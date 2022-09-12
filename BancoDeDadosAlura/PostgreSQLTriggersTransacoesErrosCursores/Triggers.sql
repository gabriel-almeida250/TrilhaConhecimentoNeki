create or replace function cria_instrutor_trigger() returns trigger as $$
	
declare 
	id_instrutor_inserido integer;
	media_salarial decimal;
	instrutores_recebem_menos integer default 0;
	total_instrutores integer default 0;
	salario decimal;
	percentual decimal(5,2);
	begin
	
		select avg(instrutor.salario) into media_salarial from instrutor where id <> id_instrutor_inserido;
		
		if new.salario > media_salarial then 
			insert into log_instrutores (informacao) values (new.nome || ' recebe acima da média');
		end if;
	
	for salario in select instrutor.salario from instrutor where id <> new.id loop 
		total_instrutores := total_instrutores + 1;
	
		if new.salario > salario then
			instrutores_recebem_menos := instrutores_recebem_menos + 1;
		end if;
	
	end loop;
	
	percentual = instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;

	insert into log_instrutores (informacao)
			values (new.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores');
		
		return new;
	end;
	
$$ language plpgsql;

create trigger cria_log_instrutores after insert on instrutor
	for each row execute function cria_instrutor_trigger();

select * from instrutor;
select cria_instrutor ('Outro instrutor', 800);
select * from log_instrutores;

insert into instrutor (nome, salario) values ('Outra pessoa de novo', '800');
