create procedure Delete_Pacientes
(@id int)
as
begin
	delete from Pacientes
	where id = @id
end