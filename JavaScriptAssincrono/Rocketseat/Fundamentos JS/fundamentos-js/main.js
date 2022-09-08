//Comando para renderizar um texto apenas com JavaScript
document.body.innerText = "Hello World"

//Nullish Coalescing Operator

//0, '', [], false, undefined, null ==> false

// Duas formas para se utilizar um ternario em js, a primeira forma interpreta o 0 como false
//Já na segunda opção o zero também é um valor, portanto é a forma mais correta de montar a lógica, no caso da idade não ter sido informada.

//const idade = 22;

//Primeira Opção:
//document.body.innerText = 'Sua idade é: ' + (idade || 'Não informdado');

//Segunda Opção:
//document.body.innerText = 'Sua idade é: ' + (idade ?? 'Não informdado');

//=========================

// Objetos

const user = {
  name: 'Gabriel',
  idade: 22,
  address: {
    street: 'Rua Teste',
    number: 176,
  },
};

//Expressão in no javaScript
//Serve para verificar se existe aquela propiedade no objeto, com o retorno de true ou false:

//document.body.innerText = ('name' in user);

//Object.keys para retornar todas as chaves do meu objeto

//document.body.innerText = Object.keys(user);

//Object.values para retornar todas os valores do meu objeto

document.body.innerText = Object.values(user);
document.body.innerText = JSON.stringify(Object.values(user));

//Object.entries retorna o objeto como um vetor com sub vetores dividindo as propiedades do mesmo

document.body.innerText = JSON.stringify(Object.entries(user));

// Desestruturação 

const address = user.address

document.body.innerText = JSON.stringify(address);



