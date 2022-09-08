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
	   curso.nome
	from aluno
	left join aluno_curso on aluno.id = aluno_curso.aluno_id
	left join curso on curso.id = aluno_curso.curso_id
	order by aluno.primeiro_nome;
	
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento)
values ('Vinícius', 'Dias', '1997-10-15'),
	   ('Patricia', 'Freitas', '1986-10-25'),
	   ('Diego', 'Oliveira', '1984-08-27'),
	   ('Maria', 'Rosa', '1985-01-01');
	   
insert into categoria (nome) 
values ('Front-end'),
	   ('Programação'),
	   ('Data Science');
	   
insert into curso (nome, categoria_id) 
values ('CSS', 6),
	   ('PHP', 3),
	   ('Java', 3),
	   ('C++', 3),
	   ('MySQL', 4),
	   ('Oracle', 4),
	   ('SQL Server', 4),
       ('SQLite', 4),
       ('Pandas', 8),
       ('Machine Learning', 8),
       ('Power BI', 8);
       
INSERT INTO aluno_curso VALUES (1,4), 
							   (1,11), 
							   (2,3), 
                               (2,2), 
                               (3,4), 
                               (3,3),
                               (4,7),
                               (4,6),
                               (4,5);

update categoria set nome = 'Ciência de Dados' 
where id = 8;

select *
from categoria;

select curso.nome,
	   categoria.nome 
	from curso 
	join categoria on curso.categoria_id = categoria.id;
	
select categoria.nome,
	   curso.nome
	   from curso 
	join categoria on curso.categoria_id = categoria.id; 
	
select aluno.primeiro_nome,
	   aluno.ultimo_nome, 
	   curso.nome,
	   count(curso.id) as numero_cursos
	   from aluno 
	   left join aluno_curso on aluno_curso.aluno_id = aluno.id
	   left join curso on curso_id = curso.id
	   group by 1, 2, 3
	   order by numero_cursos desc;
	   
	  select aluno.primeiro_nome,
	   aluno.ultimo_nome, 
	   count(aluno_curso.curso_id) as numero_cursos
	   from aluno 
	   left join aluno_curso on aluno_curso.aluno_id = aluno.id
	   group by 1, 2
	   order by numero_cursos desc;
	   
	  select aluno.primeiro_nome,
	   aluno.ultimo_nome, 
	   count(aluno_curso.curso_id) as numero_cursos
	   from aluno 
	   left join aluno_curso on aluno_curso.aluno_id = aluno.id
	   group by 1, 2
	   order by numero_cursos desc
	   limit 1;
	  
select curso.nome,
       count(aluno_curso.aluno_id) as numero_alunos
       from curso 
	   join aluno_curso on aluno_curso.curso_id  = curso.id
	   group by 1
	   order by numero_alunos desc;	  
	  
select curso.nome,
       count(aluno_curso.aluno_id) as numero_alunos
       from curso 
	   join aluno_curso on aluno_curso.curso_id  = curso.id
	   group by 1
	   order by numero_alunos desc 
	   limit 1;

select categoria.nome,
		count(curso.categoria_id) as numero_cursos
		from categoria 
		join curso on categoria_id = categoria.id
		group by 1
		order by numero_cursos desc;
		
select categoria.nome,
		count(curso.categoria_id) as numero_cursos
		from categoria 
		join curso on categoria_id = categoria.id
		group by 1
		order by numero_cursos desc
		limit 1;
	
	SELECT categoria.nome AS categoria,
        COUNT(curso.id) AS numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;
		
	SELECT categoria
    FROM (
            SELECT categoria.nome AS categoria,
                COUNT(curso.id) as numero_cursos
            FROM categoria
            JOIN curso ON curso.categoria_id = categoria.id
        GROUP BY categoria
    ) AS categoria_cursos
  WHERE numero_cursos > 3;
  
 SELECT categoria.nome AS categoria,
        COUNT(curso.id) AS numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria
having count(curso.id) > 3;