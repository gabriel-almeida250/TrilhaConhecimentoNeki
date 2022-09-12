create function cria_curso(nome_curso varchar, nome_categoria varchar) returns void as $$
	declare 
	id_categoria integer;
	begin
		select id into id_categoria from categoria where nome = nome_categoria;
	
		if not found then 
			insert into categoria (nome) values (nome_categoria) returning id into id_categoria;
		end if;
			insert into curso (nome, categoria_id) values (nome_curso, id_categoria);
	end;
	

$$ language plpgsql;

select cria_curso('Java', 'Programação');
select * from curso;
select * from categoria;