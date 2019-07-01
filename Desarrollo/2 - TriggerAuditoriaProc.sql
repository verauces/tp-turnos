create trigger AuditoriaServicio on Servicio after insert, update, delete
as
begin

declare @UserID int ,@user varchar(20), @activity varchar(20);
select @Userid = id from usuario where nombre = SYSTEM_USER;
if exists(SELECT * from inserted) and exists (SELECT * from deleted)
begin
    SET @activity = 'U';
    SET @user = SYSTEM_USER;
    INSERT into Auditoria(id_usuario, actividad, tabla) values (@userid, @activity,'Servicio');
end

If exists (Select * from inserted) and not exists(Select * from deleted)
begin
    SET @activity = 'I';
    SET @user = SYSTEM_USER;
    INSERT into Auditoria(id_usuario, actividad, tabla) values (@userid, @activity,'Servicio');
end

If exists(select * from deleted) and not exists(Select * from inserted)
begin 
    SET @activity = 'D';
    SET @user = SYSTEM_USER;
    INSERT into Auditoria(id_usuario, actividad, tabla) values (@userid, @activity,'Servicio');
end
end
