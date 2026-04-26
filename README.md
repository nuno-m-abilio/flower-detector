# 🌸 ApotecárIA — Sistema Especialista de Identificação de Flores

Protótipo de sistema especialista desenvolvido para a disciplina de **Introdução à Inteligência Artificial (2026)**. O sistema permite identificar flores a partir de suas características botânicas (cor das pétalas, tipo de caule, polinizadores, etc.), usando raciocínio lógico em Prolog e apresentando os resultados com percentual de compatibilidade e explicações sobre o diagnóstico.

> ⚠️ **Este protótipo é apenas informativo. Consulte um especialista para identificação correta e precisa de qualquer espécie vegetal.**

---

## Tecnologias utilizadas

| Camada | Tecnologia | Função |
|---|---|---|
| Front-end | HTML, CSS, JavaScript | Interface do usuário |
| Back-end | Python + Flask | Servidor e rotas da API |
| Lógica | SWI-Prolog + pyswip | Motor de inferência e base de conhecimento |
| Testes | pytest | Testes automatizados do back-end |

---

## Pré-requisitos

Você precisa instalar duas coisas antes de rodar o projeto: o **SWI-Prolog** e as **bibliotecas Python**.

### 1. SWI-Prolog

O pyswip é só uma ponte — o SWI-Prolog de verdade precisa estar instalado no sistema.

**Windows:** baixe o instalador em [swi-prolog.org/download](https://www.swi-prolog.org/Download.html) e siga o assistente normalmente.

**Ubuntu/Debian:**
```bash
sudo apt install swi-prolog
```

**Mac:**
```bash
brew install swi-prolog
```

Após instalar, confirme que funcionou:
```bash
swipl --version
```

### 2. Python e bibliotecas

O projeto exige Python 3.10 ou superior. Com o Python instalado, rode:

```bash
pip install flask pyswip pytest
```

---

## Estrutura do projeto

```
flower-detector/
├── app.py                  # Servidor Flask — rotas e lógica Python
├── flores.pl               # Base de conhecimento Prolog
├── templates/
│   ├── index.html          # Página inicial
│   ├── buscar.html         # Busca por características
│   ├── adicionar.html      # Cadastro de nova planta
│   ├── editar.html         # Edição de planta existente
│   ├── excluir.html        # Exclusão de planta
│   ├── css/
│   │   └── index.css
│   └── js/
│       ├── dados_botanicos.js   # Dicionário de atributos
│       ├── script.js            # Renderização dos filtros
│       ├── buscar.js            # Lógica da busca
│       ├── adicionar.js         # Lógica do cadastro
│       ├── excluir.js           # Lógica da exclusão
│       └── editar.js            # Lógica da edição
└── tests/
    └── test_routes.py      # Testes automatizados
```

---

## Como rodar

### Back-end (Flask + Prolog)

Na raiz do projeto, rode:

```bash
python app.py
```

O servidor vai subir em `http://127.0.0.1:5000`. Deixe esse terminal aberto enquanto usa o sistema — o front-end depende dele.

Você deve ver uma saída parecida com:

```
============================================================
  Sistema Especialista — Identificação de Flores
============================================================
  Base Prolog: flores.pl
  Flores carregadas: 10
  Atributos disponíveis: 22
============================================================
```

### Front-end

Com o servidor rodando, abra o arquivo `templates/index.html` diretamente no navegador. A partir da página inicial você acessa todas as funcionalidades pelo menu.

> O front-end faz chamadas para `http://127.0.0.1:5000`, então o Flask precisa estar rodando ao mesmo tempo.

### Testes

Em um terminal separado, na raiz do projeto:

```bash
pytest tests/test_routes.py -v
```

O `-v` mostra cada teste individualmente. Você deve ver algo como:

```
PASSED tests/test_routes.py::TestDominio::test_listar_flores_retorna_lista
PASSED tests/test_routes.py::TestCRUD::test_adicionar_flor_valida
PASSED tests/test_routes.py::TestProbabilidade::test_score_maximo_criterio_perfeito
...
```

Para rodar só um grupo de testes:
```bash
pytest tests/test_routes.py::TestCRUD -v
```

Para rodar só um teste específico:
```bash
pytest tests/test_routes.py::TestCRUD::test_adicionar_flor_valida -v
```

---

## Autores

Desenvolvido por **Eduardo Minholi, Janaina Silva e Nuno Miguel** como requisito para obtenção de nota parcial na disciplina de Introdução à Inteligência Artificial — 2026.