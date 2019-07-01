create procedure AuditoriaUsuario
(@IdUsr int,
@CantPorPag int,
@NroPag int)
as
begin
	DECLARE @TablaTemporal TABLE (id int not null identity(1,1), id_usuario int, actividad varchar(1), tabla varchar(10));
	insert into @TablaTemporal (id_usuario, actividad, tabla) select b.id_usuario, b.actividad, b.tabla from auditoria b where b.id_usuario = @IdUsr;
	select id_usuario, actividad, tabla from @TablaTemporal where id >= (@CantPorPag * @NroPag) and id < (@CantPorPag * (@NroPag+1));
end
