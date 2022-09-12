drop table log_instrutores;
create table log_instrutores (
	id serial primary key,
	informacao varchar(255),
	momento_criacao timestamp default current_timestamp
);

drop function cria_instrutor;
create or replace function cria_instrutor(nome_instrutor varchar, salario_instrutor decimal) returns void as $$
	declare 
	id_instrutor_inserido integer;
	media_salarial decimal;
	instrutores_recebem_menos integer default 0;
	total_instrutores integer default 0;
	salario decimal;
	percentual decimal;
	begin
		insert into instrutor (nome, salario) values (nome_instrutor, salario_instrutor) returning id into id_instrutor_inserido;
	
		select avg(instrutor.salario) into media_salarial from instrutor where id <> id_instrutor_inserido;
		if salario_instrutor > media_salarial then 
			insert into log_instrutores (informacao) values (nome_instrutor || ' recebe acima da média');
		end if;
	
	for salario in select instrutor.salario from instrutor where id <> id_instrutor_inserido loop 
		total_instrutores := total_instrutores + 1;
	
		if salario_instrutor > salario then
			instrutores_recebem_menos := instrutores_recebem_menos + 1;
		end if;
	end loop;
	
	percentual = instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;

	insert into log_instrutores (informacao)
			values (nome_instrutor || ' recebe mais do que ' || percentual || '% da grade de instrutores');
	end;
	
$$ language plpgsql;

select * from instrutor;
select cria_instrutor ('Outro instrutor', 500);
select * from log_instrutores;

delete from instrutor where id = 17;

insert into instrutor (nome, salario)