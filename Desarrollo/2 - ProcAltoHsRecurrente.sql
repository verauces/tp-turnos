create procedure Alta_Hs_Recu
(@IDSrvProf int,
@IsProf bit,
@TipoRep char(1),
@CantRep int,
@Inicio datetime,
@Fin datetime)
as
begin
	Declare @TotalDias int = 0;

	begin
		insert into Horarios_Disponibles (id_servicio_profesional, es_profesional, fecha_hora_inicio, fecha_hora_fin)
		values (@IDSrvProf, @IsProf, @Inicio, @Fin)
		set @TotalDias = @TotalDias + 1
	end
	
	begin
		if @TipoRep = 'C' --corrido
		begin
			while @TotalDias <= @CantRep
			begin
			set @inicio = dateadd(day, 1, @Inicio)
			set @fin = dateadd(day, 1, @Fin)
			insert into Horarios_Disponibles (id_servicio_profesional, es_profesional, fecha_hora_inicio, fecha_hora_fin)
			values (@IDSrvProf, @IsProf, @Inicio, @Fin)
			set @TotalDias = @TotalDias + 1
			end
		end
		if @TipoRep = 'M' --mensual
		begin
			while @TotalDias <= @CantRep
			begin
			set @Inicio = dateadd(month, 1, @Inicio)
			set @Fin = dateadd(month, 1, @Fin)
			insert into Horarios_Disponibles (id_servicio_profesional, es_profesional, fecha_hora_inicio, fecha_hora_fin)
			values (@IDSrvProf, @IsProf, @Inicio, @Fin)
			set @TotalDias = @TotalDias + 1
			end
		end
		if @TipoRep = 'S' --semanal
		begin
			while @TotalDias <= @CantRep
			begin
			set @Inicio = dateadd(week, 1, @Inicio)
			set @Fin = dateadd(week, 1, @Fin)
			insert into Horarios_Disponibles (id_servicio_profesional, es_profesional, fecha_hora_inicio, fecha_hora_fin)
			values (@IDSrvProf, @IsProf, @Inicio, @Fin)
			set @TotalDias = @TotalDias + 1
			end
		end

		if @TipoRep = 'L' --laboral
		begin
			while @TotalDias <= @CantRep
			begin
			set @Inicio = dateadd(week, 1, @Inicio)
			if (DATENAME(weekday, @Inicio) = 'Saturday')
			begin
				set @Inicio = dateadd(day, 1, @Inicio)
			end
			if 	(DATENAME(weekday, @Inicio) = 'Sunday')
			begin
				set @Inicio = dateadd(day, 1, @Inicio)
			end
			
			insert into Horarios_Disponibles (id_servicio_profesional, es_profesional, fecha_hora_inicio, fecha_hora_fin)
			values (@IDSrvProf, @IsProf, @Inicio, @Fin)
			set @TotalDias = @TotalDias + 1
			end
		end
	end
end