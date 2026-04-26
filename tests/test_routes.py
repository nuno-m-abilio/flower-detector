"""
tests/test_routes.py — Testes unitários com pytest
Cobre: consulta, CRUD, probabilidade, explicabilidade e rotas Flask
"""

import pytest
import sys
import os

# Garante que app.py seja importável a partir de qualquer diretório
sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

import app as flower_app
from app import (
    adicionar_flor,
    calcular_compatibilidade,
    consultar_flores,
    consultar_flor_principal,
    editar_flor,
    excluir_flor,
    justificar_resultado,
    listar_atributos,
    listar_flores,
    obter_caracteristicas,
    por_que_perguntou,
)


# ---------------------------------------------------------------------------
# FIXTURES
# ---------------------------------------------------------------------------

@pytest.fixture
def client():
    """Cliente de testes Flask."""
    flower_app.app.config["TESTING"] = True
    flower_app.app.config["SECRET_KEY"] = "test-secret"
    with flower_app.app.test_client() as c:
        yield c


@pytest.fixture(autouse=True)
def limpar_flor_teste():
    """Remove flor de teste antes e depois de cada teste para isolamento."""
    excluir_flor("flor_teste")
    excluir_flor("flor_temporaria")
    yield
    excluir_flor("flor_teste")
    excluir_flor("flor_temporaria")


# ---------------------------------------------------------------------------
# TESTES — BASE DE CONHECIMENTO E DOMÍNIO
# ---------------------------------------------------------------------------

class TestDominio:
    def test_listar_atributos_retorna_dict(self):
        atribs = listar_atributos()
        assert isinstance(atribs, dict)
        assert "cor_petala" in atribs

    def test_atributos_cor_petala_contem_cores(self):
        atribs = listar_atributos()
        cores = atribs.get("cor_petala", [])
        assert "amarelo" in cores or "amarelo_dourado" in cores

    def test_listar_flores_retorna_lista(self):
        flores = listar_flores()
        assert isinstance(flores, list)
        assert len(flores) >= 5  # Base inicial tem ao menos 5 flores

    def test_flores_iniciais_presentes(self):
        flores = listar_flores()
        for esperada in ["girassol", "rosa", "tulipa", "lavanda", "margarida"]:
            assert esperada in flores, f"'{esperada}' deveria estar na base"


# ---------------------------------------------------------------------------
# TESTES — CRUD
# ---------------------------------------------------------------------------

class TestCRUD:

    # --- Consulta individual ---

    def test_obter_caracteristicas_flor_existente(self):
        caract = obter_caracteristicas("girassol")
        assert isinstance(caract, dict)
        assert "cor_petala" in caract
        assert "amarelo_dourado" in caract["cor_petala"]

    def test_obter_caracteristicas_flor_inexistente(self):
        caract = obter_caracteristicas("flor_que_nao_existe")
        assert caract == {}

    # --- Inclusão ---

    def test_adicionar_flor_valida(self):
        resultado = adicionar_flor(
            "flor_teste",
            {
                "cor_petala": ["rosa_bebe"],
                "polinizacao": ["borboletas"],
                "porte_planta": ["media"],
            },
        )
        assert resultado.get("ok") is True
        assert "flor_teste" in listar_flores()

    def test_adicionar_flor_duplicada_retorna_erro(self):
        adicionar_flor("flor_teste", {"cor_petala": ["rosa_bebe"]})
        resultado = adicionar_flor("flor_teste", {"cor_petala": ["azul_cobalto"]})
        assert "erro" in resultado

    def test_adicionar_flor_com_atributo_invalido(self):
        resultado = adicionar_flor(
            "flor_teste",
            {"cor_petala": ["cor_que_nao_existe_123"]},
        )
        assert "erro" in resultado
        assert "flor_teste" not in listar_flores()

    def test_adicionar_flor_normaliza_nome(self):
        resultado = adicionar_flor(
            "  Flor Teste  ",
            {"cor_petala": ["rosa_bebe"]},
        )
        assert resultado.get("ok") is True
        assert resultado["flor"] == "flor_teste"

    # --- Edição ---

    def test_editar_flor_adicionar_caracteristica(self):
        adicionar_flor("flor_teste", {"cor_petala": ["rosa_bebe"]})
        resultado = editar_flor(
            "flor_teste", adicionar={"polinizacao": ["abelhas"]}
        )
        assert resultado.get("ok") is True
        caract = obter_caracteristicas("flor_teste")
        assert "abelhas" in caract.get("polinizacao", [])

    def test_editar_flor_remover_caracteristica(self):
        adicionar_flor(
            "flor_teste",
            {"cor_petala": ["rosa_bebe"], "polinizacao": ["abelhas"]},
        )
        editar_flor("flor_teste", remover={"polinizacao": ["abelhas"]})
        caract = obter_caracteristicas("flor_teste")
        assert "abelhas" not in caract.get("polinizacao", [])

    def test_editar_flor_inexistente_retorna_erro(self):
        resultado = editar_flor(
            "flor_nao_existe", adicionar={"cor_petala": ["verde_claro"]}
        )
        assert "erro" in resultado

    # --- Exclusão ---

    def test_excluir_flor_existente(self):
        adicionar_flor("flor_teste", {"cor_petala": ["rosa_bebe"]})
        resultado = excluir_flor("flor_teste")
        assert resultado.get("ok") is True
        assert "flor_teste" not in listar_flores()

    def test_excluir_flor_inexistente_retorna_erro(self):
        resultado = excluir_flor("flor_que_nao_existe_xyz")
        assert "erro" in resultado


