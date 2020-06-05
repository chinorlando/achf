INSCRIPCIONES 
	DIVISIÓN PRIMERA "A"
	DIVISIÓN PRIMERA "B"
	DIVISIÓN PRIMERA PRIMERAS DE ASCENSO
	DIVISIÓN PRIMERA SEGUNDAS DE ASCENSO
	DIVISIÓN PRIMERA TERCERAS DE ASCENSO
	DIVISIÓN PROVINCIAL
	MUNICIPIOS
	CATEGORIA DAMAS LIBRE
	CATEGORIA DAMAS DIVISION 15
	CATEGORIA DAMAS DIVISION 13
	CATEGORIA DAMAS DIVISION 11
	CATEGORIA VARONES DIVISION 19
	CATEGORIA VARONES DIVISION 17
	CATEGORIA VARONES DIVISION 15
	CATEGORIA VARONES DIVISION 13
	CATEGORIA VARONES DIVISION 11
	CATEGORIA VARONES DIVISION 9
	CATEGORIA VARONES DIVISION 7

NUEVAS AFILIACIONES 
	HAY-->DIVISION TERCERAS DE ASCENSO
	HAY-->CATEGORIA DAMAS LIBRE
	HAY --> MENORES

VALORES
	TARJETA DE ACTUACIÓN PVC TODAS LAS DIVISIONES SUPERIORES
	PLANILLA DE INSCRIPCIÓN c/Hoja
	FORMULARIO DE REGISTRO F. B. F.
	CERTIFICACIÓN A INSTITUCIONES AJENAS POR PERSONA
	CERTIFICACIONES A CLUBES AFILIADOS
	GARANTIA JUGADOR PARA ENCUENTRA SIGUIENTE
	INASISTENCIA CONSEJO CENTRAL (ATRASOS Y FALTAS)
	ABANDONOS DE CONSEJO CENTRAL Y ASAMBLEA
	INASISTENCIA FISCAL DE CANCHA (VEEDOR)
	FORMULARIO DE SOLICITUD A LA F. B. F.
	SANCIONES A DIRIGENTES TECNICOS, CUERPO TÉCNICO
	FALTA DE FIRMA DE JUGADORES Y CAPITÁN EN ENCUENTRO
	FALTA DE BALÓN REGLAMENTEARIO
	INVASIÓN A CAMPO DE JUEGO POR DIRECTORES TÉCNICOS, DIRIGENTES, PADRES DE FAMILIA E HINCHADA

RECLAMOS
	INSCRIPCIONES

DERECHOS DE PASE
	...
	JUGADOR DE PROVINCIA REGISTRADO EN LA F. B. F,
	...

PASES DE PROPIEDAD
	INSCRIPCIONES


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
	id_resultadopartido int AUTO_INCREMENT PRIMARY KEY,
	id_jugador int not null,
	id_partidos int not null,
	accion int not null,
	pagado int null, -- + columna aumentada 
	minuto int not null
	-- contamarilla int, -- +  columna aumentada -- - se quito
	-- suspencion int,  -- +  columna aumentada -- - se quito 
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
);-- eliminamos la tabla cantidad

-- del concepto valores su cosas
-- ejemplo: descripcion = planilla de inscripcin cada hoja
-- ejemplo: certificacion a clubes afiliados
create table motivo(
	id_motivo int AUTO_INCREMENT PRIMARY KEY,
	descripcion text NOT NULL
);

-- el precio de cada uno de los conceptos
create table precio_concepto(
	id_precioconcepto int PRIMARY key AUTO_INCREMENT,
	-- motivopago varchar(255) not null,
	precio float,
	-- id_cantidad int,
	id_categoria int,
	id_motivo int,
	id_concepto int,
	-- constraint fk_precioconcepto_cantidad foreign key (id_cantidad) references cantidad(id_cantidad),
	constraint fk_precioconcepto_categoria foreign key (id_categoria) references categoria(id_categoria),
	constraint fk_precioconcepto_motivo foreign key (id_motivo) references motivo(id_motivo),
	constraint fk_precioconcepto_concepto foreign key (id_concepto) references concepto(id_concepto)
);

-- pago 
create table pago(
	id_pago int PRIMARY KEY AUTO_INCREMENT,
	fecha date not null,
	monto float not null,
	descripcion text null,
	id_precioconcepto int, -- +
	-- id_motivo int,
	constraint fk_pago_precioconcepto foreign key(id_precioconcepto) references precio_concepto(id_precioconcepto)
	-- constraint fk_pago_motivo foreign key (id_motivo) references motivo(id_motivo)
);


