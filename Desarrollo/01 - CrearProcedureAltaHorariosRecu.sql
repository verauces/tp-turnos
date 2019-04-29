create procedure Alta_Hs_Recu
(@IDSrvProf int,
@IsProf bit,
@Tipo char(1),
@Cant int,
@Inicio datetime,
@Fin datetime)
as
begin
	insert into Horarios_Recurrentes (id_servicio_profesional, es_profesional, tipo_repeticion, cantidad_repeticiones, fecha_hora_inicio, fecha_hora_fin)
	values (@IDSrvProf, @IsProf, @Tipo, @Cant, @Inicio, @Fin)
end
