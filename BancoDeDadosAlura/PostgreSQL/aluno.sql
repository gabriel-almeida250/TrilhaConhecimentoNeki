INTEGER
real
serial
numeric

varchar(n)
char
text

boolean 

date
time
timestamp

CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em timestamp
);

SELECT * FROM aluno;

INSERT INTO aluno (nome,
				  cpf,
				  observacao,
				  idade,
				  dinheiro,
				  altura,
				  ativo,
				  data_nascimento,
				  hora_aula,
				  matriculado_em
				  	) 
VALUES ('Gabriel',
		'12345678123',
		'Lorem ipsum dolor sit amet, consectetur
		adipiscing elit. Aliquam pulvinar tortor 
		eget mauris ornare rutrum. Vivamus eget diam 
		quis mi imperdiet faucibus et eu dolor. Donec
		pellentesque ipsum ac enim pretium, finibus eleifend 
		ex viverra. Vivamus sem elit, feugiat eget dui at, maximus 
		tincidunt risus. Class aptent taciti sociosqu 
		ad litora torquent per conubia nostra, per inceptos 
		himenaeos. Integer lacinia enim eget diam varius,
		ac mattis tellus volutpat. Sed imperdiet purus sed 
		efficitur bibendum. Vestibulum ante ipsum primis in 
		faucibus orci luctus et ultrices posuere cubilia curae; 
		Integer quis auctor nisi.',
	   	22,
	   	100.50,
	   	1.80,
	   	TRUE,
		'1999-12-26',
		'17:30:00',
		'2022-09-02 16:13:00'
);

UPDATE aluno
    SET nome = 'Fulano',
    cpf = '10987654321',
    observacao = 'Teste',
    idade = 38,
    dinheiro = 15.23,
    altura = 1.90,
    ativo = FALSE,
    data_nascimento = '1980-01-15',
    hora_aula = '13:00:00',
    matriculado_em = '2020-01-02 15:00:00'
WHERE id = 1;

SELECT * FROM aluno;

DELETE FROM aluno where nome = 'Fulano';

SELECT nome AS "Nome do Aluno",
	   idade,
	   matriculado_em AS quando_se_matriculou
FROM aluno;

insert into aluno (nome) values ('Douglas Dias');
insert into aluno (nome) values ('Fulano Almeida');
insert into aluno (nome) values ('Azevedo Silva');

-- 03.Consulta com filtros

-- Pesquisar por alguma propiedade da tabela:

select nome
from aluno 
where nome = 'Gabriel';

-- Pesquisar por nome diferente do colocado depois do:

select nome
from aluno 
where nome <> 'Gabriel';

-- Opção dois para pesquisar por nome diferente do colocado depois do:

select nome
from aluno 
where nome != 'Gabriel';

-- Pesquisa por nomes que terminam com abriel:

select *
from aluno a 
where nome like '_abriel';

-- Pesquisa por nomes que tem Ga no começo e riel no final:

select *
from aluno
where nome like 'Ga_riel';

-- Pesquisa por todo mundo que começa com G ou qualque outra letra que esteja antes ou depois do %

select *
from aluno a 
where nome like 'G%';

select *
from aluno a 
where nome like '%l';

select *
from aluno a 
where nome like '%ri%';

select *
from aluno a 
where nome like '%ri%l';

-- Selecionar qualquer nome que contenha espaço:

select *
from aluno a 
where nome like '% %';

-- Filtrando registros de campos do tipo numérico, data e booleano:

-- Para retornos do tipo boolean usamos o IS para comparar se uma informação é verdadeira ou falsa:

-- Verificando se o campo de cpf está vazio ou não

select *
from aluno a 
where cpf is null;

select *
from aluno a 
where cpf is not null;

-- Retorna todo aluno a idade que eu coloquei depois do =

select *
from aluno a 
where idade = 22;

-- Retorna todo aluno com idade diferente do que eu coloquei depois do <>

-- Campos nulos não entram nesse tipo de consulta

select *
from aluno a 
where idade <> 25;

-- Operadores menor e maior também funcionam para montar uma consulta

select *
from aluno a 
where idade >= 18;

select *
from aluno a 
where idade > 18;

select *
from aluno a 
where idade < 25;

select *
from aluno a 
where idade <= 25;

-- Operador BETWEEN

select *
from aluno a 
where idade between 10 and 40;

------------

