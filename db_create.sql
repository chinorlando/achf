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