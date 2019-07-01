
create procedure CancelarTurno
(@IdTurno int)
as
begin
	declare @IdSrv int
	declare @fecha datetime
	declare @hora int
	select @IdSrv = id_servicio, @fecha = fecha, @hora = hora from turnos where id = @IdTurno;
	set @fecha = DATEADD(hour, @hora, @fecha);
	insert into Horarios_Disponibles (id_servicio_profesional, es_profesional, fecha_hora_inicio, fecha_hora_fin)
	values (@IdSrv, 0, @fecha, DATEADD(hour, 1, @fecha));
	delete from turnos where id = @IdTurno;
end


