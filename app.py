"""
app.py — Servidor Flask para o Sistema Especialista de Identificação de Flores
Integra Python (Flask) com SWI-Prolog (via pyswip) como motor de inferência lógica.
"""

from flask import Flask, request, jsonify, render_template, session
from flask_cors import CORS
from pyswip import Prolog, Functor, Variable, Atom, call
from pyswip.prolog import PrologError
import os
import re

# ---------------------------------------------------------------------------
# INICIALIZAÇÃO
# ---------------------------------------------------------------------------

app = Flask(__name__)
app.secret_key = os.urandom(24)
CORS(app)

prolog = Prolog()

BASE_PL = os.path.join(os.path.dirname(__file__), "flores.pl")
prolog.consult(BASE_PL)


# ---------------------------------------------------------------------------
# HELPERS DE CONVERSÃO PYSWIP → PYTHON
# ---------------------------------------------------------------------------

def _term_to_str(term) -> str:
    """Converte qualquer termo pyswip para string limpa."""
    return str(term)


def _query_list(query: str) -> list[dict]:
    """Executa uma query Prolog e retorna lista de dicts (bindings)."""
    try:
        return list(prolog.query(query))
    except PrologError as e:
        raise RuntimeError(f"Erro Prolog: {e}") from e


def _assert_fact(fact: str) -> None:
    """Asserta um fato dinâmico na base."""
    list(prolog.query(f"assert({fact})"))


def _retract_fact(fact: str) -> None:
    """Retrata um fato dinâmico da base."""
    list(prolog.query(f"retract({fact})"))


def _normalize(name: str) -> str:
    """Normaliza nomes: minúsculo, espaços → underscore."""
    return re.sub(r"\s+", "_", name.strip().lower())


# ---------------------------------------------------------------------------
# FUNÇÕES DE DOMÍNIO — CARACTERÍSTICAS
# ---------------------------------------------------------------------------

def listar_atributos() -> dict:
    """
    Retorna todos os atributos disponíveis agrupados por categoria.
    Usa dominio_atributo/2 definido em flores.pl.
    """
    resultados = _query_list("dominio_atributo(Valor, Atributo)")
    grupos: dict[str, list[str]] = {}
    for r in resultados:
        atrib = _term_to_str(r["Atributo"])
        valor = _term_to_str(r["Valor"])
        grupos.setdefault(atrib, []).append(valor)
    return grupos


def listar_subclasses_cor() -> dict:
    """Retorna hierarquia de cores (subclasse_cor/2)."""
    resultados = _query_list("subclasse_cor(Especifica, Geral)")
    hierarquia: dict[str, list[str]] = {}
    for r in resultados:
        geral = _term_to_str(r["Geral"])
        esp = _term_to_str(r["Especifica"])
        hierarquia.setdefault(geral, []).append(esp)
    return hierarquia


# ---------------------------------------------------------------------------
# FUNÇÕES DE DOMÍNIO — FLORES (CRUD)
# ---------------------------------------------------------------------------

def listar_flores() -> list[str]:
    """Lista todos os nomes únicos de flores cadastradas."""
    resultados = _query_list("caracteristica(Flor, _, _)")
    flores = sorted({_term_to_str(r["Flor"]) for r in resultados})
    return flores


def obter_caracteristicas(flor: str) -> dict[str, list[str]]:
    """
    Retorna todas as características de uma flor agrupadas por atributo.
    Ex.: {'cor_petala': ['amarelo_dourado'], 'polinizacao': ['abelhas']}
    """
    flor_norm = _normalize(flor)
    resultados = _query_list(
        f"caracteristica({flor_norm}, Atributo, Valor)"
    )
    caract: dict[str, list[str]] = {}
    for r in resultados:
        atrib = _term_to_str(r["Atributo"])
        valor = _term_to_str(r["Valor"])
        caract.setdefault(atrib, []).append(valor)
    return caract


