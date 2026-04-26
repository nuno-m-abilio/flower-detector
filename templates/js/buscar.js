/**
 * buscar.js
 * Lógica da página buscar.html.
 * Lê os critérios do formulário via lerCriterios() (script.js),
 * chama a API Flask e renderiza os resultados.
 */

const API = "http://127.0.0.1:5000";

const elResultados = document.getElementById("resultados");
const elMaisOpcoes = document.getElementById("mais-opcoes");
const btnBuscar = document.getElementById("buscar");
const btnLimpar = document.getElementById("limpar");

elResultados.style.display = "none";

// ── Busca principal ──────────────────────────────────────────────────────────

btnBuscar.addEventListener("click", async () => {
  const criterios = lerCriterios();

  if (Object.keys(criterios).length === 0) {
    alert("Selecione ao menos uma característica para buscar.");
    return;
  }

  elResultados.innerHTML = "<p>Buscando...</p>";
  elResultados.style.display = "flex";
  elMaisOpcoes.innerHTML = "";

  try {
    const resposta = await fetch(`${API}/consultar`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ criterios, threshold: 0.01 }),
    });

    const dados = await resposta.json();

    if (!resposta.ok) {
      mostrarErro(dados.erro || "Erro ao consultar.");
      return;
    }

    renderizarResultados(dados.resultados, criterios);
  } catch (err) {
    mostrarErro("Não foi possível conectar ao servidor. Verifique se o Flask está rodando.");
    console.error(err);
  }
});

// ── Limpar ───────────────────────────────────────────────────────────────────

btnLimpar.addEventListener("click", () => {
  // --- NOVA LÓGICA PARA LIMPAR O FORMULÁRIO MULTISELECT ---
  document.querySelectorAll("#filters select").forEach((select) => {
    Array.from(select.options).forEach(opt => opt.selected = false);
  });
  
  elResultados.innerHTML = "";
  elResultados.style.display = "none";
  elMaisOpcoes.innerHTML = "";
});

// ── Renderização ─────────────────────────────────────────────────────────────

function renderizarResultados(resultados, criterios) {
  elResultados.innerHTML = "";
  elMaisOpcoes.innerHTML = "";

  if (!resultados || resultados.length === 0) {
    elResultados.innerHTML = `
      <h3>Opa, não encontramos nenhuma planta com essas características.</h3>
      <p>Tente remover alguns filtros e buscar novamente.</p>
    `;
    return;
  }

  const principal = resultados[0];
  const alternativas = resultados.slice(1);

  // ── Resultado principal ──
  const tituloPrincipal = document.createElement("h2");
  tituloPrincipal.textContent = "De acordo com as informações fornecidas, sua planta pode ser:";

  const cardPrincipal = criarCard(principal, criterios, true);

  elResultados.appendChild(tituloPrincipal);
  elResultados.appendChild(cardPrincipal);

  // ── Botão de explicação ──
  const btnExplicar = document.createElement("button");
  btnExplicar.textContent = "Por que essa sugestão?";
  btnExplicar.className = "btn-explicar";
  btnExplicar.addEventListener("click", () =>
    abrirExplicacao(principal.flor, criterios, cardPrincipal)
  );
  elResultados.appendChild(btnExplicar);

  // ── Alternativas ──
  if (alternativas.length > 0) {
    const tituloAlternativas = document.createElement("h3");
    tituloAlternativas.textContent = "Mas também pode ser:";
    elMaisOpcoes.appendChild(tituloAlternativas);

    alternativas.forEach((resultado) => {
      const card = criarCard(resultado, criterios, false);
      const btnExp = document.createElement("button");
      btnExp.textContent = "Explicar";
      btnExp.className = "btn-explicar btn-explicar--small";
      btnExp.addEventListener("click", () => abrirExplicacao(resultado.flor, criterios, card));
      card.appendChild(btnExp);
      elMaisOpcoes.appendChild(card);
    });

    elResultados.appendChild(elMaisOpcoes);
  }

  // ── Aviso obrigatório ──
  const aviso = document.createElement("p");
  aviso.className = "aviso-disclaimer";
  aviso.textContent =
    "⚠️ Este protótipo é apenas informativo. Consulte um especialista para identificação correta e precisa de qualquer espécie vegetal.";
  elResultados.appendChild(aviso);
}

function criarCard(resultado, criterios, destaque) {
  const card = document.createElement("div");
  card.className = destaque ? "resultado-card resultado-card--principal" : "resultado-card";
  card.dataset.flor = resultado.flor;

  const nome = document.createElement("h3");
  nome.textContent = formatarNome(resultado.flor);

  const barra = document.createElement("div");
  barra.className = "barra-compatibilidade";

  const barraInterna = document.createElement("div");
  barraInterna.className = "barra-compatibilidade__preenchimento";
  barraInterna.style.width = resultado.percentual;
  barraInterna.textContent = resultado.percentual;

  barra.appendChild(barraInterna);

  const pct = document.createElement("span");
  pct.className = "compatibilidade-label";
  pct.textContent = `Compatibilidade: ${resultado.percentual}`;

  card.appendChild(nome);
  card.appendChild(pct);
  card.appendChild(barra);

  return card;
}

async function abrirExplicacao(flor, criterios, cardReferencia) {
  // Remove explicação anterior do mesmo card
  const anterior = cardReferencia.querySelector(".explicacao-box");
  if (anterior) { anterior.remove(); return; }

  try {
    const resp = await fetch(`${API}/justificar`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ flor, criterios }),
    });
    const dados = await resp.json();

    const box = document.createElement("div");
    box.className = "explicacao-box";

    const pre = document.createElement("pre");
    pre.textContent = dados.explicacao_texto;
    box.appendChild(pre);

    cardReferencia.appendChild(box);
  } catch (err) {
    console.error("Erro ao buscar explicação:", err);
  }
}

function mostrarErro(msg) {
  elResultados.style.display = "flex";
  elResultados.innerHTML = `<p class="erro">${msg}</p>`;
}

function formatarNome(nome) {
  return nome.replace(/_/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
}