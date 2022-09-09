create database alura_postgresql_pl_pgsql;

create function primeira_funcao() returns integer as '
	select (5 - 3) * 2;
' language sql;

select primeira_funcao() as numero;

create function soma_dois_numeros(numero_1 integer, numero_2 integer) returns integer as '
	select numero_1 + numero_2;
' language sql;

-- Podemos criar funções com paramêtros que não tem nome,
-- nesse caso preciso passar as posições com o dolar antes

create function soma_dois_numeros2(integer, integer) returns integer as '
	select $1 + $2;
' language sql;

select soma_dois_numeros2(3, 17) as "result";

create table a (
	nome varchar(255) not null
);

create or replace function cria_a(nome varchar) returns varchar as '
	insert into a (nome) values (cria_a.nome);

	select nome;
' language sql;

select cria_a('Gabriel Almeida');

create or replace function cria_a2(nome varchar) returns void as $$
	insert into a (nome) values ('Patricia');
$$ language sql;

select cria_a2('Gabriel Almeida');

-- Reescrevendo as funções usando pl

create function soma_dois_numeros_pl(numero_1 integer, numero_2 integer) returns integer as $$ 
declare
	resultado integer default 0;
begin
		resultado = numero_1 + numero_2;
	
	return resultado;
	end;
	
$$ language plpgsql;

select soma_dois_numeros_pl(1, 1);