# ---------------------------------------------------------------------------
# TESTES — PROBABILIDADE / COMPATIBILIDADE
# ---------------------------------------------------------------------------

class TestProbabilidade:

    def test_score_maximo_criterio_perfeito(self):
        """Girassol buscado com todas as suas características → score 1.0"""
        caract = obter_caracteristicas("girassol")
        # Usa apenas alguns critérios para manter o teste rápido
        criterios = {
            "cor_petala": ["amarelo_dourado"],
            "polinizacao": ["abelhas"],
        }
        compat = calcular_compatibilidade("girassol", criterios)
        assert compat["score"] == 1.0

    def test_score_zero_para_incompativel(self):
        """Girassol não tem pétalas azuis → score de azul deve ser 0."""
        criterios = {"cor_petala": ["azul_cobalto"]}
        compat = calcular_compatibilidade("girassol", criterios)
        assert compat["score"] == 0.0

    def test_score_parcial_para_match_incompleto(self):
        criterios = {
            "cor_petala": ["amarelo_dourado"],  # girassol tem → match
            "polinizacao": ["morcegos"],         # girassol NÃO tem → mismatch
        }
        compat = calcular_compatibilidade("girassol", criterios)
        assert 0.0 < compat["score"] < 1.0

    def test_resultados_ordenados_por_score(self):
        criterios = {"cor_petala": ["amarelo_dourado"]}
        resultados = consultar_flores(criterios)
        scores = [r["score"] for r in resultados]
        assert scores == sorted(scores, reverse=True)

    def test_score_via_hierarquia_cor(self):
        """Buscar 'amarelo' (geral) deve encontrar girassol (que tem amarelo_dourado)."""
        criterios = {"cor_petala": ["amarelo"]}
        compat = calcular_compatibilidade("girassol", criterios)
        # Score deve ser positivo por hierarquia de cor
        assert compat["score"] > 0.0

    def test_consultar_retorna_lista(self):
        criterios = {"polinizacao": ["abelhas"]}
        resultados = consultar_flores(criterios)
        assert isinstance(resultados, list)
        assert len(resultados) >= 1

    def test_consultar_principal_retorna_melhor(self):
        criterios = {"cor_petala": ["vermelho_cereja"], "intensidade_aroma": ["intenso"]}
        resultado = consultar_flor_principal(criterios)
        assert resultado is not None
        # Rosa tem ambas as características → deve aparecer em primeiro
        assert resultado["flor"] == "rosa"

    def test_consultar_com_threshold_filtra(self):
        criterios = {"polinizacao": ["abelhas"]}
        todos = consultar_flores(criterios, threshold=0.0)
        filtrados = consultar_flores(criterios, threshold=0.5)
        assert len(filtrados) <= len(todos)
        assert all(r["score"] >= 0.5 for r in filtrados)

    def test_consultar_top_n(self):
        criterios = {"polinizacao": ["abelhas"]}
        resultado = consultar_flores(criterios, top_n=3)
        assert len(resultado) <= 3


# ---------------------------------------------------------------------------
# TESTES — EXPLICABILIDADE
# ---------------------------------------------------------------------------

class TestExplicabilidade:

    def test_justificar_resultado_contem_campos(self):
        criterios = {"cor_petala": ["amarelo_dourado"]}
        expl = justificar_resultado("girassol", criterios)
        assert "score" in expl
        assert "acertos" in expl
        assert "faltas" in expl
        assert "explicacao_texto" in expl

    def test_justificar_acertos_corretos(self):
        criterios = {"cor_petala": ["amarelo_dourado"]}
        expl = justificar_resultado("girassol", criterios)
        assert any(
            a["atributo"] == "cor_petala" and a["valor"] == "amarelo_dourado"
            for a in expl["acertos"]
        )

    def test_justificar_faltas_corretas(self):
        criterios = {"cor_petala": ["azul_cobalto"]}
        expl = justificar_resultado("girassol", criterios)
        assert any(f["valor"] == "azul_cobalto" for f in expl["faltas"])

    def test_por_que_perguntou_retorna_explicacao(self):
        resp = por_que_perguntou("cor_petala")
        assert "explicacao" in resp
        assert "valores_possiveis" in resp
        assert len(resp["flores_que_usam"]) >= 1

    def test_justificar_score_zero_retorna_descarte(self):
        criterios = {"cor_petala": ["azul_cobalto"], "polinizacao": ["morcegos"]}
        expl = justificar_resultado("girassol", criterios)
        assert expl["score"] == 0.0
        assert "descartada" in expl["explicacao_texto"].lower()


