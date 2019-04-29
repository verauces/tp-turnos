create table 
Horarios_Recurrentes
(id int not null identity(1, 1),
id_servicio_profesional int,
es_profesional bit,
tipo_repeticion char(1),
cantidad_repeticiones int,
fecha_hora_inicio datetime,
fecha_hora_fin datetime)