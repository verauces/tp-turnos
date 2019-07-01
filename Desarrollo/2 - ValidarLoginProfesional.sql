
create procedure ValidarLoginProfesional
(@IdProfesional int,
@Pass varchar(128)
)
as
begin
 if exists (select 1 from Profesional
	where id = @IdProfesional and PWDCOMPARE(@pass, PassHash) = 1)
	begin
		print 'El acceso es exitoso'
	end
	else
	begin
		print 'La contraseña es incorrecta o el usuario no existe'
	end
end
