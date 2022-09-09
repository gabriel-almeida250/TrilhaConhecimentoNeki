create or replace function primeira_pl() returns integer as $$ 
	declare 
		-- primeira_variavel integer := 3;
		primeira_variavel integer default 3;
	begin 
		primeira_variavel := primeira_variavel * 2;
		-- Vários comandos em SQL
		return primeira_variavel;
	end
$$ language plpgsql;

select primeira_pl();

-- Sub Bloco:

create or replace function segunda_pl() returns integer as $$ 
	
	declare 
		primeira_variavel integer default 3;
	begin 
		primeira_variavel := primeira_variavel * 2;
	
		begin
			primeira_variavel := 7;
		end;
	
		return primeira_variavel;
	end;
$$ language plpgsql;

select segunda_pl();