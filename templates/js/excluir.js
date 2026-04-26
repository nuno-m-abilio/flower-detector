const API = "http://127.0.0.1:5000";

document.addEventListener("DOMContentLoaded", () => {
  const btnExcluir = document.getElementById("btn-excluir");
  const feedbackEl = document.getElementById("feedback");

  btnExcluir.addEventListener("click", async () => {
    const nome = document.getElementById("nome-planta").value.trim();

    if (!nome) {
      mostrarFeedback(feedbackEl, "erro", "Por favor, informe o nome da planta que deseja excluir.");
      return;
    }

    if (!confirm(`Tem a certeza que deseja excluir permanentemente a planta "${nome}"?`)) {
        return;
    }

    btnExcluir.disabled = true;
    btnExcluir.value = "Excluindo...";

    try {
      const resp = await fetch(`${API}/flores/${nome}`, {
        method: "DELETE",
      });

      const dados = await resp.json();

      if (resp.ok) {
        mostrarFeedback(feedbackEl, "sucesso", `✅ Planta "${dados.flor}" excluída com sucesso!`);
        document.getElementById("nome-planta").value = "";
      } else {
        mostrarFeedback(feedbackEl, "erro", `❌ Erro: ${dados.erro}`);
      }
    } catch (err) {
      mostrarFeedback(feedbackEl, "erro", "Não foi possível conectar ao servidor.");
      console.error(err);
    } finally {
      btnExcluir.disabled = false;
      btnExcluir.value = "Excluir";
    }
  });
});

function mostrarFeedback(el, tipo, mensagem) {
  el.textContent = mensagem;
  el.className = `feedback feedback--${tipo}`;
  el.style.display = "block";
  el.style.color = tipo === "erro" ? "red" : "green";
}