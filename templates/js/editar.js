const API = "http://127.0.0.1:5000";

let caracteristicasOriginais = {};

document.addEventListener("DOMContentLoaded", () => {
  const btnCarregar = document.getElementById("btn-carregar");
  const btnEditar = document.getElementById("btn-editar");
  const feedbackEl = document.getElementById("feedback");
  const areaEdicao = document.getElementById("area-edicao");
  const inputNome = document.getElementById("nome-planta");

  // 1. CARREGAR OS DADOS DA PLANTA
  btnCarregar.addEventListener("click", async () => {
    const nome = inputNome.value.trim();
    if (!nome) {
      mostrarFeedback(feedbackEl, "erro", "Informe o nome da planta para carregar.");
      return;
    }

    try {
      const resp = await fetch(`${API}/flores/${nome}`);
      const dados = await resp.json();

      if (resp.ok) {
        mostrarFeedback(feedbackEl, "sucesso", `Dados da planta "${nome}" carregados! Faça as alterações.`);
        caracteristicasOriginais = dados.caracteristicas;
        
        // Usa a função do script.js para renderizar já com os valores preenchidos!
        renderizarInterface(caracteristicasOriginais); 
        areaEdicao.style.display = "block";
        inputNome.disabled = true; // Impede mudar o nome enquanto edita
        btnCarregar.style.display = "none";
      } else {
        mostrarFeedback(feedbackEl, "erro", `❌ Erro: ${dados.erro}`);
        areaEdicao.style.display = "none";
      }
    } catch (err) {
      mostrarFeedback(feedbackEl, "erro", "Erro ao comunicar com o servidor.");
    }
  });

  // 2. SALVAR AS ALTERAÇÕES (PATCH)
  btnEditar.addEventListener("click", async () => {
    const nome = inputNome.value.trim();
    const novasCaracteristicas = lerCriterios(); // Do script.js

    // Calcular o que foi adicionado e o que foi removido
    const adicionar = {};
    const remover = {};

    // Verifica o que há de novo
    for (const [attr, novosValores] of Object.entries(novasCaracteristicas)) {
      const antigosValores = caracteristicasOriginais[attr] || [];
      const add = novosValores.filter(v => !antigosValores.includes(v));
      if (add.length > 0) adicionar[attr] = add;
    }

    // Verifica o que foi retirado
    for (const [attr, antigosValores] of Object.entries(caracteristicasOriginais)) {
      const novosValores = novasCaracteristicas[attr] || [];
      const rem = antigosValores.filter(v => !novosValores.includes(v));
      if (rem.length > 0) remover[attr] = rem;
    }

    if (Object.keys(adicionar).length === 0 && Object.keys(remover).length === 0) {
      mostrarFeedback(feedbackEl, "erro", "Nenhuma alteração foi feita.");
      return;
    }

    btnEditar.disabled = true;
    btnEditar.value = "Salvando...";

    try {
      const resp = await fetch(`${API}/flores/${nome}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ adicionar, remover }),
      });

      const dados = await resp.json();

      if (resp.ok) {
        mostrarFeedback(feedbackEl, "sucesso", `✅ Planta "${dados.flor}" atualizada com sucesso!`);
        setTimeout(() => location.reload(), 2000); // Recarrega a página após sucesso
      } else {
        mostrarFeedback(feedbackEl, "erro", `❌ Erro: ${dados.erro}`);
      }
    } catch (err) {
      mostrarFeedback(feedbackEl, "erro", "Erro ao conectar com o servidor.");
    } finally {
      btnEditar.disabled = false;
      btnEditar.value = "Salvar Alterações";
    }
  });
});

function mostrarFeedback(el, tipo, mensagem) {
  el.textContent = mensagem;
  el.className = `feedback feedback--${tipo}`;
  el.style.display = "block";
  el.style.color = tipo === "erro" ? "red" : "green";
}