def adicionar_flor(nome: str, caracteristicas: dict[str, list[str]]) -> dict:
    """
    Adiciona uma nova flor com suas características.
    caracteristicas: {'cor_petala': ['amarelo'], 'polinizacao': ['abelhas']}
    Retorna: {'ok': True} ou {'erro': '...'}
    """
    nome_norm = _normalize(nome)

    # Verifica duplicata
    existente = _query_list(f"caracteristica({nome_norm}, _, _)")
    if existente:
        return {"erro": f"Flor '{nome_norm}' já existe na base."}

    # Valida e asserta cada característica
    fatos_assertados = []
    for atributo, valores in caracteristicas.items():
        atrib_norm = _normalize(atributo)
        for valor in valores:
            valor_norm = _normalize(str(valor))

            # Checa se o valor é válido no domínio
            valido = _query_list(
                f"dominio_atributo({valor_norm}, {atrib_norm})"
            )
            if not valido:
                # Tenta com subclasse de cor
                valido = _query_list(
                    f"subclasse_cor({valor_norm}, _)"
                )
            if not valido:
                return {
                    "erro": (
                        f"Valor '{valor_norm}' não reconhecido para "
                        f"atributo '{atrib_norm}'. Use /atributos para "
                        f"ver os valores válidos."
                    )
                }

            fato = f"caracteristica({nome_norm}, {atrib_norm}, {valor_norm})"
            _assert_fact(fato)
            fatos_assertados.append(fato)

    return {"ok": True, "flor": nome_norm, "fatos": fatos_assertados}


def editar_flor(
    nome: str,
    adicionar: dict[str, list[str]] | None = None,
    remover: dict[str, list[str]] | None = None,
) -> dict:
    """
    Edita características de uma flor existente.
    - adicionar: atributos/valores a incluir
    - remover: atributos/valores a excluir (None em 'valores' remove o atributo inteiro)
    """
    nome_norm = _normalize(nome)
    existente = _query_list(f"caracteristica({nome_norm}, _, _)")
    if not existente:
        return {"erro": f"Flor '{nome_norm}' não encontrada."}

    log:dict[str, list] = {"adicionados": [], "removidos": []}

    # Remoções
    if remover:
        for atributo, valores in remover.items():
            atrib_norm = _normalize(atributo)
            if not valores:
                # Remove todos os valores daquele atributo
                list(prolog.query(
                    f"retractall(caracteristica({nome_norm}, {atrib_norm}, _))"
                ))
                log["removidos"].append(f"{atrib_norm}/*")
            else:
                for valor in valores:
                    valor_norm = _normalize(str(valor))
                    _retract_fact(
                        f"caracteristica({nome_norm}, {atrib_norm}, {valor_norm})"
                    )
                    log["removidos"].append(f"{atrib_norm}/{valor_norm}")

    # Adições
    if adicionar:
        for atributo, valores in adicionar.items():
            atrib_norm = _normalize(atributo)
            for valor in valores:
                valor_norm = _normalize(str(valor))
                valido = _query_list(
                    f"dominio_atributo({valor_norm}, {atrib_norm})"
                )
                if not valido:
                    valido = _query_list(f"subclasse_cor({valor_norm}, _)")
                if not valido:
                    return {
                        "erro": (
                            f"Valor '{valor_norm}' inválido para "
                            f"'{atrib_norm}'."
                        )
                    }
                fato = f"caracteristica({nome_norm}, {atrib_norm}, {valor_norm})"
                _assert_fact(fato)
                log["adicionados"].append(f"{atrib_norm}/{valor_norm}")

    return {"ok": True, "flor": nome_norm, **log}


def excluir_flor(nome: str) -> dict:
    """Remove completamente uma flor da base."""
    nome_norm = _normalize(nome)
    existente = _query_list(f"caracteristica({nome_norm}, _, _)")
    if not existente:
        return {"erro": f"Flor '{nome_norm}' não encontrada."}

    list(prolog.query(f"retractall(caracteristica({nome_norm}, _, _))"))
    return {"ok": True, "flor": nome_norm}


# ---------------------------------------------------------------------------
# PROBABILIDADE E CONSULTA / DIAGNÓSTICO
# ---------------------------------------------------------------------------

def _expandir_cor(valor: str) -> list[str]:
    """
    Para um valor de cor, retorna ele mesmo + subclasses (se for geral)
    ou ele mesmo + a cor geral (se for específica).
    Isso garante que buscar 'amarelo' encontre flores com 'amarelo_dourado'.
    """
    expandido = [valor]
    # Valor é cor geral → busca subclasses
    subs = _query_list(f"subclasse_cor(Sub, {valor})")
    expandido += [_term_to_str(s["Sub"]) for s in subs]
    # Valor é cor específica → adiciona a cor geral
    gerais = _query_list(f"subclasse_cor({valor}, Geral)")
    expandido += [_term_to_str(g["Geral"]) for g in gerais]
    return list(set(expandido))


