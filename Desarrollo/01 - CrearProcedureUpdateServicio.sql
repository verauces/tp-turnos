create procedure Update_Servicio
(@id int,
@name varchar(50),
@type char(2))
as
begin
	update Servicio 
	set nombre = @name, tipo = @type
	where id = @id
end