CREATE TABLE roles (
  id int PRIMARY key AUTO_INCREMENT,
  nombre varchar(150) NOT NULL,
  estado set('1','0') DEFAULT NULL
);

CREATE TABLE estadio (
  id_estadio int AUTO_INCREMENT PRIMARY KEY,
  nombreestadio varchar(200) DEFAULT NULL,
  capacidad varchar(200) DEFAULT NULL,
  ciudad varchar(150) DEFAULT NULL,
  direccion varchar(150) DEFAULT NULL,
  foto varchar(250) DEFAULT 'estadio.jpg',
  fecha_inaguracion date DEFAULT NULL,
  estado int(11) DEFAULT NULL
);

CREATE TABLE persona (
  id_persona int AUTO_INCREMENT PRIMARY KEY,
  nombres varchar(70) DEFAULT NULL,
  apellido_paterno varchar(70) DEFAULT NULL,
  apellido_materno varchar(70) DEFAULT NULL,
  foto varchar(255) DEFAULT 'user.jpg',
  telefono varchar(25) DEFAULT NULL,
  celular varchar(25) DEFAULT NULL,
  direccion varchar(100) DEFAULT NULL,
  ciudad varchar(100) DEFAULT NULL,
  fecha_nacimiento date DEFAULT NULL,
  sexo varchar(1) DEFAULT NULL,
  profesion varchar(50) DEFAULT NULL,
  nacionalidad varchar(100) DEFAULT NULL,
  email varchar(150) DEFAULT NULL,
  usuario varchar(150) DEFAULT NULL,
  password varchar(250) DEFAULT NULL
);

CREATE TABLE concepto (
  id_concepto int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(150) DEFAULT NULL,
  estado int(11) DEFAULT NULL
);

CREATE TABLE categoria_arbitro (
  id_catarbitro int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(150) DEFAULT NULL,
  estado int(11) DEFAULT NULL
);

CREATE TABLE cargo (
  id_cargo int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(100) DEFAULT NULL,
  estado char(1) DEFAULT NULL
);

CREATE TABLE categoria (
  id_categoria int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(150) DEFAULT NULL,
  estado int(11) DEFAULT NULL
);

CREATE TABLE menus_principales (
  id int AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(250) NOT NULL,
  icono varchar(70) DEFAULT NULL,
  color varchar(25) DEFAULT NULL,
  orden int(11) DEFAULT NULL,
  estado set('1','0') DEFAULT NULL
);

create table motivo(
	id_motivo int AUTO_INCREMENT PRIMARY KEY,
	descripcion text NOT NULL
);

CREATE TABLE club (
  id_club int AUTO_INCREMENT PRIMARY KEY,
  id_personacargo int(11) NOT NULL,
  nombre_club varchar(100) NOT NULL,
  direccion varchar(100) NOT NULL,
  ciudad varchar(50) NOT NULL,
  escudo varchar(50) NOT NULL,
  fecha_fundacion date DEFAULT NULL,
  estado int(11) DEFAULT NULL,

  constraint fk_club_persona foreign key (id_personacargo) references persona(id_persona)
);




CREATE TABLE planillero (
  id_planillero int AUTO_INCREMENT PRIMARY KEY,
  id_persona int(11) NOT NULL,
  disciplinas varchar(100) DEFAULT NULL,
  observaciones varchar(250) DEFAULT NULL,
  estado int(11) DEFAULT NULL,
  constraint fk_planillero_persona foreign key (id_persona) references persona(id_persona)
);

CREATE TABLE costos (
  id_costos int AUTO_INCREMENT PRIMARY KEY,
  id_concepto int(11) NOT NULL,
  costo float DEFAULT NULL,
  estado int(11) DEFAULT NULL,

  constraint fk_costos_concepto foreign key (id_concepto) references concepto(id_concepto)
);

CREATE TABLE jugador (
  id_jugador int AUTO_INCREMENT PRIMARY KEY,
  id_persona int(11) NOT NULL,
  n_registro_fbf int(11) DEFAULT NULL,
  lfpb_asociacion_liga_provincial varchar(250) DEFAULT NULL,
  nombre_padre varchar(70) DEFAULT NULL,
  nombre_madre varchar(70) DEFAULT NULL,
  estado_civil varchar(50) DEFAULT NULL,
  c_i varchar(30) DEFAULT NULL,
  estado char(1) DEFAULT NULL,
  estatura decimal(10,0) DEFAULT NULL,
  cont_amarilla tinyint(4) NOT NULL,

  constraint fk_jugador_persona foreign key (id_persona) references persona(id_persona)
);

