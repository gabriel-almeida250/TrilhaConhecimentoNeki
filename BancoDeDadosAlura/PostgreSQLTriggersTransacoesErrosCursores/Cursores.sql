create function intrutores_internos(id_instrutor integer) returns refcursor as $$
	declare
		cursor_salarios refcursor;
	begin
		open cursor_salarios for select instrutor.salario
									from instrutor
								where id <> id_instrutor
									and salario > 0;
		
--		move last from cursor_salarios;
--		move next from cursor_salarios;
--		move prior from cursor_salarios;
--		move first from cursor_salarios;
--		fetch last from cursor_salarios into salario;
--		fetch next from cursor_salarios into salario;
--		fetch prior from cursor_salarios into salario;
--		fetch first from cursor_salarios into salario;
 
		return cursor_salarios;
	end;
	
$$ language plpgsql;