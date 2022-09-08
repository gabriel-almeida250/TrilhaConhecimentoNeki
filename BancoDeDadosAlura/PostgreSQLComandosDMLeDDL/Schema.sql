CREATE DATABASE alura_postgreSQL_dml_ddl;

drop table academico.aluno;
CREATE TABLE if not exists academico.aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT null default 'Fulano',
	ultimo_nome VARCHAR(255) NOT null check (ultimo_nome <> ''),
	data_nascimento DATE NOT null default now()::date
);

drop table academico.categoria;
CREATE TABLE academico.categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

drop table academico.curso;
CREATE TABLE academico.curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);

drop table academico.aluno_curso;
CREATE TABLE academico.aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES academico.aluno(id),
	curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

create schema academico;

drop table aluno, categoria, curso, aluno_curso;

insert into academico.aluno (primeiro_nome, ultimo_nome, data_nascimento)
values ('Gabriel', 'Almeida', '1999-12-26'),
	   ('Patricia', 'Freitas', '1986-10-25'),
	   ('Diego', 'Oliveira', '1984-08-27'),
	   ('Maria', 'Rosa', '1985-01-01');
	   
insert into academico.categoria (nome) 
values ('Front-end'),
	   ('Programação'),
	   ('Banco de Dados'),
	   ('Data Science')
	   ;
	   
insert into academico.curso (nome, categoria_id) 
values ('CSS', 1),
	   ('PHP', 2),
	   ('Java', 2),
	   ('C++', 2),
	   ('MySQL', 3),
	   ('Oracle', 3),
	   ('SQL Server', 3),
       ('SQLite', 3),
       ('Pandas', 4),
       ('Machine Learning', 4),
       ('Power BI', 4);
       
INSERT INTO academico.aluno_curso VALUES (1,4), 
							   (1,11), 
							   (2,1), 
                               (2,2), 
                               (3,4), 
                               (3,3),
                               (4,4),
                               (4,6),
                               (4,5);
                               
select *
	from academico.curso 
	join academico.categoria on academico.curso.categoria_id = academico.categoria.id 
	where categoria_id = 2;
	
