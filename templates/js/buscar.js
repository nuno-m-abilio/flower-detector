const dadosResultados = document.getElementById("dados-resultados");
const resultados = document.getElementById("resultados");
const buscar = document.getElementById("buscar");
const limpar = document.getElementById("limpar");

resultados.style.display = "none";

function renderizarRespostas() {
    resultados.style.display = "inherit";
}

buscar.addEventListener('click', function(){
    renderizarRespostas();
});

limpar.addEventListener('click', function(){
    resultados.style.display = "none";
});
