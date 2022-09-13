do $$ 
	declare
		cursor_salarios refcursor;
		salario decimal;
		total_instrutores integer default 0;
		instrutores_recebem_menos integer default 0;
		percentual decimal(5,2);
	begin
		select intrutores_internos(12) into cursor_salarios;
		loop 
			fetch cursor_salarios into salario;
			exit when not found;
			total_instrutores := total_instrutores + 1;
	
			if 600::decimal > salario then
			instrutores_recebem_menos := instrutores_recebem_menos + 1;
		end if;
	end loop;
	percentual = instrutores_recebem_menos::decimal / total_instrutores::decimal * 100;

	raise notice 'Percentual: % %%', percentual;
	end;
	
$$;