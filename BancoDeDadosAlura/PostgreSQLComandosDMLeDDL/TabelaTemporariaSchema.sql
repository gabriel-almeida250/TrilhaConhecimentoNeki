create temporary table cursos_programacao (
	id_curso integer primary key,
	nome_curso varchar(255) not null
);

insert into cursos_programacao 

select academico.curso.id,
	   academico.curso.nome
	from academico.curso 
	join academico.categoria on academico.curso.categoria_id = academico.categoria.id 
	where categoria_id = 2;
	
select * 
	from cursos_programacao;
	
create schema teste;

create table teste.cursos_programacao (
	id_curso integer primary key,
	nome_curso varchar(255) not null
);

insert into teste.cursos_programacao 

select academico.curso.id,
	   academico.curso.nome
	from academico.curso 
	join academico.categoria on academico.curso.categoria_id = academico.categoria.id 
	where categoria_id = 2;

select *
	from teste.cursos_programacao;

select * 
	from academico.curso
	order by 1;

update academico.curso set nome = 'PHP Básico'
	where id = 2;

update academico.curso set nome = 'Java Básico'
	where id = 3;

update academico.curso set nome = 'C++ Básico'
	where id = 4;

-- Atualizando os dados de uma tabela, usando outra tabela

update teste.cursos_programacao set nome_curso = nome
	from academico.curso 
	where teste.cursos_programacao.id_curso = academico.curso.id
	and academico.curso.id < 10;

--Assim como é possível fazer INSERT ou UPDATE 
--a partir de um SELECT também podemos realizar junções 
--para filtrar o que queremos excluir de nossas tabelas, 
--mas a sintaxe é um pouco diferente.
--
--Por exemplo, para excluir todos os cursos da categoria 
--com nome “Teste”, podemos fazer:

DELETE FROM curso
      USING categoria
      WHERE categoria.id = curso.categoria_id
        AND categoria.nome = 'Teste';
       
delete 
	from teste.cursos_programacao 
	where id_curso = 10;

-- Toda execução que o postgre faz, é uma transação, ou seja,
-- caso alguma parte da query não der certo, ele reverte os comandos bem sucedidos anteriormente.

-- Podemos controlar isso manualmente também, usando algumas funções do postgre
-- como a função start transaction, ou a mais comum, begin

-- Exemplo:

begin;
delete 
	from teste.cursos_programacao;

-- Comando para recuperar as ações feitas durante a transação

rollback;

select * 
	from teste.cursos_programacao;
	
begin;
delete 
	from teste.cursos_programacao where id_curso = 60;

-- Comando usado para comfirmar a transação

commit;
	
select * 
	from teste.cursos_programacao;
	
-- Caso eu me desconecte do server antes de commitar ou dar um rollback,
-- o postgre automaticamente faz um rollback e retorna os dados para
-- o estado anterior ao começo da transação.

-- Sequences

create sequence eu_criei;

select nextval('eu_criei');

drop table auto;

create temporary table auto (
	id integer primary key default nextval('eu_criei'), 
	nome varchar(30) not null
);

insert into auto (nome) values ('Gabriel Almeida');
insert into auto (id, nome) values (20, 'Fulano');
insert into auto (nome) values ('Outro nome');

select * from auto; 

create type CLASSIFICACAO as enum ('livre', '12_anos', '14_anos', '16_anos', '18_anos');

create temporary table filme (
	id serial primary key,
	nome varchar(255) not null,
	classificacao CLASSIFICACAO
);

insert into filme (nome, classificacao) 
	values ('Um filme qualquer', '18_anos');