def calcular_compatibilidade(
    flor: str,
    criterios: dict[str, list[str]],
) -> dict:
    """
    Calcula a compatibilidade de uma flor com os critérios informados.

    Algoritmo (Jaccard ponderado simples):
    - Para cada (atributo, valor) nos critérios:
        * MATCH direto: a flor tem exatamente esse par          → +1 ponto
        * MATCH via hierarquia de cor: cor geral ↔ específica  → +0.8 ponto
        * SEM MATCH                                             → 0 pontos
    - score = soma_pontos / total_criterios_expandidos
    - Retorna score ∈ [0,1] + detalhes de match/mismatch
    """
    flor_norm = _normalize(flor)
    caract_flor = obter_caracteristicas(flor_norm)  # {atrib: [valores]}

    acertos = []
    faltas = []
    total_pontos = 0.0
    pontos_obtidos = 0.0

    for atributo, valores in criterios.items():
        atrib_norm = _normalize(atributo)
        valores_flor = caract_flor.get(atrib_norm, [])

        for valor in valores:
            valor_norm = _normalize(str(valor))
            total_pontos += 1.0
            expandidos = _expandir_cor(valor_norm)

            if valor_norm in valores_flor:
                pontos_obtidos += 1.0
                acertos.append(
                    {"atributo": atrib_norm, "valor": valor_norm, "tipo": "direto"}
                )
            elif any(v in valores_flor for v in expandidos):
                # Match via hierarquia de cor
                match_val = next(v for v in expandidos if v in valores_flor)
                pontos_obtidos += 0.8
                acertos.append(
                    {
                        "atributo": atrib_norm,
                        "valor": valor_norm,
                        "match_via": match_val,
                        "tipo": "hierarquia_cor",
                    }
                )
            else:
                faltas.append({"atributo": atrib_norm, "valor": valor_norm})

    score = round(pontos_obtidos / total_pontos, 4) if total_pontos > 0 else 0.0

    # Extras: características que a flor tem mas não foram solicitadas
    extras = []
    for atrib, vals in caract_flor.items():
        if atrib not in criterios:
            extras.append({"atributo": atrib, "valores": vals})

    return {
        "flor": flor_norm,
        "score": score,
        "percentual": f"{score * 100:.1f}%",
        "acertos": acertos,
        "faltas": faltas,
        "extras_da_flor": extras,
    }


def consultar_flores(
    criterios: dict[str, list[str]],
    threshold: float = 0.0,
    top_n: int | None = None,
) -> list[dict]:
    """
    Busca todas as flores, calcula compatibilidade e retorna lista
    ordenada do mais para o menos compatível.

    criterios: {'cor_petala': ['amarelo'], 'polinizacao': ['abelhas']}
    threshold: score mínimo para incluir (0.0 = todas)
    top_n: limite de resultados (None = todos)
    """
    flores = listar_flores()
    resultados = []

    for flor in flores:
        compat = calcular_compatibilidade(flor, criterios)
        if compat["score"] >= threshold:
            resultados.append(compat)

    resultados.sort(key=lambda x: x["score"], reverse=True)

    if top_n is not None:
        resultados = resultados[:top_n]

    return resultados


def consultar_flor_principal(criterios: dict[str, list[str]]) -> dict | None:
    """Retorna apenas o melhor resultado (maior compatibilidade)."""
    resultados = consultar_flores(criterios, threshold=0.01, top_n=1)
    return resultados[0] if resultados else None


# ---------------------------------------------------------------------------
# JUSTIFICATIVA / EXPLICABILIDADE
# ---------------------------------------------------------------------------

