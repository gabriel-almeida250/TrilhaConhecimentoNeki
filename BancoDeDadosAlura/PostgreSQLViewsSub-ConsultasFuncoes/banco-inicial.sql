CREATE DATABASE alura_postgreSQL_V_SC_F;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

drop table categoria;
CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

drop table curso;
CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

drop table aluno_curso;
CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) 
	values ('Gabriel', 'Almeida', '26-12-1999'),
		   ('Guilherme', 'Xavier', '17-03-2003'),
		   ('Douglas', 'Barbosa', '10-08-1996'),
		   ('Pietro', 'Cavalvante', '14-05-1990'),
		   ('Ademir', 'Botelho', '02-11-1981');
		  
insert into categoria (nome) 
	values ('Linguagem de Programação'),
	       ('Biblioteca'),
	       ('Linguagem de Marcação'),
	       ('Banco de Dados'),
	       ('Cloud');
	      
insert into curso (nome, categoria_id)
	values ('JavaScript', 1),
		   ('React', 2),
		   ('HTML', 3),
		   ('PostGreSQL', 4),
		   ('Azure', 5);

insert into aluno_curso (aluno_id, curso_id)
	values (1, 2),
		   (2, 1),
		   (3, 5),
		   (5, 3),
		   (4, 4);

select *
	from aluno;

select *
	from categoria;

select *
	from curso;

select *
	from aluno_curso;

select aluno.primeiro_nome,
	   count(aluno.id) 
	from aluno
	left join aluno_curso on aluno.id = aluno_curso.aluno_id
	left join curso on curso.id = aluno_curso.curso_id
	group by 1
	order by aluno.primeiro_nome;