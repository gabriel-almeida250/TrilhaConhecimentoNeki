select  * from curso;
select * from categoria;

select *
	from curso 
	where categoria_id = 1 or categoria_id = 2;

select *
	from curso 
	where categoria_id in (1, 2);

select *
	from curso 
	where categoria_id in (3);

select *
	from aluno
	where aluno.primeiro_nome in ('Vinícius', 'Diogo', 'Patricia');

select id
	from categoria 
	where nome not like '% %';

-- Sub Query

select *
	from curso 
	where categoria_id in (
	select id
	from categoria 
	where nome not like '% %');

select *
	from curso 
	where categoria_id in (
	select id
	from categoria 
	where nome like '% de %');

select categoria.nome as Categoria,
	   count(curso.id) numero_cursos
	   from categoria 
	   join curso on curso.categoria_id = categoria.id
	   group by 1;
	  
select categoria, 
	   numero_cursos
	   from (
	   	select categoria.nome as Categoria,
	   		count(curso.id) numero_cursos
	   		from categoria 
	   		join curso on curso.categoria_id = categoria.id
	   		group by 1
	   ) as categoria_cursos
	   where numero_cursos > 3;
	  
select categoria
	from (
	   	select categoria.nome as Categoria,
	   		count(curso.id) numero_cursos
	   		from categoria 
	   		join curso on curso.categoria_id = categoria.id
	   		group by 1
	   		having count (curso.id) > 3
	   ) as categoria_cursos
	   where numero_cursos > 3;
	  
select categoria.nome as Categoria,
	   		count(curso.id) numero_cursos
	   		from categoria 
	   		join curso on curso.categoria_id = categoria.id
	   		group by 1
	   		having count (curso.id) > 3;
	   	
  SELECT curso.nome,
         COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
     HAVING COUNT(aluno_curso.aluno_id) > 2
ORDER BY numero_alunos DESC;


  SELECT t.curso,
         t.numero_alunos
    FROM (
        SELECT curso.nome AS curso,
               COUNT(aluno_curso.aluno_id) numero_alunos
          FROM curso
          JOIN aluno_curso ON aluno_curso.curso_id = curso.id
      GROUP BY 1
    ) AS t
    WHERE t.numero_alunos > 2
  ORDER BY t.numero_alunos DESC;
 