def justificar_resultado(flor: str, criterios: dict[str, list[str]]) -> dict:
    """
    Gera explicação detalhada de por que uma flor foi (ou não) selecionada.
    Responde a perguntas do tipo:
    - "Por que essa flor foi sugerida?"
    - "Por que não foi descartada?"
    - "O que essa flor tem a mais?"
    """
    compat = calcular_compatibilidade(flor, criterios)

    linhas_explicacao = []

    if compat["score"] == 0:
        linhas_explicacao.append(
            f"'{flor}' foi descartada: nenhuma característica informada "
            f"corresponde ao seu perfil."
        )
        return {**compat, "explicacao_texto": "\n".join(linhas_explicacao)}

    # Por que foi sugerida
    linhas_explicacao.append(
        f"'{flor}' foi sugerida com {compat['percentual']} de compatibilidade."
    )

    # Acertos
    if compat["acertos"]:
        linhas_explicacao.append("\n✅ Características que CONFIRMAM a sugestão:")
        for a in compat["acertos"]:
            if a["tipo"] == "direto":
                linhas_explicacao.append(
                    f"  • {a['atributo']} = {a['valor']} (correspondência exata)"
                )
            else:
                linhas_explicacao.append(
                    f"  • {a['atributo']} = {a['valor']} → "
                    f"correspondeu via '{a['match_via']}' "
                    f"(hierarquia de cor)"
                )

    # Faltas
    if compat["faltas"]:
        linhas_explicacao.append(
            "\n❌ Características INFORMADAS que NÃO foram encontradas "
            "nessa flor:"
        )
        for f in compat["faltas"]:
            linhas_explicacao.append(
                f"  • {f['atributo']} = {f['valor']} (ausente no perfil)"
            )

    # Extras
    if compat["extras_da_flor"]:
        linhas_explicacao.append(
            "\nℹ️  Características da flor que NÃO foram consultadas:"
        )
        for e in compat["extras_da_flor"]:
            linhas_explicacao.append(
                f"  • {e['atributo']}: {', '.join(e['valores'])}"
            )

    return {**compat, "explicacao_texto": "\n".join(linhas_explicacao)}


def por_que_perguntou(atributo: str) -> dict:
    """
    Explica por que um determinado atributo é relevante na identificação.
    Responde: "Por que foi perguntado sobre X?"
    """
    atrib_norm = _normalize(atributo)
    flores_com_atrib = _query_list(
        f"caracteristica(Flor, {atrib_norm}, _)"
    )
    flores_unicas = list({_term_to_str(r["Flor"]) for r in flores_com_atrib})
    valores_possiveis = _query_list(
        f"dominio_atributo(Valor, {atrib_norm})"
    )
    vals = [_term_to_str(r["Valor"]) for r in valores_possiveis]

    return {
        "atributo": atrib_norm,
        "explicacao": (
            f"O atributo '{atrib_norm}' foi consultado porque está presente "
            f"em {len(flores_unicas)} flor(es) da base e possui "
            f"{len(vals)} valor(es) possível(eis). "
            f"Especificá-lo ajuda a diferenciar entre as flores cadastradas."
        ),
        "flores_que_usam": flores_unicas,
        "valores_possiveis": vals,
    }


# ---------------------------------------------------------------------------
# ROTAS FLASK
# ---------------------------------------------------------------------------

DISCLAIMER = (
    "⚠️  Este protótipo é apenas informativo. "
    "Consulte um especialista para identificação correta e precisa."
)


@app.route("/")
def index():
    return render_template("index.html")


# ---- Domínio / Vocabulário ------------------------------------------------

@app.route("/atributos", methods=["GET"])
def rota_atributos():
    """Lista todos os atributos e seus valores válidos."""
    return jsonify({"atributos": listar_atributos(), "aviso": DISCLAIMER})


@app.route("/cores/hierarquia", methods=["GET"])
def rota_hierarquia_cores():
    """Retorna hierarquia de cores (geral → específicas)."""
    return jsonify({"hierarquia": listar_subclasses_cor()})


@app.route("/flores", methods=["GET"])
def rota_listar_flores():
    """Lista todas as flores cadastradas."""
    return jsonify({"flores": listar_flores()})


@app.route("/flores/<nome>", methods=["GET"])
def rota_obter_flor(nome: str):
    """Retorna as características de uma flor específica."""
    nome_norm = _normalize(nome)
    caract = obter_caracteristicas(nome_norm)
    if not caract:
        return jsonify({"erro": f"Flor '{nome_norm}' não encontrada."}), 404
    return jsonify({"flor": nome_norm, "caracteristicas": caract})


# ---- Consulta / Diagnóstico -----------------------------------------------

