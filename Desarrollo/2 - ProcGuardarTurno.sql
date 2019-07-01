create procedure GuardarTurno
(@IdUsr varchar(50),
@IdPac int,
@IdSrv int,
@Fecha datetime,
@Hora int)
as
begin
	if exists (select 1 from Horarios_Disponibles
	where DATEPART(year, fecha_hora_inicio) = DATEPART(year, @fecha) and
		DATEPART(month, fecha_hora_inicio) = DATEPART(month, @fecha) and
		DATEPART(day, fecha_hora_inicio) = DATEPART(day, @fecha) and
		DATEPART(hour, fecha_hora_inicio) = @hora and es_profesional = 0 and id_servicio_profesional = @IdSrv)
	begin
		insert into turnos (id_paciente, id_servicio, fecha, hora) values (@IdPac, @IdUsr, @Fecha, @Hora);
		delete from Horarios_Disponibles where es_profesional = 0 and id_servicio_profesional = @IdSrv and DATEPART(year, fecha_hora_inicio) = DATEPART(year, @fecha) and
		DATEPART(month, fecha_hora_inicio) = DATEPART(month, @fecha) and
		DATEPART(day, fecha_hora_inicio) = DATEPART(day, @fecha) and
		DATEPART(hour, fecha_hora_inicio) = @hora;
	end
end

