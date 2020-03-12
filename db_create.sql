create table materia (
	id_materia int AUTO_INCREMENT primary key,
	nombre varchar(100) not null,
	troncal varchar(1) default 'N',
	prerequisito int,
	id_tipoevaluacion int not null,
	constraint fk_materia_tipoevaluacion foreign key (id_tipoevaluacion) references tipoevaluacion(id_tipoevaluacion)
	
);


create table jugador
	-id_categoria
	-club
	-procede_del_club
	-domicilio
	-peso
	-posicion

create table persona
	-edad

create table club
	-noticias
	-transferencias
	-estadisticas
	-estado
	-id_equipo
	+id_personacargo = presidente
	+direccion
	+ciudad
	+escudo
	+fecha_fundacion 
	+estado
	+nombre_club

create table equipo_jugador
	-+nombre_equipo
	+dorsal
	+posicion
	+peso
	+id_categoria

create table equipo
	-nombre_equipo
	-entrenador
	-presidente
	-fecha_fundacion
	-escudo
	-direccion
	-ciudad
	+id_personacargo = entrenador
	+id_club
	+genero

create table jornada
	-fecha
	-año
	-horas
	+id_jornada
	+jornada
	+fechahora

drop table jugador_categoria

create table torneo_equipo = inscripcion
	+fecha

create table transacciones
	-id_costos
	+id_inscripcion
	+fechapago
	+cantidad

create table costos_torneo / +costos
	-id_torneo

-- create table planillero
-- 	-disciplina
-- 	-observaciones
-- 	-estado
-- 	+id_persona = planillero

drop table arbitro / arbitros
	-disciplina
	-observaciones
	-estado
	+id_categoria
	+id_partidos

drop table partidos_arbitro

create table partido

create table accion(
	id_accion int AUTO_INCREMENT PRIMARY KEY
	accion varchar(10)
);

-- donde se guardan rojas, amarillas y goles
create table resultado_partido(
	-- id_resultadopartido int AUTO_INCREMENT PRIMARY KEY,
	id_jugador int not null,
	id_partidos int not null,
	accion int not null,
	minuto int not null
);

create table calendario(
	id_calendario

);


CREATE TABLE games(
	id_games int primary key auto_increment,
	-- date datetime,                   
	id_equipo_h int, 
    id_equipo_a int, 
    hscore tinyint,
    ascore tinyint,
    id_partidos int,
    constraint fk_games_equipo_h foreign key (id_equipo_h) references equipo(id_equipo),
    constraint fk_games_equipo_a foreign key (id_equipo_a) references equipo(id_equipo),
    constraint fk_games_partido foreign key (id_partidos) references partidos(id_partidos)
);


create table arbitro_partido( -- asignacion de arbitros a un partido
	id_arbitropartido int PRIMARY key AUTO_INCREMENT,
	id_partidos int,
	id_arbitro int,
	constraint fk_arbitropartido_partidos foreign key (id_partidos) references partidos(id_partidos),
	constraint fk_arbitropartido_arbitro foreign key (id_arbitro) references equipo(id_arbitro)
);

-- ejemplo: cantidad de veces que se ha hecho sacar amarillas 
create table cantidad(
	id_cantidad int PRIMARY KEY AUTO_INCREMENT,
	veces int
);

-- del concepto valores su cosas
-- ejemplo: descripcion = planilla de inscripcin cada hoja
-- ejemplo: certificacion a clubes afiliados
create table motivo(
	id_motivo int AUTO_INCREMENT PRIMARY KEY,
	descripcion text
);

-- el precio de cada uno de los conceptos
create table precio_concepto(
	id_precioconcepto int PRIMARY key AUTO_INCREMENT,
	precio float,
	id_cantidad int,
	-- id_motivo int,
	id_categoria int,
	id_concepto int,
	constraint fk_precioconcepto_cantidad foreign key (id_cantidad) references cantidad(id_cantidad),
	-- constraint fk_precioconcepto_motivo foreign key (id_motivo) references motivo(id_motivo),
	constraint fk_precioconcepto_categoria foreign key (id_categoria) references categoria(id_categoria),
	constraint fk_precioconcepto_concepto foreign key (id_concepto) references concepto(id_concepto)
);

-- pago 
create table pago(
	id_pago int PRIMARY KEY AUTO_INCREMENT,
	fecha date,
	id_precioconcepto int,
	id_motivo int,
	constraint fk_pago_precioconcepto foreign key(id_precioconcepto) references precio_concepto(id_precioconcepto),
	constraint fk_pago_motivo foreign key (id_motivo) references motivo(id_motivo)
);



INSERT INTO `precio_concepto`(`id_precioconcepto`, `precio`, `id_cantidad`, `id_categoria`, `id_concepto`) VALUES 
(null,500,1,1,1),
(null,400,1,2,1),
(null,350,1,3,1),
(null,350,1,4,1),
(null,350,1,5,1),
(null,300,1,6,1),
(null,300,1,7,1),
(null,150,1,10,1),
(null,150,1,11,1),
(null,150,1,12,1),
(null,150,1,13,1),
(null,150,1,14,1),
(null,150,1,15,1),
(null,150,1,16,1);

-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),
-- VALUES (null,500,1,1,1,1),