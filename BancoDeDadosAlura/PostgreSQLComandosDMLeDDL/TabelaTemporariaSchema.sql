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

update teste.cursos_programacao set nome_curso = nome
	from academico.curso 
	where teste.cursos_programacao.id_curso = academico.curso.id
	and academico.curso.id < 10;