select *
from aluno a 
where ativo = true;

select *
from aluno a 
where ativo is null;

------------

-- Filtrando utilizando operadores E ou OU:

-- Query com mais de uma condição 

-- Operador and

select *
from aluno a 
where nome like 'G%'
and cpf is not null;

-- Operador or

select *
	from aluno a 
	where nome like 'Gabriel'
		or nome like 'Fulano'
		or nome like 'A%';

Nesta aula, aprendemos:

--A selecionar campos específicos da tabela
--Como definir um alias para os nomes dos campos
--A filtrar registros, utilizando o WHERE para campos do tipo de texto
--Operadores =, !=,<>, LIKE e NOT LIKE
--A diferença entre = e LIKE
--O funcionamento do caractere % no filtro com LIKE e NOT LIKE
--O funcionamento do caractere _ no filtro com LIKE e NOT LIKE
--Como filtrar utilizando IS NULL e IS NOT NULL
--Como filtrar registros para campos do tipos relacionados a números, datas e horas
--=, !=, <>, <, <=, >, >=
--BETWEEN
--Como filtrar registros para campos do tipo booleano
--=, !=, <>
--Como funciona os operadores lógicos AND e OR

--=================================

-- 04.Trabalhando com relacionametos 

-- Criando tabela com chave primária 

create table curso (
	id INTEGER primary KEY,
	nome VARCHAR(255)
);

insert into curso (id, nome) values (1, 'JavaScript');
insert into curso (id, nome) values (2, 'Java');

select * from curso;

drop table aluno_curso;

create table aluno (
	id serial primary key,
	nome varchar(255) not null
);

insert into aluno (nome) values ('Gabriel');
insert into aluno (nome) values ('Abner');

select * from aluno;

select * from curso;

-- Criando tabela com chave estrangeira

create table aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	primary key (aluno_id, curso_id),
	
	foreign key (aluno_id)
		references aluno (id),
		
	foreign key (curso_id)
		references curso (id)
);

insert into aluno_curso (aluno_id, curso_id) values (1,1);
insert into aluno_curso (aluno_id, curso_id) values (2,1);

select *
from aluno a 
where id = 1;

select * from aluno;

select * from curso;

-- Consultas com relcionamentos

-- JOIN

select a.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso" 
	from aluno a 
		join aluno_curso on aluno_curso.aluno_id = a.id
		join curso on curso.id = aluno_curso.curso_id; 

--======================
	
insert into aluno_curso (aluno_id, curso_id) values (2, 2);

insert into aluno (nome) values ('Diego');

insert into curso (id, nome) values (3, 'React');

-- Com o left join a query vai trazer todos os valores da tabela da esquerda. a primeira refenciada no select
-- Independente ser no lado do curso for null

select a.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso" 
	from aluno a 
		left join aluno_curso on aluno_curso.aluno_id = a.id
		left join curso on curso.id = aluno_curso.curso_id;
		
-- Com o right join a query vai trazer todos os valores da tabela da direita. a segunda refenciada no select
-- Independente ser no lado do aluno for null

	select a.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso" 
	from aluno a 
		right join aluno_curso on aluno_curso.aluno_id = a.id
		right join curso on curso.id = aluno_curso.curso_id;
		
-- Com o full join não importa se existe dados na tabrela da direita ou da esqueda, ele vai trazer as duas
	
	select a.nome as "Nome do Aluno",
	   curso.nome as "Nome do Curso" 
	from aluno a 
		full join aluno_curso on aluno_curso.aluno_id = a.id
		full join curso on curso.id = aluno_curso.curso_id;
		
	select aluno.nome as "Nome do Aluno",
	curso.nome as "Nome do curso"
	from aluno 
	cross join curso;
	
insert into aluno (nome) values ('João');

--Nesta aula, aprendemos:
--
--Como funciona a chave primária
--Como funciona os campos que aceitam NULL e que não aceitam NULL (NOT NULL)
--Como funciona um campo UNIQUE
--Como criar uma chave primária
--Como funciona a chave estrangeira
--Como criar uma chave estrangeira
--Como criar consultas com relacionamentos
--INNER JOIN
--LEFT JOIN
--RIGHT JOIN
--FULL JOIN
--CROSS JOIN

--=================================


-- 05.Usando Cascade:

-- Com o auxílio do cascade é possível deletar um aluno já relacionado com algum curso

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
     ON DELETE cascade,

    FOREIGN KEY (curso_id)
     REFERENCES curso (id)
  );

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

