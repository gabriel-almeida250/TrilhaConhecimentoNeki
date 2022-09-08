create view vw_cursos_por_categoria as SELECT categoria.nome AS categoria,
                COUNT(curso.id) as numero_cursos
            FROM categoria
            JOIN curso ON curso.categoria_id = categoria.id
        GROUP BY categoria;
        
select * from vw_cursos_por_categoria;

select categoria
	from vw_cursos_por_categoria as categoria_cursos
	where numero_cursos > 3;

create view vw_cursos_programacao as select nome from curso where categoria_id = 2;

select * from vw_cursos_programacao;

create view vw_cursos_linguagem_programacao 
	as select nome
		from curso 
		where categoria_id = 1;
	
select *
	from vw_cursos_linguagem_programacao;

create view vw_cursos_banco_de_dados 
	as select nome
		from curso 
		where categoria_id = 4;

select *
	from vw_cursos_banco_de_dados where nome = 'Oracle';
	
select categoria.id as categoria_id,
	   vw_cursos_por_categoria.* 
	from vw_cursos_por_categoria
	join categoria on categoria.nome = vw_cursos_por_categoria.categoria;
