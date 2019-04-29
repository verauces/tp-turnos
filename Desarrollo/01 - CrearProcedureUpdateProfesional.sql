create procedure Update_Profesional
(@id int,
@name varchar(255),
@mail varchar(80),
@phone varchar(40))
as
begin
	update Profesional
	set nombre = @name, email = @mail, telefono = @phone
	where id = @id
end