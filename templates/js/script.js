function renderizarInterface() {
    const container = document.getElementById('filters');
    if (!container) {
        console.error("ERRO: Não encontrei o ID 'filtros-container' no seu HTML!");
        return;
    }

    container.innerHTML = ""; // Limpa antes de gerar

    for (const chave in dicionarioBotanico) {
        const categoria = dicionarioBotanico[chave];

        const div = document.createElement('div');
        div.className = 'filter-item';

        const label = document.createElement('label');
        label.textContent = categoria.label;

        const select = document.createElement('select');
        select.id = `input_${chave}`; // ID padrão que usamos para ler depois

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

document.addEventListener('DOMContentLoaded', () => {
    renderizarInterface();
});