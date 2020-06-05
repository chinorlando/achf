-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-06-2020 a las 08:17:12
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_achfa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitro`
--

CREATE TABLE `arbitro` (
  `id_arbitro` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_catarbitro` int(11) NOT NULL,
  `id_partidos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `arbitro`
--

INSERT INTO `arbitro` (`id_arbitro`, `id_persona`, `id_catarbitro`, `id_partidos`) VALUES
(1, 6, 1, 0),
(2, 7, 2, 0),
(3, 8, 3, 0),
(4, 9, 4, 0),
(5, 12, 6, 0),
(6, 13, 6, 0),
(7, 14, 7, 0),
(8, 15, 7, 0),
(9, 16, 7, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitro_partido`
--

CREATE TABLE `arbitro_partido` (
  `id_arbitropartido` int(11) NOT NULL,
  `id_partidos` int(11) DEFAULT NULL,
  `id_arbitro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `arbitro_partido`
--

INSERT INTO `arbitro_partido` (`id_arbitropartido`, `id_partidos`, `id_arbitro`) VALUES
(90, 3, 1),
(91, 3, 6),
(92, 3, 9),
(114, 4, 1),
(115, 4, 5),
(116, 4, 8),
(117, 5, 1),
(118, 5, 5),
(119, 5, 8),
(120, 2, 1),
(121, 2, 5),
(122, 2, 7),
(123, 1, 1),
(124, 1, 6),
(125, 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nombre`, `estado`) VALUES
(1, 'Administrador', '1'),
(2, 'Jugador', '1'),
(3, 'Delegado', '1'),
(4, 'Secretaria', '1'),
(5, 'Comite tecnico', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `estado`) VALUES
(1, 'PRIMERA A', 1),
(2, 'PRIMERA B', 1),
(3, 'PRIMERAS DE ASCENSO', 1),
(4, 'SEGUNDAS DE ASCENSO', 1),
(5, 'TERCERAS DE ASCENSO', 1),
(6, 'PROVINCIAL', 1),
(7, 'MUNICIPIOS', 1),
(8, 'MUTUAL', 1),
(9, 'DAMAS LIBRE', 1),
(10, 'SUB 15 DAMAS', 1),
(11, 'SUB 13 DAMAS', 1),
(12, 'SUB 11 DAMAS', 1),
(13, 'SUB 19', 1),
(14, 'SUB 17', 1),
(15, 'SUB 15', 1),
(16, 'SUB 13', 1),
(17, 'SUB 11', 1),
(18, 'SUB 9', 1),
(19, 'SUB 7', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_arbitro`
--

CREATE TABLE `categoria_arbitro` (
  `id_catarbitro` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria_arbitro`
--

INSERT INTO `categoria_arbitro` (`id_catarbitro`, `nombre`, `estado`) VALUES
(1, 'REFEREE 1', 1),
(2, 'REFEREE 2', NULL),
(3, 'REFEREE 3', NULL),
(4, 'REFEREE 4', NULL),
(5, 'REFEREE 5', NULL),
(6, 'ASISTENTE 1', NULL),
(7, 'ASISTENTE 2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club`
--

CREATE TABLE `club` (
  `id_club` int(11) NOT NULL,
  `id_personacargo` int(11) NOT NULL,
  `nombre_club` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `escudo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_fundacion` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `club`
--

INSERT INTO `club` (`id_club`, `id_personacargo`, `nombre_club`, `direccion`, `ciudad`, `escudo`, `fecha_fundacion`, `estado`) VALUES
(1, 1, 'SAN JOSE', 'Senkata', 'La Paz', '', NULL, NULL),
(2, 2, 'BOLIVAR', '', '', '', NULL, NULL),
(3, 3, 'INDEPENDIENTE', '', 'SUCRE', '', NULL, NULL),
(4, 4, 'WILSTERMAN', '', 'COCHABAMBA', '', NULL, NULL),
(5, 5, 'BARCELONA', '', '', '', NULL, NULL),
(6, 6, 'AURORA', '', '', '', NULL, NULL),
(7, 7, 'THE STRONGEST', '', '', '', NULL, NULL),
(8, 8, 'BLOOMING', '', '', '', NULL, NULL),
(9, 9, 'REAL POTOSI', '', '', '', NULL, NULL),
(10, 10, 'STORMERS', '', '', '', NULL, NULL),
(11, 11, 'LIVERPOOL', '', '', '', NULL, NULL),
(12, 12, 'EVERTON', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `id_concepto` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`id_concepto`, `nombre`, `estado`) VALUES
(1, 'INSCRIPCIONES ', 1),
(2, 'NUEVAS AFILIACIONES', 1),
(3, 'VALORES', 1),
(4, 'RECLAMOS', 1),
(5, 'DERECHOS DE PASE', 1),
(6, 'PASE EN PROPIEDAD DE JUGADORES DE LA A. CH. F. (CLUBES DESAPARECIDOS)', 1),
(7, 'MULTAS POR AMONESTACIONES', 1),
(8, 'MULTAS POR WALKOVER (W. O.)', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos`
--

CREATE TABLE `costos` (
  `id_costos` int(11) NOT NULL,
  `id_concepto` int(11) NOT NULL,
  `costo` float DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `costos`
--

INSERT INTO `costos` (`id_costos`, `id_concepto`, `costo`, `estado`) VALUES
(1, 1, 300, 1),
(2, 2, 250, 1),
(3, 3, 10, 1),
(4, 4, 5, 1),
(5, 5, 500, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curriculo_jugador`
--

CREATE TABLE `curriculo_jugador` (
  `id_currijugador` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `informacion` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `trayectoria` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `logros` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `palmares` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `foto` varchar(250) COLLATE utf8_spanish_ci DEFAULT 'user.jpg',
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `curriculo_jugador`
--

INSERT INTO `curriculo_jugador` (`id_currijugador`, `id_jugador`, `informacion`, `trayectoria`, `logros`, `palmares`, `foto`, `estado`) VALUES
(1, 1, 'Es bueno', 'prueba trayectoria', 'Trofeo 1', 'Mejor jugador 1', 'user.jpg', 1),
(2, 1, 'buena informacion', 'prueba 2 trayectoria', 'Trofeo 2', 'Mejor jugador de nuevo', 'user.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL,
  `id_personacargo` int(11) NOT NULL COMMENT 'entrenador',
  `id_club` int(11) NOT NULL,
  `genero` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id_equipo`, `id_personacargo`, `id_club`, `genero`, `id_categoria`) VALUES
(1, 1, 1, '', 1),
(2, 2, 2, '', 1),
(3, 3, 3, '', 1),
(4, 4, 4, '', 1),
(5, 5, 5, '', 1),
(6, 6, 6, '', 1),
(7, 7, 7, '', 1),
(8, 8, 8, '', 1),
(9, 9, 9, '', 1),
(10, 10, 10, '', 1),
(11, 11, 11, '', 1),
(12, 12, 12, '', 1),
(13, 0, 0, '', 0),
(14, 0, 0, '', 0),
(15, 0, 0, '', 0),
(16, 0, 0, '', 0),
(17, 0, 0, '', 0),
(18, 0, 0, '', 0),
(19, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadio`
--

CREATE TABLE `estadio` (
  `id_estadio` int(11) NOT NULL,
  `nombreestadio` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `capacidad` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ciudad` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `foto` varchar(250) COLLATE utf8_spanish_ci DEFAULT 'user.jpg',
  `fecha_inaguracion` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estadio`
--

INSERT INTO `estadio` (`id_estadio`, `nombreestadio`, `capacidad`, `ciudad`, `direccion`, `foto`, `fecha_inaguracion`, `estado`) VALUES
(1, 'Estadio Sucre', '20000', 'Chuquisaca', 'Surapata ', '', '1960-05-01', 1),
(2, 'Estadio Olímpico Patria ', '32700', 'Chuquisaca ', 'Avenida Jaime Mendoza', '', '1992-05-25', 1),
(3, 'Estadio Lurdes de Yotala ', '15000', 'Chuquisaca', 'Yotala', '', '1912-11-29', 1),
(4, 'Garcilazo', '10000', 'Chuquisaca', 'Inca Garcilazo', '', '2000-05-25', 1),
(5, 'Mesa Verde', '5000', 'Chuquisaca', 'Rotari', '', '2005-05-25', 1),
(6, 'Churuquella', '1000', 'Potosi', 'Zona alta', '', '2019-01-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `id_games` int(11) NOT NULL,
  `id_equipo_h` int(11) DEFAULT NULL,
  `id_equipo_a` int(11) DEFAULT NULL,
  `hscore` tinyint(4) DEFAULT NULL,
  `ascore` tinyint(4) DEFAULT NULL,
  `id_partidos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `games`
--

INSERT INTO `games` (`id_games`, `id_equipo_h`, `id_equipo_a`, `hscore`, `ascore`, `id_partidos`) VALUES
(3, 1, 2, 1, 0, 1),
(4, 3, 4, 0, 2, 1),
(5, 1, 3, 1, 1, 1),
(6, 2, 4, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `id_inscripcion` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `num_bolo` int(11) DEFAULT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id_inscripcion`, `fecha`, `num_bolo`, `id_equipo`, `id_torneo`) VALUES
(1, '2019-12-12 07:37:12', 1, 1, 1),
(2, '2019-12-12 07:37:12', 2, 2, 1),
(3, '2019-12-12 00:00:00', 3, 3, 1),
(4, '2019-12-12 07:37:12', 4, 4, 1),
(5, '2019-12-12 07:37:12', 5, 5, 1),
(6, '2019-12-12 07:37:12', 6, 6, 1),
(7, '2019-12-12 07:37:12', 7, 7, 1),
(8, '2019-12-12 07:37:12', 8, 8, 1),
(9, '2019-12-12 07:37:12', 9, 9, 1),
(10, '2019-12-12 07:37:12', 10, 10, 1),
(11, '2019-12-12 07:37:12', 11, 11, 1),
(12, '2019-12-12 07:37:12', 12, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcionequipo`
--

CREATE TABLE `inscripcionequipo` (
  `id_inscripcionequipo` int(11) NOT NULL,
  `id_personacargo` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `genero` varchar(1) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha` date NOT NULL,
  `num_bolo` int(11) DEFAULT NULL,
  `id_torneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `inscripcionequipo`
--

INSERT INTO `inscripcionequipo` (`id_inscripcionequipo`, `id_personacargo`, `id_club`, `genero`, `fecha`, `num_bolo`, `id_torneo`) VALUES
(1, 1, 1, NULL, '2020-05-13', 1, 1),
(2, 2, 2, NULL, '2020-05-13', 2, 1),
(3, 3, 3, NULL, '2020-05-13', 3, 1),
(4, 4, 4, NULL, '2020-05-13', 4, 1),
(5, 5, 5, NULL, '2020-05-13', 5, 1),
(6, 6, 6, NULL, '2020-05-13', 6, 1),
(7, 7, 7, NULL, '2020-05-13', 7, 1),
(8, 8, 8, NULL, '2020-05-13', 8, 1),
(9, 9, 9, NULL, '2020-05-13', 9, 1),
(10, 10, 10, NULL, '2020-05-13', 10, 1),
(11, 11, 11, NULL, '2020-05-13', 11, 1),
(12, 12, 12, NULL, '2020-05-13', 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcionjugador`
--

CREATE TABLE `inscripcionjugador` (
  `id_inscripcionjugador` int(11) NOT NULL,
  `dorsal` int(100) NOT NULL,
  `posicion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `peso` float NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `inscripcionjugador`
--

INSERT INTO `inscripcionjugador` (`id_inscripcionjugador`, `dorsal`, `posicion`, `peso`, `id_jugador`, `id_equipo`) VALUES
(1, 1, 'Arquero', 54, 1, 1),
(2, 2, 'Defensor', 60, 2, 1),
(3, 3, 'Medio campo', 65, 3, 1),
(4, 4, 'Lateral Izquierdo', 87, 4, 1),
(5, 5, 'Lateral Derecho', 76, 5, 1),
(6, 6, 'Arquero', 54, 6, 2),
(7, 7, 'Defensor', 60, 7, 2),
(8, 8, 'Medio campo', 65, 8, 2),
(9, 9, 'Lateral Izquierdo', 87, 9, 2),
(10, 10, 'Lateral Derecho', 76, 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `id_jornadas` int(11) NOT NULL,
  `jornada` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `jornadas`
--

INSERT INTO `jornadas` (`id_jornadas`, `jornada`, `id_torneo`) VALUES
(1, 20191203, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `n_registro_fbf` int(11) DEFAULT NULL,
  `lfpb_asociacion_liga_provincial` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_padre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_madre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado_civil` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_i` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estatura` decimal(10,0) DEFAULT NULL,
  `cont_amarilla` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id_jugador`, `id_persona`, `n_registro_fbf`, `lfpb_asociacion_liga_provincial`, `nombre_padre`, `nombre_madre`, `estado_civil`, `c_i`, `estado`, `estatura`, `cont_amarilla`) VALUES
(1, 37, 331887, 'A. Tarijeña de Futbol', 'BENJAMIN CASTILLO EGUEZ', 'DELICIA EGUEZ ALVAREZ', 'Soltero', '7218547', '1', '175', 2),
(2, 36, 387049, 'Asociacion Cruceña de Futbol', 'JULIO CESAR CRUZ', 'DELMA PANIAGUA CUELLAR', 'Soltero', '10383578', '1', '170', 0),
(3, 35, 39445, NULL, 'JUAN YUCRA REVOLIO', 'LEONA CABA MENDEZ', 'Soltero', '8545519', '1', '165', 0),
(4, 34, 406496, NULL, 'ABELINO CRUZ MAMANI', 'LEONARDA MAMANI POLO', 'Soltero', '13090549', '1', '157', 0),
(5, 33, 346304, NULL, 'JUSTO SONCO SILLO', 'ROSARIO RIOS CARDENAS', 'Soltero', '10300268', '1', '177', 0),
(6, 32, 406497, NULL, 'ABELINO CRUZ MAMANI', 'LEONARDA MAMANI POLO', 'Soltera', '10341988', '1', '160', -6),
(7, 31, 370954, 'Asociación Chuquisaqueña de Fútbol ', NULL, 'Silvia Serrano Llanos', 'Soltero', '7521767', '1', '155', 5),
(8, 30, 406250, NULL, 'LAURO LLANQUI BAUTISTA', 'NATIVIDAD COLQUE TELLEZ', 'Soltero', '10305958', '1', '180', 3),
(9, 29, 406234, NULL, 'TEODORO GOMEZ PACO', 'MARCELINA UMAÑA TICOLLANO', 'Soltero', '10465437', '1', '170', 2),
(10, 28, 396133, NULL, 'MARIO MENACHO MAMANI', 'MERCEDES CALDERON GUZMAN', 'Soltero', '10582010', '1', '150', 2),
(11, 27, 386508, NULL, 'RAMIRO GUTIERREZ MALLEA', 'YANNET VICTORIA MONTAÑO GUZMAN', 'Soltero', '6676790', '1', '175', 0),
(12, 26, 366493, NULL, 'RAMON RODRIGUEZ AGUIRRE', 'ELBA YOLANDA CAYO OCHOA', 'Soltero', '7506999', '1', '170', 0),
(13, 25, 396252, NULL, 'BENITO LEON MORALES', 'SILDA SANCHEZ CARBALLO', 'Soltero', '7542354', '1', '172', 0),
(14, 24, 388405, NULL, 'MARIO MARTINEZ', 'EUSEBIA IBAÑEZ', 'Soltero', '1036054', '1', '155', 0),
(15, 23, 396132, NULL, 'ELICEO GONGORA CEREZO', 'BENITA BALDERAS CHAVEZ', 'Soltero', '10322444', '1', '177', 0),
(16, 22, 394047, NULL, 'RUFINO MOLLO CHOQUE', 'ASCENCIA DONAIRE CAMATA', 'Soltero', '8627159', '1', '160', 0),
(17, 21, 386507, NULL, 'MARIO LLANOS PORTAL', 'LEONOR GALLARDO VASQUEZ', 'Soltero', '7509690', '1', '173', 0),
(18, 20, 396270, NULL, 'EDUBIGUEZ CHOQUE ZELAYA', 'TEOFILA ESCALANTE GONZALES', 'Soltero', '10365148', '1', '170', 0),
(19, 19, 406414, NULL, 'GREGORIO MIRANDA MARCELO', 'FERMINA COPA FERNANDEZ', 'Soltero', '5568104', '1', '155', 0),
(20, 18, 406495, NULL, 'DEMETRIO VERBO GUTIERREZ', 'VICTORIA MARQUEZ ZELAYA', 'Soltero', '8599602', '1', '165', 0),
(21, 17, 359879, NULL, 'MARIO MARTINEZ ROMERO', 'EUSEBIA IBAÑEZ ARROYO', 'Soltero', '7531013', '1', '170', 0),
(22, 4, 396253, NULL, 'DELFIN CONDORI VILLARPANDO ', 'FELICIA LAZCANO CAZORLA', 'Soltero', '10346248', '1', '173', 0),
(23, 3, 386576, NULL, 'MARIO LLANOS PORTAL', 'LEONOR GALLARDO VASQUEZ', 'Soltero', '5031830', '1', '165', 0),
(24, 2, 386500, NULL, 'HILARION AVENDAÑO CASTRO', 'EDUARDA FAUSTINA CANO', 'Soltero', '10310946', '1', '172', 0),
(25, 1, 375025, NULL, 'ISMAEL MARTINEZ ORTEGA', 'SANTUSA CARVAJAL TEJERINA', 'Soltero', '7531086', '1', '170', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `id_menu_principal` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `directorio` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `icono` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `color` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `estado` set('1','0') COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `id_menu_principal`, `nombre`, `directorio`, `icono`, `imagen`, `color`, `orden`, `estado`) VALUES
(1, 1, 'Trasferencias', 'jugador/transferencias', '1', '1', '1', 1, NULL),
(2, 3, 'Estadium', 'Estadio', '3', '3', '3', 3, NULL),
(3, 4, 'Categoria', 'Categoria', '4', '4', '4', 4, NULL),
(4, 8, 'Concepto', 'Concepto', '8', '8', '8', 8, NULL),
(5, 1, 'Jugador', 'Jugador', '1', '1', '1', 1, NULL),
(6, 2, 'Torneo', 'Torneo', '2', '2', '2', 2, NULL),
(7, 5, 'Categoria_Arbitro', 'Categoria_Arbitro', '5', '5', '5', 5, NULL),
(8, 2, 'Equipo', 'Equipo', '2', '2', '2', 2, NULL),
(9, 2, 'd', 'd', '2', '2', '2', 2, NULL),
(10, 6, 'd', 'd', '6', '6', '6', 6, NULL),
(11, 7, 'd', 'd', '7', '7', '7', 7, NULL),
(12, 1, 'Jugador_Categoria', 'jugador/categorias', '1', '1', '1', 1, NULL),
(13, 1, 'Curriculo_Jugador', 'Curriculo', '1', '1', '1', 1, NULL),
(14, 9, 'Cargo', 'registro/cargo', '1', '1', '1', 1, NULL),
(15, 9, 'Persona', 'registro/persona', NULL, NULL, NULL, 2, '1'),
(16, 9, 'Persona - Cargo', 'registro/persona_cargo', NULL, NULL, NULL, 1, '1'),
(17, 9, 'Roles', 'registro/roles', NULL, NULL, NULL, 1, ''),
(18, 9, 'Asignacion roles', 'registro/persona_roles', NULL, NULL, NULL, NULL, ''),
(19, 9, 'Menu principal', 'registro/menus_principales', NULL, NULL, NULL, NULL, ''),
(20, 9, 'Submenus', 'registro/menus', NULL, NULL, NULL, NULL, ''),
(21, 9, 'Asignacion Menu Prin.', 'registro/roles_menus_principales', NULL, NULL, NULL, NULL, '1'),
(22, 9, 'Árbitro', 'registro/arbitro', NULL, NULL, NULL, NULL, ''),
(23, 9, 'Categoría de árbitro', 'registro/categoria_arbitro', NULL, NULL, NULL, NULL, '1'),
(24, 9, 'Partidos de árbitro', 'registro/partidos_arbitro', NULL, NULL, NULL, NULL, NULL),
(25, 9, 'Planillero', 'registro/planillero', NULL, NULL, NULL, NULL, NULL),
(26, 9, 'Jugador', 'registro/jugador', NULL, NULL, NULL, NULL, NULL),
(27, 9, 'Categoria', 'registro/categoria', NULL, NULL, NULL, NULL, NULL),
(28, 9, 'Jugador y categoria - eliminar este menu', 'registro/jugador_categoria-eliminar esta', NULL, NULL, NULL, NULL, NULL),
(29, 9, 'Equipo', 'registro/equipo', NULL, NULL, NULL, NULL, NULL),
(30, 9, 'Registrar una categoria de un club', 'registro/equipo_jugador', NULL, NULL, NULL, NULL, NULL),
(31, 9, 'Club', 'registro/club', NULL, NULL, NULL, NULL, NULL),
(32, 9, 'Transferencia', 'registro/transferencia', NULL, NULL, NULL, NULL, NULL),
(33, 9, 'Torneo', 'registro/torneo', NULL, NULL, NULL, NULL, NULL),
(34, 9, 'Inscripciones', 'registro/torneo_equipo', NULL, NULL, NULL, NULL, NULL),
(35, 9, 'Costos', 'registro/costos_torneo', NULL, NULL, NULL, NULL, NULL),
(36, 9, 'Concepto de...', 'registro/concepto', NULL, NULL, NULL, NULL, NULL),
(37, 9, 'Transacciones', 'registro/transacciones', NULL, NULL, NULL, NULL, NULL),
(39, 9, 'Estadio', 'registro/estadio', NULL, NULL, NULL, NULL, NULL),
(40, 4, 'Planillero', 'planillero', NULL, NULL, NULL, NULL, NULL),
(41, 4, 'Rol de partidos', 'planillero/rol_partidos', NULL, NULL, NULL, NULL, '1'),
(42, 9, 'Tabla de posiciones', 'planillero/tabla_posiciones', NULL, NULL, NULL, NULL, '1'),
(43, 9, 'Asignacion de árbitros', 'planillero/asignacion_arbitros', NULL, NULL, NULL, NULL, '1'),
(44, 9, 'Pagos', 'planillero/pagos', NULL, NULL, NULL, NULL, '1'),
(46, 10, 'Asignacion menu usuario', 'Menu_Opciones/asignacion', NULL, NULL, NULL, NULL, '1'),
(47, 9, 'Asignar precios', 'registro/precio_concepto', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus_principales`
--

CREATE TABLE `menus_principales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `icono` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `color` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `estado` set('1','0') COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `menus_principales`
--

INSERT INTO `menus_principales` (`id`, `nombre`, `icono`, `color`, `orden`, `estado`) VALUES
(1, 'JUGADORES', '1', '1', 1, '1'),
(2, 'CLUBES', '2', '2', 2, '1'),
(3, 'ESTADIOS', '3', '3', 3, '1'),
(4, 'COMPETICIONES', '4', '4', 4, '1'),
(5, 'ARBITROS o PLANILLEROS', '5', '5', 5, '1'),
(6, 'ENTRENADORES', '6', '6', 6, '1'),
(7, 'INFORMES Y ESTADISTICAS', '7', '7', 7, '1'),
(8, 'CONTABILIDAD', '8', '8', 8, '1'),
(9, 'REGISTROS', '9', '9', 9, '1'),
(10, 'Menu-Usuario', '10', '10', 10, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo`
--

CREATE TABLE `motivo` (
  `id_motivo` int(11) NOT NULL,
  `descripcion` text COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `motivo`
--

INSERT INTO `motivo` (`id_motivo`, `descripcion`) VALUES
(1, 'PAGO POR INSCRIPCIÓN'),
(2, 'PAGO POR NUEVA AFILIACIÓN'),
(3, 'TARJETA DE ACTUACIÓN PVC TODAS LAS DIVISIONES SUPERIORES'),
(4, 'PLANILLA DE INSCRIPCIÓN c/Hoja'),
(5, 'FORMULARIO DE REGISTRO F. B. F.'),
(6, 'CERTIFICACIÓN A INSTITUCIONES AJENAS POR PERSONA'),
(7, 'CERTIFICACIONES A CLUBES AFILIADOS'),
(8, 'GARANTIA JUGADOR PARA ENCUENTRA SIGUIENTE'),
(9, 'INASISTENCIA CONSEJO CENTRAL (ATRASOS Y FALTAS)'),
(10, 'ABANDONOS DE CONSEJO CENTRAL Y ASAMBLEA'),
(11, 'INASISTENCIA FISCAL DE CANCHA (VEEDOR)'),
(12, 'FORMULARIO DE SOLICITUD A LA F. B. F.'),
(13, 'SANCIONES A DIRIGENTES TECNICOS, CUERPO TÉCNICO'),
(14, 'FALTA DE FIRMA DE JUGADORES Y CAPITÁN EN ENCUENTRO'),
(15, 'FALTA DE BALÓN REGLAMENTEARIO'),
(16, 'INVASIÓN A CAMPO DE JUEGO POR DIRECTORES TÉCNICOS, DIRIGENTES, PADRES DE FAMILIA E HINCHADA'),
(17, 'PAGO POR RECLAMO REALIZADO'),
(18, 'PAGO POR DERECHOS DE PASE'),
(19, 'JUGADOR DE PROVINCIA REGISTRADO EN LA F. B. F.'),
(20, 'PAGO POR PASES EN PROPIEDAD DE JUGADORES (CLUBES DESAPARECIDOS)'),
(21, 'PAGO POR AMARILLA'),
(22, '1 PAGO POR WALKOVER (W. O.)'),
(23, '2 PAGO POR WALKOVER (W. O.)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  `descripcion` text COLLATE latin1_spanish_ci,
  `id_precioconcepto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `fecha`, `monto`, `descripcion`, `id_precioconcepto`) VALUES
(8, '2020-06-05', 20, '[\"8\"]', 379),
(9, '2020-06-05', 10, '[\"2\"]', 379),
(10, '2020-06-05', 15, '[\"3\"]', 379),
(11, '2020-06-05', 20, '[\"4\"]', 379),
(12, '2020-06-05', 10, '[\"6\"]', 379),
(13, '2020-06-05', 5, '[\"1\"]', 379);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id_partidos` int(11) NOT NULL,
  `id_planillero` int(11) NOT NULL,
  `id_inscripcion1` int(11) NOT NULL,
  `id_inscripcion2` int(11) NOT NULL,
  `jornada` int(11) NOT NULL,
  `id_estadio` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `observaciones` varchar(350) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id_partidos`, `id_planillero`, `id_inscripcion1`, `id_inscripcion2`, `jornada`, `id_estadio`, `fecha`, `observaciones`, `estado`) VALUES
(1, 2, 2, 1, 1, 0, '2020-01-14 02:03:00', NULL, NULL),
(2, 1, 8, 6, 1, 0, '2020-06-26 02:02:00', NULL, NULL),
(3, 2, 9, 5, 1, 0, '2020-03-30 16:39:00', NULL, NULL),
(4, 1, 10, 4, 1, 5, '2020-04-30 16:39:00', NULL, NULL),
(5, 1, 11, 3, 1, 5, '2020-05-29 02:00:00', NULL, NULL),
(6, 1, 12, 7, 1, 0, '2020-06-30 16:39:00', NULL, NULL),
(7, 0, 3, 1, 2, 0, NULL, NULL, NULL),
(8, 0, 8, 7, 2, 0, NULL, NULL, NULL),
(9, 0, 9, 6, 2, 0, NULL, NULL, NULL),
(10, 0, 10, 5, 2, 0, NULL, NULL, NULL),
(11, 0, 11, 4, 2, 0, NULL, NULL, NULL),
(12, 0, 12, 2, 2, 0, NULL, NULL, NULL),
(13, 0, 3, 2, 3, 0, NULL, NULL, NULL),
(14, 0, 4, 1, 3, 0, NULL, NULL, NULL),
(15, 0, 9, 7, 3, 0, NULL, NULL, NULL),
(16, 0, 10, 6, 3, 0, NULL, NULL, NULL),
(17, 0, 11, 5, 3, 0, NULL, NULL, NULL),
(18, 0, 12, 8, 3, 0, NULL, NULL, NULL),
(19, 0, 4, 2, 4, 0, NULL, NULL, NULL),
(20, 0, 5, 1, 4, 0, NULL, NULL, NULL),
(21, 0, 9, 8, 4, 0, NULL, NULL, NULL),
(22, 0, 10, 7, 4, 0, NULL, NULL, NULL),
(23, 0, 11, 6, 4, 0, NULL, NULL, NULL),
(24, 0, 12, 3, 4, 0, NULL, NULL, NULL),
(25, 0, 4, 3, 5, 0, NULL, NULL, NULL),
(26, 0, 5, 2, 5, 0, NULL, NULL, NULL),
(27, 0, 6, 1, 5, 0, NULL, NULL, NULL),
(28, 0, 10, 8, 5, 0, NULL, NULL, NULL),
(29, 0, 11, 7, 5, 0, NULL, NULL, NULL),
(30, 0, 12, 9, 5, 0, NULL, NULL, NULL),
(31, 0, 5, 3, 6, 0, NULL, NULL, NULL),
(32, 0, 6, 2, 6, 0, NULL, NULL, NULL),
(33, 0, 7, 1, 6, 0, NULL, NULL, NULL),
(34, 0, 10, 9, 6, 0, NULL, NULL, NULL),
(35, 0, 11, 8, 6, 0, NULL, NULL, NULL),
(36, 0, 12, 4, 6, 0, NULL, NULL, NULL),
(37, 0, 5, 4, 7, 0, NULL, NULL, NULL),
(38, 0, 6, 3, 7, 0, NULL, NULL, NULL),
(39, 0, 7, 2, 7, 0, NULL, NULL, NULL),
(40, 0, 8, 1, 7, 0, NULL, NULL, NULL),
(41, 0, 11, 9, 7, 0, NULL, NULL, NULL),
(42, 0, 12, 10, 7, 0, NULL, NULL, NULL),
(43, 0, 6, 4, 8, 0, NULL, NULL, NULL),
(44, 0, 7, 3, 8, 0, NULL, NULL, NULL),
(45, 0, 8, 2, 8, 0, NULL, NULL, NULL),
(46, 0, 9, 1, 8, 0, NULL, NULL, NULL),
(47, 0, 11, 10, 8, 0, NULL, NULL, NULL),
(48, 0, 12, 5, 8, 0, NULL, NULL, NULL),
(49, 0, 6, 5, 9, 0, NULL, NULL, NULL),
(50, 0, 7, 4, 9, 0, NULL, NULL, NULL),
(51, 0, 8, 3, 9, 0, NULL, NULL, NULL),
(52, 0, 9, 2, 9, 0, NULL, NULL, NULL),
(53, 0, 10, 1, 9, 0, NULL, NULL, NULL),
(54, 0, 12, 11, 9, 0, NULL, NULL, NULL),
(55, 0, 7, 5, 10, 0, NULL, NULL, NULL),
(56, 0, 8, 4, 10, 0, NULL, NULL, NULL),
(57, 0, 9, 3, 10, 0, NULL, NULL, NULL),
(58, 0, 10, 2, 10, 0, NULL, NULL, NULL),
(59, 0, 11, 1, 10, 0, NULL, NULL, NULL),
(60, 0, 12, 6, 10, 0, NULL, NULL, NULL),
(61, 0, 7, 6, 11, 0, NULL, NULL, NULL),
(62, 0, 8, 5, 11, 0, NULL, NULL, NULL),
(63, 0, 9, 4, 11, 0, NULL, NULL, NULL),
(64, 0, 10, 3, 11, 0, NULL, NULL, NULL),
(65, 0, 11, 2, 11, 0, NULL, NULL, NULL),
(66, 0, 12, 1, 11, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombres` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_paterno` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_materno` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT 'user.jpg',
  `telefono` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dirección` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `profesión` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nacionalidad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombres`, `apellido_paterno`, `apellido_materno`, `foto`, `telefono`, `celular`, `dirección`, `ciudad`, `fecha_nacimiento`, `sexo`, `profesión`, `nacionalidad`, `email`, `usuario`, `password`) VALUES
(1, 'Carlos Alfredo', 'Ortega', 'Orellana', 'user.jpg', '064-65425', '60322860', 'Ostria Reyes # 125', 'Chuquisca', '2000-02-02', 'M', 'Estudiante', 'bolivia', 'admin@gmail.com', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(2, 'Gilverto', 'avendaño', 'Cano', 'user.jpg', '064-220000', '65231578', 'Canada # 1256', 'Chuquisca', '1998-06-22', 'M', 'Estudiante', 'Bolivia', 'cano@gmail.com', 'cano', 'cano'),
(3, 'Diego', 'Llanos ', 'Gallardo', 'user.jpg', '064-22000', '65258985', 'Lemoine # 254', 'Chuquisca', '1997-09-15', 'M', 'Estudiante', 'Bolivia', 'diego@gmail.com', 'diego', 'diego'),
(4, 'Ivan', 'Condori', 'Lascano', 'user.jpg', '064-25635', '71225233', 'Colon # 854', 'Chuquisca', '1998-12-15', 'M', 'Estudiante', 'Bolivia', 'ivan@gmail.com', 'ivan', 'ivan'),
(5, 'Abelardo', 'Cazon', 'Rodrigues', 'user.jpg', '064-25687', '75633522', 'Junin @ 1235', 'Chuquisca', '1865-07-29', 'M', 'Profesor de Educación Física', 'bolivia', 'abelardo@gmail.com', 'abelardo', 'abelardo'),
(6, 'Juan Nelio', 'Garcia', 'Salvatierra', 'user.jpg', '064-65425', '78594562', 'Lemoine # 124', 'Chuquisaca', '1982-02-25', 'M', 'Arbitro Referee', 'Bolivia', 'juan@gmail.com', 'juan', 'juan'),
(7, 'Jose', 'Jordan', 'Vasquez', 'user.jpg', '064-65425', '65878565', 'Lemoine # 254', 'Chuquisaca', '1978-08-29', 'M', 'Arbitro Referee', 'Bolivia', 'jose@gmail.com', 'jose', 'jose'),
(8, 'Ivo Nigel', 'Mendez', 'Chavez', 'user.jpg', '251-0254', '65248763', 'Loa # 1247', 'Chuquisaca', '1991-07-20', 'M', 'Arbitro Referee', 'Bolivia', 'ivo@gmail.com', 'ivo', 'ivo'),
(9, 'Raul', 'Orosco', 'Mendez', 'user.jpg', '124-63254', '61235478', 'Avaroa # 1456', 'Chuquisaca', '1979-01-14', 'M', 'Arbitro Referee', 'Bolivia', 'raul@gmail.com', 'raul', 'raul'),
(10, 'Gery', 'Vargas', 'Chavez', 'user.jpg', '064-25478', '78954612', '25 de mayo # 12', 'Chuquisaca', '1981-05-13', 'M', 'Planillero', 'Bolivia', 'gery@gmail.com', 'gery', 'gery'),
(11, 'Luis Javier', 'Yrusta', 'Campos', 'user.jpg', '124-56879', '71457893', 'Avaroa # 1245', 'Chuquisaca', '1979-07-07', 'M', 'Planillero', 'Bolivia', 'luis@gmail.com', 'luis', 'luis'),
(12, 'Alberto', 'Antelo', 'Campos', 'user.jpg', '064-65425', '71254365', 'Arenales # 231', 'Chuquisaca', '1984-06-24', 'M', 'Arbitro Asistente Referee', 'Bolivia', 'alberto@gmail.com', 'alberto', 'alberto'),
(13, 'Ariel', 'Guizada', 'Herbas', 'user.jpg', '064-54879', '75631245', 'Loa # 258', 'Chuquisaca', '1980-04-26', 'M', 'Arbitro Asistente Referee', 'Bolivia', 'ariel@gmail.com', 'ariel', 'ariel'),
(14, 'Pablo', 'Montano', 'Chavez', 'user.jpg', '064-36547', '72121010', 'Loa # 120', 'Chuquisaca', '1988-03-26', 'M', 'Arbitro Asistente Referee', 'Bolivia', 'pablo@gmail.com', 'pablo', 'pablo'),
(15, 'Edwar', 'Saavedra', 'Vargas', 'user.jpg', '064-58967', '76894111', 'Colon # 365', 'Chuquisca', '1990-08-20', 'M', 'Arbitro Asistente Referee', 'Bolivia', 'edwar@gamail,com', 'edwar', 'edwar'),
(16, 'Reluy', 'Vallejos', 'Ramos', 'user.jpg', '064-56231', '71256898', 'Arenales # 124', 'Chuquisaca', '1985-09-11', 'M', 'Arbitro Asistente Referee', 'Bolivia', 'reluy@gmail.com', 'reluy', 'reluy'),
(17, 'Cristian', 'Martinez', 'Ibañez', 'user.jpg', '063-22222', '65897452', 'Lemoine #12', 'Chuquisaca', '1993-03-16', 'M', 'Estudiante', 'Bolivia', 'cristian@gmail.com', NULL, NULL),
(18, 'JUAN CARLOS ', 'VERBO', 'MARQUEZ', 'user.jpg', NULL, '78594562', 'Loa #12', 'Chuquisaca', '1991-05-10', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(19, 'FERNANDO JOSE', 'MIRANDA', 'COPA', 'user.jpg', NULL, '758965488', 'Loa #125', 'Chuquisaca', '2000-01-09', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(20, 'JUAN PABLO', 'COLQUE', 'ESCALANTE', 'user.jpg', NULL, '75845585', 'Loa #1254', 'Chuquisaca', '1999-04-24', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(21, 'LUIS ALBARO', 'LLANOS', 'GALLARDO', 'user.jpg', NULL, '75879621', 'Abaroa #145', 'Chuquisaca', '1999-01-11', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(22, 'EDWIN', 'MOLLO', 'DONAIRE', 'user.jpg', NULL, '75845585', 'Lemoine #124', 'Chuquisaca', '1994-06-10', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(23, 'GILBERTO', 'GONGORA', 'BALDERAS', 'user.jpg', NULL, '75124565', 'Lemoine #542', 'Chuquisaca', '1997-08-09', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(24, 'MARIO MIGUEL', 'MARTINEZ', 'IBAÑEZ', 'user.jpg', NULL, '75845585', 'Lemoine #5421', 'Chuquisca', '1998-09-05', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(25, 'JUAN BENITO', 'LEON ', 'SANCHES', 'user.jpg', NULL, '75124565', 'Lemoine #254', 'Chuquisaca', '1995-03-31', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(26, 'REYNER', 'RODRIGUEZ', 'CAYO', 'user.jpg', NULL, '75845585', 'Lemoine #258', 'Chuquisaca', '1995-03-03', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(27, 'DANIEL ALEJANDRO', 'GUTIERREZ', 'MONTAÑO', 'user.jpg', NULL, '75124565', 'Lemoine #258', 'Chuquisaca', '1991-09-16', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(28, 'DANIEL', 'MENACHO', 'CALDERON', 'user.jpg', NULL, '75879658', 'Lemoine #258', 'Chuquisaca', '2001-04-17', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(29, 'HECTOR WILFREDO', 'GOMEZ', 'UMAÑA', 'user.jpg', NULL, '75896421', 'Lemoine #258', 'Chuquisaca', '1993-09-25', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(30, 'NOEL FERNANDO', 'LLANQUI', 'COLQUE', 'user.jpg', NULL, '75849632', 'Lemoine #258', 'Chuquisaca', '2000-06-10', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(31, 'LUIS MIGUEL', 'SERRANO', NULL, 'user.jpg', NULL, '78594562', 'Lemoine #236', 'Chuquisaca', '1993-06-25', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(32, 'GERONIMO', 'CRUZ', 'MAMANI', 'user.jpg', NULL, '75124565', 'Lemoine #236', 'Chuquisaca', '1995-02-08', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(33, 'MANUEL NIQUELI', 'SONCO', 'RIOS', 'user.jpg', NULL, '75849658', 'Lemoine #236', 'Chuquisaca', '1994-08-29', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(34, 'ARIEL ALEX', 'CRUZ', 'MAMANI', 'user.jpg', NULL, '75896321', 'Lemoine #236', 'Chuquisaca', '1999-07-31', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(35, 'BACILIO RIGOBERTO', 'YUCRA', 'CABA', 'user.jpg', NULL, '741235689', 'Lemoine #236', 'Chuquisaca', '1995-01-04', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(36, 'GEYSEL DARWIN', 'CRUZ', 'PANIAGUA', 'user.jpg', NULL, '71245638', 'Lemoine #36', 'Chuquisaca', '1998-04-13', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(37, 'BENJAMIN', 'CASTILLO', 'EGUEZ', 'user.jpg', NULL, '72356897', 'Lemoine #36', 'Chuquisaca', '1995-01-05', 'M', 'Estudiante', 'Bolivia', NULL, NULL, NULL),
(38, 'Carlos Alfredo', 'Ortega', 'Orellana', 'user.jpg', '464-85255', '74402507', 'Pasaje Tomina # 2', 'Chuquisaca', '1991-04-04', 'M', 'Estudiante', 'Bolivia', 'ortega.orellana.alfredo@gmail.com', 'Carlos', 'carlos'),
(41, 'Katerine', 'Martinez', 'Cossio', 'ce9bf-427pis4wc3l41.jpg', '2134r12', '2134', 'asdvsdav', 'Oruro', '1988-12-09', 'F', 'asdvfsadv', 'asvdsad', 'ercm@itecaamericano.com', 'ivi', 'd033e22ae348aeb5660fc2140aec35850c4da997');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_roles`
--

CREATE TABLE `personas_roles` (
  `id` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` set('1','0') COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `personas_roles`
--

INSERT INTO `personas_roles` (`id`, `id_persona`, `id_rol`, `fecha`, `estado`) VALUES
(1, 1, 1, '2019-08-28', '1'),
(2, 41, 2, '2020-03-13', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_cargo`
--

CREATE TABLE `persona_cargo` (
  `id_personacargo` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona_cargo`
--

INSERT INTO `persona_cargo` (`id_personacargo`, `id_persona`, `id_cargo`, `estado`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planillero`
--

CREATE TABLE `planillero` (
  `id_planillero` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `disciplinas` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planillero`
--

INSERT INTO `planillero` (`id_planillero`, `id_persona`, `disciplinas`, `observaciones`, `estado`) VALUES
(1, 10, 'FÚTBOL ', 'NINGUNA', 1),
(2, 11, 'FÚTBOL ', 'NINGUNA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_concepto`
--

CREATE TABLE `precio_concepto` (
  `id_precioconcepto` int(11) NOT NULL,
  `precio` float DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_motivo` int(11) DEFAULT NULL,
  `id_concepto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `precio_concepto`
--

INSERT INTO `precio_concepto` (`id_precioconcepto`, `precio`, `id_categoria`, `id_motivo`, `id_concepto`) VALUES
(1, 500, 1, 1, 1),
(2, 450, 2, 1, 1),
(3, 350, 3, 1, 1),
(4, 350, 4, 1, 1),
(5, 350, 5, 1, 1),
(6, 300, 6, 1, 1),
(7, 300, 7, 1, 1),
(8, 200, 9, 1, 1),
(9, 150, 10, 1, 1),
(10, 150, 11, 1, 1),
(11, 150, 12, 1, 1),
(12, 150, 13, 1, 1),
(13, 150, 14, 1, 1),
(14, 150, 15, 1, 1),
(15, 150, 16, 1, 1),
(16, 150, 17, 1, 1),
(17, 150, 18, 1, 1),
(18, 150, 19, 1, 1),
(19, 2000, 5, 2, 2),
(20, 2000, 9, 2, 2),
(21, 2000, 10, 2, 2),
(22, 2000, 11, 2, 2),
(23, 2000, 12, 2, 2),
(24, 2000, 13, 2, 2),
(25, 2000, 14, 2, 2),
(26, 2000, 15, 2, 2),
(27, 2000, 16, 2, 2),
(28, 2000, 17, 2, 2),
(29, 2000, 18, 2, 2),
(30, 2000, 19, 2, 2),
(31, 10, 1, 3, 3),
(32, 3, 1, 4, 3),
(33, 10, 1, 5, 3),
(34, 100, 1, 6, 3),
(35, 10, 1, 7, 3),
(36, 10, 1, 8, 3),
(37, 50, 1, 9, 3),
(38, 90, 1, 10, 3),
(39, 60, 1, 11, 3),
(40, 1, 1, 12, 3),
(41, 1000, 1, 13, 3),
(42, 20, 1, 14, 3),
(43, 50, 1, 15, 3),
(44, 1000, 1, 16, 3),
(45, 10, 2, 3, 3),
(46, 3, 2, 4, 3),
(47, 10, 2, 5, 3),
(48, 100, 2, 6, 3),
(49, 10, 2, 7, 3),
(50, 10, 2, 8, 3),
(51, 50, 2, 9, 3),
(52, 90, 2, 10, 3),
(53, 60, 2, 11, 3),
(54, 1, 2, 12, 3),
(55, 1000, 2, 13, 3),
(56, 20, 2, 14, 3),
(57, 50, 2, 15, 3),
(58, 1000, 2, 16, 3),
(59, 10, 3, 3, 3),
(60, 3, 3, 4, 3),
(61, 10, 3, 5, 3),
(62, 100, 3, 6, 3),
(63, 10, 3, 7, 3),
(64, 10, 3, 8, 3),
(65, 50, 3, 9, 3),
(66, 90, 3, 10, 3),
(67, 60, 3, 11, 3),
(68, 1, 3, 12, 3),
(69, 1000, 3, 13, 3),
(70, 20, 3, 14, 3),
(71, 50, 3, 15, 3),
(72, 1000, 3, 16, 3),
(73, 10, 4, 3, 3),
(74, 3, 4, 4, 3),
(75, 10, 4, 5, 3),
(76, 100, 4, 6, 3),
(77, 10, 4, 7, 3),
(78, 10, 4, 8, 3),
(79, 50, 4, 9, 3),
(80, 90, 4, 10, 3),
(81, 60, 4, 11, 3),
(82, 1, 4, 12, 3),
(83, 1000, 4, 13, 3),
(84, 20, 4, 14, 3),
(85, 50, 4, 15, 3),
(86, 1000, 4, 16, 3),
(87, 10, 5, 3, 3),
(88, 3, 5, 4, 3),
(89, 10, 5, 5, 3),
(90, 100, 5, 6, 3),
(91, 10, 5, 7, 3),
(92, 10, 5, 8, 3),
(93, 50, 5, 9, 3),
(94, 90, 5, 10, 3),
(95, 60, 5, 11, 3),
(96, 1, 5, 12, 3),
(97, 1000, 5, 13, 3),
(98, 20, 5, 14, 3),
(99, 50, 5, 15, 3),
(100, 1000, 5, 16, 3),
(101, 10, 6, 3, 3),
(102, 3, 6, 4, 3),
(103, 10, 6, 5, 3),
(104, 100, 6, 6, 3),
(105, 10, 6, 7, 3),
(106, 10, 6, 8, 3),
(107, 50, 6, 9, 3),
(108, 90, 6, 10, 3),
(109, 60, 6, 11, 3),
(110, 1, 6, 12, 3),
(111, 1000, 6, 13, 3),
(112, 20, 6, 14, 3),
(113, 50, 6, 15, 3),
(114, 1000, 6, 16, 3),
(115, 10, 7, 3, 3),
(116, 3, 7, 4, 3),
(117, 10, 7, 5, 3),
(118, 100, 7, 6, 3),
(119, 10, 7, 7, 3),
(120, 10, 7, 8, 3),
(121, 50, 7, 9, 3),
(122, 90, 7, 10, 3),
(123, 60, 7, 11, 3),
(124, 1, 7, 12, 3),
(125, 1000, 7, 13, 3),
(126, 20, 7, 14, 3),
(127, 50, 7, 15, 3),
(128, 1000, 7, 16, 3),
(129, 10, 8, 3, 3),
(130, 3, 8, 4, 3),
(131, 10, 8, 5, 3),
(132, 100, 8, 6, 3),
(133, 10, 8, 7, 3),
(134, 10, 8, 8, 3),
(135, 50, 8, 9, 3),
(136, 90, 8, 10, 3),
(137, 60, 8, 11, 3),
(138, 1, 8, 12, 3),
(139, 1000, 8, 13, 3),
(140, 20, 8, 14, 3),
(141, 50, 8, 15, 3),
(142, 1000, 8, 16, 3),
(143, 10, 9, 3, 3),
(144, 3, 9, 4, 3),
(145, 10, 9, 5, 3),
(146, 100, 9, 6, 3),
(147, 10, 9, 7, 3),
(148, 10, 9, 8, 3),
(149, 50, 9, 9, 3),
(150, 90, 9, 10, 3),
(151, 60, 9, 11, 3),
(152, 1, 9, 12, 3),
(153, 1000, 9, 13, 3),
(154, 20, 9, 14, 3),
(155, 50, 9, 15, 3),
(156, 1000, 9, 16, 3),
(157, 10, 10, 3, 3),
(158, 3, 10, 4, 3),
(159, 10, 10, 5, 3),
(160, 100, 10, 6, 3),
(161, 10, 10, 7, 3),
(162, 10, 10, 8, 3),
(163, 50, 10, 9, 3),
(164, 90, 10, 10, 3),
(165, 60, 10, 11, 3),
(166, 1, 10, 12, 3),
(167, 1000, 10, 13, 3),
(168, 20, 10, 14, 3),
(169, 50, 10, 15, 3),
(170, 1000, 10, 16, 3),
(171, 10, 11, 3, 3),
(172, 3, 11, 4, 3),
(173, 10, 11, 5, 3),
(174, 100, 11, 6, 3),
(175, 10, 11, 7, 3),
(176, 10, 11, 8, 3),
(177, 50, 11, 9, 3),
(178, 90, 11, 10, 3),
(179, 60, 11, 11, 3),
(180, 1, 11, 12, 3),
(181, 1000, 11, 13, 3),
(182, 20, 11, 14, 3),
(183, 50, 11, 15, 3),
(184, 1000, 11, 16, 3),
(185, 10, 12, 3, 3),
(186, 3, 12, 4, 3),
(187, 10, 12, 5, 3),
(188, 100, 12, 6, 3),
(189, 10, 12, 7, 3),
(190, 10, 12, 8, 3),
(191, 50, 12, 9, 3),
(192, 90, 12, 10, 3),
(193, 60, 12, 11, 3),
(194, 1, 12, 12, 3),
(195, 1000, 12, 13, 3),
(196, 20, 12, 14, 3),
(197, 50, 12, 15, 3),
(198, 1000, 12, 16, 3),
(199, 10, 13, 3, 3),
(200, 3, 13, 4, 3),
(201, 10, 13, 5, 3),
(202, 100, 13, 6, 3),
(203, 10, 13, 7, 3),
(204, 10, 13, 8, 3),
(205, 50, 13, 9, 3),
(206, 90, 13, 10, 3),
(207, 60, 13, 11, 3),
(208, 1, 13, 12, 3),
(209, 1000, 13, 13, 3),
(210, 20, 13, 14, 3),
(211, 50, 13, 15, 3),
(212, 1000, 13, 16, 3),
(213, 10, 14, 3, 3),
(214, 3, 14, 4, 3),
(215, 10, 14, 5, 3),
(216, 100, 14, 6, 3),
(217, 10, 14, 7, 3),
(218, 10, 14, 8, 3),
(219, 50, 14, 9, 3),
(220, 90, 14, 10, 3),
(221, 60, 14, 11, 3),
(222, 1, 14, 12, 3),
(223, 1000, 14, 13, 3),
(224, 20, 14, 14, 3),
(225, 50, 14, 15, 3),
(226, 1000, 14, 16, 3),
(227, 10, 15, 3, 3),
(228, 3, 15, 4, 3),
(229, 10, 15, 5, 3),
(230, 100, 15, 6, 3),
(231, 10, 15, 7, 3),
(232, 10, 15, 8, 3),
(233, 50, 15, 9, 3),
(234, 90, 15, 10, 3),
(235, 60, 15, 11, 3),
(236, 1, 15, 12, 3),
(237, 1000, 15, 13, 3),
(238, 20, 15, 14, 3),
(239, 50, 15, 15, 3),
(240, 1000, 15, 16, 3),
(241, 10, 16, 3, 3),
(242, 3, 16, 4, 3),
(243, 10, 16, 5, 3),
(244, 100, 16, 6, 3),
(245, 10, 16, 7, 3),
(246, 10, 16, 8, 3),
(247, 50, 16, 9, 3),
(248, 90, 16, 10, 3),
(249, 60, 16, 11, 3),
(250, 1, 16, 12, 3),
(251, 1000, 16, 13, 3),
(252, 20, 16, 14, 3),
(253, 50, 16, 15, 3),
(254, 1000, 16, 16, 3),
(255, 10, 17, 3, 3),
(256, 3, 17, 4, 3),
(257, 10, 17, 5, 3),
(258, 100, 17, 6, 3),
(259, 10, 17, 7, 3),
(260, 10, 17, 8, 3),
(261, 50, 17, 9, 3),
(262, 90, 17, 10, 3),
(263, 60, 17, 11, 3),
(264, 1, 17, 12, 3),
(265, 1000, 17, 13, 3),
(266, 20, 17, 14, 3),
(267, 50, 17, 15, 3),
(268, 1000, 17, 16, 3),
(269, 10, 18, 3, 3),
(270, 3, 18, 4, 3),
(271, 10, 18, 5, 3),
(272, 100, 18, 6, 3),
(273, 10, 18, 7, 3),
(274, 10, 18, 8, 3),
(275, 50, 18, 9, 3),
(276, 90, 18, 10, 3),
(277, 60, 18, 11, 3),
(278, 1, 18, 12, 3),
(279, 1000, 18, 13, 3),
(280, 20, 18, 14, 3),
(281, 50, 18, 15, 3),
(282, 1000, 18, 16, 3),
(283, 10, 19, 3, 3),
(284, 3, 19, 4, 3),
(285, 10, 19, 5, 3),
(286, 100, 19, 6, 3),
(287, 10, 19, 7, 3),
(288, 10, 19, 8, 3),
(289, 50, 19, 9, 3),
(290, 90, 19, 10, 3),
(291, 60, 19, 11, 3),
(292, 1, 19, 12, 3),
(293, 1000, 19, 13, 3),
(294, 20, 19, 14, 3),
(295, 50, 19, 15, 3),
(296, 1000, 19, 16, 3),
(297, 450, 1, 17, 4),
(298, 350, 2, 17, 4),
(299, 300, 3, 17, 4),
(300, 250, 4, 17, 4),
(301, 250, 5, 17, 4),
(302, 100, 9, 17, 4),
(303, 80, 10, 17, 4),
(304, 80, 11, 17, 4),
(305, 50, 12, 17, 4),
(306, 100, 13, 17, 4),
(307, 100, 14, 17, 4),
(308, 80, 15, 17, 4),
(309, 80, 16, 17, 4),
(310, 50, 17, 17, 4),
(311, 50, 18, 17, 4),
(312, 50, 19, 17, 4),
(313, 300, 1, 18, 5),
(314, 380, 2, 18, 5),
(315, 250, 3, 18, 5),
(316, 250, 4, 18, 5),
(317, 250, 5, 18, 5),
(318, 220, 9, 18, 5),
(319, 180, 10, 18, 5),
(320, 200, 13, 18, 5),
(321, 200, 14, 18, 5),
(322, 200, 15, 18, 5),
(323, 200, 16, 18, 5),
(324, 200, 17, 18, 5),
(325, 180, 18, 18, 5),
(326, 180, 19, 18, 5),
(327, 400, 1, 19, 5),
(328, 400, 2, 19, 5),
(329, 400, 3, 19, 5),
(330, 400, 4, 19, 5),
(331, 400, 5, 19, 5),
(332, 400, 6, 19, 5),
(333, 400, 7, 19, 5),
(334, 400, 8, 19, 5),
(335, 400, 9, 19, 5),
(336, 400, 10, 19, 5),
(337, 400, 11, 19, 5),
(338, 400, 12, 19, 5),
(339, 400, 13, 19, 5),
(340, 400, 14, 19, 5),
(341, 400, 15, 19, 5),
(342, 400, 16, 19, 5),
(343, 400, 17, 19, 5),
(344, 400, 18, 19, 5),
(345, 400, 19, 19, 5),
(346, 350, 1, 20, 6),
(347, 300, 2, 20, 6),
(348, 250, 3, 20, 6),
(349, 200, 4, 20, 6),
(350, 200, 5, 20, 6),
(351, 150, 9, 20, 6),
(352, 150, 10, 20, 6),
(353, 150, 13, 20, 6),
(354, 150, 14, 20, 6),
(355, 150, 15, 20, 6),
(356, 150, 16, 20, 6),
(357, 100, 17, 20, 6),
(358, 100, 18, 20, 6),
(359, 100, 19, 20, 6),
(360, 300, 1, 19, 6),
(361, 300, 2, 19, 6),
(362, 300, 3, 19, 6),
(363, 300, 4, 19, 6),
(364, 300, 5, 19, 6),
(365, 300, 6, 19, 6),
(366, 300, 7, 19, 6),
(367, 300, 8, 19, 6),
(368, 300, 9, 19, 6),
(369, 300, 10, 19, 6),
(370, 300, 11, 19, 6),
(371, 300, 12, 19, 6),
(372, 300, 13, 19, 6),
(373, 300, 14, 19, 6),
(374, 300, 15, 19, 6),
(375, 300, 16, 19, 6),
(376, 300, 17, 19, 6),
(377, 300, 18, 19, 6),
(378, 300, 19, 19, 6),
(379, 0, 1, 21, 7),
(380, 0, 2, 21, 7),
(381, 0, 3, 21, 7),
(382, 0, 4, 21, 7),
(383, 0, 5, 21, 7),
(384, 0, 8, 21, 7),
(385, 0, 9, 21, 7),
(386, 0, 13, 21, 7),
(387, 0, 14, 21, 7),
(388, 0, 15, 21, 7),
(389, 0, 16, 21, 7),
(390, 0, 17, 21, 7),
(391, 0, 18, 21, 7),
(392, 0, 19, 21, 7),
(393, 1500, 1, 22, 8),
(394, 1000, 2, 22, 8),
(395, 1000, 3, 22, 8),
(396, 1000, 4, 22, 8),
(397, 1000, 5, 22, 8),
(398, 500, 8, 22, 8),
(399, 100, 9, 22, 8),
(400, 100, 10, 22, 8),
(401, 100, 11, 22, 8),
(402, 80, 12, 22, 8),
(403, 100, 13, 22, 8),
(404, 100, 14, 22, 8),
(405, 100, 15, 22, 8),
(406, 100, 16, 22, 8),
(407, 80, 17, 22, 8),
(408, 80, 18, 22, 8),
(409, 80, 19, 22, 8),
(410, 2500, 1, 23, 8),
(411, 1500, 2, 23, 8),
(412, 1500, 3, 23, 8),
(413, 1500, 4, 23, 8),
(414, 1500, 5, 23, 8),
(415, 1000, 8, 23, 8),
(416, 200, 9, 23, 8),
(417, 200, 10, 23, 8),
(418, 200, 11, 23, 8),
(419, 100, 12, 23, 8),
(420, 200, 13, 23, 8),
(421, 200, 14, 23, 8),
(422, 200, 15, 23, 8),
(423, 150, 16, 23, 8),
(424, 100, 17, 23, 8),
(425, 100, 18, 23, 8),
(426, 100, 19, 23, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_partido`
--

CREATE TABLE `resultado_partido` (
  `id_resultadopartido` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_partidos` int(11) NOT NULL,
  `accion` int(11) NOT NULL COMMENT '1=amarilla\r\n2=roja\r\n3=gol',
  `pagado` tinyint(4) DEFAULT NULL COMMENT '0=no pagado por amarilla, 1=pagado por amarilla',
  `minuto` int(11) DEFAULT NULL,
  `orden` text COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `resultado_partido`
--

INSERT INTO `resultado_partido` (`id_resultadopartido`, `id_jugador`, `id_partidos`, `accion`, `pagado`, `minuto`, `orden`) VALUES
(525, 1, 1, 1, 1, 12, ''),
(526, 1, 1, 1, 0, 12, ''),
(527, 1, 1, 1, 0, 12, ''),
(528, 1, 1, 1, 0, 12, ''),
(529, 1, 1, 1, 0, 12, ''),
(530, 1, 1, 1, 0, 12, ''),
(531, 1, 1, 1, 0, 12, ''),
(532, 1, 1, 1, 0, 12, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `estado` set('1','0') COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `estado`) VALUES
(1, 'admin', '1'),
(2, 'secre', '1'),
(3, 'otro', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_menus_principales`
--

CREATE TABLE `roles_menus_principales` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_menu_principal` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` set('1','0') COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles_menus_principales`
--

INSERT INTO `roles_menus_principales` (`id`, `id_rol`, `id_menu_principal`, `fecha`, `estado`) VALUES
(54, 1, 1, '2020-03-13', '1'),
(55, 1, 2, '2020-03-13', '1'),
(56, 1, 3, '2020-03-13', '1'),
(57, 1, 4, '2020-03-13', '1'),
(58, 1, 5, '2020-03-13', '1'),
(59, 1, 6, '2020-03-13', '1'),
(60, 1, 7, '2020-03-13', '1'),
(61, 1, 8, '2020-03-13', '1'),
(62, 1, 9, '2020-03-13', '1'),
(63, 1, 10, '2020-03-13', '1'),
(90, 2, 1, '2020-03-13', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suspencion`
--

CREATE TABLE `suspencion` (
  `id_suspencion` int(11) NOT NULL,
  `cantpart` int(11) NOT NULL,
  `motivo` varchar(1) COLLATE latin1_spanish_ci NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_partidos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `id_torneo` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`id_torneo`, `id_categoria`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 1, '2019-02-09', '2019-12-22', 0),
(2, 2, '2019-05-18', '2019-11-24', 0),
(3, 3, '2019-05-25', '2019-11-24', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneosorteado`
--

CREATE TABLE `torneosorteado` (
  `id_torneosorteado` int(11) NOT NULL,
  `fecha_sorteo` date NOT NULL,
  `id_torneo` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL COMMENT '1=equipos sorteados. 0=equipos no sorteados'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `torneosorteado`
--

INSERT INTO `torneosorteado` (`id_torneosorteado`, `fecha_sorteo`, `id_torneo`, `estado`) VALUES
(9, '2020-05-27', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id_transacciones` int(11) NOT NULL,
  `id_inscripcion` int(11) NOT NULL,
  `id_torneoequipo` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`id_transacciones`, `id_inscripcion`, `id_torneoequipo`, `fecha`, `cantidad`) VALUES
(1, 4, 1, '2019-05-08 00:00:00', 30),
(2, 2, 1, '2019-05-08 00:00:00', 10),
(3, 1, 9, '2019-12-09 00:00:00', 111),
(4, 5, 9, '2019-12-09 00:00:00', 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencias`
--

CREATE TABLE `transferencias` (
  `id_transferencias` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `id_club_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `transferencias`
--

INSERT INTO `transferencias` (`id_transferencias`, `fecha`, `id_jugador`, `id_club`, `id_club_destino`) VALUES
(1, '2019-08-05', 1, 6, 1),
(17, '2029-09-01', 1, 1, 5),
(18, '2020-10-01', 1, 5, 8),
(19, '2020-11-01', 1, 8, 4),
(20, '2020-12-01', 1, 4, 2),
(21, '2020-06-01', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_categoria_torneo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_categoria_torneo` (
`id_torneo` int(11)
,`nombre` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_equipo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_equipo` (
`id_equipo` int(11)
,`nombre_club` varchar(100)
,`nombre` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_ficha_kardex`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_ficha_kardex` (
`id_persona` int(11)
,`nacionalidad` varchar(100)
,`ciudad` varchar(100)
,`estado` char(1)
,`nombres` varchar(70)
,`apellido_paterno` varchar(70)
,`apellido_materno` varchar(70)
,`foto` varchar(255)
,`fecha_nacimiento` date
,`sexo` varchar(1)
,`id_jugador` int(11)
,`nombre_club` varchar(100)
,`nombre` varchar(150)
,`lfpb_asociacion_liga_provincial` varchar(250)
,`n_registro_fbf` int(11)
,`estado_civil` varchar(50)
,`nombre_padre` varchar(70)
,`nombre_madre` varchar(70)
,`c_i` varchar(30)
,`dirección` varchar(100)
,`posicion` varchar(50)
,`estatura` decimal(10,0)
,`peso` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_jugador_categoria`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_jugador_categoria` (
`id_jugador` int(11)
,`jugador` varchar(212)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_personas_menus_principales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_personas_menus_principales` (
`nombre_persona` varchar(70)
,`apellido_paterno` varchar(70)
,`apellido_materno` varchar(70)
,`fecha_nacimiento` date
,`foto` varchar(255)
,`sexo` varchar(1)
,`telefono` varchar(25)
,`celular` varchar(25)
,`usuario` varchar(150)
,`password` varchar(250)
,`id_persona_rol` int(11)
,`id_persona` int(11)
,`id_rol` int(11)
,`nombre_rol` varchar(150)
,`id_menu_principal` int(11)
,`nombre_menu_principal` varchar(250)
,`icono` varchar(70)
,`color` varchar(25)
,`orden` int(11)
,`estado` set('1','0')
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_torneocategoria`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_torneocategoria` (
`id_torneo` int(11)
,`nombre` varchar(150)
,`fecha_inicio` date
,`fecha_fin` date
,`estado` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_categoria_torneo`
--
DROP TABLE IF EXISTS `v_categoria_torneo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_categoria_torneo`  AS  select `torneo`.`id_torneo` AS `id_torneo`,`categoria`.`nombre` AS `nombre` from (`torneo` join `categoria` on((`categoria`.`id_categoria` = `torneo`.`id_categoria`))) group by `torneo`.`id_torneo`,`categoria`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_equipo`
--
DROP TABLE IF EXISTS `v_equipo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_equipo`  AS  select `equipo`.`id_equipo` AS `id_equipo`,`club`.`nombre_club` AS `nombre_club`,`categoria`.`nombre` AS `nombre` from (((`inscripcionjugador` join `equipo` on((`equipo`.`id_equipo` = `inscripcionjugador`.`id_equipo`))) join `club` on((`club`.`id_club` = `equipo`.`id_club`))) join `categoria` on((`categoria`.`id_categoria` = `equipo`.`id_categoria`))) group by `equipo`.`id_equipo` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_ficha_kardex`
--
DROP TABLE IF EXISTS `v_ficha_kardex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ficha_kardex`  AS  select `persona`.`id_persona` AS `id_persona`,`persona`.`nacionalidad` AS `nacionalidad`,`persona`.`ciudad` AS `ciudad`,`jugador`.`estado` AS `estado`,`persona`.`nombres` AS `nombres`,`persona`.`apellido_paterno` AS `apellido_paterno`,`persona`.`apellido_materno` AS `apellido_materno`,`persona`.`foto` AS `foto`,`persona`.`fecha_nacimiento` AS `fecha_nacimiento`,`persona`.`sexo` AS `sexo`,`jugador`.`id_jugador` AS `id_jugador`,`club`.`nombre_club` AS `nombre_club`,`categoria`.`nombre` AS `nombre`,`jugador`.`lfpb_asociacion_liga_provincial` AS `lfpb_asociacion_liga_provincial`,`jugador`.`n_registro_fbf` AS `n_registro_fbf`,`jugador`.`estado_civil` AS `estado_civil`,`jugador`.`nombre_padre` AS `nombre_padre`,`jugador`.`nombre_madre` AS `nombre_madre`,`jugador`.`c_i` AS `c_i`,`persona`.`dirección` AS `dirección`,`inscripcionjugador`.`posicion` AS `posicion`,`jugador`.`estatura` AS `estatura`,`inscripcionjugador`.`peso` AS `peso` from (((((`persona` join `jugador` on((`jugador`.`id_persona` = `persona`.`id_persona`))) join `inscripcionjugador` on((`inscripcionjugador`.`id_jugador` = `jugador`.`id_jugador`))) join `equipo` on((`equipo`.`id_equipo` = `inscripcionjugador`.`id_equipo`))) join `categoria` on((`categoria`.`id_categoria` = `equipo`.`id_categoria`))) join `club` on((`club`.`id_club` = `equipo`.`id_club`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_jugador_categoria`
--
DROP TABLE IF EXISTS `v_jugador_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jugador_categoria`  AS  select `jugador`.`id_jugador` AS `id_jugador`,concat(`persona`.`apellido_paterno`,' ',`persona`.`apellido_materno`,' ',`persona`.`nombres`) AS `jugador` from (`jugador` join `persona`) where (`jugador`.`id_persona` = `persona`.`id_persona`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_personas_menus_principales`
--
DROP TABLE IF EXISTS `v_personas_menus_principales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_personas_menus_principales`  AS  select `persona`.`nombres` AS `nombre_persona`,`persona`.`apellido_paterno` AS `apellido_paterno`,`persona`.`apellido_materno` AS `apellido_materno`,`persona`.`fecha_nacimiento` AS `fecha_nacimiento`,`persona`.`foto` AS `foto`,`persona`.`sexo` AS `sexo`,`persona`.`telefono` AS `telefono`,`persona`.`celular` AS `celular`,`persona`.`usuario` AS `usuario`,`persona`.`password` AS `password`,`personas_roles`.`id` AS `id_persona_rol`,`personas_roles`.`id_persona` AS `id_persona`,`personas_roles`.`id_rol` AS `id_rol`,`roles`.`nombre` AS `nombre_rol`,`roles_menus_principales`.`id_menu_principal` AS `id_menu_principal`,`menus_principales`.`nombre` AS `nombre_menu_principal`,`menus_principales`.`icono` AS `icono`,`menus_principales`.`color` AS `color`,`menus_principales`.`orden` AS `orden`,`menus_principales`.`estado` AS `estado` from ((((`menus_principales` join `roles_menus_principales` on((`menus_principales`.`id` = `roles_menus_principales`.`id_menu_principal`))) join `roles` on((`roles_menus_principales`.`id_rol` = `roles`.`id`))) join `personas_roles` on((`personas_roles`.`id_rol` = `roles`.`id`))) join `persona` on((`personas_roles`.`id_persona` = `persona`.`id_persona`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_torneocategoria`
--
DROP TABLE IF EXISTS `v_torneocategoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_torneocategoria`  AS  select `t`.`id_torneo` AS `id_torneo`,`c`.`nombre` AS `nombre`,`t`.`fecha_inicio` AS `fecha_inicio`,`t`.`fecha_fin` AS `fecha_fin`,`t`.`estado` AS `estado` from (`torneo` `t` join `categoria` `c` on((`c`.`id_categoria` = `t`.`id_categoria`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arbitro`
--
ALTER TABLE `arbitro`
  ADD PRIMARY KEY (`id_arbitro`);

--
-- Indices de la tabla `arbitro_partido`
--
ALTER TABLE `arbitro_partido`
  ADD PRIMARY KEY (`id_arbitropartido`),
  ADD KEY `fk_arbitropartido_partidos` (`id_partidos`),
  ADD KEY `fk_arbitropartido_arbitro` (`id_arbitro`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `categoria_arbitro`
--
ALTER TABLE `categoria_arbitro`
  ADD PRIMARY KEY (`id_catarbitro`);

--
-- Indices de la tabla `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id_club`);

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id_concepto`);

--
-- Indices de la tabla `costos`
--
ALTER TABLE `costos`
  ADD PRIMARY KEY (`id_costos`);

--
-- Indices de la tabla `curriculo_jugador`
--
ALTER TABLE `curriculo_jugador`
  ADD PRIMARY KEY (`id_currijugador`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id_equipo`);

--
-- Indices de la tabla `estadio`
--
ALTER TABLE `estadio`
  ADD PRIMARY KEY (`id_estadio`);

--
-- Indices de la tabla `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id_games`),
  ADD KEY `fk_games_equipo_h` (`id_equipo_h`),
  ADD KEY `fk_games_equipo_a` (`id_equipo_a`),
  ADD KEY `fk_games_partido` (`id_partidos`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id_inscripcion`);

--
-- Indices de la tabla `inscripcionequipo`
--
ALTER TABLE `inscripcionequipo`
  ADD PRIMARY KEY (`id_inscripcionequipo`),
  ADD KEY `fk_inscripcionequipo_persona` (`id_personacargo`),
  ADD KEY `fk_inscripcionequipo_club` (`id_club`),
  ADD KEY `fk_inscripcionequipo_torneo` (`id_torneo`);

--
-- Indices de la tabla `inscripcionjugador`
--
ALTER TABLE `inscripcionjugador`
  ADD PRIMARY KEY (`id_inscripcionjugador`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`id_jornadas`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id_jugador`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus_principales`
--
ALTER TABLE `menus_principales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `motivo`
--
ALTER TABLE `motivo`
  ADD PRIMARY KEY (`id_motivo`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `fk_pago_precioconcepto` (`id_precioconcepto`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id_partidos`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `personas_roles`
--
ALTER TABLE `personas_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona_cargo`
--
ALTER TABLE `persona_cargo`
  ADD PRIMARY KEY (`id_personacargo`);

--
-- Indices de la tabla `planillero`
--
ALTER TABLE `planillero`
  ADD PRIMARY KEY (`id_planillero`);

--
-- Indices de la tabla `precio_concepto`
--
ALTER TABLE `precio_concepto`
  ADD PRIMARY KEY (`id_precioconcepto`),
  ADD KEY `fk_precioconcepto_categoria` (`id_categoria`),
  ADD KEY `fk_precioconcepto_motivo` (`id_motivo`),
  ADD KEY `fk_precioconcepto_concepto` (`id_concepto`);

--
-- Indices de la tabla `resultado_partido`
--
ALTER TABLE `resultado_partido`
  ADD PRIMARY KEY (`id_resultadopartido`),
  ADD KEY `fk_resultadopartido_jugador` (`id_jugador`),
  ADD KEY `fk_resultadopartido_partidos` (`id_partidos`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles_menus_principales`
--
ALTER TABLE `roles_menus_principales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suspencion`
--
ALTER TABLE `suspencion`
  ADD PRIMARY KEY (`id_suspencion`),
  ADD KEY `fk_suspencion_jugador` (`id_jugador`),
  ADD KEY `fk_suspencion_partidos` (`id_partidos`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`id_torneo`),
  ADD KEY `fk_torneo_categoria` (`id_categoria`);

--
-- Indices de la tabla `torneosorteado`
--
ALTER TABLE `torneosorteado`
  ADD PRIMARY KEY (`id_torneosorteado`),
  ADD KEY `fk_sorteoequipos_torneo` (`id_torneo`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id_transacciones`);

--
-- Indices de la tabla `transferencias`
--
ALTER TABLE `transferencias`
  ADD PRIMARY KEY (`id_transferencias`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arbitro_partido`
--
ALTER TABLE `arbitro_partido`
  MODIFY `id_arbitropartido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `categoria_arbitro`
--
ALTER TABLE `categoria_arbitro`
  MODIFY `id_catarbitro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `club`
--
ALTER TABLE `club`
  MODIFY `id_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id_concepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `costos`
--
ALTER TABLE `costos`
  MODIFY `id_costos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `curriculo_jugador`
--
ALTER TABLE `curriculo_jugador`
  MODIFY `id_currijugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `estadio`
--
ALTER TABLE `estadio`
  MODIFY `id_estadio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `id_games` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `inscripcionequipo`
--
ALTER TABLE `inscripcionequipo`
  MODIFY `id_inscripcionequipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `inscripcionjugador`
--
ALTER TABLE `inscripcionjugador`
  MODIFY `id_inscripcionjugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `id_jornadas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `menus_principales`
--
ALTER TABLE `menus_principales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `motivo`
--
ALTER TABLE `motivo`
  MODIFY `id_motivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id_partidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `personas_roles`
--
ALTER TABLE `personas_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `persona_cargo`
--
ALTER TABLE `persona_cargo`
  MODIFY `id_personacargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `planillero`
--
ALTER TABLE `planillero`
  MODIFY `id_planillero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `precio_concepto`
--
ALTER TABLE `precio_concepto`
  MODIFY `id_precioconcepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=427;

--
-- AUTO_INCREMENT de la tabla `resultado_partido`
--
ALTER TABLE `resultado_partido`
  MODIFY `id_resultadopartido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles_menus_principales`
--
ALTER TABLE `roles_menus_principales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `suspencion`
--
ALTER TABLE `suspencion`
  MODIFY `id_suspencion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `id_torneo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `torneosorteado`
--
ALTER TABLE `torneosorteado`
  MODIFY `id_torneosorteado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id_transacciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `transferencias`
--
ALTER TABLE `transferencias`
  MODIFY `id_transferencias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arbitro_partido`
--
ALTER TABLE `arbitro_partido`
  ADD CONSTRAINT `fk_arbitropartido_arbitro` FOREIGN KEY (`id_arbitro`) REFERENCES `arbitro` (`id_arbitro`),
  ADD CONSTRAINT `fk_arbitropartido_partidos` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`);

--
-- Filtros para la tabla `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `fk_games_equipo_a` FOREIGN KEY (`id_equipo_a`) REFERENCES `equipo` (`id_equipo`),
  ADD CONSTRAINT `fk_games_equipo_h` FOREIGN KEY (`id_equipo_h`) REFERENCES `equipo` (`id_equipo`),
  ADD CONSTRAINT `fk_games_partido` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`);

--
-- Filtros para la tabla `inscripcionequipo`
--
ALTER TABLE `inscripcionequipo`
  ADD CONSTRAINT `fk_inscripcionequipo_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `fk_inscripcionequipo_persona` FOREIGN KEY (`id_personacargo`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `fk_inscripcionequipo_torneo` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_precioconcepto` FOREIGN KEY (`id_precioconcepto`) REFERENCES `precio_concepto` (`id_precioconcepto`);

--
-- Filtros para la tabla `precio_concepto`
--
ALTER TABLE `precio_concepto`
  ADD CONSTRAINT `fk_precioconcepto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_precioconcepto_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`),
  ADD CONSTRAINT `fk_precioconcepto_motivo` FOREIGN KEY (`id_motivo`) REFERENCES `motivo` (`id_motivo`);

--
-- Filtros para la tabla `resultado_partido`
--
ALTER TABLE `resultado_partido`
  ADD CONSTRAINT `fk_resultadopartido_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`),
  ADD CONSTRAINT `fk_resultadopartido_partidos` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`);

--
-- Filtros para la tabla `suspencion`
--
ALTER TABLE `suspencion`
  ADD CONSTRAINT `fk_suspencion_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`),
  ADD CONSTRAINT `fk_suspencion_partidos` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`);

--
-- Filtros para la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD CONSTRAINT `fk_torneo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `torneosorteado`
--
ALTER TABLE `torneosorteado`
  ADD CONSTRAINT `fk_sorteoequipos_torneo` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
