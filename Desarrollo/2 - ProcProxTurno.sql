
create procedure ProximoTurno
(@IdSrv int)
as
begin
	select top 1 * from Horarios_Disponibles where es_profesional = 0 and id_servicio_profesional = @IdSrv 
	and fecha_hora_inicio > getdate()
	order by fecha_hora_inicio asc
end
		