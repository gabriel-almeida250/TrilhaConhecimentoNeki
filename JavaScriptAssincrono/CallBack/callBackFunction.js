// Funções aceitam qualquer tipo de dado como argumento

function imprimirDado(dado) {
    console.log('Outras tarefas');
    console.log(dado());
};

// imprimirDado(1);
// imprimirDado('texto');
// imprimirDado(true);
// imprimirDado({ nome: 'Gabriel'});
imprimirDado(function () {
    return 'Olá Mundo'
});

//Uma função callBack é quando usuamos uma função como arguento de outra.