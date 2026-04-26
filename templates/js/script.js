/**
 * Renderiza os campos de filtro botânico no #filters.
 * Utiliza menus dropdown (<select multiple>) para permitir selecionar várias opções.
 *
 * Exporta: lerCriterios() → objeto { atributo: [valores] } pronto para a API.
 */

function renderizarInterface(valoresIniciais = {}) {
  const container = document.getElementById("filters");
  if (!container) return;
  container.innerHTML = "";

  for (const chave in dicionarioBotanico) {
    const categoria = dicionarioBotanico[chave];
    const div = document.createElement("div");
    div.className = "filter-item";

    const label = document.createElement("label");
    label.textContent = categoria.label;
    
    // Adicionar uma pequena dica visual para o utilizador
    if (categoria.multiselect) {
      const hint = document.createElement("span");
      hint.className = "multiselect-hint";
      hint.textContent = " (Segure Ctrl ou Cmd para selecionar vários)";
      hint.style.fontSize = "0.8em";
      hint.style.color = "#666";
      label.appendChild(hint);
    }
    div.appendChild(label);

    // Criar a caixa de seleção
    const select = document.createElement("select");
    select.id = `input_${chave}`;
    select.name = chave;

    if (categoria.multiselect) {
      select.multiple = true;
      // Para select múltiplo, um pouco mais de altura fica visualmente melhor
      select.style.minHeight = "80px"; 
    } else {
      // Opção por defeito apenas para menus de seleção única
      const optDefault = document.createElement("option");
      optDefault.value = "";
      optDefault.textContent = "— Não observado —";
      select.appendChild(optDefault);
    }

    const iniciais = valoresIniciais[chave] || [];

    // Preencher as opções disponíveis
    categoria.opcoes.forEach((opcao) => {
      const el = document.createElement("option");
      el.value = opcao.valor;
      el.textContent = opcao.texto;
      if (iniciais.includes(opcao.valor)) {
        el.selected = true;
      }
      select.appendChild(el);
    });

        const div = document.createElement('div');
        div.className = 'filter-item';

        const label = document.createElement('label');
        label.textContent = categoria.label;

        const select = document.createElement('select');
        select.id = `input_${chave}`; // ID padrão para ler depois
        select.multiple = true;

        const optDefault = document.createElement('option');
        optDefault.value = "";
        optDefault.textContent = "Não observado / Qualquer";
        select.appendChild(optDefault);

        categoria.opcoes.forEach(opcao => {
            const el = document.createElement('option');
            el.value = opcao.valor;
            el.textContent = opcao.texto;
            select.appendChild(el);
        });

        div.appendChild(label);
        div.appendChild(select);
        container.appendChild(div);
    }
}

function lerCriterios() {
  const criterios = {};

  for (const chave in dicionarioBotanico) {
    const select = document.getElementById(`input_${chave}`);
    if (select) {
      // A propriedade selectedOptions devolve apenas os <option> selecionados
      const valores = Array.from(select.selectedOptions)
                           .map(opt => opt.value)
                           .filter(val => val !== ""); // ignora valores vazios

      if (valores.length > 0) {
        criterios[chave] = valores;
      }
    }
  }

  return criterios;
}

// Renderiza assim que o DOM estiver pronto
document.addEventListener("DOMContentLoaded", () => {
  renderizarInterface();
});