# ---------------------------------------------------------------------------
# TESTES — ROTAS FLASK (integração)
# ---------------------------------------------------------------------------

class TestRotas:

    def test_rota_atributos(self, client):
        resp = client.get("/atributos")
        assert resp.status_code == 200
        data = resp.get_json()
        assert "atributos" in data
        assert "aviso" in data

    def test_rota_listar_flores(self, client):
        resp = client.get("/flores")
        assert resp.status_code == 200
        assert "flores" in resp.get_json()

    def test_rota_obter_flor_existente(self, client):
        resp = client.get("/flores/girassol")
        assert resp.status_code == 200
        data = resp.get_json()
        assert data["flor"] == "girassol"
        assert "caracteristicas" in data

    def test_rota_obter_flor_inexistente(self, client):
        resp = client.get("/flores/flor_xyz_123")
        assert resp.status_code == 404

    def test_rota_consultar(self, client):
        resp = client.post(
            "/consultar",
            json={"criterios": {"cor_petala": ["amarelo_dourado"]}},
        )
        assert resp.status_code == 200
        data = resp.get_json()
        assert "resultados" in data
        assert "total" in data

    def test_rota_consultar_sem_criterios(self, client):
        resp = client.post("/consultar", json={})
        assert resp.status_code == 400

    def test_rota_consultar_principal(self, client):
        resp = client.post(
            "/consultar/principal",
            json={"criterios": {"cor_petala": ["vermelho_cereja"]}},
        )
        assert resp.status_code == 200
        data = resp.get_json()
        assert "resultado" in data

    def test_rota_justificar(self, client):
        resp = client.post(
            "/justificar",
            json={
                "flor": "girassol",
                "criterios": {"cor_petala": ["amarelo_dourado"]},
            },
        )
        assert resp.status_code == 200
        data = resp.get_json()
        assert "explicacao_texto" in data

    def test_rota_por_que_perguntou(self, client):
        resp = client.get("/por-que-perguntou/cor_petala")
        assert resp.status_code == 200
        data = resp.get_json()
        assert "explicacao" in data

    def test_rota_adicionar_flor(self, client):
        resp = client.post(
            "/flores",
            json={
                "nome": "flor_teste",
                "caracteristicas": {
                    "cor_petala": ["rosa_bebe"],
                    "porte_planta": ["media"],
                },
            },
        )
        assert resp.status_code == 201
        assert resp.get_json().get("ok") is True

    def test_rota_adicionar_flor_duplicada(self, client):
        client.post(
            "/flores",
            json={"nome": "flor_teste", "caracteristicas": {"cor_petala": ["rosa_bebe"]}},
        )
        resp = client.post(
            "/flores",
            json={"nome": "flor_teste", "caracteristicas": {"cor_petala": ["azul_cobalto"]}},
        )
        assert resp.status_code == 409

    def test_rota_editar_flor(self, client):
        client.post(
            "/flores",
            json={"nome": "flor_teste", "caracteristicas": {"cor_petala": ["rosa_bebe"]}},
        )
        resp = client.patch(
            "/flores/flor_teste",
            json={"adicionar": {"polinizacao": ["abelhas"]}},
        )
        assert resp.status_code == 200
        assert resp.get_json().get("ok") is True

    def test_rota_excluir_flor(self, client):
        client.post(
            "/flores",
            json={"nome": "flor_teste", "caracteristicas": {"cor_petala": ["rosa_bebe"]}},
        )
        resp = client.delete("/flores/flor_teste")
        assert resp.status_code == 200
        assert resp.get_json().get("ok") is True

    def test_rota_excluir_flor_inexistente(self, client):
        resp = client.delete("/flores/flor_xyz_nao_existe")
        assert resp.status_code == 404

    def test_sessao_iniciar(self, client):
        with client.session_transaction() as sess:
            sess.clear()
        resp = client.post("/sessao/iniciar")
        assert resp.status_code == 200
        data = resp.get_json()
        assert "proximo_atributo" in data

    def test_sessao_responder(self, client):
        client.post("/sessao/iniciar")
        resp = client.post(
            "/sessao/responder",
            json={"atributo": "cor_petala", "valores": ["amarelo_dourado"]},
        )
        assert resp.status_code == 200
        data = resp.get_json()
        assert "estado" in data
        assert data["estado"] in ("continuar", "conclusao")