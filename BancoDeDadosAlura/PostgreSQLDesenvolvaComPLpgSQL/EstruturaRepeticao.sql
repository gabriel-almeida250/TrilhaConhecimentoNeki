create or replace function tabuada(numero integer) returns setof integer as $$

	declare
		multiplicador integer default 1;
	begin
		-- Multiplicador que começa com 1, e vai até < 10
		-- Número 8 multiplicador 
		-- Multiplicador := multiplicador + 1
		
		loop
			return next numero * multiplicador;
			
			multiplicador := multiplicador + 1;
		
			exit when multiplicador = 10;
		end loop;
					
	end;

$$ language plpgsql;

select tabuada(9);

create or replace function tabuada2(numero integer) returns setof varchar as $$

	declare
		multiplicador integer default 1;
	begin
		loop
			-- 9 x 1 = 9
			return next numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;
			
			multiplicador := multiplicador + 1;
		
			exit when multiplicador = 10;
		end loop;
					
	end;

$$ language plpgsql;

select tabuada2(9);

create or replace function tabuada_while(numero integer) returns setof varchar as $$

	declare
		multiplicador integer default 1;
	begin
		while multiplicador < 10 loop 
			return next numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;
			multiplicador := multiplicador + 1;
		end loop;		
	end;

$$ language plpgsql;

select tabuada_while(9);

create or replace function tabuada_for(numero integer) returns setof varchar as $$

	declare
		multiplicador integer default 1;
	begin
		for multiplicador in 1..9 loop
			return next numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;
		end loop;		
	end;

$$ language plpgsql;

select tabuada_for(5);

drop function instrutor_com_salario;
create or replace function instrutor_com_salario(out nome varchar, out salario_ok_case2 varchar) returns setof record as $$ 
	declare 
		instrutor instrutor;
	begin
		for instrutor in select * from instrutor loop
			nome := instrutor.nome;
			salario_ok_case2 = salario_ok_case2(instrutor.id);
		
			return next;
		end loop;
	end;
	
$$ language plpgsql;  

select * from instrutor_com_salario();