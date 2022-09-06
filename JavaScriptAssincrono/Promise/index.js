// Promise

// A promessa de que algo irá acontecer
// Poderá dar certo ou errado, 
// mas irá acontecer

let aceitar = true;

console.log('Pedir Uber');

const promessa = new Promise((resolve, reject) => {

    if (aceitar) {
        return resolve('Pedido aceito!')
    } else {
        return reject('Pedido negado!'); 
    }
});

console.log('Aguardando');

promessa
.then(result => console.log(result))
.catch(error => console.log(error))
.finally(() => console.log('Finalizado!'));