CREATE TABLE curriculo_jugador (
  id_currijugador int AUTO_INCREMENT PRIMARY KEY,
  id_jugador int(11) NOT NULL,
  informacion varchar(250) DEFAULT NULL,
  trayectoria varchar(250) DEFAULT NULL,
  logros varchar(150) DEFAULT NULL,
  palmares varchar(150) DEFAULT NULL,
  foto varchar(250) DEFAULT 'user.jpg',
  estado int(11) DEFAULT NULL,

  constraint fk_currijugador_jugador foreign key (id_jugador) references jugador(id_jugador)
);

create  table torneo(
	id_torneo int PRIMARY KEY AUTO_INCREMENT,
	-- id_categoria int not null, -- -
  nombretorneo varchar(255) not null,
	fecha_inicio date null,
	fecha_fin date null,
	estado int null

	-- fecha_sorteo date not null,
	-- sorteado tinyint COMMENT '1=equipos sorteados. 0=equipos no sorteados'

	-- constraint fk_torneo_categoria foreign key(id_categoria) references categoria(id_categoria) -- -
);

-- CREATE TABLE jornadas (
--   id_jornadas int AUTO_INCREMENT PRIMARY KEY,
--   jornada int(11) NOT NULL,
--   id_torneo int(11) NOT NULL
-- );

-- guarda los torneos que han sido sorteados en un campeonado
-- create table torneosorteado(
-- 	id_torneosorteado int PRIMARY key AUTO_INCREMENT,
-- 	id_torneo int not null,
-- 	-- id_campeonato int not null,
-- 	constraint fk_sorteoequipos_torneo foreign key(id_torneo) references torneo(id_torneo),
-- 	-- constraint fk_sorteoequipos_campeonato foreign key(id_campeonato) references campeonato(id_campeonato)
-- );

-- 2
CREATE TABLE personas_roles (
  id int AUTO_INCREMENT PRIMARY KEY,
  id_persona int(11) NOT NULL,
  id_rol int(11) NOT NULL,
  fecha date NOT NULL,
  estado set('1','0') DEFAULT NULL,

  constraint fk_personaroles_persona foreign key (id_persona) references persona(id_persona),
  constraint fk_personaroles_roles foreign key (id_rol) references roles(id)
);