create table inscripcionequipo(
	id_inscripcionequipo int PRIMARY key AUTO_INCREMENT,
	id_personacargo int not null,
	id_club int not null,
	genero varchar(9),
	-- id_categoria int not null,
	fecha date not null,
	num_bolo int,
	id_torneo int not null,
	-- id_equipo int(11) NOT NULL,
	constraint fk_inscripcionequipo_persona foreign KEY(id_personacargo) references persona(id_persona),
	constraint fk_inscripcionequipo_club foreign KEY(id_club) references club(id_club),
	-- constraint fk_inscripcionequipo_categoria foreign key(id_categoria) references categoria(id_categoria),
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


-- +++ registro de suspencion de partidos por numero de partidos 
create table suspencion(
	id_suspencion int PRIMARY key AUTO_INCREMENT,
	cantpart int not null,
	motivo varchar(1) not null,
	id_jugador int not null,
	-- id_torneo int not null,
	id_partidos int not null,
	constraint fk_suspencion_jugador foreign key(id_jugador) references jugador(id_jugador),
	-- constraint fk_suspencion_torneo foreign key(id_torneo) references torneo(id_torneo),
	constraint fk_suspencion_partidos foreign key(id_partidos) references partidos(id_partidos)
);

--> se aumenta un campo para saber cuantas amarillas tien un jugador
update table jugador(
	+ cont_amarilla int 
);

drop table motivo;


////////////////////////////////////////////////////////////////////////////
- cambiar en la tabla transacciones el id_inscripcion por id_inscripcionequipo
- el controlador torneo ya no usamos debemos eliminar, controlador modelo y fista. ->ya esta torneo con grocery
- que es la tabla transacciones?
- partidos_arbitro revisar --> menu revisar si va o no va
- registro/roles_menus_principales --> menu revisar si va o no va 
- eliminar tabla campeonadonato
- eliminar tabla jornada
- debemos eliminar el menú Equipos --> primero verificar 
-> hecho al hacer la transferencia habra actualizar la tabla inscripcion jugador
////////////////////////////////////////////////////////////////////////////





INSERT INTO `inscripcionequipo` (`id_inscripcionequipo`, `id_personacargo`, `id_club`, `genero`, `fecha`, `num_bolo`, `id_torneo`) VALUES 
(null, '1', '1', NULL, '2020-05-13', '1', '1'),
(null, '2', '2', NULL, '2020-05-13', '2', '1'),
(null, '3', '3', NULL, '2020-05-13', '3', '1'),
(null, '4', '4', NULL, '2020-05-13', '4', '1'),
(null, '5', '5', NULL, '2020-05-13', '5', '1'),
(null, '6', '6', NULL, '2020-05-13', '6', '1'),
(null, '7', '7', NULL, '2020-05-13', '7', '1'),
(null, '8', '8', NULL, '2020-05-13', '8', '1'),
(null, '9', '9', NULL, '2020-05-13', '9', '1'),
(null, '10', '10', NULL, '2020-05-13', '10', '1'),
(null, '11', '11', NULL, '2020-05-13', '11', '1'),
(null, '12', '12', NULL, '2020-05-13', '12', '1');

-- -- NO SIRVE
-- INSERT INTO `motivo`(`id_motivo`, `descripcion`) VALUES 
-- (NULL, 'DIVISIÓN PRIMERA "A"'),
-- (NULL, 'DIVISIÓN PRIMERA "B"'),
-- (NULL, 'DIVISIÓN PRIMERA PRIMERAS DE ASCENSO'),
-- (NULL, 'DIVISIÓN PRIMERA SEGUNDAS DE ASCENSO'),
-- (NULL, 'DIVISIÓN PRIMERA TERCERAS DE ASCENSO'),
-- (NULL, 'DIVISIÓN PROVINCIAL'),
-- (NULL, 'MUNICIPIOS'),
-- (NULL, 'JUGADOR DE PROVINCIA REGISTRADO EN LA F. B. F.'),
-- (NULL, 'MUTUAL'),
-- (NULL, 'CATEGORIA DAMAS LIBRE'),
-- (NULL, 'CATEGORIA DAMAS DIVISION 15'),
-- (NULL, 'CATEGORIA DAMAS DIVISION 13'),
-- (NULL, 'CATEGORIA DAMAS DIVISION 11'),
-- (NULL, 'CATEGORIA VARONES DIVISION 19'),
-- (NULL, 'CATEGORIA VARONES DIVISION 17'),
-- (NULL, 'CATEGORIA VARONES DIVISION 15'),
-- (NULL, 'CATEGORIA VARONES DIVISION 13'),
-- (NULL, 'CATEGORIA VARONES DIVISION 11'),
-- (NULL, 'CATEGORIA VARONES DIVISION 9'),
-- (NULL, 'CATEGORIA VARONES DIVISION 7'),
-- (NULL, 'TARJETA DE ACTUACIÓN PVC TODAS LAS DIVISIONES SUPERIORES'),
-- (NULL, 'PLANILLA DE INSCRIPCIÓN c/Hoja'),
-- (NULL, 'FORMULARIO DE REGISTRO F. B. F.'),
-- (NULL, 'CERTIFICACIÓN A INSTITUCIONES AJENAS POR PERSONA'),
-- (NULL, 'CERTIFICACIONES A CLUBES AFILIADOS'),
-- (NULL, 'GARANTIA JUGADOR PARA ENCUENTRA SIGUIENTE'),
-- (NULL, 'INASISTENCIA CONSEJO CENTRAL (ATRASOS Y FALTAS)'),
-- (NULL, 'ABANDONOS DE CONSEJO CENTRAL Y ASAMBLEA'),
-- (NULL, 'INASISTENCIA FISCAL DE CANCHA (VEEDOR)'),
-- (NULL, 'FORMULARIO DE SOLICITUD A LA F. B. F.'),
-- (NULL, 'SANCIONES A DIRIGENTES TECNICOS, CUERPO TÉCNICO'),
-- (NULL, 'FALTA DE FIRMA DE JUGADORES Y CAPITÁN EN ENCUENTRO'),
-- (NULL, 'FALTA DE BALÓN REGLAMENTEARIO'),
-- (NULL, 'INVASIÓN A CAMPO DE JUEGO POR DIRECTORES TÉCNICOS, DIRIGENTES, PADRES DE FAMILIA E HINCHADA'),
-- (NULL, 'TARJETA AMARILLA');
-- (NULL, 'TARJETA ROJA');
-- (NULL, '');

-- -- NO SIRVE
-- INSERT INTO `precio_concepto`(`id_precioconcepto`, `precio`, `id_categoria`, `id_motivo`, `id_concepto`) VALUES
-- (null,500,1,1,1),
-- (null,450,2,1,1),
-- (null,350,3,1,1),
-- (null,350,4,1,1),
-- (null,350,5,1,1),
-- (null,300,6,1,1),
-- (null,300,7,1,1),
-- (null,200,9,1,1),
-- (null,150,10,1,1),
-- (null,150,11,1,1),
-- (null,150,12,1,1),
-- (null,150,13,1,1),
-- (null,150,14,1,1),
-- (null,150,15,1,1),
-- (null,150,16,1,1),
-- (null,150,17,1,1),
-- (null,150,18,1,1),
-- (null,150,19,1,1),

-- (null,2000,5,2,2),
-- (null,2000,9,2,2),
-- (null,2000,10,2,2),
-- (null,2000,11,2,2),
-- (null,2000,12,2,2),
-- (null,2000,13,2,2),
-- (null,2000,14,2,2),
-- (null,2000,15,2,2),
-- (null,2000,16,2,2),
-- (null,2000,17,2,2),
-- (null,2000,18,2,2),
-- (null,2000,19,2,2),

-- (null,10,1,3,3),
-- (null,3,1,4,3),
-- (null,10,1,5,3),
-- (null,100,1,6,3),
-- (null,10,1,7,3),
-- (null,10,1,8,3),
-- (null,50,1,9,3),
-- (null,90,1,10,3),
-- (null,60,1,11,3),
-- (null,1,1,12,3),
-- (null,1000,1,13,3),
-- (null,20,1,14,3),
-- (null,50,1,15,3),
-- (null,1000,1,16,3),

-- (null,10,2,3,3),
-- (null,3,2,4,3),
-- (null,10,2,5,3),
-- (null,100,2,6,3),
-- (null,10,2,7,3),
-- (null,10,2,8,3),
-- (null,50,2,9,3),
-- (null,90,2,10,3),
-- (null,60,2,11,3),
-- (null,1,2,12,3),
-- (null,1000,2,13,3),
-- (null,20,2,14,3),
-- (null,50,2,15,3),
-- (null,1000,2,16,3),

-- (null,10,3,3,3),
-- (null,3,3,4,3),
-- (null,10,3,5,3),
-- (null,100,3,6,3),
-- (null,10,3,7,3),
-- (null,10,3,8,3),
-- (null,50,3,9,3),
-- (null,90,3,10,3),
-- (null,60,3,11,3),
-- (null,1,3,12,3),
-- (null,1000,3,13,3),
-- (null,20,3,14,3),
-- (null,50,3,15,3),
-- (null,1000,3,16,3),

-- (null,10,4,3,3),
-- (null,3,4,4,3),
-- (null,10,4,5,3),
-- (null,100,4,6,3),
-- (null,10,4,7,3),
-- (null,10,4,8,3),
-- (null,50,4,9,3),
-- (null,90,4,10,3),
-- (null,60,4,11,3),
-- (null,1,4,12,3),
-- (null,1000,4,13,3),
-- (null,20,4,14,3),
-- (null,50,4,15,3),
-- (null,1000,4,16,3),

-- (null,10,5,3,3),
-- (null,3,5,4,3),
-- (null,10,5,5,3),
-- (null,100,5,6,3),
-- (null,10,5,7,3),
-- (null,10,5,8,3),
-- (null,50,5,9,3),
-- (null,90,5,10,3),
-- (null,60,5,11,3),
-- (null,1,5,12,3),
-- (null,1000,5,13,3),
-- (null,20,5,14,3),
-- (null,50,5,15,3),
-- (null,1000,5,16,3),

-- (null,10,6,3,3),
-- (null,3,6,4,3),
-- (null,10,6,5,3),
-- (null,100,6,6,3),
-- (null,10,6,7,3),
-- (null,10,6,8,3),
-- (null,50,6,9,3),
-- (null,90,6,10,3),
-- (null,60,6,11,3),
-- (null,1,6,12,3),
-- (null,1000,6,13,3),
-- (null,20,6,14,3),
-- (null,50,6,15,3),
-- (null,1000,6,16,3),

-- (null,10,7,3,3),
-- (null,3,7,4,3),
-- (null,10,7,5,3),
-- (null,100,7,6,3),
-- (null,10,7,7,3),
-- (null,10,7,8,3),
-- (null,50,7,9,3),
-- (null,90,7,10,3),
-- (null,60,7,11,3),
-- (null,1,7,12,3),
-- (null,1000,7,13,3),
-- (null,20,7,14,3),
-- (null,50,7,15,3),
-- (null,1000,7,16,3),

-- (null,10,8,3,3),
-- (null,3,8,4,3),
-- (null,10,8,5,3),
-- (null,100,8,6,3),
-- (null,10,8,7,3),
-- (null,10,8,8,3),
-- (null,50,8,9,3),
-- (null,90,8,10,3),
-- (null,60,8,11,3),
-- (null,1,8,12,3),
-- (null,1000,8,13,3),
-- (null,20,8,14,3),
-- (null,50,8,15,3),
-- (null,1000,8,16,3),

-- (null,10,9,3,3),
-- (null,3,9,4,3),
-- (null,10,9,5,3),
-- (null,100,9,6,3),
-- (null,10,9,7,3),
-- (null,10,9,8,3),
-- (null,50,9,9,3),
-- (null,90,9,10,3),
-- (null,60,9,11,3),
-- (null,1,9,12,3),
-- (null,1000,9,13,3),
-- (null,20,9,14,3),
-- (null,50,9,15,3),
-- (null,1000,9,16,3),

-- (null,10,10,3,3),
-- (null,3,10,4,3),
-- (null,10,10,5,3),
-- (null,100,10,6,3),
-- (null,10,10,7,3),
-- (null,10,10,8,3),
-- (null,50,10,9,3),
-- (null,90,10,10,3),
-- (null,60,10,11,3),
-- (null,1,10,12,3),
-- (null,1000,10,13,3),
-- (null,20,10,14,3),
-- (null,50,10,15,3),
-- (null,1000,10,16,3),

-- (null,10,11,3,3),
-- (null,3,11,4,3),
-- (null,10,11,5,3),
-- (null,100,11,6,3),
-- (null,10,11,7,3),
-- (null,10,11,8,3),
-- (null,50,11,9,3),
-- (null,90,11,10,3),
-- (null,60,11,11,3),
-- (null,1,11,12,3),
-- (null,1000,11,13,3),
-- (null,20,11,14,3),
-- (null,50,11,15,3),
-- (null,1000,11,16,3),

-- (null,10,12,3,3),
-- (null,3,12,4,3),
-- (null,10,12,5,3),
-- (null,100,12,6,3),
-- (null,10,12,7,3),
-- (null,10,12,8,3),
-- (null,50,12,9,3),
-- (null,90,12,10,3),
-- (null,60,12,11,3),
-- (null,1,12,12,3),
-- (null,1000,12,13,3),
-- (null,20,12,14,3),
-- (null,50,12,15,3),
-- (null,1000,12,16,3),

-- (null,10,13,3,3),
-- (null,3,13,4,3),
-- (null,10,13,5,3),
-- (null,100,13,6,3),
-- (null,10,13,7,3),
-- (null,10,13,8,3),
-- (null,50,13,9,3),
-- (null,90,13,10,3),
-- (null,60,13,11,3),
-- (null,1,13,12,3),
-- (null,1000,13,13,3),
-- (null,20,13,14,3),
-- (null,50,13,15,3),
-- (null,1000,13,16,3),

-- (null,10,14,3,3),
-- (null,3,14,4,3),
-- (null,10,14,5,3),
-- (null,100,14,6,3),
-- (null,10,14,7,3),
-- (null,10,14,8,3),
-- (null,50,14,9,3),
-- (null,90,14,10,3),
-- (null,60,14,11,3),
-- (null,1,14,12,3),
-- (null,1000,14,13,3),
-- (null,20,14,14,3),
-- (null,50,14,15,3),
-- (null,1000,14,16,3),

-- (null,10,15,3,3),
-- (null,3,15,4,3),
-- (null,10,15,5,3),
-- (null,100,15,6,3),
-- (null,10,15,7,3),
-- (null,10,15,8,3),
-- (null,50,15,9,3),
-- (null,90,15,10,3),
-- (null,60,15,11,3),
-- (null,1,15,12,3),
-- (null,1000,15,13,3),
-- (null,20,15,14,3),
-- (null,50,15,15,3),
-- (null,1000,15,16,3),

-- (null,10,16,3,3),
-- (null,3,16,4,3),
-- (null,10,16,5,3),
-- (null,100,16,6,3),
-- (null,10,16,7,3),
-- (null,10,16,8,3),
-- (null,50,16,9,3),
-- (null,90,16,10,3),
-- (null,60,16,11,3),
-- (null,1,16,12,3),
-- (null,1000,16,13,3),
-- (null,20,16,14,3),
-- (null,50,16,15,3),
-- (null,1000,16,16,3),

-- (null,10,17,3,3),
-- (null,3,17,4,3),
-- (null,10,17,5,3),
-- (null,100,17,6,3),
-- (null,10,17,7,3),
-- (null,10,17,8,3),
-- (null,50,17,9,3),
-- (null,90,17,10,3),
-- (null,60,17,11,3),
-- (null,1,17,12,3),
-- (null,1000,17,13,3),
-- (null,20,17,14,3),
-- (null,50,17,15,3),
-- (null,1000,17,16,3),

-- (null,10,18,3,3),
-- (null,3,18,4,3),
-- (null,10,18,5,3),
-- (null,100,18,6,3),
-- (null,10,18,7,3),
-- (null,10,18,8,3),
-- (null,50,18,9,3),
-- (null,90,18,10,3),
-- (null,60,18,11,3),
-- (null,1,18,12,3),
-- (null,1000,18,13,3),
-- (null,20,18,14,3),
-- (null,50,18,15,3),
-- (null,1000,18,16,3),

-- (null,10,19,3,3),
-- (null,3,19,4,3),
-- (null,10,19,5,3),
-- (null,100,19,6,3),
-- (null,10,19,7,3),
-- (null,10,19,8,3),
-- (null,50,19,9,3),
-- (null,90,19,10,3),
-- (null,60,19,11,3),
-- (null,1,19,12,3),
-- (null,1000,19,13,3),
-- (null,20,19,14,3),
-- (null,50,19,15,3),
-- (null,1000,19,16,3),

-- (null,450,1,17,4),
-- (null,350,2,17,4),
-- (null,300,3,17,4),
-- (null,250,4,17,4),
-- (null,250,5,17,4),
-- (null,100,9,17,4),
-- (null,80,10,17,4),
-- (null,80,11,17,4),
-- (null,50,12,17,4),
-- (null,100,13,17,4),
-- (null,100,14,17,4),
-- (null,80,15,17,4),
-- (null,80,16,17,4),
-- (null,50,17,17,4),
-- (null,50,18,17,4),
-- (null,50,19,17,4),


-- (null,300,1,18,5),
-- (null,380,2,18,5),
-- (null,250,3,18,5),
-- (null,250,4,18,5),
-- (null,250,5,18,5),
-- (null,220,9,18,5),
-- (null,180,10,18,5),
-- (null,200,13,18,5),
-- (null,200,14,18,5),
-- (null,200,15,18,5),
-- (null,200,16,18,5),
-- (null,200,17,18,5),
-- (null,180,18,18,5),
-- (null,180,19,18,5),

-- (null,400,1,19,5),
-- (null,400,2,19,5),
-- (null,400,3,19,5),
-- (null,400,4,19,5),
-- (null,400,5,19,5),
-- (null,400,6,19,5),
-- (null,400,7,19,5),
-- (null,400,8,19,5),
-- (null,400,9,19,5),
-- (null,400,10,19,5),
-- (null,400,11,19,5),
-- (null,400,12,19,5),
-- (null,400,13,19,5),
-- (null,400,14,19,5),
-- (null,400,15,19,5),
-- (null,400,16,19,5),
-- (null,400,17,19,5),
-- (null,400,18,19,5),
-- (null,400,19,19,5),

-- (null,350,1,20,5),
-- (null,300,2,20,5),
-- (null,250,3,20,5),
-- (null,200,4,20,5),
-- (null,200,5,20,5),

-- (null,300,1,20,5),
-- (null,300,2,20,5),
-- (null,300,3,20,5),
-- (null,300,4,20,5),
-- (null,300,5,20,5),
-- (null,300,9,20,5),
-- (null,300,10,20,5),
-- (null,300,13,20,5),
-- (null,300,14,20,5),
-- (null,300,15,20,5),
-- (null,300,16,20,5),
-- (null,300,17,20,5),
-- (null,300,18,20,5),
-- (null,300,19,20,5),

-- (null,150,9,20,5),
-- (null,150,10,20,5),
-- (null,150,13,20,5),
-- (null,150,14,20,5),
-- (null,150,15,20,5),
-- (null,150,16,20,5),
-- (null,100,17,20,5),
-- (null,100,18,20,5),
-- (null,100,19,20,5),


-- (null,5,1,21,6),
-- (null,2,2,21,6),
-- (null,5,3,21,6),
-- (null,5,4,21,6),
-- (null,5,5,21,6),
-- (null,5,8,21,6),
-- (null,5,9,21,6),
-- (null,5,13,21,6),
-- (null,5,14,21,6),
-- (null,5,15,21,6),
-- (null,5,16,21,6),
-- (null,5,17,21,6),
-- (null,5,18,21,6),
-- (null,5,19,21,6),

-- (null,10,1,22,6),
-- (null,10,2,22,6),
-- (null,10,3,22,6),
-- (null,10,4,22,6),
-- (null,10,5,22,6),
-- (null,10,8,22,6),
-- (null,10,9,22,6),
-- (null,10,13,22,6),
-- (null,10,14,22,6),
-- (null,10,15,22,6),
-- (null,10,16,22,6),
-- (null,10,17,22,6),
-- (null,10,18,22,6),
-- (null,10,19,22,6),

-- (null,15,1,23,6),
-- (null,15,2,23,6),
-- (null,15,3,23,6),
-- (null,15,4,23,6),
-- (null,15,5,23,6),
-- (null,15,8,23,6),
-- (null,15,9,23,6),
-- (null,15,13,23,6),
-- (null,15,14,23,6),
-- (null,15,15,23,6),
-- (null,15,16,23,6),
-- (null,15,17,23,6),
-- (null,15,18,23,6),
-- (null,15,19,23,6),

-- (null,20,1,24,6),
-- (null,20,2,24,6),
-- (null,20,3,24,6),
-- (null,20,4,24,6),
-- (null,20,5,24,6),
-- (null,20,8,24,6),
-- (null,20,9,24,6),
-- (null,20,13,24,6),
-- (null,20,14,24,6),
-- (null,20,15,24,6),
-- (null,20,16,24,6),
-- (null,20,17,24,6),
-- (null,20,18,24,6),
-- (null,20,19,24,6),

-- (null,10,1,25,6),
-- (null,10,2,25,6),
-- (null,10,3,25,6),
-- (null,10,4,25,6),
-- (null,10,5,25,6),
-- (null,10,8,25,6),
-- (null,10,9,25,6),
-- (null,10,13,25,6),
-- (null,10,14,25,6),
-- (null,10,15,25,6),
-- (null,10,16,25,6),
-- (null,10,17,25,6),
-- (null,10,18,25,6),
-- (null,10,19,25,6),

-- (null,15,1,26,6),
-- (null,15,2,26,6),
-- (null,15,3,26,6),
-- (null,15,4,26,6),
-- (null,15,5,26,6),
-- (null,15,8,26,6),
-- (null,15,9,26,6),
-- (null,15,13,26,6),
-- (null,15,14,26,6),
-- (null,15,15,26,6),
-- (null,15,16,26,6),
-- (null,15,17,26,6),
-- (null,15,18,26,6),
-- (null,15,19,26,6),

-- (null,20,1,27,6),
-- (null,20,2,27,6),
-- (null,20,3,27,6),
-- (null,20,4,27,6),
-- (null,20,5,27,6),
-- (null,20,8,27,6),
-- (null,20,9,27,6),
-- (null,20,13,27,6),
-- (null,20,14,27,6),
-- (null,20,15,27,6),
-- (null,20,16,27,6),
-- (null,20,17,27,6),
-- (null,20,18,27,6),
-- (null,20,19,27,6),

-- (null,25,1,28,6),
-- (null,25,2,28,6),
-- (null,25,3,28,6),
-- (null,25,4,28,6),
-- (null,25,5,28,6),
-- (null,25,8,28,6),
-- (null,25,9,28,6),
-- (null,25,13,28,6),
-- (null,25,14,28,6),
-- (null,25,15,28,6),
-- (null,25,16,28,6),
-- (null,25,17,28,6),
-- (null,25,18,28,6),
-- (null,25,19,28,6),


-- (null,1500,1,29,7),
-- (null,1000,2,29,7),
-- (null,1000,3,29,7),
-- (null,1000,4,29,7),
-- (null,1000,5,29,7),
-- (null,500,8,29,7),
-- (null,100,9,29,7),
-- (null,100,10,29,7),
-- (null,100,11,29,7),
-- (null,80,12,29,7),
-- (null,100,13,29,7),
-- (null,100,14,29,7),
-- (null,100,15,29,7),
-- (null,100,16,29,7),
-- (null,80,17,29,7),
-- (null,80,18,29,7),
-- (null,80,19,29,7),

-- (null,1500,1,30,7),
-- (null,1000,2,30,7),
-- (null,1000,3,30,7),
-- (null,1000,4,30,7),
-- (null,1000,5,30,7),
-- (null,500,8,30,7),
-- (null,100,9,30,7),
-- (null,100,10,30,7),
-- (null,100,11,30,7),
-- (null,80,12,30,7),
-- (null,100,13,30,7),
-- (null,100,14,30,7),
-- (null,100,15,30,7),
-- (null,100,16,30,7),
-- (null,80,17,30,7),
-- (null,80,18,30,7),
-- (null,80,19,30,7);

-- -- EL QUE SIRVE
-- INSERT INTO `motivo`(`id_motivo`, `descripcion`) VALUES 
-- (NULL, 'PAGO POR INSCRIPCIÓN'),

-- (NULL, 'PAGO POR NUEVA AFILIACIÓN'),

-- (NULL, 'TARJETA DE ACTUACIÓN PVC TODAS LAS DIVISIONES SUPERIORES'),
-- (NULL, 'PLANILLA DE INSCRIPCIÓN c/Hoja'),
-- (NULL, 'FORMULARIO DE REGISTRO F. B. F.'),
-- (NULL, 'CERTIFICACIÓN A INSTITUCIONES AJENAS POR PERSONA'),
-- (NULL, 'CERTIFICACIONES A CLUBES AFILIADOS'),
-- (NULL, 'GARANTIA JUGADOR PARA ENCUENTRA SIGUIENTE'),
-- (NULL, 'INASISTENCIA CONSEJO CENTRAL (ATRASOS Y FALTAS)'),
-- (NULL, 'ABANDONOS DE CONSEJO CENTRAL Y ASAMBLEA'),
-- (NULL, 'INASISTENCIA FISCAL DE CANCHA (VEEDOR)'),
-- (NULL, 'FORMULARIO DE SOLICITUD A LA F. B. F.'),
-- (NULL, 'SANCIONES A DIRIGENTES TECNICOS, CUERPO TÉCNICO'),
-- (NULL, 'FALTA DE FIRMA DE JUGADORES Y CAPITÁN EN ENCUENTRO'),
-- (NULL, 'FALTA DE BALÓN REGLAMENTEARIO'),
-- (NULL, 'INVASIÓN A CAMPO DE JUEGO POR DIRECTORES TÉCNICOS, DIRIGENTES, PADRES DE FAMILIA E HINCHADA'),

-- (NULL, 'PAGO POR RECLAMO REALIZADO'),

-- (NULL, 'PAGO POR DERECHOS DE PASE'),
-- (NULL, 'PAGO POR DERECHOS DE PASE DE JUGADOR DE PROVINCIA REGISTRADO EN LA F. B. F.'),
-- (NULL, 'PAGO POR PASES EN PROPIEDAD DE JUGADORES (CLUBES DESAPARECIDOS)'),

-- (NULL, '1 AMARILLA'),
-- (NULL, '2 AMARILLA'),
-- (NULL, '3 AMARILLA'),
-- (NULL, '4 AMARILLA'),
-- -- (NULL, '5 AMARILLA'),
-- (NULL, '6 AMARILLA'),
-- (NULL, '7 AMARILLA'),
-- (NULL, '8 AMARILLA'),
-- (NULL, '9 AMARILLA'),
-- -- (NULL, '10 AMARILLA'),
-- (NULL, '1 WALKOVER (W. O.)'),
-- (NULL, '2 WALKOVER (W. O.)');
-- -- (NULL, '2 WALKOVER (W. O.)');


EL QUE SIRVE
INSERT INTO `motivo`(`id_motivo`, `descripcion`) VALUES 
(NULL, 'PAGO POR INSCRIPCIÓN'),

(NULL, 'PAGO POR NUEVA AFILIACIÓN'),

(NULL, 'TARJETA DE ACTUACIÓN PVC TODAS LAS DIVISIONES SUPERIORES'),
(NULL, 'PLANILLA DE INSCRIPCIÓN c/Hoja'),
(NULL, 'FORMULARIO DE REGISTRO F. B. F.'),
(NULL, 'CERTIFICACIÓN A INSTITUCIONES AJENAS POR PERSONA'),
(NULL, 'CERTIFICACIONES A CLUBES AFILIADOS'),
(NULL, 'GARANTIA JUGADOR PARA ENCUENTRA SIGUIENTE'),
(NULL, 'INASISTENCIA CONSEJO CENTRAL (ATRASOS Y FALTAS)'),
(NULL, 'ABANDONOS DE CONSEJO CENTRAL Y ASAMBLEA'),
(NULL, 'INASISTENCIA FISCAL DE CANCHA (VEEDOR)'),
(NULL, 'FORMULARIO DE SOLICITUD A LA F. B. F.'),
(NULL, 'SANCIONES A DIRIGENTES TECNICOS, CUERPO TÉCNICO'),
(NULL, 'FALTA DE FIRMA DE JUGADORES Y CAPITÁN EN ENCUENTRO'),
(NULL, 'FALTA DE BALÓN REGLAMENTEARIO'),
(NULL, 'INVASIÓN A CAMPO DE JUEGO POR DIRECTORES TÉCNICOS, DIRIGENTES, PADRES DE FAMILIA E HINCHADA'),

(NULL, 'PAGO POR RECLAMO REALIZADO'),

(NULL, 'PAGO POR DERECHOS DE PASE'),
(NULL, 'PAGO POR DERECHOS DE PASE DE JUGADOR DE PROVINCIA REGISTRADO EN LA F. B. F.'),
(NULL, 'PAGO POR PASES EN PROPIEDAD DE JUGADORES (CLUBES DESAPARECIDOS)'),

(NULL, 'PAGO POR AMARILLA'),

(NULL, '1 PAGO POR WALKOVER');
(NULL, '2 PAGO POR WALKOVER');

INSERT INTO `precio_concepto`(`id_precioconcepto`, `precio`, `id_categoria`, `id_motivo`, `id_concepto`) VALUES
(null,500,1,1,1),
(null,450,2,1,1),
(null,350,3,1,1),
(null,350,4,1,1),
(null,350,5,1,1),
(null,300,6,1,1),
(null,300,7,1,1),
(null,200,9,1,1),
(null,150,10,1,1),
(null,150,11,1,1),
(null,150,12,1,1),
(null,150,13,1,1),
(null,150,14,1,1),
(null,150,15,1,1),
(null,150,16,1,1),
(null,150,17,1,1),
(null,150,18,1,1),
(null,150,19,1,1),

(null,2000,5,2,2),
(null,2000,9,2,2),
(null,2000,10,2,2),
(null,2000,11,2,2),
(null,2000,12,2,2),
(null,2000,13,2,2),
(null,2000,14,2,2),
(null,2000,15,2,2),
(null,2000,16,2,2),
(null,2000,17,2,2),
(null,2000,18,2,2),
(null,2000,19,2,2),


(null,10,1,3,3),
(null,3,1,4,3),
(null,10,1,5,3),
(null,100,1,6,3),
(null,10,1,7,3),
(null,10,1,8,3),
(null,50,1,9,3),
(null,90,1,10,3),
(null,60,1,11,3),
(null,1,1,12,3),
(null,1000,1,13,3),
(null,20,1,14,3),
(null,50,1,15,3),
(null,1000,1,16,3),

(null,10,2,3,3),
(null,3,2,4,3),
(null,10,2,5,3),
(null,100,2,6,3),
(null,10,2,7,3),
(null,10,2,8,3),
(null,50,2,9,3),
(null,90,2,10,3),
(null,60,2,11,3),
(null,1,2,12,3),
(null,1000,2,13,3),
(null,20,2,14,3),
(null,50,2,15,3),
(null,1000,2,16,3),

(null,10,3,3,3),
(null,3,3,4,3),
(null,10,3,5,3),
(null,100,3,6,3),
(null,10,3,7,3),
(null,10,3,8,3),
(null,50,3,9,3),
(null,90,3,10,3),
(null,60,3,11,3),
(null,1,3,12,3),
(null,1000,3,13,3),
(null,20,3,14,3),
(null,50,3,15,3),
(null,1000,3,16,3),

(null,10,4,3,3),
(null,3,4,4,3),
(null,10,4,5,3),
(null,100,4,6,3),
(null,10,4,7,3),
(null,10,4,8,3),
(null,50,4,9,3),
(null,90,4,10,3),
(null,60,4,11,3),
(null,1,4,12,3),
(null,1000,4,13,3),
(null,20,4,14,3),
(null,50,4,15,3),
(null,1000,4,16,3),

(null,10,5,3,3),
(null,3,5,4,3),
(null,10,5,5,3),
(null,100,5,6,3),
(null,10,5,7,3),
(null,10,5,8,3),
(null,50,5,9,3),
(null,90,5,10,3),
(null,60,5,11,3),
(null,1,5,12,3),
(null,1000,5,13,3),
(null,20,5,14,3),
(null,50,5,15,3),
(null,1000,5,16,3),

(null,10,6,3,3),
(null,3,6,4,3),
(null,10,6,5,3),
(null,100,6,6,3),
(null,10,6,7,3),
(null,10,6,8,3),
(null,50,6,9,3),
(null,90,6,10,3),
(null,60,6,11,3),
(null,1,6,12,3),
(null,1000,6,13,3),
(null,20,6,14,3),
(null,50,6,15,3),
(null,1000,6,16,3),

(null,10,7,3,3),
(null,3,7,4,3),
(null,10,7,5,3),
(null,100,7,6,3),
(null,10,7,7,3),
(null,10,7,8,3),
(null,50,7,9,3),
(null,90,7,10,3),
(null,60,7,11,3),
(null,1,7,12,3),
(null,1000,7,13,3),
(null,20,7,14,3),
(null,50,7,15,3),
(null,1000,7,16,3),

(null,10,8,3,3),
(null,3,8,4,3),
(null,10,8,5,3),
(null,100,8,6,3),
(null,10,8,7,3),
(null,10,8,8,3),
(null,50,8,9,3),
(null,90,8,10,3),
(null,60,8,11,3),
(null,1,8,12,3),
(null,1000,8,13,3),
(null,20,8,14,3),
(null,50,8,15,3),
(null,1000,8,16,3),

(null,10,9,3,3),
(null,3,9,4,3),
(null,10,9,5,3),
(null,100,9,6,3),
(null,10,9,7,3),
(null,10,9,8,3),
(null,50,9,9,3),
(null,90,9,10,3),
(null,60,9,11,3),
(null,1,9,12,3),
(null,1000,9,13,3),
(null,20,9,14,3),
(null,50,9,15,3),
(null,1000,9,16,3),

(null,10,10,3,3),
(null,3,10,4,3),
(null,10,10,5,3),
(null,100,10,6,3),
(null,10,10,7,3),
(null,10,10,8,3),
(null,50,10,9,3),
(null,90,10,10,3),
(null,60,10,11,3),
(null,1,10,12,3),
(null,1000,10,13,3),
(null,20,10,14,3),
(null,50,10,15,3),
(null,1000,10,16,3),

(null,10,11,3,3),
(null,3,11,4,3),
(null,10,11,5,3),
(null,100,11,6,3),
(null,10,11,7,3),
(null,10,11,8,3),
(null,50,11,9,3),
(null,90,11,10,3),
(null,60,11,11,3),
(null,1,11,12,3),
(null,1000,11,13,3),
(null,20,11,14,3),
(null,50,11,15,3),
(null,1000,11,16,3),

(null,10,12,3,3),
(null,3,12,4,3),
(null,10,12,5,3),
(null,100,12,6,3),
(null,10,12,7,3),
(null,10,12,8,3),
(null,50,12,9,3),
(null,90,12,10,3),
(null,60,12,11,3),
(null,1,12,12,3),
(null,1000,12,13,3),
(null,20,12,14,3),
(null,50,12,15,3),
(null,1000,12,16,3),

(null,10,13,3,3),
(null,3,13,4,3),
(null,10,13,5,3),
(null,100,13,6,3),
(null,10,13,7,3),
(null,10,13,8,3),
(null,50,13,9,3),
(null,90,13,10,3),
(null,60,13,11,3),
(null,1,13,12,3),
(null,1000,13,13,3),
(null,20,13,14,3),
(null,50,13,15,3),
(null,1000,13,16,3),

(null,10,14,3,3),
(null,3,14,4,3),
(null,10,14,5,3),
(null,100,14,6,3),
(null,10,14,7,3),
(null,10,14,8,3),
(null,50,14,9,3),
(null,90,14,10,3),
(null,60,14,11,3),
(null,1,14,12,3),
(null,1000,14,13,3),
(null,20,14,14,3),
(null,50,14,15,3),
(null,1000,14,16,3),

(null,10,15,3,3),
(null,3,15,4,3),
(null,10,15,5,3),
(null,100,15,6,3),
(null,10,15,7,3),
(null,10,15,8,3),
(null,50,15,9,3),
(null,90,15,10,3),
(null,60,15,11,3),
(null,1,15,12,3),
(null,1000,15,13,3),
(null,20,15,14,3),
(null,50,15,15,3),
(null,1000,15,16,3),

(null,10,16,3,3),
(null,3,16,4,3),
(null,10,16,5,3),
(null,100,16,6,3),
(null,10,16,7,3),
(null,10,16,8,3),
(null,50,16,9,3),
(null,90,16,10,3),
(null,60,16,11,3),
(null,1,16,12,3),
(null,1000,16,13,3),
(null,20,16,14,3),
(null,50,16,15,3),
(null,1000,16,16,3),

(null,10,17,3,3),
(null,3,17,4,3),
(null,10,17,5,3),
(null,100,17,6,3),
(null,10,17,7,3),
(null,10,17,8,3),
(null,50,17,9,3),
(null,90,17,10,3),
(null,60,17,11,3),
(null,1,17,12,3),
(null,1000,17,13,3),
(null,20,17,14,3),
(null,50,17,15,3),
(null,1000,17,16,3),

(null,10,18,3,3),
(null,3,18,4,3),
(null,10,18,5,3),
(null,100,18,6,3),
(null,10,18,7,3),
(null,10,18,8,3),
(null,50,18,9,3),
(null,90,18,10,3),
(null,60,18,11,3),
(null,1,18,12,3),
(null,1000,18,13,3),
(null,20,18,14,3),
(null,50,18,15,3),
(null,1000,18,16,3),

(null,10,19,3,3),
(null,3,19,4,3),
(null,10,19,5,3),
(null,100,19,6,3),
(null,10,19,7,3),
(null,10,19,8,3),
(null,50,19,9,3),
(null,90,19,10,3),
(null,60,19,11,3),
(null,1,19,12,3),
(null,1000,19,13,3),
(null,20,19,14,3),
(null,50,19,15,3),
(null,1000,19,16,3),

(null,450,1,17,4),
(null,350,2,17,4),
(null,300,3,17,4),
(null,250,4,17,4),
(null,250,5,17,4),
(null,100,9,17,4),
(null,80,10,17,4),
(null,80,11,17,4),
(null,50,12,17,4),
(null,100,13,17,4),
(null,100,14,17,4),
(null,80,15,17,4),
(null,80,16,17,4),
(null,50,17,17,4),
(null,50,18,17,4),
(null,50,19,17,4),


(null,300,1,18,5),
(null,380,2,18,5),
(null,250,3,18,5),
(null,250,4,18,5),
(null,250,5,18,5),
(null,220,9,18,5),
(null,180,10,18,5),
(null,200,13,18,5),
(null,200,14,18,5),
(null,200,15,18,5),
(null,200,16,18,5),
(null,200,17,18,5),
(null,180,18,18,5),
(null,180,19,18,5),

(null,400,1,19,5),
(null,400,2,19,5),
(null,400,3,19,5),
(null,400,4,19,5),
(null,400,5,19,5),
(null,400,6,19,5),
(null,400,7,19,5),
(null,400,8,19,5),
(null,400,9,19,5),
(null,400,10,19,5),
(null,400,11,19,5),
(null,400,12,19,5),
(null,400,13,19,5),
(null,400,14,19,5),
(null,400,15,19,5),
(null,400,16,19,5),
(null,400,17,19,5),
(null,400,18,19,5),
(null,400,19,19,5),


(null,350,1,20,6),
(null,300,2,20,6),
(null,250,3,20,6),
(null,200,4,20,6),
(null,200,5,20,6),
(null,150,9,20,6),
(null,150,10,20,6),
(null,150,13,20,6),
(null,150,14,20,6),
(null,150,15,20,6),
(null,150,16,20,6),
(null,100,17,20,6),
(null,100,18,20,6),
(null,100,19,20,6),

(null,300,1,19,6),
(null,300,2,19,6),
(null,300,3,19,6),
(null,300,4,19,6),
(null,300,5,19,6),
(null,300,6,19,6),
(null,300,7,19,6),
(null,300,8,19,6),
(null,300,9,19,6),
(null,300,10,19,6),
(null,300,11,19,6),
(null,300,12,19,6),
(null,300,13,19,6),
(null,300,14,19,6),
(null,300,15,19,6),
(null,300,16,19,6),
(null,300,17,19,6),
(null,300,18,19,6),
(null,300,19,19,6),


(null,0,1,21,7),
(null,0,2,21,7),
(null,0,3,21,7),
(null,0,4,21,7),
(null,0,5,21,7),
(null,0,8,21,7),
(null,0,9,21,7),
(null,0,13,21,7),
(null,0,14,21,7),
(null,0,15,21,7),
(null,0,16,21,7),
(null,0,17,21,7),
(null,0,18,21,7),
(null,0,19,21,7),


(null,1500,1,22,8),
(null,1000,2,22,8),
(null,1000,3,22,8),
(null,1000,4,22,8),
(null,1000,5,22,8),
(null,500,8,22,8),
(null,100,9,22,8),
(null,100,10,22,8),
(null,100,11,22,8),
(null,80,12,22,8),
(null,100,13,22,8),
(null,100,14,22,8),
(null,100,15,22,8),
(null,100,16,22,8),
(null,80,17,22,8),
(null,80,18,22,8),
(null,80,19,22,8),

(null,2500,1,23,8),
(null,1500,2,23,8),
(null,1500,3,23,8),
(null,1500,4,23,8),
(null,1500,5,23,8),
(null,1000,8,23,8),
(null,200,9,23,8),
(null,200,10,23,8),
(null,200,11,23,8),
(null,100,12,23,8),
(null,200,13,23,8),
(null,200,14,23,8),
(null,200,15,23,8),
(null,150,16,23,8),
(null,100,17,23,8),
(null,100,18,23,8),
(null,100,19,23,8);