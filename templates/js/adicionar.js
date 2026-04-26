/**
 * Lógica da página adicionar.html.
 * Lê o nome e os critérios do formulário e chama POST /flores na API Flask.
 */

const API = "http://127.0.0.1:5000";

document.addEventListener("DOMContentLoaded", () => {
  const btnCadastrar = document.getElementById("btn-cadastrar");
  const feedbackEl = document.getElementById("feedback");

  if (!btnCadastrar) return; // Segurança

  btnCadastrar.addEventListener("click", async () => {
    const nome = document.getElementById("nome-planta").value.trim();

    if (!nome) {
      mostrarFeedback(feedbackEl, "erro", "Informe o nome da planta antes de cadastrar.");
      return;
    }

    const caracteristicas = lerCriterios();

    if (Object.keys(caracteristicas).length === 0) {
      mostrarFeedback(feedbackEl, "erro", "Informe ao menos uma característica.");
      return;
    }

    btnCadastrar.disabled = true;
    btnCadastrar.value = "Cadastrando...";

    try {
      const resp = await fetch(`${API}/flores`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nome, caracteristicas }),
      });

      const dados = await resp.json();

      if (resp.ok) {
        mostrarFeedback(
          feedbackEl,
          "sucesso",
          `✅ Planta "${dados.flor}" cadastrada com sucesso!`
        );
        
        // --- NOVA LÓGICA PARA LIMPAR O FORMULÁRIO ---
        document.getElementById("nome-planta").value = "";
        document.querySelectorAll("#filters select").forEach((select) => {
          // Remove a seleção de todos os elementos dentro do menu suspenso
          Array.from(select.options).forEach(opt => opt.selected = false);
        });
        
      } else {
        mostrarFeedback(feedbackEl, "erro", `❌ Erro: ${dados.erro}`);
      }
    } catch (err) {
      mostrarFeedback(feedbackEl, "erro", "Não foi possível conectar ao servidor.");
      console.error(err);
    } finally {
      btnCadastrar.disabled = false;
      btnCadastrar.value = "Cadastrar!";
    }
  });
});

function mostrarFeedback(el, tipo, mensagem) {
  el.textContent = mensagem;
  el.className = `feedback feedback--${tipo}`;
  el.style.display = "block";
}