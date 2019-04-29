create procedure Delete_Servicio
(@id int)
as
begin
	delete from Servicio
	where id = @id
end