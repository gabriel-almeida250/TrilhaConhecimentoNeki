// const user = {
//     name: 'Gabriel Almeida',
//     email: 'gabriel@mail.com'
// }

// console.log(user.name);

// function sum(a: number, b: number){
//     return a + b;
// }

// function showTicket(user: string | null, ticket: number){
//     console.log(`Olá ${user ?? 'Usuário Padrão'}. Seu número de bilhete é ${ticket}.`)
// }

// showTicket(null, 234);

// let info: any;

// info = [1,2,3];
// info = 'Gabriel';
// info = 2.50;
// info = true;

// function sum(a: any, b: any){
//     return a + b;
// }

// sum(1, 3) // 4
// sum('1', 3) // 13

//============================

//Declaraçãd de Arrays TypedPropertyDescriptor

// let numbers: number[];
// numbers = [1,2,3,4,5,6];

// let users: Array<string>;
// users = ['Gabriel', 'Fulano'];

//============================

// Função sem retorno:
// function showMessages(message: string): void{
//     console.log(message);
// }

// Função com possibilidades diferentes de parâmetros
// function printUserId(id: number | string | boolean): void{
//     console.log(`O ID do usuário é: ${id}`)
// }

// printUserId(2);
// printUserId(true);
// printUserId('Gabriel');

//============================

// function useState(){
//     let state: number | string;

//     function get(){
//         return state;
//     }

//     function set(newValue: number | string){
//         state = newValue;
//     }

//     return { get, set};
// };

// let newState = useState();
// newState.get();
// newState.set('Gabriel')
// newState.set(20)

//============================

// S => state
// T => type
// K => key
// V => value
// E => element

// function useState<T>(){
//     let state: T;

//     function get(){
//         return state;
//     }

//     function set(newValue: T){
//         state = newValue;
//     }

//     return { get, set};
// };

// //Quando usamos generic ele sempre vai respitar o primeiro tipo de variável que colocamos,
// //no caso abaixo é o tipo string
// let newState = useState<string>();
// newState.get();
// newState.set('Gabriel')
// //newState.set(20)

//============================

//Caso eu não defina meu generic por default ele será o tipo que eu colocar depois do igual
//No caso abaixo ele será string
function useState<T extends string | number = string>(){
    let state: T;

    function get(){
        return state;
    }

    function set(newValue: T){
        state = newValue;
    }

    return { get, set};
};

//Quando usamos generic ele sempre vai respitar o primeiro tipo de variável que colocamos,
//no caso abaixo é o tipo string
let newState = useState();
newState.get();
newState.set('Gabriel')
//newState.set(20)

//============================

//Usando o type para criar variaves com o mesmo padrão de tipos
type IdType = string | number | undefined;

let userId: IdType;
let adminId: IdType;

adminId = 10;

//============================

//Toda variável do tipo type deve começar com a letra maiúscula
type UserResponse = {
    id: number;
    name: string;
    avatar: string;
};

//Asserção de tipo
let userResponse = {} as UserResponse;

console.log(userResponse.name);

//============================

type Point = {
    x: number;
    y: number;
};

function printCoord(points: Point){
    console.log(`O eixo x é: ${points.x}`)
    console.log(`O eixo x é: ${points.y}`)
};

printCoord({x: 101, y: 50});

//============================

type User = {
    name: string;
    email: string;
    age: number;
    //Usamos o ? para indicar uma propiedade adicional
    isAdmin?: boolean;
};

let newUSer: User = {
    name: 'Gabriel',
    email: 'gabriel@mail.com',
    age: 18
};

//============================

type User2 = {
    id: number;
    name: string;
};

type Char = {
    nickName: string;
    level: number;
};

//Junção entre dois tipos em um, assim tenho acesso aos dois tipos em um.
type PlayerInfo = User2 & Char;

//Segunda forma
type PlayerInfo2 = User2 & {
    nickName: string;
    level: number;
};


let info: PlayerInfo = {
    id: 1,
    level: 15,
    name: 'Gabriel',
    nickName: 'Gabi'
};

//============================

interface User3 {
    id: number;
    name: string;
};

// let newUser: User3 = {
//     id: 2,
//     name: "Gabriel"
// }

function registerNewUser(newUser: User3){
    newUser.id,
    newUser.name
};

//============================

//Difença na criação de interfaces e types

type TUser = {
    id: number;
    name: string;
};

type TPayment = {
    method: string;
};

type TAccount = TUser & TPayment;

let teste: TAccount = {
    id: 1,
    method: "Cash",
    name: 'Gabriel'
}

interface IUser {
    id: number;
    name: string;
};

interface IPayment {
    method: string;
};

interface IAccount extends IUser, IPayment {};

//============================