CREATE TABLE persona_cargo (
  id_personacargo int AUTO_INCREMENT PRIMARY KEY,
  id_persona int(11) NOT NULL,
  id_cargo int(11) NOT NULL,
  estado int(11) DEFAULT NULL,
  constraint fk_personacargo_persona foreign key (id_persona) references persona(id_persona),
  constraint fk_personacargo_cargo foreign key (id_cargo) references cargo(id_cargo)
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


CREATE TABLE roles_menus_principales (
  id int PRIMARY KEY AUTO_INCREMENT,
  id_rol int(11) NOT NULL,
  id_menu_principal int(11) NOT NULL,
  fecha date DEFAULT NULL,
  estado set('1','0') DEFAULT NULL,

  constraint fk_rolesmenusprincipales_rol foreign key (id_rol) references roles(id),
  constraint fk_rolesmenusprincipales_menuprincipal foreign key (id_menu_principal) references menus_principales(id)
);

-- CREATE TABLE transacciones (
--   id_transacciones int AUTO_INCREMENT PRIMARY KEY,
--   id_inscripcion int(11) NOT NULL,
--   id_torneoequipo int(11) NOT NULL,
--   fecha datetime DEFAULT NULL,
--   cantidad float DEFAULT NULL
-- );

-- 3

create table equipo(
  id_equipo int PRIMARY KEY AUTO_INCREMENT,
  genero char(1) NOT NULL,
  id_personacargo int NOT NULL COMMENT 'entrenador',
  id_club int NOT NULL,
  id_categoria int NOT NULL,

  constraint fk_equipo_persona foreign key (id_personacargo) references persona(id_persona),
  constraint fk_equipo_club foreign key(id_club) references club(id_club),
  constraint fk_equipo_categoria foreign key(id_categoria) references categoria(id_categoria)
);

-- create table inscripcionequipo(
-- 	id_inscripcionequipo int PRIMARY key AUTO_INCREMENT,
-- 	id_personacargo int not null,
-- 	id_club int not null,
-- 	genero varchar(9),
-- 	id_categoria int not null,
-- 	fecha date not null,
-- 	num_bolo int,
-- 	id_torneo int not null,

-- 	constraint fk_inscripcionequipo_persona foreign KEY(id_personacargo) references persona(id_persona),
-- 	constraint fk_inscripcionequipo_club foreign KEY(id_club) references club(id_club),
-- 	constraint fk_inscripcionequipo_categoria foreign key(id_categoria) references categoria(id_categoria),
-- 	constraint fk_inscripcionequipo_torneo foreign key(id_torneo) references torneo (id_torneo)
-- );

create table inscripcionequipo(
  id_inscripcionequipo int PRIMARY key AUTO_INCREMENT,
  -- id_personacargo int not null,
  -- id_club int not null,
  -- genero varchar(9),
  -- id_categoria int not null,
  fecha date not null,
  num_bolo int,
  id_equipo int not null,
  id_torneo int not null,

  -- constraint fk_inscripcionequipo_persona foreign KEY(id_personacargo) references persona(id_persona),
  -- constraint fk_inscripcionequipo_club foreign KEY(id_club) references club(id_club),
  -- constraint fk_inscripcionequipo_categoria foreign key(id_categoria) references categoria(id_categoria),
  constraint fk_inscripcionequipo_equipo foreign key(id_equipo) references equipo (id_equipo),
  constraint fk_inscripcionequipo_torneo foreign key(id_torneo) references torneo (id_torneo)
);

CREATE TABLE partidos (
	id_partidos int PRIMARY KEY AUTO_INCREMENT,
	jornada int(11) NOT NULL,
	fecha datetime DEFAULT NULL,
	observaciones varchar(350) DEFAULT NULL,
	estado int(11) DEFAULT NULL,

	id_planillero int(11) NULL,
	id_inscripcion1 int(11) NOT NULL,
	id_inscripcion2 int(11) NOT NULL,
	id_estadio int(11) NULL,
	id_torneo int not null,

	constraint fk_partidos_planilleo foreign key (id_planillero) references planillero(id_planillero),
	constraint fk_partidos_inscripcionequipo1 foreign key (id_inscripcion1) references inscripcionequipo(id_inscripcionequipo),
	constraint fk_partidos_inscripcionequipo2 foreign key (id_inscripcion2) references inscripcionequipo(id_inscripcionequipo),
	constraint fk_partidos_estadio foreign key (id_estadio) references estadio(id_estadio),
	constraint fk_partidos_torneo foreign key (id_torneo) references torneo(id_torneo)
);

CREATE TABLE arbitro (
  id_arbitro int PRIMARY KEY AUTO_INCREMENT,
  id_persona int NOT NULL,
  id_catarbitro int NOT NULL,
  -- id_partidos int NOT NULL,

  constraint fk_arbitro_persona foreign key (id_persona) references persona(id_persona),
  constraint fk_arbitro_categoriaarbitro foreign key (id_catarbitro) references categoria_arbitro(id_catarbitro)
  -- constraint fk_arbitro_partidos foreign key (id_partidos) references partidos(id_partidos)
);

-- 4
CREATE TABLE menus (
  id int AUTO_INCREMENT PRIMARY KEY,
  id_menu_principal int NOT NULL,
  nombre varchar(250) NOT NULL,
  directorio varchar(150) NOT NULL,
  icono varchar(70) DEFAULT NULL,
  imagen varchar(150) DEFAULT NULL,
  color varchar(25) DEFAULT NULL,
  orden int(11) DEFAULT NULL,
  estado set('1','0') DEFAULT NULL,

  constraint fk_menu_menuprincipal foreign key (id_menu_principal) references menus_principales(id)
);

-- pago total de los conceptos por torneo
create table pagogeneral(
	id_pagogeneral int AUTO_INCREMENT PRIMARY KEY,
	fecha date not null,
	montototal float not null,
	observacion text null,
	id_inscripcionequipo int not null,

	constraint fk_pagogeneral_inscripcionequipo foreign key(id_inscripcionequipo) references inscripcionequipo(id_inscripcionequipo)
);

CREATE TABLE transferencias (
  id_transferencias int AUTO_INCREMENT PRIMARY KEY,
  fecha date NOT NULL,
  id_jugador int(11) NOT NULL,
  id_club int(11) NOT NULL,
  id_club_destino int(11) NOT NULL,
  id_precioconcepto int not null,
  pagado tinyint NOT NULL DEFAULT '0',

  constraint fk_transferencias_jugador foreign key (id_jugador) references jugador(id_jugador),
  constraint fk_transferencias_club foreign key (id_club) references club(id_club),
  constraint fk_transferencias_clubdestino foreign key (id_club_destino) references club(id_club),
  constraint fk_transferencias_precioconcepto foreign key (id_precioconcepto) references precio_concepto(id_precioconcepto)
);

CREATE TABLE games(
	id_games int primary key auto_increment,
	-- date datetime,
    hscore tinyint,
    ascore tinyint,
	  id_equipo_h int, 
    id_equipo_a int, 
    id_partidos int,
    constraint fk_games_equipo_h foreign key (id_equipo_h) references inscripcionequipo(id_inscripcionequipo),
    constraint fk_games_equipo_a foreign key (id_equipo_a) references inscripcionequipo(id_inscripcionequipo),
    constraint fk_games_partido foreign key (id_partidos) references partidos(id_partidos)
);

create table inscripcionjugador(
	id_inscripcionjugador int AUTO_INCREMENT PRIMARY KEY,
	dorsal int not null,
	posicion varchar(100) not null,
	peso float not null,
	id_jugador int not null,
	id_inscripcionequipo int not null,

	constraint fk_inscripcionjugador_jugador foreign key(id_jugador) references jugador(id_jugador),
	constraint fk_inscripcionjugador_inscripcionequipo foreign key(id_inscripcionequipo) references inscripcionequipo(id_inscripcionequipo)
);

create table resultado_partido(
	id_resultadopartido int AUTO_INCREMENT PRIMARY KEY,
	id_jugador int not null,
	id_partidos int not null,
	accion int not null COMMENT '1=amarilla\r\n2=roja\r\n3=gol',
	pagado int null COMMENT '0=no pagado por amarilla, 1=pagado por amarilla',
	minuto int not null,
	-- contamarilla int, -- +  columna aumentada -- - se quito
	-- suspencion int,  -- +  columna aumentada -- - se quito 
	constraint fk_resultpartido_jugador foreign key (id_jugador) references jugador(id_jugador),
	constraint fk_resultpartido_partido foreign key (id_partidos) references partidos(id_partidos)
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

create table arbitro_partido( -- asignacion de arbitros a un partido
	id_arbitropartido int PRIMARY key AUTO_INCREMENT,
	id_partidos int not null,
	id_arbitro int not null,
	constraint fk_arbitropartido_partidos foreign key (id_partidos) references partidos(id_partidos),
	constraint fk_arbitropartido_arbitro foreign key (id_arbitro) references arbitro(id_arbitro)
);

-- pago 
create table pago(
	id_pago int PRIMARY KEY AUTO_INCREMENT,
	-- fecha date not null, -- -
	monto float not null,
	-- descripcion text null, -- -
	cantidad int not null, -- +
	id_precioconcepto int not null, -- +
	id_pagogeneral int not null, -- +
	constraint fk_pago_precioconcepto foreign key(id_precioconcepto) references precio_concepto(id_precioconcepto),
	constraint fk_pago_pagogeneral foreign key (id_pagogeneral) references pagogeneral(id_pagogeneral)
);

-- jugadores habilitados para cada partido
create table habilitado(
	id_habilitado int PRIMARY KEY AUTO_INCREMENT,
	id_jugador int not null,
	id_partidos int not null,

	constraint fk_habilitado_jugador foreign key (id_jugador) references jugador(id_jugador),
	constraint fk_habilitado_partido foreign key (id_partidos) references partidos(id_partidos)
);

create table categoriasorteado(
  id_categoriasorteado int PRIMARY key AUTO_INCREMENT,
  fecha_sorteo date not null,
  id_categoria int not null,
  id_torneo int not null,
  sorteado tinyint COMMENT '1=equipos sorteados. 0=equipos no sorteados',
  constraint fk_sorteoequipos_categoria foreign key(id_categoria) references categoria(id_categoria),
  constraint fk_sorteoequipos_torneo foreign key(id_torneo) references torneo(id_torneo)
);

create table suspencion_partido(
  id_suspencionpartido int PRIMARY KEY AUTO_INCREMENT,
  id_partidos int not null,
  observaciones text,
  fecha_reprogramacion datetime ,
  estado_sus tinyint COMMENT '1=partido reprogramado finalizado 0=sigue suspendido el partido',

  constraint fk_suspencionpartido_partido foreign key (id_partidos) references partidos(id_partidos)
);




INSERT INTO `menus` (`id`, `id_menu_principal`, `nombre`, `directorio`, `icono`, `imagen`, `color`, `orden`, `estado`) VALUES (41, 11, 'Jugadores', 'reporte/jugador', NULL, NULL, NULL, NULL, '1');