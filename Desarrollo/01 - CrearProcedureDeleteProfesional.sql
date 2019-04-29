create procedure Delete_Profesional
(@id int)
as
begin
	delete from Profesional
	where id = @id
end