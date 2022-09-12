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

create or replace function primeira_funcao_pl() returns integer as $$ 
	
	declare
		resultado integer default 0;
	begin
		resultado = (5 - 3) * 2;
	
	return resultado;
	end
	
$$ language plpgsql;

select primeira_funcao_pl() as numero;

drop function cria_a_pl();
create or replace function cria_a_pl() returns void as $$ 
	begin
		insert into a (nome) values ('Patricia');
	end;
	
$$ language plpgsql;

select cria_a_pl();

select nome from a;

create function cria_intrutor_falso_pl() returns instrutor as $$ 
	begin
		return row(22, 'Nome Falso', 200::decimal)::instrutor;
	end;
	
$$ language plpgsql;

select id, salario from cria_intrutor_falso_pl();

create function cria_intrutor_falso_pl2() returns instrutor as $$ 
	declare 
		retorno instrutor;
	begin
		select 22, 'Nome Falso', 200::decimal into retorno;
	
	return retorno;
	end;
	
$$ language plpgsql;

select id, salario from cria_intrutor_falso_pl2();

drop function instrutores_bem_pagos_pl;
create function instrutores_bem_pagos_pl(valor_salario decimal) returns setof instrutor as $$ 
	
	begin
		return query select * from instrutor where salario > valor_salario;
	end;
	
$$ language plpgsql; 

select * from instrutores_bem_pagos_pl(300);

-- Errado:
-- create function soma_e_produto_pl(in numero_1 integer, in numero_2 integer) returns dois_valores as $$
--
--		begin
--			select row(numero_1 + numero_2 as soma, numero_1 + numero_2 as produto)::dois_valores;
--		end;
--	
-- $$ language plpgsql;
--
--select * from soma_e_produto_pl(3, 3);