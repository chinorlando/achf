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

update table partidos(
	fecha date->datetime
);

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


create table inscripcionequipo(
	id_inscripcionequipo int PRIMARY key AUTO_INCREMENT,
	id_personacargo int not null
	id_club int not null,
	genero varchar(9),
	id_categoria int not null,
	fecha date not null,
	num_bolo int,
	id_torneo int not null,
	-- id_equipo int(11) NOT NULL,
	constraint fk_inscripcionequipo_persona foreign KEY(id_personacargo) references persona(id_persona),
	constraint fk_inscripcionequipo_club foreign KEY(id_club) references club(id_club),
	constraint fk_inscripcionequipo_categoria foreign key(id_categoria) references categoria(id_categoria),
	constraint fk_inscripcionequipo_torneo foreign key(id_torneo) references torneo (id_torneo)
);


-- tipo de campeonado en el año
create table campeonato(
	id_campeonato int PRIMARY key AUTO_INCREMENT,
	gestion year not null,
	fecha_inicio date,
	fecha_fin date,
	-- tipos de campeonato --> clausura, apertura, invierno, verano, 
	tipocampeonato varchar(20) not null
);

-- guarda los torneos que han sido sorteados en un campeonado
create table torneosorteado(
	id_torneosorteado int PRIMARY key AUTO_INCREMENT,
	fecha_sorteo date not null,
	id_torneo int not null,
	id_campeonato int not null,
	estado tinyint,
	constraint fk_sorteoequipos_torneo foreign key(id_torneo) references torneo(id_torneo),
	constraint fk_sorteoequipos_campeonato foreign key(id_campeonato) references campeonato(id_campeonato)
);

-- tabla categoria
-- + id_cagegoria
create  table torneo(
	id_torneo int PRIMARY KEY AUTO_INCREMENT,
	id_categoria int not null,
	fecha_inicio date null,
	fecha_fin date null,
	estado int null,
	constraint fk_torneo_categoria foreign key(id_categoria) references categoria(id_categoria)
);



////////////////////////////////////////////////////////////////////////////
- cambiar en la tabla transacciones el id_inscripcion por id_inscripcionequipo
- el controlador torneo ya no usamos debemos eliminar, controlador modelo y fista. ->ya esta torneo con grocery
- que es la tabla transacciones?
- partidos_arbitro revisar --> menu revisar si va o no va
- registro/roles_menus_principales --> menu revisar si va o no va 
////////////////////////////////////////////////////////////////////////////



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





INSERT INTO `inscripcionequipo` (`id_inscripcionequipo`, `id_personacargo`, `id_club`, `genero`, `id_categoria`, `fecha`, `num_bolo`, `id_torneo`) VALUES 
(null, '1', '1', NULL, '1', '2020-05-13', '1', '1'),
(null, '2', '2', NULL, '1', '2020-05-13', '2', '1'),
(null, '3', '3', NULL, '1', '2020-05-13', '3', '1'),
(null, '4', '4', NULL, '1', '2020-05-13', '4', '1'),
(null, '5', '5', NULL, '1', '2020-05-13', '5', '1'),
(null, '6', '6', NULL, '1', '2020-05-13', '6', '1'),
(null, '7', '7', NULL, '1', '2020-05-13', '7', '1'),
(null, '8', '8', NULL, '1', '2020-05-13', '8', '1'),
(null, '9', '9', NULL, '1', '2020-05-13', '9', '1'),
(null, '10', '10', NULL, '1', '2020-05-13', '10', '1'),
(null, '11', '11', NULL, '1', '2020-05-13', '11', '1'),
(null, '12', '12', NULL, '1', '2020-05-13', '12', '1')
