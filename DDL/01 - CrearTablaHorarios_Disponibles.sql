create table 
Horarios_Disponibles
(id int not null identity(1, 1),
id_servicio_profesional int,
es_profesional bit,
fecha_hora_inicio datetime,
fecha_hora_fin datetime)