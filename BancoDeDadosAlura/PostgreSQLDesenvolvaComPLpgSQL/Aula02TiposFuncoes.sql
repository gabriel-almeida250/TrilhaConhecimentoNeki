create table instrutor (
	id serial primary key, 
	nome varchar(255) not null,
	salario decimal(10, 2)
);

insert into instrutor (nome, salario) 
	values ('Gabriel', 100);

update instrutor set nome = 'Gabriel Almeida' where nome = 'Gabriel';

insert into instrutor (nome, salario) 
	values ('Diogo Mascarenhas', 200);
insert into instrutor (nome, salario) 
	values ('Nico Steppat', 300);
insert into instrutor (nome, salario) 
	values ('Juliana', 400);
insert into instrutor (nome, salario) 
	values ('Priscila', 500);
	
create function dobro_do_salario(instrutor) returns decimal as $$ 
	select $1.salario * 2 as dobro;
$$ language sql;

select nome, dobro_do_salario(instrutor.*) as desejo from instrutor;

drop function dobro_do_salario2;

create or replace function cria_instrutor_falso() returns instrutor as $$ 
	select 22, 'Nome falso', 200::decimal;
$$ language sql;

select * from cria_instrutor_falso();

select id, salario from cria_instrutor_falso();

drop function instrutores_bem_pagos;

create function instrutores_bem_pagos2(valor_salario decimal) returns table (id integer, nome varchar, salario decimal) as $$
	select * from instrutor where salario > valor_salario;
$$ language sql;

select * from instrutores_bem_pagos2(300);

-- Forma mais comum:

create or replace function instrutores_bem_pagos(valor_salario decimal) returns setof instrutor as $$
	select * from instrutor where salario > valor_salario;
$$ language sql;

select * from instrutores_bem_pagos(300);

create function soma_e_produto (numero_1 integer, numero_2 integer, out soma integer, out produto integer) as $$
	select numero_1 + numero_2 as soma, numero_1 * numero_2 as produto;
$$ language sql;

select * from soma_e_produto(3, 3);

create type dois_valores as (soma integer, produto integer);

create function soma_e_produto2 (numero_1 integer, numero_2 integer) returns dois_valores as $$
	select numero_1 + numero_2 as soma, numero_1 * numero_2 as produto;
$$ language sql;

select * from soma_e_produto2(3, 3);

create or replace function instrutores_bem_pagos3(valor_salario decimal, out nome varchar, out salario decimal) returns setof record as $$
	select nome, salario from instrutor where salario > valor_salario;
$$ language sql;

select * from instrutores_bem_pagos3(300);
