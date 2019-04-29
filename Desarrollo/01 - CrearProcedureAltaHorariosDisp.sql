create procedure Alta_Hs_Disp
(@IDSrvProf int,
@IsProf bit,
@Inicio datetime,
@Fin datetime)
as
begin
	insert into Horarios_Disponibles (id_servicio_profesional, es_profesional, fecha_hora_inicio, fecha_hora_fin)
	values (@IDSrvProf, @IsProf, @Inicio, @Fin)
end