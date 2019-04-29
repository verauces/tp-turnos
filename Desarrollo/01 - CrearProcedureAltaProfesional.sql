create procedure Alta_Profesional
(@name varchar(255),
@mail varchar(80),
@phone varchar(40))
as 
begin
	insert into Profesional (nombre, email, telefono)
	values (@name, @mail, @phone)
end