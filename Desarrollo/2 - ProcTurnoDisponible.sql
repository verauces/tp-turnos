create procedure ServicioDisponible
(@Fecha datetime,
@Hora int,
@IdSrv int)
as
begin
	if exists 
		(select 1 from Horarios_Disponibles where
		es_profesional = 0 and
			id_servicio_profesional = @idsrv and
		DATEPART(year, fecha_hora_inicio) = DATEPART(year, @fecha) and
		DATEPART(month, fecha_hora_inicio) = DATEPART(month, @fecha) and
		DATEPART(day, fecha_hora_inicio) = DATEPART(day, @fecha) and
		DATEPART(hour, fecha_hora_inicio) = @hora)
		begin
			print 'El horario se encuentra disponible'
		end
		else
		begin
			print 'El horario no se encuentra disponible'
		end
end
