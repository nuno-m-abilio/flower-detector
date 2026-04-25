const resultados = document.getElementById("resultados");
const maisOpcoes = document.getElementById("mais-opcoes");
const buscar = document.getElementById("buscar");
const limpar = document.getElementById("limpar");

resultados.style.display = "none";

const flores = ["A", "B", "C"];


function renderizarRespostas(flores) {
    resultados.style.display = "inherit";
    if(1>0){
        //aqui mostra caso achar
        //imprime opcao 1
        const titulo = document.createElement('h2');
        titulo.innerHTML = "De acordo com as informacoes fornecidas, sua planta pode ser:";
        const dados = document.createElement('p');
        // dados.className = "resultado-dados";
        dados.innerHTML = flores[0];
        
        //imprime tabela
        const tituloTabela = document.createElement('h2');
        tituloTabela.innerHTML = "Mas também pode ser:";
        const lista = document.createElement('div');
        lista.className = "resultados-lista";
        flores.forEach(flor => {
            const item = document.createElement('p');
            item.innerText = flor;
            lista.appendChild(item);
        });{

        }
        
        maisOpcoes.appendChild(lista);
        resultados.appendChild(titulo);
        resultados.appendChild(dados);
        resultados.appendChild(tituloTabela);
        resultados.appendChild(maisOpcoes);

    }else{
        //aqui mostra se não achar
        resultados.innerHTML = "";
        const div = document.createElement('div');
        div.className = "resultados-item"
        const aviso = document.createElement('h3');
        aviso.innerHTML = "Opa, não achamos nada aqui com essas características. Que tal tentar de novo?";

        div.appendChild(aviso);
        resultados.appendChild(div);
    }

}


buscar.addEventListener('click', function(){
    renderizarRespostas(flores);
});

limpar.addEventListener('click', function(){
    resultados.innerHTML = "";
    resultados.style.display = "none";
});

