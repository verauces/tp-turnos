
create procedure Update_Pacientes
(@id int, 
@name varchar(255),
@mail varchar(80),
@phone varchar(40))
as
begin
	update Pacientes
	set nombre = @name, email = @mail, telefono = @phone
	where id = @id
end