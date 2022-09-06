const https = require('https');
const API = 'https://jsonplaceholder.typicode.com/users?_limit=2';
https.get(API, res => {
    console.log(res.statusCode);
});
//Essa linha será executada primeiro, pois o get é executado depois da requisição na api foi terminada. Como uma CallBack function.
console.log('conectando API');