delete from aluno where id = 1;

-- Update pg_catalog."ri_fkey_cascade_del"

update aluno 
set id = 10
where id = 2;

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
     ON DELETE cascade
     on update cascade,

    FOREIGN KEY (curso_id)
     REFERENCES curso (id)
  );
  
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);

select 
	   a.id as aluno_id,
	   a.nome as "Nome do Aluno",
	   curso.id as curso_id,
	   curso.nome as "Nome do Curso" 
	from aluno a 
		join aluno_curso on aluno_curso.aluno_id = a.id
		join curso on curso.id = aluno_curso.curso_id;
	
--Nesta aula, aprendemos:
--
--Como funciona as restrições de chave estrangeira
--A diferença entre RESTRICT e CASCADE
--Como aplicar tipos diferentes de restrições de chave estrangeira no DELETE
--RESTRICT
--CASCADE
--A aplicar tipos diferentes de restrições de chave estrangeira no UPDATE
--RESTRICT
--CASCADE

--=================================

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Oliveira');

select * 
from funcionarios 
order by nome desc;

select *
from funcionarios 
order by nome asc;

-- Ordenação por mais de um campo

select *
from funcionarios 
order by nome, matricula;

select *
from funcionarios 
order by nome, matricula desc;

-- Ordenação por posição da coluna

select * 
from funcionarios
order by 3, 4, 2;

-- Mistutrano coluna e atributo na query

select *
from funcionarios
order by 4 desc, funcionarios.nome desc, 2 asc;

SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
    ORDER BY curso.nome, aluno.nome;
    
 select *
 from aluno;

select *
from curso;

insert into aluno_curso (aluno_id, curso_id) values (5,3);

-- Limitando as consultas:

-- Limit = Limita a quantidade de registros do select 

-- Offset = Determina a quantidade que o select vai pular 

select *
from funcionarios f 
order by id 
limit 5
offset 2;

--=================================

-- Funções de agregação:

-- COUNT - Retorna a quantidade de registros
-- SUM -   Retorna a soma dos registros
-- MAX -   Retorna o maior valor dos registros
-- MIN -   Retorna o menor valor dos registros
-- AVG -   Retorna a média dos registros

select count(*) as "Quantidade total de registros"
from aluno;

select count(id) as "Quantidade total de registros",
sum(id) as "Soma total dos registros",
max(id) as "Maior id da tebela",
min(id) as "Menor id da tabela",
round(avg(id), 1) as "Média dos registros da tabela"
from aluno;

select max(nome)
from aluno;

-- Agrupando consultas:

-- O DISTINCT garante que os dados do campo solicitado não se repitam, 
-- a partir do agrupamento de informações.

select distinct  
nome, sobrenome
from funcionarios 
order by nome;

select 
nome, sobrenome,
count(id)
from funcionarios 
group by nome, sobrenome 
order by nome;

SELECT curso.nome,
        COUNT(aluno.id)
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
    GROUP BY 1
    ORDER BY 1

SELECT curso.nome,
	count(aluno.id)
  FROM curso
  LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
  LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
 -- where curso.nome = 'Javascript'
group by 1
having count (aluno.id) > 0;

select nome,
		count (id)
	from funcionarios
	group by nome
	having count(id) > 1;
	
-- Nesta aula, aprendemos:
--
-- Como ordenar uma consulta
-- Ordenar utilizando os nomes de campo
-- Ordenar com mais de um campo
-- Ordenar por posição do campo
-- Ordenar por ordem Crescente e Decrescente
-- Ordenar com campos de tabelas diferentes
-- Como limitar quantidade e paginar registros de consulta
-- LIMIT
-- OFFSET
-- Como funcionam as funções de agregação
-- COUNT
-- SUM
-- MAX
-- MIN
-- AVG
-- Como funciona a função de arredondamento ROUND
-- Como funciona o agrupamento de dados
-- A diferença entre DISTINCT e GROUP BY
-- Onde utilizar o DISTINCT
-- Onde utilizar o GROUP BY
-- Como utilizar o GROUP BY com os nomes de campo
-- Como utilizar o GROUP BY por posição
-- Como funcionam os filtros por funções de agrupamento, utilizando HAVING
-- A diferença entre WHERE e HAVING
-- Como utilizar o HAVING