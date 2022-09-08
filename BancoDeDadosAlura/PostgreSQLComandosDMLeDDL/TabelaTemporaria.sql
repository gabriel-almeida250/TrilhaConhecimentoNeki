drop table a;

create temporary table a (
	coluna varchar(255) not null check (coluna <> ''),
	coluna2 varchar(255) not null,
	unique(coluna, coluna2)
);

insert into a values ('Gabriel', 'Fulano');
select * from a;

alter table a rename to arroz;

select * from arroz;

alter table arroz rename to teste;

select * from teste;

alter table teste rename coluna1 to primeira_coluna;

alter table teste rename coluna2 to segunda_coluna;

create temporary table pessoa (
	id serial primary key,
	sobrenome varchar(255)
);

alter table pessoa add column nome varchar(125);

select * from pessoa;

select primeira_coluna as "Primeira Coluna" from teste;