@app.route("/consultar", methods=["POST"])
def rota_consultar():
    """
    Consulta flores por características.
    Body JSON:
    {
      "criterios": {"cor_petala": ["amarelo"], "polinizacao": ["abelhas"]},
      "threshold": 0.3,   // opcional, padrão 0.0
      "top_n": 5          // opcional
    }
    """
    dados = request.get_json(force=True) or {}
    criterios = dados.get("criterios", {})
    threshold = float(dados.get("threshold", 0.0))
    top_n = dados.get("top_n")

    if not criterios:
        return jsonify({"erro": "Informe ao menos um critério de busca."}), 400

    resultados = consultar_flores(criterios, threshold=threshold, top_n=top_n)

    return jsonify({
        "total": len(resultados),
        "resultados": resultados,
        "aviso": DISCLAIMER,
    })


@app.route("/consultar/principal", methods=["POST"])
def rota_consultar_principal():
    """Retorna apenas o melhor resultado da consulta."""
    dados = request.get_json(force=True) or {}
    criterios = dados.get("criterios", {})

    if not criterios:
        return jsonify({"erro": "Informe ao menos um critério de busca."}), 400

    resultado = consultar_flor_principal(criterios)

    if not resultado:
        return jsonify({
            "resultado": None,
            "mensagem": "Nenhuma flor compatível encontrada.",
            "aviso": DISCLAIMER,
        })

    return jsonify({"resultado": resultado, "aviso": DISCLAIMER})


# ---- Explicabilidade -------------------------------------------------------

@app.route("/justificar", methods=["POST"])
def rota_justificar():
    """
    Explica o resultado de uma consulta para uma flor específica.
    Body JSON:
    {
      "flor": "girassol",
      "criterios": {"cor_petala": ["amarelo"], "polinizacao": ["abelhas"]}
    }
    """
    dados = request.get_json(force=True) or {}
    flor = dados.get("flor")
    criterios = dados.get("criterios", {})

    if not flor or not criterios:
        return jsonify({"erro": "Informe 'flor' e 'criterios'."}), 400

    explicacao = justificar_resultado(_normalize(flor), criterios)
    return jsonify({**explicacao, "aviso": DISCLAIMER})


@app.route("/por-que-perguntou/<atributo>", methods=["GET"])
def rota_por_que_perguntou(atributo: str):
    """Explica por que um atributo é relevante na identificação."""
    return jsonify(por_que_perguntou(atributo))


# ---- CRUD —— Adição --------------------------------------------------------

@app.route("/flores", methods=["POST"])
def rota_adicionar_flor():
    """
    Adiciona uma nova flor.
    Body JSON:
    {
      "nome": "girassol",
      "caracteristicas": {
        "cor_petala": ["amarelo_dourado"],
        "polinizacao": ["abelhas", "borboletas"],
        "porte_planta": ["alta"]
      }
    }
    """
    dados = request.get_json(force=True) or {}
    nome = dados.get("nome", "").strip()
    caracteristicas = dados.get("caracteristicas", {})

    if not nome:
        return jsonify({"erro": "Informe o campo 'nome'."}), 400
    if not caracteristicas:
        return jsonify({"erro": "Informe ao menos uma característica."}), 400

    resultado = adicionar_flor(nome, caracteristicas)

    if "erro" in resultado:
        return jsonify(resultado), 409

    return jsonify(resultado), 201


# ---- CRUD — Edição ---------------------------------------------------------

@app.route("/flores/<nome>", methods=["PATCH"])
def rota_editar_flor(nome: str):
    """
    Edita características de uma flor existente.
    Body JSON:
    {
      "adicionar": {"polinizacao": ["mariposas"]},
      "remover":   {"polinizacao": ["abelhas"]}   // lista vazia remove o atributo todo
    }
    """
    dados = request.get_json(force=True) or {}
    adicionar = dados.get("adicionar")
    remover = dados.get("remover")

    if not adicionar and not remover:
        return jsonify({"erro": "Informe 'adicionar' e/ou 'remover'."}), 400

    resultado = editar_flor(nome, adicionar=adicionar, remover=remover)

    if "erro" in resultado:
        return jsonify(resultado), 404

    return jsonify(resultado)


# ---- CRUD — Exclusão -------------------------------------------------------

