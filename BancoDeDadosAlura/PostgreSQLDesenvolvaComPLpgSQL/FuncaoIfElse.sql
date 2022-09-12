create function salario_ok(instrutor instrutor) returns varchar as $$

	begin
		-- se o salário do instrutor for maior que dozentos, está ok. Senão, pode aumentar
		if instrutor.salario > 200 then 
			return 'Salário está ok';
		else 
			return 'Salário pode aumentar';
		end if;
	end;


$$ language plpgsql;

select nome, salario_ok(instrutor) from instrutor;

create function salario_ok2(id_instrutor integer) returns varchar as $$

	declare
		instrutor instrutor;
	begin
		select * from instrutor where id = id_instrutor into instrutor;
	
		-- se o salário do instrutor for maior que dozentos, está ok. Senão, pode aumentar
		if instrutor.salario > 200 then 
			return 'Salário está ok';
		else 
			return 'Salário pode aumentar';
		end if;
	end;


$$ language plpgsql;

select nome, salario_ok2(instrutor.id) from instrutor;

create or replace function salario_ok3(id_instrutor integer) returns varchar as $$

	declare
		instrutor instrutor;
	begin
		select * from instrutor where id = id_instrutor into instrutor;
	
		-- se o salário do instrutor for maior que 300, está ok. Se for 300 reais, pode aumentar. Caso contrário, o salário está defasado. 
		if instrutor.salario > 300 then 
			return 'Salário está ok';
		elseif instrutor.salario = 300 then
				return 'Salário pode aumentar';
		else
				return 'O salário está defasado';
		end if;
	end;


$$ language plpgsql;

select nome, salario_ok3(instrutor.id) from instrutor;

create or replace function salario_ok_case(id_instrutor integer) returns varchar as $$

	declare
		instrutor instrutor;
	begin
		select * from instrutor where id = id_instrutor into instrutor;
	
		/* -- se o salário do instrutor for maior que 300, está ok. Se for 300 reais, pode aumentar. Caso contrário, o salário está defasado. 
		if instrutor.salario > 300 then 
			return 'Salário está ok';
		elseif instrutor.salario = 300 then
				return 'Salário pode aumentar';
		else
				return 'O salário está defasado';
		end if;*/
		case 
			when instrutor.salario = 100 then
				return 'Salário muito baixo';
			when instrutor.salario = 200 then
				return 'Salário baixo'; 
			when instrutor.salario = 300 then
				return 'Salário ok';
			else
				return 'Salário ótimo';
		end case;
	end;


$$ language plpgsql;

select nome, salario_ok_case(instrutor.id) from instrutor;

create or replace function salario_ok_case2(id_instrutor integer) returns varchar as $$

	declare
		instrutor instrutor;
	begin
		select * from instrutor where id = id_instrutor into instrutor;
	
		/* -- se o salário do instrutor for maior que 300, está ok. Se for 300 reais, pode aumentar. Caso contrário, o salário está defasado. 
		if instrutor.salario > 300 then 
			return 'Salário está ok';
		elseif instrutor.salario = 300 then
				return 'Salário pode aumentar';
		else
				return 'O salário está defasado';
		end if;*/
		case  instrutor.salario
			when 100 then
				return 'Salário muito baixo';
			when 200 then
				return 'Salário baixo'; 
			when 300 then
				return 'Salário ok';
			else
				return 'Salário ótimo';
		end case;
	end;


$$ language plpgsql;

select nome, salario_ok_case2(instrutor.id) from instrutor;