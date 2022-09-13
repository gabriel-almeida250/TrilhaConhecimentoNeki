create or replace function cria_instrutor_trigger() returns trigger as $$
	
declare 
	media_salarial decimal;
	instrutores_recebem_menos integer default 0;
	total_instrutores integer default 0;
	salario decimal;
	percentual decimal(5,2);
	cursor_salarios refcursor;
	begin
	
		select avg(instrutor.salario) into media_salarial from instrutor where id <> new.id;
		
		if new.salario > media_salarial then 
			insert into log_instrutores (informacao) values (new.nome || ' recebe acima da média');
			-- Consegue pegar a contagem de linhas alteradas:
--			get diagnostics logs_inseridos = row_count;
--		
--			if log_inseridos > 1 then 
--				raise exception 'Algo de errado não está certo';
--			end if;
		end if;
	
	select intrutores_internos(new.id) into cursor_salarios;
	loop 
		fetch cursor_salarios into salario;
		exit when not found;
		total_instrutores := total_instrutores + 1;
	
		raise notice 'Salário inserido: % Salário do instrutor existente: %', new.salario, salario;
		if new.salario > salario then
			instrutores_recebem_menos := instrutores_recebem_menos + 1;
		end if;
	
	end loop;
	
	percentual = instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;
	assert percentual < 100::decimal, 'Instrutores novos não podem receber mais do que os antigos';

	insert into log_instrutores (informacao, teste)
			values (new.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores', '');
		
		return new;
	
	-- Tratamentos de erros
--	exception
--		when undefined_column then
--				   or	
--		when SQLSTATE 'P0004' then
--				   or
--		para buscar todos os erros encontradados
--		when others then
--			raise notice 'Algo de errado não está certo.';
--			raise exception 'Erro complicado de resolver.';
	end;

$$ language plpgsql;

-- Dentro de funções plpgsql não podemos adicionar transações internas.

drop trigger cria_log_instrutores on instrutor;
create trigger cria_log_instrutores before insert on instrutor
	for each row execute function cria_instrutor_trigger();

select * from instrutor;
select cria_instrutor ('Outro instrutor', 800);

select * from log_instrutores;

delete from instrutor where id = 25  26; 

DELETE FROM instrutor
  WHERE id IN (SELECT id FROM instrutor WHERE id = 28);
 
 -- Delete de mais de um registro de uma vez:
 delete from instrutor 
 	where id in (32, 33, 22);
 
-- begin or start transaction;
insert into instrutor (nome, salario) values ('João', 6000);
-- rollback;

-- Caso nós quiséssemos que apenas parte do código fosse “cancelado” no caso de um erro, 
-- poderíamos separar nossa função em diversos blocos, como vimos no início do treinamento inicial.
--
-- Cada bloco pode tratar suas exceções de forma individual. 
-- Então se quiséssemos tratar a exceção do segundo INSERT e
-- não cancelar a execução do primeiro, bastaria rodear esse 
-- segundo INSERT em um bloco BEGIN - EXCEPTION - END
