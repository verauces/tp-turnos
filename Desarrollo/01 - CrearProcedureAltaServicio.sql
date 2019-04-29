create procedure AltaServicio
(@name varchar(50),
@type char(2))
as
begin
	insert into Servicio(nombre, tipo)
	values (@name, @type)
end