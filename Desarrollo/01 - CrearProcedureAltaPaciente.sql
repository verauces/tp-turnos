create procedure Alta_Pacientes
(@name varchar(255),
@mail varchar(80),
@phone varchar(40))
as
begin
	insert into Pacientes (nombre, email, telefono)
	values (@name, @mail, @phone)
end
