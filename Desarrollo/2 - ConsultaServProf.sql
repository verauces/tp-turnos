
create procedure ConsultarServProf
(@Id int,
@EsServ bit)
as
begin
	if (@EsServ = 1)
	begin
		select * from Servicio where id = @id
	end
	else
	begin
		select * from Profesional where id = @Id
	end
end