@app.route("/flores/<nome>", methods=["DELETE"])
def rota_excluir_flor(nome: str):
    """Remove uma flor completamente da base."""
    resultado = excluir_flor(nome)

    if "erro" in resultado:
        return jsonify(resultado), 404

    return jsonify(resultado)


# ---------------------------------------------------------------------------
# SESSÃO — modo Akinator (perguntas incrementais)
# ---------------------------------------------------------------------------

@app.route("/sessao/iniciar", methods=["POST"])
def sessao_iniciar():
    """
    Inicia uma sessão de identificação incremental (modo Akinator).
    Reseta os critérios acumulados e sugere o primeiro atributo a perguntar.
    """
    session["criterios"] = {}
    session["historico"] = []

    proximo = _sugerir_proximo_atributo({})
    return jsonify({
        "mensagem": "Sessão iniciada. Responda as perguntas para identificar a flor.",
        "proximo_atributo": proximo,
        "aviso": DISCLAIMER,
    })


@app.route("/sessao/responder", methods=["POST"])
def sessao_responder():
    """
    Recebe uma resposta incremental e devolve o próximo atributo a perguntar
    ou o resultado final se a confiança for suficiente.
    Body JSON: {"atributo": "cor_petala", "valores": ["amarelo"]}
    """
    dados = request.get_json(force=True) or {}
    atrib = _normalize(dados.get("atributo", ""))
    valores = dados.get("valores", [])

    if not atrib or not valores:
        return jsonify({"erro": "Informe 'atributo' e 'valores'."}), 400

    criterios = session.get("criterios", {})
    criterios[atrib] = valores
    session["criterios"] = criterios

    historico = session.get("historico", [])
    historico.append({"atributo": atrib, "valores": valores})
    session["historico"] = historico

    resultados = consultar_flores(criterios, threshold=0.01, top_n=5)

    # Confiança alta: melhor resultado tem score ≥ 0.85 e é bem destacado
    if resultados and resultados[0]["score"] >= 0.85:
        melhor = resultados[0]
        return jsonify({
            "estado": "conclusao",
            "resultado": melhor,
            "alternativas": resultados[1:],
            "historico": historico,
            "aviso": DISCLAIMER,
        })

    proximo = _sugerir_proximo_atributo(criterios)

    if not proximo:
        return jsonify({
            "estado": "conclusao",
            "resultado": resultados[0] if resultados else None,
            "alternativas": resultados[1:] if len(resultados) > 1 else [],
            "historico": historico,
            "aviso": DISCLAIMER,
        })

    return jsonify({
        "estado": "continuar",
        "candidatos_atuais": resultados[:3],
        "proximo_atributo": proximo,
        "historico": historico,
    })


def _sugerir_proximo_atributo(criterios_ja_usados: dict) -> dict | None:
    """
    Sugere o próximo atributo mais discriminatório para perguntar.
    Critério: atributo que aparece no maior número de flores candidatas
    e ainda não foi perguntado.
    """
    atribs_usados = set(criterios_ja_usados.keys())

    # Conta ocorrências de cada atributo ainda não perguntado
    contagens: dict[str, int] = {}
    resultados = _query_list("caracteristica(_, Atributo, _)")
    for r in resultados:
        atrib = _term_to_str(r["Atributo"])
        if atrib not in atribs_usados:
            contagens[atrib] = contagens.get(atrib, 0) + 1

    if not contagens:
        return None

    melhor_atrib = max(contagens, key=lambda a: contagens[a])

    # Busca valores possíveis para o atributo
    vals_res = _query_list(f"dominio_atributo(Valor, {melhor_atrib})")
    valores = [_term_to_str(v["Valor"]) for v in vals_res]

    return {
        "atributo": melhor_atrib,
        "valores_possiveis": valores,
        "pergunta": f"Qual é o valor de '{melhor_atrib}' desta flor?",
    }


# ---------------------------------------------------------------------------
# ENTRY POINT
# ---------------------------------------------------------------------------

if __name__ == "__main__":
    print("=" * 60)
    print("  Sistema Especialista — Identificação de Flores")
    print("=" * 60)
    print(f"  Base Prolog: {BASE_PL}")
    print(f"  Flores carregadas: {len(listar_flores())}")
    print(f"  Atributos disponíveis: {len(listar_atributos())}")
    print("=" * 60)
    print(f"\n  {DISCLAIMER}\n")
    app.run(debug=True, port=5000)