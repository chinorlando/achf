-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-07-2020 a las 02:08:29
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
-- Base de datos: `db_achfend`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `arbitro`
--

INSERT INTO `arbitro` (`id_arbitro`, `id_persona`, `id_catarbitro`, `id_partidos`) VALUES
(1, 6, 1, 1),
(2, 7, 1, 1),
(3, 8, 1, 1),
(4, 9, 2, 1),
(5, 12, 2, 1),
(6, 13, 2, 1),
(7, 14, 2, 1),
(8, 15, 2, 1),
(9, 16, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitro_partido`
--

CREATE TABLE `arbitro_partido` (
  `id_arbitropartido` int(11) NOT NULL,
  `id_partidos` int(11) NOT NULL,
  `id_arbitro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `arbitro_partido`
--

INSERT INTO `arbitro_partido` (`id_arbitropartido`, `id_partidos`, `id_arbitro`) VALUES
(5, 1, 1),
(6, 1, 4),
(7, 1, 5),
(8, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nombre`, `estado`) VALUES
(1, 'ADMINISTRADOR', '1'),
(2, 'SECRETARIA', '1'),
(3, 'COMITE TECNICO LIBRE', '1'),
(4, 'COMITE TECNICO MENORES', '1'),
(5, 'DELEGADOS', '1'),
(6, 'ARBITROS', '1'),
(7, 'PLANILLEROS', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
-- Estructura de tabla para la tabla `categoriasorteado`
--

CREATE TABLE `categoriasorteado` (
  `id_categoriasorteado` int(11) NOT NULL,
  `fecha_sorteo` date NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL,
  `sorteado` tinyint(4) DEFAULT NULL COMMENT '1=equipos sorteados. 0=equipos no sorteados'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `categoriasorteado`
--

INSERT INTO `categoriasorteado` (`id_categoriasorteado`, `fecha_sorteo`, `id_categoria`, `id_torneo`, `sorteado`) VALUES
(1, '2020-06-30', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_arbitro`
--

CREATE TABLE `categoria_arbitro` (
  `id_catarbitro` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `categoria_arbitro`
--

INSERT INTO `categoria_arbitro` (`id_catarbitro`, `nombre`, `estado`) VALUES
(1, 'ARBITRO FIFA', 1),
(2, 'ASISTENTE ARBITRO FIFA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club`
--

CREATE TABLE `club` (
  `id_club` int(11) NOT NULL,
  `id_personacargo` int(11) NOT NULL,
  `nombre_club` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `direccion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `escudo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_fundacion` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `club`
--

INSERT INTO `club` (`id_club`, `id_personacargo`, `nombre_club`, `direccion`, `ciudad`, `escudo`, `fecha_fundacion`, `estado`) VALUES
(1, 7, 'BOLIVAR', 'OSTRIA GUTIERREZ # 585', 'LA PAZ', '28892-club-bolivar.jpg', '1925-04-12', 1),
(2, 8, 'THE STRONGEST', 'PANDO # 321', 'LA PAZ', '8fab7-the-strongest.jpg', '1908-04-08', 1),
(3, 9, 'SAN JOSE', 'AV. LIBERTADORES # 12', 'ORURO', '18984-san-jose.jpg', '1942-03-19', 1),
(4, 10, 'BLOOMING', 'MARCELO QUIROGA # 225', 'SANTA CRUZ', '1de21-blooming.jpg', '1956-05-01', 1),
(5, 11, 'WILSTERMAN', 'SONA LAJASTAMBO # 1115', 'COCHABAMBA', 'b1475-escudowilstermann1.jpg', '1949-11-24', 1),
(6, 12, 'ORIENTE PETROLERO', 'CANADA # 2225', 'SANTA CRUZ', '17a82-oriente.jpg', '1995-11-05', 1),
(7, 13, 'ROYAL PARY', 'JUNIN # 1325', 'SANTA CRUZ', '', '1993-11-13', 1),
(8, 14, 'INDEPENDIENTE', 'GERMAN BUCHS # 925', 'SUCRE', '', '1932-04-04', 1),
(9, 15, 'UNIVERSITARIO', 'UMI RUMI # 525', 'SUCRE', '', '1961-04-05', 1),
(10, 16, 'REAL POTOSI', 'CANELAS # 55', 'POTOSI', '', '1941-10-05', 1),
(11, 17, 'NACIONAL POTOSI', 'GARCILAZO # 7125', 'POTOSI', '', '1942-04-08', 1),
(12, 18, 'GUABIRA', 'RAUL OTERO # 785', 'MONTERO SC.', '', '1962-04-14', 1),
(13, 19, 'ALEMAN', 'ABAROA # 325', 'SUCRE', '', '1994-02-02', 1),
(14, 20, 'STORMERS', 'ABAROA # 325', 'SUCRE', '', '1914-01-25', 1),
(15, 21, 'AURORA', 'ABAROA # 325', 'COCHABAMBA', '', '1935-05-27', 1),
(16, 22, 'JUNIN', 'ABAROA # 325', 'SUCRE', '', '1918-06-18', 1),
(17, 23, 'SAJLINA', 'ABAROA # 325', 'SUCRE', '', '2015-08-02', 1),
(18, 24, 'LITORAL', 'ABAROA # 325', 'LA PAZ', '', '1932-03-23', 1),
(19, 25, 'CICLON', 'ABAROA # 325', 'TARIJA', '', '1951-09-21', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `id_concepto` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curriculo_jugador`
--

CREATE TABLE `curriculo_jugador` (
  `id_currijugador` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `informacion` varchar(250) COLLATE latin1_spanish_ci DEFAULT NULL,
  `trayectoria` varchar(250) COLLATE latin1_spanish_ci DEFAULT NULL,
  `logros` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `palmares` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `foto` varchar(250) COLLATE latin1_spanish_ci DEFAULT 'user.jpg',
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `curriculo_jugador`
--

INSERT INTO `curriculo_jugador` (`id_currijugador`, `id_jugador`, `informacion`, `trayectoria`, `logros`, `palmares`, `foto`, `estado`) VALUES
(1, 376, 'Divicion Profecional', 'BOLIVAR 24-01-2020 al 23-01-2021', '', '', 'user.jpg', 1),
(2, 376, 'Nacional Bolivia', 'JUGO, San Jose 24-01-2019 al 23-01-2020', 'MEDALLA DE BRONCE', 'Seleccion Sub 19 de Chuquisaca', 'user.jpg', 1),
(3, 376, 'Nacional Bolivia', 'JUGO, San Jose 24-01-2018 al 23-01-2019', 'MEDALLA DE ORO', 'Seleccion Sub 17 de Chuquisaca', 'user.jpg', 1),
(4, 377, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(5, 377, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(6, 377, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(7, 378, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(8, 378, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(9, 378, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(10, 379, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(11, 379, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(12, 379, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(13, 380, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(14, 380, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(15, 380, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(16, 381, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(17, 381, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(18, 381, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(19, 382, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(20, 382, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(21, 382, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(22, 383, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(23, 383, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(24, 383, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(25, 384, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(26, 384, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(27, 384, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(28, 385, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(29, 385, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(30, 385, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(31, 386, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(32, 386, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(33, 386, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(34, 387, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(35, 387, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(36, 387, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(37, 388, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(38, 388, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(39, 388, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(40, 389, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(41, 389, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(42, 389, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(43, 390, 'Divicion Profecional', 'Bolivar 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(44, 390, 'NACIONAL B', 'Bolivar 24-01-2020 al 23-01-21', 'MEDALLA DE BRONCE', 'LIBERTADORES', 'user.jpg', 1),
(45, 390, 'Divicion Profecional', 'Bolivar 24-01-2016 al 23-01-18', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(46, 391, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(47, 391, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(48, 392, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(49, 392, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(50, 393, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(51, 393, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(52, 394, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(53, 394, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(54, 395, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(55, 395, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(56, 396, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(57, 396, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(58, 397, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(59, 397, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(60, 398, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(61, 398, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(62, 399, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(63, 399, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(64, 400, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(65, 400, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(66, 401, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(67, 401, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(68, 402, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(69, 402, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(70, 403, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(71, 403, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(72, 404, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(73, 404, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(74, 405, 'Divicion Profecional', 'THE STRONGEST 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(75, 405, 'NACIONAL B', 'THE STRONGEST 24-01-2020 al 23-01-21', 'MEDALLA DE PLATA', 'LIBERTADORES', 'user.jpg', 1),
(76, 406, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(77, 406, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(78, 407, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(79, 407, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(80, 408, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(81, 408, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(82, 409, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(83, 409, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(84, 410, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(85, 410, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(86, 411, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(87, 411, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(88, 412, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(89, 412, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(90, 413, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(91, 413, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(92, 414, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(93, 414, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(94, 415, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(95, 415, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(96, 416, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(97, 416, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(98, 417, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(99, 417, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(100, 418, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(101, 418, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(102, 419, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(103, 419, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(104, 420, 'Divicion Profecional', 'SAN JOSE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(105, 420, 'NACIONAL B', 'SAN JOSE 24-01-2020 al 23-01-21', 'MEJOR JUGADOR', 'LIBERTADORES', 'user.jpg', 1),
(106, 421, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(107, 421, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(108, 422, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(109, 422, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(110, 423, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(111, 423, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(112, 424, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(113, 424, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(114, 425, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(115, 425, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(116, 426, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(117, 426, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(118, 427, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(119, 427, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(120, 428, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(121, 428, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(122, 429, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(123, 429, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(124, 430, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(125, 430, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(126, 431, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(127, 431, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(128, 432, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(129, 432, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(130, 433, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(131, 433, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(132, 434, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(133, 434, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(134, 435, 'Divicion Profecional', 'BLOOMING 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(135, 435, 'NACIONAL B', 'BLOOMING 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(136, 436, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(137, 436, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(138, 437, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(139, 437, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(140, 438, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(141, 438, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(142, 439, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(143, 439, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(144, 440, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(145, 440, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(146, 441, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(147, 441, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(148, 442, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(149, 442, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(150, 443, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(151, 443, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(152, 444, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(153, 444, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(154, 445, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(155, 445, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(156, 446, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(157, 446, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(158, 447, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(159, 447, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(160, 448, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(161, 448, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(162, 449, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(163, 449, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(164, 450, 'Divicion Profecional', 'WILSTERMAN 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(165, 450, 'NACIONAL B', 'WILSTERMAN 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(166, 451, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(167, 451, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(168, 452, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(169, 452, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(170, 453, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(171, 453, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(172, 454, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(173, 454, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(174, 455, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(175, 455, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(176, 456, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(177, 456, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(178, 457, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(179, 457, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(180, 458, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(181, 458, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(182, 459, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(183, 459, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(184, 460, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(185, 460, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(186, 461, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(187, 461, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(188, 462, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(189, 462, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(190, 463, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(191, 463, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(192, 464, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(193, 464, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(194, 465, 'Divicion Profecional', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(195, 465, 'NACIONAL B', 'ORIENTE PETROLERO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(196, 466, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(197, 466, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(198, 467, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(199, 467, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(200, 468, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(201, 468, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(202, 469, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(203, 469, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(204, 470, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(205, 470, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(206, 471, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(207, 471, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(208, 472, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(209, 472, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(210, 473, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(211, 473, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(212, 474, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(213, 474, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(214, 475, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(215, 475, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(216, 476, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(217, 476, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(218, 477, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(219, 477, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(220, 478, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(221, 478, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(222, 479, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(223, 479, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(224, 480, 'Divicion Profecional', 'ROYAL PARY 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(225, 480, 'NACIONAL B', 'ROYAL PARY 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(226, 481, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(227, 481, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(228, 482, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(229, 482, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(230, 483, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(231, 483, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(232, 484, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(233, 484, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(234, 485, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(235, 485, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(236, 486, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(237, 486, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(238, 487, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(239, 487, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(240, 488, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(241, 488, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(242, 489, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(243, 489, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(244, 490, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(245, 490, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(246, 491, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(247, 491, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(248, 492, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(249, 492, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(250, 493, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(251, 493, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(252, 494, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(253, 494, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(254, 495, 'Divicion Profecional', 'INDEPENDIENTE 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(255, 495, 'NACIONAL B', 'INDEPENDIENTE 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(256, 496, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(257, 496, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(258, 497, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(259, 497, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(260, 498, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(261, 498, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(262, 499, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(263, 499, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(264, 500, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(265, 500, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(266, 501, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(267, 501, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(268, 502, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(269, 502, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(270, 503, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(271, 503, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(272, 504, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(273, 504, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(274, 505, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(275, 505, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(276, 506, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(277, 506, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(278, 507, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(279, 507, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(280, 508, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(281, 508, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(282, 509, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(283, 509, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(284, 510, 'Divicion Profecional', 'UNIVERCITARO 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(285, 510, 'NACIONAL B', 'UNIVERCITARO 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(286, 511, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(287, 511, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(288, 512, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(289, 512, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(290, 513, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(291, 513, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(292, 514, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(293, 514, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(294, 515, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(295, 515, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(296, 516, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(297, 516, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(298, 517, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(299, 517, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(300, 518, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(301, 518, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(302, 519, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(303, 519, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(304, 520, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(305, 520, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(306, 521, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(307, 521, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(308, 522, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(309, 522, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(310, 523, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(311, 523, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(312, 524, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(313, 524, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1),
(314, 525, 'Divicion Profecional', 'REAL POTOSI 24-01-2020 al 23-01-21', '', '', 'user.jpg', 1),
(315, 525, 'NACIONAL B', 'REAL POTOSI 24-01-2020 al 23-01-21', 'MEDALLA DE ORO', 'LIBERTADORES', 'user.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadio`
--

CREATE TABLE `estadio` (
  `id_estadio` int(11) NOT NULL,
  `nombreestadio` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `capacidad` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ciudad` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `foto` varchar(250) COLLATE latin1_spanish_ci DEFAULT 'estadio.jpg',
  `fecha_inaguracion` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `estadio`
--

INSERT INTO `estadio` (`id_estadio`, `nombreestadio`, `capacidad`, `ciudad`, `direccion`, `foto`, `fecha_inaguracion`, `estado`) VALUES
(1, 'ESTADIO PATRIA', '32700', NULL, 'AV. JAIME MENDOZA # 3352', 'b7d97-patria-sucre.jpg', NULL, 1),
(2, 'ESTADIO SUCRE', '25000', NULL, 'AV. DEL MAESTRO # 152', '1f8f8-estadio-sucre.jpg', NULL, 1),
(3, 'ESTADIO LOURDES DE YOTALA', '6500', NULL, 'REYES # 2352', '55a57-yotala.jpg', NULL, 1),
(4, 'HERNANDO SILES', '45000', 'La Paz', 'AV. LOS ANDES # 1352', 'e7975-siles.jpg', NULL, 1),
(5, 'VILLA INGENIO', '25000', 'LA PAZ', 'AV. ALTO DE ALIENZA # 352', '', '2000-01-01', 1),
(6, 'JESUS BERMUDES', '30000', NULL, 'JAIME MENDOZA # 3544', 'b2a34-photo2.png', '2000-01-01', 1),
(7, 'RAMON AGUILERA COSTAS', '40500', 'SANTA CRUZ', 'Yotala # 588', '', '2000-01-01', 1),
(8, 'FELIX CAPRILES', '32303', 'COCHABAMBA', 'INCA GARCILAZO # 698', '', '2000-01-01', 1),
(9, 'VICTOR AGUSTIN UGARTE', '35000', 'POTOSI', 'AV. MARCELO QUIROGA # 2854', '', '2000-01-01', 1),
(10, 'OVIDIO MESA SORUCO', '25000', 'TARIJA', 'AV. DEL EJERCITO # 56', '', '2000-01-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `id_games` int(11) NOT NULL,
  `hscore` tinyint(4) DEFAULT NULL,
  `ascore` tinyint(4) DEFAULT NULL,
  `id_equipo_h` int(11) DEFAULT NULL,
  `id_equipo_a` int(11) DEFAULT NULL,
  `id_partidos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `games`
--

INSERT INTO `games` (`id_games`, `hscore`, `ascore`, `id_equipo_h`, `id_equipo_a`, `id_partidos`) VALUES
(1, 1, 3, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilitado`
--

CREATE TABLE `habilitado` (
  `id_habilitado` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_partidos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `habilitado`
--

INSERT INTO `habilitado` (`id_habilitado`, `id_jugador`, `id_partidos`) VALUES
(6, 394, 1),
(8, 380, 1),
(9, 390, 1),
(10, 389, 1),
(11, 391, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcionequipo`
--

CREATE TABLE `inscripcionequipo` (
  `id_inscripcionequipo` int(11) NOT NULL,
  `id_personacargo` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `genero` varchar(9) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `num_bolo` int(11) DEFAULT NULL,
  `id_torneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `inscripcionequipo`
--

INSERT INTO `inscripcionequipo` (`id_inscripcionequipo`, `id_personacargo`, `id_club`, `genero`, `id_categoria`, `fecha`, `num_bolo`, `id_torneo`) VALUES
(1, 7, 1, 'M', 1, '2020-06-12', 1, 1),
(2, 8, 2, 'M', 1, '2020-06-12', 2, 1),
(3, 9, 3, 'M', 1, '2020-06-12', 3, 1),
(4, 10, 4, 'M', 1, '2020-06-12', 4, 1),
(5, 11, 5, 'M', 1, '2020-06-12', 5, 1),
(6, 13, 6, 'M', 1, '2020-06-12', 6, 1),
(7, 14, 7, 'M', 1, '2020-06-12', 7, 1),
(8, 15, 8, 'M', 1, '2020-06-12', 8, 1),
(9, 16, 9, 'M', 1, '2020-06-12', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcionjugador`
--

CREATE TABLE `inscripcionjugador` (
  `id_inscripcionjugador` int(11) NOT NULL,
  `dorsal` int(11) NOT NULL,
  `posicion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `peso` float NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_inscripcionequipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `inscripcionjugador`
--

INSERT INTO `inscripcionjugador` (`id_inscripcionjugador`, `dorsal`, `posicion`, `peso`, `id_jugador`, `id_inscripcionequipo`) VALUES
(1, 1, 'ARQUERO', 54, 376, 1),
(2, 2, 'DEFENZA', 60, 377, 1),
(3, 3, 'TAPON', 65, 378, 1),
(4, 4, 'DEFENZA ISQUIERDO', 60, 379, 1),
(5, 5, 'DEFENZA DERECHO', 70, 380, 1),
(6, 6, 'MEDIO CAMPO', 54, 381, 1),
(7, 7, 'VOLANTE ISQUIERDO', 65, 382, 1),
(8, 8, 'VOLANTE DERECHO', 65, 383, 1),
(9, 9, 'DELANTERO', 87, 384, 1),
(10, 10, 'DELANTERO', 76, 385, 1),
(11, 11, 'VOLANTE ISQUIERDO', 60, 386, 1),
(12, 12, 'VOLANTE DERECHO', 65, 387, 1),
(13, 13, 'DELANTERO', 87, 388, 1),
(14, 14, 'DELANTERO', 76, 389, 1),
(15, 15, 'DELANTERO', 87, 390, 1),
(16, 1, 'ARQUERO', 70, 391, 2),
(17, 2, 'DEFENZA', 70, 392, 2),
(18, 3, 'TAPON', 70, 393, 2),
(19, 4, 'DEFENZA ISQUIERDO', 70, 394, 2),
(20, 5, 'DEFENZA DERECHO', 70, 395, 2),
(21, 6, 'MEDIO CAMPO', 70, 396, 2),
(22, 7, 'VOLANTE ISQUIERDO', 70, 397, 2),
(23, 8, 'VOLANTE DERECHO', 70, 398, 2),
(24, 9, 'DELANTERO', 70, 399, 2),
(25, 10, 'DELANTERO', 70, 400, 2),
(26, 11, 'VOLANTE ISQUIERDO', 70, 401, 2),
(27, 12, 'VOLANTE DERECHO', 70, 402, 2),
(28, 13, 'DELANTERO', 70, 403, 2),
(29, 14, 'DELANTERO', 70, 404, 2),
(30, 15, 'DELANTERO', 70, 405, 2),
(31, 10, 'ARQUERO', 70, 406, 3),
(32, 10, 'DEFENZA', 70, 407, 3),
(33, 10, 'TAPON', 70, 408, 3),
(34, 10, 'DEFENZA ISQUIERDO', 70, 409, 3),
(35, 10, 'DEFENZA DERECHO', 70, 410, 3),
(36, 10, 'MEDIO CAMPO', 70, 411, 3),
(37, 10, 'VOLANTE ISQUIERDO', 70, 412, 3),
(38, 10, 'VOLANTE DERECHO', 70, 413, 3),
(39, 10, 'DELANTERO', 70, 414, 3),
(40, 10, 'DELANTERO', 70, 415, 3),
(41, 10, 'VOLANTE ISQUIERDO', 70, 416, 3),
(42, 10, 'VOLANTE DERECHO', 70, 417, 3),
(43, 10, 'DELANTERO', 70, 418, 3),
(44, 10, 'DELANTERO', 70, 419, 3),
(45, 10, 'DELANTERO', 70, 420, 3),
(46, 10, 'ARQUERO', 70, 421, 4),
(47, 10, 'DEFENZA', 70, 422, 4),
(48, 10, 'TAPON', 70, 423, 4),
(49, 10, 'DEFENZA ISQUIERDO', 70, 424, 4),
(50, 10, 'DEFENZA DERECHO', 70, 425, 4),
(51, 10, 'MEDIO CAMPO', 70, 426, 4),
(52, 10, 'VOLANTE ISQUIERDO', 70, 427, 4),
(53, 10, 'VOLANTE DERECHO', 70, 428, 4),
(54, 10, 'DELANTERO', 70, 429, 4),
(55, 10, 'DELANTERO', 70, 430, 4),
(56, 10, 'VOLANTE ISQUIERDO', 70, 431, 4),
(57, 10, 'VOLANTE DERECHO', 70, 432, 4),
(58, 10, 'DELANTERO', 70, 433, 4),
(59, 10, 'DELANTERO', 70, 434, 3),
(60, 10, 'DELANTERO', 70, 435, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `n_registro_fbf` int(11) DEFAULT NULL,
  `lfpb_asociacion_liga_provincial` varchar(250) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombre_padre` varchar(70) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nombre_madre` varchar(70) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado_civil` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `c_i` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estatura` decimal(10,0) DEFAULT NULL,
  `cont_amarilla` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id_jugador`, `id_persona`, `n_registro_fbf`, `lfpb_asociacion_liga_provincial`, `nombre_padre`, `nombre_madre`, `estado_civil`, `c_i`, `estado`, `estatura`, `cont_amarilla`) VALUES
(1, 61, 3826532, 'ACHF', 'PETERITO', 'CHOQUE', 'SOLTERO', '10396816', '1', '175', 0),
(2, 62, 4878686, 'ACHF', 'ARANCIBIA', 'SERRUDO', 'SOLTERO', '10386132', '1', '175', 0),
(3, 63, 4900625, 'ACHF', 'PERKA', 'ESTRADA', 'SOLTERO', '12705736', '1', '175', 0),
(4, 64, 4924644, 'ACHF', 'GOMEZ', 'LLANQUE', 'SOLTERO', '10388065', '1', '175', 0),
(5, 65, 4949808, 'ACHF', 'ROCHA ', 'MONTAÑO', 'SOLTERO', '10545188', '1', '175', 0),
(6, 66, 4949844, 'ACHF', 'SANCHEZ', 'CHILE', 'SOLTERO', '10383010', '1', '175', 0),
(7, 67, 4960661, 'ACHF', 'NINACHI', 'GUERRERA', 'SOLTERO', '7511036', '1', '175', 0),
(8, 68, 4960914, 'ACHF', 'HIGUERAS', 'MAYAN', 'SOLTERO', '5692939', '1', '175', 0),
(9, 69, 4960952, 'ACHF', 'SANDI', 'ORTIZ', 'SOLTERO', '10396000', '1', '175', 0),
(10, 70, 4961923, 'ACHF', 'MOSCOSO', 'VILLAGRA', 'SOLTERO', '13219690', '1', '175', 0),
(11, 71, 4963280, 'ACHF', 'BEIZAGA', 'NOYA', 'SOLTERO', '10408933', '1', '175', 0),
(12, 72, 4971432, 'ACHF', 'MONASTERIOS', 'ROJAS', 'SOLTERO', '12930386', '1', '175', 0),
(13, 73, 4971548, 'ACHF', 'CORIA', 'MAMANI', 'SOLTERO', '10330089', '1', '175', 0),
(14, 74, 4972169, 'ACHF', 'QUISPE', 'MONASTERIOS', 'SOLTERO', '12730773', '1', '175', 0),
(15, 75, 4972183, 'ACHF', 'CHAVARRIA', 'SANTUNI', 'SOLTERO', '13882139', '1', '175', 0),
(16, 76, 4972219, 'ACHF', 'MAMANI', 'PEREZ', 'SOLTERO', '13884046', '1', '175', 0),
(17, 77, 4972250, 'ACHF', 'TELLEZ', 'DURAN', 'SOLTERO', '10396822', '1', '175', 0),
(18, 78, 4972276, 'ACHF', 'CUELLAR', 'BARRIGA', 'SOLTERO', '12548091', '1', '175', 0),
(19, 79, 4972300, 'ACHF', 'VARGAS  ', 'LOAYZA', 'SOLTERO', '12517901', '1', '175', 0),
(20, 80, 4972322, 'ACHF', 'ALARCON', 'VARGAS', 'SOLTERO', '10387248', '1', '175', 0),
(21, 81, 4972323, 'ACHF', 'AGUILAR', 'MAMANI', 'SOLTERO', '10381161', '1', '175', 0),
(22, 82, 4972375, 'ACHF', 'CHOQUERIME', 'LLANQUE', 'SOLTERO', '13723713', '1', '175', 0),
(23, 83, 4972492, 'ACHF', 'MUÑOZ', 'CARDOZO', 'SOLTERO', '10412614', '1', '175', 0),
(24, 84, 4972760, 'ACHF', 'CORDERO', 'GONZALEZ', 'SOLTERO', '12898627', '1', '175', 0),
(25, 85, 4972780, 'ACHF', 'TARDIO', 'RIVERO', 'SOLTERO', '5698981', '1', '175', 0),
(26, 86, 4972792, 'ACHF', 'SELAEZ', 'CABRERA', 'SOLTERO', '13218641', '1', '175', 0),
(27, 87, 4972801, 'ACHF', 'CHUMACERO', 'CUETO', 'SOLTERO', '10380702', '1', '175', 0),
(28, 88, 4993645, 'ACHF', 'OÑA', 'QUIROGA', 'SOLTERO', '13904690', '1', '175', 0),
(29, 89, 5005724, 'ACHF', 'MARTINEZ ', 'IBAÑEZ', 'SOLTERO', '10412998', '1', '175', 0),
(30, 90, 5005819, 'ACHF', 'BERNAL', 'ECHALAR', 'SOLTERO', '12930690', '1', '175', 0),
(31, 91, 5005866, 'ACHF', 'CHURQUI', 'PEÑAS', 'SOLTERO', '10394951', '1', '175', 0),
(32, 92, 5008475, 'ACHF', 'CABALLERO', 'VALDA', 'SOLTERO', '10400292', '1', '175', 0),
(33, 93, 5008479, 'ACHF', 'VARGAS', 'LLAVE', 'SOLTERO', '10348520', '1', '175', 0),
(34, 94, 5008481, 'ACHF', 'BUEZO', 'VALDA', 'SOLTERO', '10388907', '1', '175', 0),
(35, 95, 5013517, 'ACHF', 'CUENCA', 'AVILA', 'SOLTERO', '13092379', '1', '175', 0),
(36, 96, 5014399, 'ACHF', 'VERA', 'ACEBO', 'SOLTERO', '12995890', '1', '175', 0),
(37, 97, 5014776, 'ACHF', 'FERRUFINO', 'PADILLA', 'SOLTERO', '10389021', '1', '175', 0),
(38, 98, 5018111, 'ACHF', 'TUMIRI', 'TARQUE', 'SOLTERO', '7567897', '1', '175', 0),
(39, 99, 5029057, 'ACHF', 'SORIA', 'LIMACHI', 'SOLTERO', '12898646', '1', '175', 0),
(40, 100, 5029120, 'ACHF', 'SUAREZ', 'SOLIZ', 'SOLTERO', '10307059', '1', '175', 0),
(41, 101, 5029450, 'ACHF', 'ARANDO', 'SAAVEDRA', 'SOLTERO', '10394075', '1', '175', 0),
(42, 102, 5032130, 'ACHF', 'HONORIO', 'ACEBO', 'SOLTERO', '12994926', '1', '175', 0),
(43, 103, 5034406, 'ACHF', 'MAMANI', 'RODRIGUEZ', 'SOLTERO', '12425785', '1', '175', 0),
(44, 104, 5034439, 'ACHF', 'BEJARANO', 'MONRROY', 'SOLTERO', '10515976', '1', '175', 0),
(45, 105, 5034444, 'ACHF', 'SAAVEDRA', 'HERVAS', 'SOLTERO', '10342388', '1', '175', 0),
(46, 106, 5034458, 'ACHF', 'MARTINEZ', 'PORTILLO', 'SOLTERO', '10380285', '1', '175', 0),
(47, 107, 5034668, 'ACHF', 'KALLATA', 'ROMERO', 'SOLTERO', '10322052', '1', '175', 0),
(48, 108, 5035395, 'ACHF', 'CRUZ', 'MARTINEZ', 'SOLTERO', '10393566', '1', '175', 0),
(49, 109, 5035474, 'ACHF', 'MARTINEZ', 'TORREZ', 'SOLTERO', '14321020', '1', '175', 0),
(50, 110, 5035517, 'ACHF', 'TORRES', 'GONZALES', 'SOLTERO', '10392885', '1', '175', 0),
(51, 111, 5035888, 'ACHF', 'ORELLANA', 'CALZADILLA', 'SOLTERO', '8909278', '1', '175', 0),
(52, 112, 5035889, 'ACHF', 'VILLCA', 'TORRIJON', 'SOLTERO', '7565263', '1', '175', 0),
(53, 113, 5036973, 'ACHF', 'HERNANI', 'BUSTILLO', 'SOLTERO', '7484792', '1', '175', 0),
(54, 114, 5037006, 'ACHF', 'RENDON', 'RIVERA', 'SOLTERO', '7545819', '1', '175', 0),
(55, 115, 5037021, 'ACHF', 'YUCRA', 'MATURANO', 'SOLTERO', '14260293', '1', '175', 0),
(56, 116, 5037044, 'ACHF', 'LIMACHI', 'ROJAS', 'SOLTERO', '10390887', '1', '175', 0),
(57, 117, 5037058, 'ACHF', 'QUEVEDO', 'DAZA', 'SOLTERO', '10954752', '1', '175', 0),
(58, 118, 5037071, 'ACHF', 'DAZA', 'PARDO', 'SOLTERO', '10409076', '1', '175', 0),
(59, 119, 5037088, 'ACHF', 'QUEVEDO', 'DAZA', 'SOLTERO', '12863515', '1', '175', 0),
(60, 120, 5037103, 'ACHF', 'SERRUDO', 'ORTIZ', 'SOLTERO', '12707848', '1', '175', 0),
(61, 121, 5037116, 'ACHF', 'PAZ', 'RODRIGUEZ', 'SOLTERO', '10384243', '1', '175', 0),
(62, 122, 5037128, 'ACHF', 'FLORES', 'MATIENZO', 'SOLTERO', '10337801', '1', '175', 0),
(63, 123, 5037293, 'ACHF', 'QUINTANA', 'CHOQUE', 'SOLTERO', '12707099', '1', '175', 0),
(64, 124, 5037464, 'ACHF', 'GONZALES', 'TITO', 'SOLTERO', '10307436', '1', '175', 0),
(65, 125, 5042481, 'ACHF', 'CONDORI', 'LEON', 'SOLTERO', '13122988', '1', '175', 0),
(66, 126, 5042505, 'ACHF', 'MARTINEZ', 'SALAMANCA', 'SOLTERO', '12738221', '1', '175', 0),
(67, 127, 5042520, 'ACHF', 'PINTO', 'ROMERO', 'SOLTERO', '7485963', '1', '175', 0),
(68, 128, 5095985, 'ACHF', 'QUISPE', 'ZARATE', 'SOLTERO', '10381312', '1', '175', 0),
(69, 129, 5095985, 'ACHF', 'QUISPE', 'ZARATE', 'SOLTERO', '10381312', '1', '175', 0),
(70, 130, 5101439, 'ACHF', 'RAMOS', 'DAZA', 'SOLTERO', '7485223', '1', '175', 0),
(71, 131, 5101459, 'ACHF', 'ZARATE', 'CONTRERAS', 'SOLTERO', '14492514', '1', '175', 0),
(72, 132, 5102124, 'ACHF', 'SENO', 'FLORES', 'SOLTERO', '12737576', '1', '175', 0),
(73, 133, 5110191, 'ACHF', 'TAPIA', 'CASTILLO', 'SOLTERO', '13723632', '1', '175', 0),
(74, 134, 5119163, 'ACHF', 'CANASI', 'MAMANI', 'SOLTERO', '14364147', '1', '175', 0),
(75, 135, 5127993, 'ACHF', 'GARCIA', 'ESPINDOLA', 'SOLTERO', '8227949', '1', '175', 0),
(76, 136, 5128017, 'ACHF', 'LAIME', 'AYAVIRI', 'SOLTERO', '12706618', '1', '175', 0),
(77, 137, 5128140, 'ACHF', 'MENDOZA', 'CORTEZ', 'SOLTERO', '13836414', '1', '175', 0),
(78, 138, 5128326, 'ACHF', 'TRUJILLO', 'CAMPOS', 'SOLTERO', '7554659', '1', '175', 0),
(79, 139, 5128347, 'ACHF', 'ALIAGA', 'CALLE', 'SOLTERO', '10392801', '1', '175', 0),
(80, 140, 5133912, 'ACHF', 'YUCRA', 'SERRUDO', 'SOLTERO', '12366138', '1', '175', 0),
(81, 141, 5137724, 'ACHF', 'ARDILES', 'JALDIN', 'SOLTERO', '12740467', '1', '175', 0),
(82, 142, 5137766, 'ACHF', 'ARDILES', 'JALDIN', 'SOLTERO', '12803243', '1', '175', 0),
(83, 143, 5137855, 'ACHF', 'SANCHEZ', 'RAMOS', 'SOLTERO', '7486924', '1', '175', 0),
(84, 144, 5138392, 'ACHF', 'RENGIFO', 'AMADOR', 'SOLTERO', '10707316', '1', '175', 0),
(85, 145, 5140437, 'ACHF', 'VILLCA', 'CORONADO', 'SOLTERO', '45807239', '1', '175', 0),
(86, 146, 5140457, 'ACHF', 'TORIHUANO', 'CLEMENTE', 'SOLTERO', '10307385', '1', '175', 0),
(87, 147, 5140473, 'ACHF', 'ESCALIER', 'GONZALES', 'SOLTERO', '12611763', '1', '175', 0),
(88, 148, 5142277, 'ACHF', 'BELTRAN', 'CHOQUE', 'SOLTERO', '12963268', '1', '175', 0),
(89, 149, 5142416, 'ACHF', 'BALLESTEROS', 'QUICHU', 'SOLTERO', '12994295', '1', '175', 0),
(90, 150, 5142488, 'ACHF', 'OCHOA', 'AYARACHI', 'SOLTERO', '12834520', '1', '175', 0),
(91, 151, 3088305, 'ACHF', 'SILVA', 'GUTIERREZ', 'SOLTERO', '42931977', '1', '176', 0),
(92, 152, 3518093, 'ACHF', 'GOMEZ', 'LAZO', 'SOLTERO', '1010107545', '1', '176', 0),
(93, 153, 3573846, 'ACHF', 'CABRERA', 'MIRANDA', 'SOLTERO', '7577664', '1', '176', 0),
(94, 154, 3738724, 'ACHF', 'VILLEGAS', 'SERRUDO', 'SOLTERO', '74658700', '1', '176', 0),
(95, 155, 3785657, 'ACHF', 'BELALCASAR', 'GONZALES', 'SOLTERO', '1001868147', '1', '176', 0),
(96, 156, 3826436, 'ACHF', 'MORALES ', 'TABOADA', 'SOLTERO', '10396831', '1', '176', 0),
(97, 157, 3826533, 'ACHF', 'LEDEZMA', 'RODRIGUEZ', 'SOLTERO', '8159424', '1', '176', 0),
(98, 158, 3856241, 'ACHF', 'JEAN', 'ORELLANA', 'SOLTERO', 'E-11267324', '1', '176', 0),
(99, 159, 4543141, 'ACHF', 'GARCIA ', 'PEÑARANDA', 'SOLTERO', '13488650', '1', '176', 0),
(100, 160, 4793838, 'ACHF', 'OLIVA', 'CUMANDIRI', 'SOLTERO', '10394119', '1', '176', 0),
(101, 161, 4874996, 'ACHF', 'CAYO', 'DURAN', 'SOLTERO', '10527164', '1', '176', 0),
(102, 162, 4878788, 'ACHF', 'CHOQUE', 'MARTINEZ', 'SOLTERO', '10406199', '1', '176', 0),
(103, 163, 4878958, 'ACHF', 'LLAMPA ', 'DURAN', 'SOLTERO', '10361996', '1', '176', 0),
(104, 164, 4878979, 'ACHF', 'MARTINEZ ', 'MARTINEZ', 'SOLTERO', '7487335', '1', '176', 0),
(105, 165, 4881120, 'ACHF', 'SALVATIERRA', 'ORTIZ', 'SOLTERO', '8991100', '1', '176', 0),
(106, 166, 4881258, 'ACHF', 'CUETO', 'LOPEZ', 'SOLTERO', '7537970', '1', '176', 0),
(107, 167, 4881664, 'ACHF', 'CRUZ  ', 'TORRES', 'SOLTERO', '7548498', '1', '176', 0),
(108, 168, 4881761, 'ACHF', 'EYZAGUIRRE', 'BAREA', 'SOLTERO', '10388838', '1', '176', 0),
(109, 169, 4885650, 'ACHF', 'CUELLAR', 'SAIGUA', 'SOLTERO', '10554149', '1', '176', 0),
(110, 170, 4885883, 'ACHF', 'VELASQUEZ', 'MAMANI', 'SOLTERO', '10321316', '1', '176', 0),
(111, 171, 4886014, 'ACHF', 'SANABRIA', 'QUISPE', 'SOLTERO', '12546727', '1', '176', 0),
(112, 172, 4888438, 'ACHF', 'RIOS ', 'SAIGUA', 'SOLTERO', '12457818', '1', '176', 0),
(113, 173, 4891116, 'ACHF', 'GALLARDO', 'ALVARADO', 'SOLTERO', '10384277', '1', '176', 0),
(114, 174, 4891227, 'ACHF', 'SANCHEZ', 'CONDORI', 'SOLTERO', '10344343', '1', '176', 0),
(115, 175, 4896151, 'ACHF', 'FLORES ', 'URIONA', 'SOLTERO', '12676449', '1', '176', 0),
(116, 176, 4900338, 'ACHF', 'GONZALES ', 'RAMIREZ', 'SOLTERO', '13188407', '1', '176', 0),
(117, 177, 4900642, 'ACHF', 'AGUILAR', 'MARTINEZ', 'SOLTERO', '12610810', '1', '176', 0),
(118, 178, 4909670, 'ACHF', 'LAIME', 'TRUJILLO', 'SOLTERO', '10317076', '1', '176', 0),
(119, 179, 4910048, 'ACHF', 'FUENTES ', 'BONIFAZ', 'SOLTERO', '10542419', '1', '176', 0),
(120, 180, 4911793, 'ACHF', 'AYAVIRI', 'TORRES', 'SOLTERO', '10402020', '1', '176', 0),
(121, 181, 4911953, 'ACHF', 'FERRUFINO', 'LEON', 'SOLTERO', '10389022', '1', '176', 0),
(122, 182, 4911968, 'ACHF', 'MORALES ', 'FLORES', 'SOLTERO', '10583872', '1', '176', 0),
(123, 183, 4911970, 'ACHF', 'VASQUEZ', 'ESQUIVEL', 'SOLTERO', '10424346', '1', '176', 0),
(124, 184, 4911971, 'ACHF', 'JIMENEZ', 'VALLEJOS', 'SOLTERO', '7504046', '1', '176', 0),
(125, 185, 4911972, 'ACHF', 'FLORES ', 'QUENTA', 'SOLTERO', '10396011', '1', '176', 0),
(126, 186, 4913469, 'ACHF', 'AGUIRRAYA ', 'MARQUEZ', 'SOLTERO', '10471269', '1', '176', 0),
(127, 187, 4914905, 'ACHF', 'IBARRA', 'LLALLI', 'SOLTERO', '12803931', '1', '176', 0),
(128, 188, 4914949, 'ACHF', 'CONDO', 'GONZALES', 'SOLTERO', '14025933', '1', '176', 0),
(129, 189, 4915786, 'ACHF', 'VELA', 'RUIZ', 'SOLTERO', '10324969', '1', '176', 0),
(130, 190, 4919401, 'ACHF', 'CANAVIRI', 'FLORES', 'SOLTERO', '12611742', '1', '176', 0),
(131, 191, 4920050, 'ACHF', 'ESPINOZA', 'MONTALVO', 'SOLTERO', '10398710', '1', '176', 0),
(132, 192, 4920076, 'ACHF', 'QUISPE', '	CHAURE', 'SOLTERO', '10398423', '1', '176', 0),
(133, 193, 4920106, 'ACHF', 'HUANCO', '	PANIAGUA', 'SOLTERO', '10398790', '1', '176', 0),
(134, 194, 4921530, 'ACHF', 'PACHECO', 'CALLEJAS', 'SOLTERO', '13723292', '1', '176', 0),
(135, 195, 4921561, 'ACHF', 'AUZA', '	ORTEGA', 'SOLTERO', '10339126', '1', '176', 0),
(136, 196, 4921586, 'ACHF', 'ARCIENEGA', 'PACO', 'SOLTERO', '10383236', '1', '176', 0),
(137, 197, 4921699, 'ACHF', 'SAIGUA', '	POVEDA', 'SOLTERO', '12708135', '1', '176', 0),
(138, 198, 4922902, 'ACHF', 'CHAMBI', '	MAMANI', 'SOLTERO', '10401891', '1', '176', 0),
(139, 199, 4922932, 'ACHF', 'CONTRERAS', 'RIVERA', 'SOLTERO', '12740455', '1', '176', 0),
(140, 200, 4922960, 'ACHF', 'CHIRARI  ', 'GONZALES', 'SOLTERO', '13957775', '1', '176', 0),
(141, 201, 4924816, 'ACHF', 'VALLEJOS ', 'SUAREZ', 'SOLTERO', '10379119', '1', '176', 0),
(142, 202, 4926664, 'ACHF', 'CONDORI', 'RODRIGUEZ', 'SOLTERO', '10398650', '1', '176', 0),
(143, 203, 4926675, 'ACHF', 'ABAN', 'ORDOÑEZ', 'SOLTERO', '10315530', '1', '176', 0),
(144, 204, 4926942, 'ACHF', 'PICHA', 'TOMIANOVIC', 'SOLTERO', '10398724', '1', '176', 0),
(145, 205, 4927028, 'ACHF', 'MANCILLA', 'SANDOVAL', 'SOLTERO', '12899768', '1', '176', 0),
(146, 206, 4943763, 'ACHF', 'LLANOS', 'VACA', 'SOLTERO', '13025665', '1', '176', 0),
(147, 207, 4944270, 'ACHF', 'SEÑA', 'VASQUEZ', 'SOLTERO', '7569766', '1', '176', 0),
(148, 208, 4944283, 'ACHF', 'CERVANTES', 'RIVERA', 'SOLTERO', '10398577', '1', '176', 0),
(149, 209, 4944331, 'ACHF', 'ARANCIBIA', 'FACIO', 'SOLTERO', '12833846', '1', '176', 0),
(150, 210, 4944362, 'ACHF', 'ACHO', 'GONZALEZ', 'SOLTERO', '12547632', '1', '176', 0),
(151, 211, 4944376, 'ACHF', 'GONZALES', 'CARVAJAL', 'SOLTERO', '12547290', '1', '176', 0),
(152, 212, 4945370, 'ACHF', 'ZARATE', 'FAJARDO', 'SOLTERO', '4945370', '1', '176', 0),
(153, 213, 4948812, 'ACHF', 'MARQUEZ', 'GUZMAN', 'SOLTERO', '13028401', '1', '176', 0),
(154, 214, 4948989, 'ACHF', 'GALEAN', '	BARRIOS', 'SOLTERO', '7500469', '1', '176', 0),
(155, 215, 4949659, 'ACHF', 'TORRES ', 'CHARCAS', 'SOLTERO', '12547432', '1', '176', 0),
(156, 216, 4949744, 'ACHF', 'GALLARDO', 'ORTIZ', 'SOLTERO', '13219674', '1', '176', 0),
(157, 217, 4949778, 'ACHF', 'CORONADO', 'ROMERO', 'SOLTERO', '7545904', '1', '176', 0),
(158, 218, 4950251, 'ACHF', 'HIGUERAS', 'RIOS', 'SOLTERO', '7569598', '1', '176', 0),
(159, 219, 4954496, 'ACHF', 'CALLAHUARA', 'LLAMPA', 'SOLTERO', '12898539', '1', '176', 0),
(160, 220, 4954559, 'ACHF', 'FLORES ', 'ALIZAR', 'SOLTERO', '14854966', '1', '176', 0),
(161, 221, 4954583, 'ACHF', 'SACACA', '	ALIZAR', 'SOLTERO', '12496565', '1', '176', 0),
(162, 222, 4954666, 'ACHF', 'JULIAN ', 'BERNAL', 'SOLTERO', '8623300', '1', '176', 0),
(163, 223, 4957615, 'ACHF', 'PERALTA', 'SOLIZ', 'SOLTERO', '12517739', '1', '176', 0),
(164, 224, 4960753, 'ACHF', 'RODRIGUEZ', 'VARGAS', 'SOLTERO', '10321468', '1', '176', 0),
(165, 225, 4962995, 'ACHF', 'QUISPE', 'ARCE', 'SOLTERO', '14406884', '1', '176', 0),
(166, 226, 4963002, 'ACHF', 'SALAMANCA', 'BARRIOS', 'SOLTERO', '14261718', '1', '176', 0),
(167, 227, 4963157, 'ACHF', 'VELASQUEZ', '', 'SOLTERO', '13884836', '1', '176', 0),
(168, 228, 4963239, 'ACHF', 'CHIRARI  ', 'HURTADO', 'SOLTERO', '13722675', '1', '176', 0),
(169, 229, 4963338, 'ACHF', 'FLORES ', 'DURAN', 'SOLTERO', '12642200', '1', '176', 0),
(170, 230, 4963660, 'ACHF', 'RODRIGUEZ', 'FLORES', 'SOLTERO', '8616058', '1', '176', 0),
(171, 231, 4963877, 'ACHF', 'AGUILAR', 'RAMOS', 'SOLTERO', '10423828', '1', '176', 0),
(172, 232, 4963926, 'ACHF', 'ZARATE', 'ZARATE', 'SOLTERO', '13721910', '1', '176', 0),
(173, 233, 4963959, 'ACHF', 'BRITO', 'VARGAS', 'SOLTERO', '12963251', '1', '176', 0),
(174, 234, 4964068, 'ACHF', 'CRUZ', 'AGUILAR', 'SOLTERO', '13090549', '1', '176', 0),
(175, 235, 4964088, 'ACHF', 'CABA', 'YAIBONA', 'SOLTERO', '10366854', '1', '176', 0),
(176, 236, 4964167, 'ACHF', 'QUINTANA', 'MOSCOSO', 'SOLTERO', '7570152', '1', '176', 0),
(177, 237, 4964231, 'ACHF', 'ROMERO', 'AREQUIPA', 'SOLTERO', '12739094', '1', '176', 0),
(178, 238, 4965404, 'ACHF', 'RIVERO', 'ALEGRE', 'SOLTERO', '12539365', '1', '176', 0),
(179, 239, 4965457, 'ACHF', 'PUMA ', 'HERVAS', 'SOLTERO', '10333346', '1', '176', 0),
(180, 240, 4966418, 'ACHF', 'SALAZAR', 'POLO', 'SOLTERO', '10410915', '1', '176', 0),
(181, 241, 4966779, 'ACHF', 'PUMA ', 'LLANOS', 'SOLTERO', '14236595', '1', '176', 0),
(182, 242, 4966873, 'ACHF', 'SANTILLAN', 'VARGAS', 'SOLTERO', '13124418', '1', '176', 0),
(183, 243, 4966918, 'ACHF', 'CHAVARRIA', 'CHOQUE', 'SOLTERO', '14320711', '1', '176', 0),
(184, 244, 4966955, 'ACHF', 'CAMPOS', 'MIRANDA', 'SOLTERO', '13220090', '1', '176', 0),
(185, 245, 4967000, 'ACHF', 'CABALLERO', 'GARCIA', 'SOLTERO', '13122810', '1', '176', 0),
(186, 246, 4967027, 'ACHF', 'TORRES ', 'VELIZ', 'SOLTERO', '10355582', '1', '176', 0),
(187, 247, 4970279, 'ACHF', 'QUISPE', 'CHOQUE', 'SOLTERO', '9983843', '1', '176', 0),
(188, 248, 4971202, 'ACHF', 'CHOCAYA', 'RIOS', 'SOLTERO', '12834546', '1', '176', 0),
(189, 249, 4971443, 'ACHF', 'SOLIZ', 'SORIA', 'SOLTERO', '10310071', '1', '176', 0),
(190, 250, 4971457, 'ACHF', 'FERNANDEZ', 'CAMPUZANO', 'SOLTERO', '12706758', '1', '176', 0),
(191, 251, 4971539, 'ACHF', 'CHOQUE', 'MAMANI', 'SOLTERO', '10348428', '1', '176', 0),
(192, 252, 4971564, 'ACHF', 'CHOQUE', 'LOPEZ', 'SOLTERO', '7539062', '1', '176', 0),
(193, 253, 4971628, 'ACHF', 'YUCRA ', '', 'SOLTERO', '7544176', '1', '176', 0),
(194, 254, 4971647, 'ACHF', 'NAVARRO', 'RIVERA', 'SOLTERO', '13883384', '1', '176', 0),
(195, 255, 4972090, 'ACHF', 'PEÑAS', 'MONTES', 'SOLTERO', '10306228', '1', '176', 0),
(196, 256, 4972129, 'ACHF', 'MUÑOZ', 'AAAA', 'SOLTERO', '10401667', '1', '176', 0),
(197, 257, 4972194, 'ACHF', 'VEDIA', 'ALVAREZ', 'SOLTERO', '7485705', '1', '176', 0),
(198, 258, 4972227, 'ACHF', 'TERRAZAS', 'ALVAREZ', 'SOLTERO', '10350334', '1', '176', 0),
(199, 259, 4972348, 'ACHF', 'ORTUSTE', 'MAMANI', 'SOLTERO', '12546994', '1', '176', 0),
(200, 260, 4972390, 'ACHF', 'LUGO', 'PINTO', 'SOLTERO', '8638000', '1', '176', 0),
(201, 261, 4972406, 'ACHF', 'SANTILLAN', 'PAREDES', 'SOLTERO', '14260407', '1', '176', 0),
(202, 262, 4972415, 'ACHF', 'TELAO', 'CHOQUE', 'SOLTERO', '10333146', '1', '176', 0),
(203, 263, 4972445, 'ACHF', 'CUELLAR', 'VENTURA', 'SOLTERO', '12547958', '1', '176', 0),
(204, 264, 4972454, 'ACHF', 'PANIAGUA', 'AVILA', 'SOLTERO', '13187297', '1', '176', 0),
(205, 265, 4972462, 'ACHF', 'DURAN ', 'SOLIZ', 'SOLTERO', '14033689', '1', '176', 0),
(206, 266, 4972477, 'ACHF', 'ZARATE', 'SANTOS', 'SOLTERO', '14768795', '1', '176', 0),
(207, 267, 4972569, 'ACHF', 'QUIROGA', 'AGUIRRE', 'SOLTERO', '12546937', '1', '176', 0),
(208, 268, 4972720, 'ACHF', 'PACAJA ', 'RIOS', 'SOLTERO', '7563102', '1', '176', 0),
(209, 269, 4972754, 'ACHF', 'FLORES ', 'RIOS', 'SOLTERO', '10390778', '1', '176', 0),
(210, 270, 4972770, 'ACHF', 'AGUIRRE', 'PADILLA', 'SOLTERO', '10307443', '1', '176', 0),
(211, 271, 4973039, 'ACHF', 'DAZA ', 'MERCADO', 'SOLTERO', '10351311', '1', '76', 0),
(212, 272, 4973046, 'ACHF', 'GOMEZ', 'FERNANDEZ', 'SOLTERO', '11103465', '1', '76', 0),
(213, 273, 4973050, 'ACHF', 'DURAN ', 'CUEVAS', 'SOLTERO', '10363488', '1', '76', 0),
(214, 274, 4973844, 'ACHF', 'CABEZAS', 'ARANCIBIA', 'SOLTERO', '12744117', '1', '76', 0),
(215, 275, 4973867, 'ACHF', 'LOPEZ', 'CORONADO', 'SOLTERO', '10334129', '1', '176', 0),
(216, 276, 4973873, 'ACHF', 'ALARCON', 'VEDIA', 'SOLTERO', '12517688', '1', '176', 0),
(217, 277, 4973880, 'ACHF', 'PACHACOPA', 'CABEZAS', 'SOLTERO', '10394471', '1', '176', 0),
(218, 278, 4973893, 'ACHF', 'SERRUDO', 'ANGELO', 'SOLTERO', '12518475', '1', '176', 0),
(219, 279, 4973902, 'ACHF', 'CAMACHO', 'BARJA', 'SOLTERO', '10397093', '1', '176', 0),
(220, 280, 4974644, 'ACHF', 'CAPOBIANCO', 'GONZALES', 'SOLTERO', '9047446', '1', '176', 0),
(221, 281, 4993633, 'ACHF', 'CARDOSO', 'CARDENAS', 'SOLTERO', '13964714', '1', '176', 0),
(222, 282, 4993639, 'ACHF', 'SANTOS ', 'SAAVEDRA', 'SOLTERO', '6689738', '1', '176', 0),
(223, 283, 4993644, 'ACHF', 'CASTRO', 'HUANCA', 'SOLTERO', '12457790', '1', '176', 0),
(224, 284, 4993650, 'ACHF', 'ILAFAYA', 'AQUILAR', 'SOLTERO', '10400427', '1', '176', 0),
(225, 285, 4993655, 'ACHF', 'CHOQUE', 'SERRUDO', 'SOLTERO', '8564328', '1', '176', 0),
(226, 286, 4994938, 'ACHF', 'QUISPE', 'PEÑARANDA', 'SOLTERO', '15228606', '1', '176', 0),
(227, 287, 4994948, 'ACHF', 'ALVARADO', 'MONTELLANO', 'SOLTERO', '12517579', '1', '176', 0),
(228, 288, 5005020, 'ACHF', 'ALANDIA', 'PUCHO', 'SOLTERO', '12517589', '1', '176', 0),
(229, 289, 5005750, 'ACHF', 'MAMANI', 'SANTOS', 'SOLTERO', '10471856', '1', '176', 0),
(230, 290, 5005887, 'ACHF', 'GUERRA', 'VELASCO', 'SOLTERO', '10412358', '1', '176', 0),
(231, 291, 5005906, 'ACHF', 'CONDORI', 'LOPEZ', 'SOLTERO', '14821509', '1', '176', 0),
(232, 292, 5005938, 'ACHF', 'MAMANI', 'URQUIZU', 'SOLTERO', '10322144', '1', '176', 0),
(233, 293, 5005961, 'ACHF', 'CHUI', 'PATIÑO', 'SOLTERO', '13883718', '1', '176', 0),
(234, 294, 5006047, 'ACHF', 'CAYHUARA ', 'DURAN', 'SOLTERO', '13410213', '1', '176', 0),
(235, 295, 5006585, 'ACHF', 'URIETA', 'TERRAZAS', 'SOLTERO', '1038470', '1', '176', 0),
(236, 296, 5006658, 'ACHF', 'MOLINA', 'VILLANUEVA', 'SOLTERO', '7557843', '1', '176', 0),
(237, 297, 5006690, 'ACHF', 'DURAN ', 'PORCEL', 'SOLTERO', '10386431', '1', '176', 0),
(238, 298, 5006871, 'ACHF', 'OVIDIO', 'MARTINEZ', 'SOLTERO', '8513982', '1', '176', 0),
(239, 299, 5006984, 'ACHF', 'PACAJA ', 'AGUIRRE', 'SOLTERO', '10348861', '1', '176', 0),
(240, 300, 5007079, 'ACHF', 'ORTUÑO', 'GUEVARA', 'SOLTERO', '10393865', '1', '176', 0),
(241, 301, 5007290, 'ACHF', 'ORTIZ ', 'CRUZ', 'SOLTERO', '7577040', '1', '176', 0),
(242, 302, 5013608, 'ACHF', 'LIMACHI', 'OLIVERA', 'SOLTERO', '10388018', '1', '176', 0),
(243, 303, 5014426, 'ACHF', 'IRIARTE', 'MENDEZ', 'SOLTERO', '7532820', '1', '176', 0),
(244, 304, 5015273, 'ACHF', 'FLORES', 'BARRIGA', 'SOLTERO', '10412633', '1', '176', 0),
(245, 305, 5015357, 'ACHF', 'PEÑARANDA ', 'AJA', 'SOLTERO', '10400733', '1', '176', 0),
(246, 306, 5015815, 'ACHF', 'GALLEGO', 'LOPEZ', 'SOLTERO', '13027357', '1', '176', 0),
(247, 307, 5015817, 'ACHF', 'FERRUFINO', 'VARGAS', 'SOLTERO', '10389023', '1', '176', 0),
(248, 308, 5015847, 'ACHF', 'PORTILLO', 'RAMIREZ', 'SOLTERO', '12578046', '1', '176', 0),
(249, 309, 5015870, 'ACHF', 'FLORES ', 'CESPEDES', 'SOLTERO', '9331537', '1', '176', 0),
(250, 310, 5019161, 'ACHF', 'POLARES ', 'GUZMAN', 'SOLTERO', '10390891', '1', '176', 0),
(251, 311, 5019165, 'ACHF', 'VALLEJOS ', 'CIVERA', 'SOLTERO', '12577715', '1', '176', 0),
(252, 312, 5019174, 'ACHF', 'PANOSO', 'ABUAWAD', 'SOLTERO', '10385876', '1', '176', 0),
(253, 313, 5019178, 'ACHF', 'OROPEZA', 'SAINZ', 'SOLTERO', '10317067', '1', '176', 0),
(254, 314, 5019218, 'ACHF', 'AVALOS', 'QUINTANILLA', 'SOLTERO', '10383353', '1', '176', 0),
(255, 315, 5020474, 'ACHF', 'GALLEGOS', 'PINTO', 'SOLTERO', '10317229', '1', '176', 0),
(256, 316, 5021845, 'ACHF', 'VEDIA', 'BLACUTT', 'SOLTERO', '13442156', '1', '176', 0),
(257, 317, 5022560, 'ACHF', 'TAQUICHIRI', 'BARRON', 'SOLTERO', '10322032', '1', '176', 0),
(258, 318, 5022613, 'ACHF', 'TAQUICHIRI', 'CHAVARRIA', 'SOLTERO', '12930628', '1', '176', 0),
(259, 319, 5022682, 'ACHF', 'QUIROZ', 'REQUE', 'SOLTERO', '10383174', '1', '176', 0),
(260, 320, 5025320, 'ACHF', 'REJAS', 'LOPEZ', 'SOLTERO', '10326597', '1', '176', 0),
(261, 321, 5025335, 'ACHF', 'VASQUEZ', 'FLORES', 'SOLTERO', '7542386', '1', '176', 0),
(262, 322, 5028768, 'ACHF', 'PACHECO', 'ECOS', 'SOLTERO', '12465631', '1', '176', 0),
(263, 323, 5029178, 'ACHF', 'VILLCA', 'SANDOVAL', 'SOLTERO', '10329734', '1', '176', 0),
(264, 324, 5029225, 'ACHF', 'VASQUEZ', 'LEON', 'SOLTERO', '10367004', '1', '176', 0),
(265, 325, 5029313, 'ACHF', 'MARTINEZ', 'BELLIDO', 'SOLTERO', '10330700', '1', '176', 0),
(266, 326, 5029366, 'ACHF', 'ALMENDRAS', 'MENDOZA', 'SOLTERO', '12929559', '1', '176', 0),
(267, 327, 5029457, 'ACHF', 'VARGAS  ', 'URQUIZU', 'SOLTERO', '13028309', '1', '176', 0),
(268, 328, 5030171, 'ACHF', 'IRALA', 'SENO', 'SOLTERO', '12367430', '1', '176', 0),
(269, 329, 5030218, 'ACHF', 'MOSCOSO', 'VARGAS', 'SOLTERO', '7535884', '1', '176', 0),
(270, 330, 5030260, 'ACHF', 'ROCHA', 'ESPINOZA', 'SOLTERO', '10350143', '1', '176', 0),
(271, 331, 5030299, 'ACHF', 'FLORES ', 'COLQUE', 'SOLTERO', '10317310', '1', '176', 0),
(272, 332, 5030354, 'ACHF', 'MARISCAL', 'SERRUDO', 'SOLTERO', '10384274', '1', '176', 0),
(273, 333, 5033917, 'ACHF', 'GRIMALDES', 'DURAN', 'SOLTERO', '10387841', '1', '176', 0),
(274, 334, 5033927, 'ACHF', 'VILLAVICENCIO', 'DURAN', 'SOLTERO', '10387829', '1', '176', 0),
(275, 335, 5034581, 'ACHF', 'CHUMACERO ', 'COPA', 'SOLTERO', '10385958', '1', '176', 0),
(276, 336, 5034605, 'ACHF', 'HUALLPA', 'QUISPE', 'SOLTERO', '10328800', '1', '176', 0),
(277, 337, 5034619, 'ACHF', 'MICAYO', 'JIMENEZ', 'SOLTERO', '8670227', '1', '176', 0),
(278, 338, 5034630, 'ACHF', 'KALLATA', 'ESQUIVEL', 'SOLTERO', '10322051', '1', '176', 0),
(279, 339, 5034637, 'ACHF', 'CANCHI', 'ZUBIA', 'SOLTERO', '10387839', '1', '176', 0),
(280, 340, 5034643, 'ACHF', 'MAMANI', 'CHOQUE', 'SOLTERO', '10471868', '1', '176', 0),
(281, 341, 5034662, 'ACHF', 'ESCALANTE ', 'LEON', 'SOLTERO', '10380855', '1', '176', 0),
(282, 342, 5034672, 'ACHF', 'DURAN', 'CERVANTES', 'SOLTERO', '10385877', '1', '176', 0),
(283, 343, 5034682, 'ACHF', 'GUAMANI', 'BARRA', 'SOLTERO', '12706498', '1', '176', 0),
(284, 344, 5034688, 'ACHF', 'RODRIGUEZ', 'AAAA', 'SOLTERO', '12961958', '1', '176', 0),
(285, 345, 5034696, 'ACHF', 'MEDRANO', 'MARISCAL', 'SOLTERO', '8622989', '1', '176', 0),
(286, 346, 5034700, 'ACHF', 'CALVIMONTES', 'AGUILAR', 'SOLTERO', '10388054', '1', '176', 0),
(287, 347, 5034708, 'ACHF', 'COLORADO', 'MENDOZA', 'SOLTERO', '103472411', '1', '176', 0),
(288, 348, 5034713, 'ACHF', 'BARRIENTOS', 'RIVERA', 'SOLTERO', '10347664', '1', '176', 0),
(289, 349, 5034747, 'ACHF', 'CATACORA', 'LEON', 'SOLTERO', '10620034', '1', '176', 0),
(290, 350, 5034834, 'ACHF', 'KALLATA', 'CARBAJAL', 'SOLTERO', '10322053', '1', '176', 0),
(291, 351, 5035263, 'ACHF', 'ALACA', 'AZURDUY', 'SOLTERO', '12517580', '1', '176', 0),
(292, 352, 5035510, 'ACHF', 'ARANCIBIA', 'FERNANDEZ', 'SOLTERO', '12930593', '1', '176', 0),
(293, 353, 5036028, 'ACHF', 'LAZCANO', 'CARVAJAL', 'SOLTERO', '10326448', '1', '176', 0),
(294, 354, 5036227, 'ACHF', 'CERBANTES', 'CLAROS', 'SOLTERO', '9595760', '1', '176', 0),
(295, 355, 5036279, 'ACHF', 'CONDORI', 'RUIZ', 'SOLTERO', '10400608', '1', '176', 0),
(296, 356, 5036366, 'ACHF', 'AVILES', 'BALCERA', 'SOLTERO', '10387116', '1', '176', 0),
(297, 357, 5036484, 'ACHF', 'ANDRADE', 'SIERRA', 'SOLTERO', '10384176', '1', '176', 0),
(298, 358, 5036559, 'ACHF', 'ZAMORA', 'BONIFACIO', 'SOLTERO', '12929640', '1', '176', 0),
(299, 359, 5037155, 'ACHF', 'CABEZAS ', 'LLAVE', 'SOLTERO', '14106421', '1', '176', 0),
(300, 360, 5037184, 'ACHF', 'RUIZ ', 'VALLE', 'SOLTERO', '10411764', '1', '176', 0),
(301, 361, 5037217, 'ACHF', 'ARATEA', 'DIAZ', 'SOLTERO', '10366747', '1', '176', 0),
(302, 362, 5037266, 'ACHF', 'SOBIA', 'SERRUDO', 'SOLTERO', '7538885', '1', '176', 0),
(303, 363, 5037272, 'ACHF', 'APAZA', 'TRIGO', 'SOLTERO', '10314331', '1', '176', 0),
(304, 364, 5037309, 'ACHF', 'CHOQUE ', 'LOPEZ', 'SOLTERO', '10362905', '1', '176', 0),
(305, 365, 5037425, 'ACHF', 'VELASQUEZ ', 'NEGRETE', 'SOLTERO', '7541488', '1', '176', 0),
(306, 366, 5038352, 'ACHF', 'CORREIA DE ALMEIDA', 'ROMERO', 'SOLTERO', '132UMD4', '1', '176', 0),
(307, 367, 5039170, 'ACHF', 'COPA ', 'AVENDAÑO', 'SOLTERO', '13318434', '1', '176', 0),
(308, 368, 5040170, 'ACHF', 'DURAN', 'BALDERRAMA', 'SOLTERO', '12899512', '1', '176', 0),
(309, 369, 5043125, 'ACHF', 'HUALLPA', 'MIGUES', 'SOLTERO', '7510538', '1', '176', 0),
(310, 370, 5043218, 'ACHF', 'MENDOZA', 'AGUDO', 'SOLTERO', '12546625', '1', '176', 0),
(311, 371, 5044785, 'ACHF', 'CONDORI', 'SANCHEZ', 'SOLTERO', '10386991', '1', '176', 0),
(312, 372, 5045737, 'ACHF', 'HUANCA', 'SUAREZ', 'SOLTERO', '8648175', '1', '176', 0),
(313, 373, 5047635, 'ACHF', 'TORRES ', 'LLALLI', 'SOLTERO', '13185752', '1', '176', 0),
(314, 374, 5058325, 'ACHF', 'ORTIZ', 'AVILES', 'SOLTERO', '10400477', '1', '176', 0),
(315, 375, 5059007, 'ACHF', 'MONTALVO', 'PEÑARANDA', 'SOLTERO', '10406100', '1', '176', 0),
(316, 376, 5059007, 'ACHF', 'MONTALVO', 'GONZALES', 'SOLTERO', '10406100', '1', '176', 0),
(317, 377, 5063092, 'ACHF', 'BARJA', 'AVALOS', 'SOLTERO', '10385950', '1', '176', 0),
(318, 378, 5068087, 'ACHF', 'CLARK', 'PEÑARANDA', 'SOLTERO', 'G27600126', '1', '176', 0),
(319, 379, 5070880, 'ACHF', 'CAMIÑO', 'PATZI', 'SOLTERO', '10381152', '1', '176', 0),
(320, 380, 5073948, 'ACHF', 'CHACON', '', 'SOLTERO', '13750627', '1', '176', 0),
(321, 381, 5074263, 'ACHF', 'CALDERON', 'ZARATE', 'SOLTERO', '10383343', '1', '176', 0),
(322, 382, 5077119, 'ACHF', 'CABEZAS', 'ATA', 'SOLTERO', '12547085', '1', '176', 0),
(323, 383, 5089383, 'ACHF', 'ARIAS ', 'BENITEZ', 'SOLTERO', '12550794', '1', '176', 0),
(324, 384, 5092952, 'ACHF', 'ESPINOZA', 'SANCHEZ', 'SOLTERO', '12577730', '1', '176', 0),
(325, 385, 5092953, 'ACHF', 'TORRES', 'LLANOS', 'SOLTERO', '10318292', '1', '176', 0),
(326, 386, 5092957, 'ACHF', 'MANCILLA', 'VARGAS', 'SOLTERO', '10406617', '1', '176', 0),
(327, 387, 5093517, 'ACHF', 'CHOQUE', 'MAMANI', 'SOLTERO', '7543560', '1', '176', 0),
(328, 388, 5093519, 'ACHF', 'GARCIA ', 'CANO', 'SOLTERO', '10321592', '1', '176', 0),
(329, 389, 5093521, 'ACHF', 'YUCRA ', 'APARICIO', 'SOLTERO', '10394670', '1', '176', 0),
(330, 390, 5093524, 'ACHF', 'FLORES ', 'CASTRO', 'SOLTERO', '15052808', '1', '176', 0),
(331, 391, 5093954, 'ACHF', 'SALVA', 'RODRIGUEZ', 'SOLTERO', '12546628', '1', '176', 0),
(332, 392, 5095997, 'ACHF', 'TORREZ', 'CUATA', 'SOLTERO', '8623674', '1', '176', 0),
(333, 393, 5095997, 'ACHF', 'TORRES ', 'ANTEQUERA', 'SOLTERO', '8623674', '1', '176', 0),
(334, 394, 5096080, 'ACHF', 'BARAHONA', 'VASQUEZ', 'SOLTERO', '12488054', '1', '176', 0),
(335, 395, 5096208, 'ACHF', 'SILVA', 'FLORES', 'SOLTERO', '10330266', '1', '176', 0),
(336, 396, 5096215, 'ACHF', 'VILLARROEL', 'MOYA', 'SOLTERO', '7550597', '1', '176', 0),
(337, 397, 5096485, 'ACHF', 'RODRIGUEZ', 'BARRON', 'SOLTERO', '10362456', '1', '176', 0),
(338, 398, 5096487, 'ACHF', 'PEREZ ', 'LEON', 'SOLTERO', '7522476', '1', '176', 0),
(339, 399, 5096488, 'ACHF', 'HINOJOSA', 'MARQUEZ', 'SOLTERO', '10306280', '1', '176', 0),
(340, 400, 5096559, 'ACHF', 'MURILLO', 'GARABITO', 'SOLTERO', '10363097', '1', '176', 0),
(341, 401, 5096569, 'ACHF', 'ALVIZ', 'MERCADO', 'SOLTERO', '7566372', '1', '176', 0),
(342, 402, 5096594, 'ACHF', 'HERRERA', 'SALAZAR', 'SOLTERO', '10321716', '1', '176', 0),
(343, 403, 5096613, 'ACHF', 'ARACA', 'DURAN', 'SOLTERO', '10391419', '1', '176', 0),
(344, 404, 5102243, 'ACHF', 'PEDRAZA', 'CALIZAYA', 'SOLTERO', '7750331', '1', '176', 0),
(345, 405, 5102735, 'ACHF', 'CARO', 'ORTEGA', 'SOLTERO', '7539163', '1', '176', 0),
(346, 406, 5102938, 'ACHF', 'RETAMOZO', 'RODRIGUEZ', 'SOLTERO', '7527741', '1', '176', 0),
(347, 407, 5103027, 'ACHF', 'CESPEDES', 'TERAN', 'SOLTERO', '12579506', '1', '176', 0),
(348, 408, 5109602, 'ACHF', 'COA ', 'MURILLO', 'SOLTERO', '10395119', '1', '176', 0),
(349, 409, 5109851, 'ACHF', 'MENDEZ', 'VARGAS', 'SOLTERO', '10318077', '1', '176', 0),
(350, 410, 5117668, 'ACHF', 'GARCIA ', 'SALAZAR', 'SOLTERO', '13028156', '1', '176', 0),
(351, 411, 5119204, 'ACHF', 'COLQUE', 'LOAYZA', 'SOLTERO', '12368100', '1', '176', 0),
(352, 412, 5125277, 'ACHF', 'PARACTA', 'HEREDIA', 'SOLTERO', '10381888', '1', '176', 0),
(353, 413, 5127691, 'ACHF', 'MEDRANO', 'PEREZ', 'SOLTERO', '7533764', '1', '176', 0),
(354, 414, 5128028, 'ACHF', 'TAQUIICHIRI', 'SEGOVIA', 'SOLTERO', '12930284', '1', '176', 0),
(355, 415, 5128059, 'ACHF', 'PARTES', 'FRANCO', 'SOLTERO', '10381736', '1', '176', 0),
(356, 416, 5128071, 'ACHF', 'MEDINA', 'ALCIBIA', 'SOLTERO', '10387137', '1', '176', 0),
(357, 417, 5128075, 'ACHF', 'RODRIGUEZ', 'ALCIBIA', 'SOLTERO', '7278245', '1', '176', 0),
(358, 418, 5128081, 'ACHF', 'ROJAS', 'ZELAYA', 'SOLTERO', '10311754', '1', '176', 0),
(359, 419, 5128142, 'ACHF', 'PINTO', 'CHAVARRIA', 'SOLTERO', '10366795', '1', '176', 0),
(360, 420, 5128352, 'ACHF', 'BAPTISTA', 'VELASCO', 'SOLTERO', '12517962', '1', '176', 0),
(361, 421, 5133913, 'ACHF', 'MAMANI', 'AGUILAR', 'SOLTERO', '10389755', '1', '176', 0),
(362, 422, 5135799, 'ACHF', 'ZURITA', 'GARCIA', 'SOLTERO', '12706037', '1', '176', 0),
(363, 423, 5136043, 'ACHF', 'VENEROS', 'VELA', 'SOLTERO', '12739902', '1', '176', 0),
(364, 424, 5137180, 'ACHF', 'HEREDIA', 'ALBA', 'SOLTERO', '10394901', '1', '176', 0),
(365, 425, 5137259, 'ACHF', 'CHIRARI  ', 'AGUILAR', 'SOLTERO', '10310409', '1', '176', 0),
(366, 426, 5141345, 'ACHF', 'GUTIERREZ', 'MOSCOSO', 'SOLTERO', '8228757', '1', '176', 0),
(367, 427, 5142307, 'ACHF', 'CONDORI', 'CHACON', 'SOLTERO', '12546540', '1', '176', 0),
(368, 428, 5142321, 'ACHF', 'PANIAGUA', 'SERRUDO', 'SOLTERO', '14363912', '1', '176', 0),
(369, 429, 5142338, 'ACHF', 'PACHECO', 'GONZALES', 'SOLTERO', '12963679', '1', '176', 0),
(370, 430, 5142358, 'ACHF', 'ROMERO', 'MEDRANO', 'SOLTERO', '12517807', '1', '176', 0),
(371, 431, 5142372, 'ACHF', 'AZURDUY', 'LOAYZA', 'SOLTERO', '10466244', '1', '176', 0),
(372, 432, 5142383, 'ACHF', 'BARRERA', 'AVILES', 'SOLTERO', '12963688', '1', '176', 0),
(373, 433, 5142404, 'ACHF', 'CALDERON', 'LEDEZMA', 'SOLTERO', '10391175', '1', '176', 0),
(374, 434, 5142436, 'ACHF', 'SANCHEZ', 'MENDOZA', 'SOLTERO', '7478522', '1', '176', 0),
(375, 435, 5142462, 'ACHF', 'ALVAREZ', 'BARRIOS', 'SOLTERO', '10381964', '1', '176', 0),
(376, 436, 3826425, 'ACHF', 'SALAZAR', 'GUTIERREZ', 'SOLTERO', '9852627', '1', '176', 0),
(377, 437, 3826526, 'ACHF', 'CESPEDES', 'LAZO', 'SOLTERO', '10388949', '1', '175', 0),
(378, 438, 3826529, 'ACHF', 'TORRES', 'MIRANDA', 'SOLTERO', '7518272', '1', '172', 1),
(379, 439, 3827313, 'ACHF', 'QUISPE', 'CERRUDO', 'SOLTERO', '12642588', '1', '179', 0),
(380, 440, 4735220, 'ACHF', 'SOTO', 'GONZALES', 'SOLTERO', '4118968', '1', '180', 0),
(381, 441, 4876869, 'ACHF', 'CHIRARI', 'TABOADA', 'SOLTERO', '10361836', '1', '176', 0),
(382, 442, 4878458, 'ACHF', 'CESPEDES', 'RODRIGUEZ', 'SOLTERO', '9844104', '1', '175', 0),
(383, 443, 4879491, 'ACHF', 'YUCRA', 'ORELLANA', 'SOLTERO', '10341157', '1', '173', 0),
(384, 444, 4879507, 'ACHF', 'YUCRA', 'PEÑARANDA', 'SOLTERO', '7530073', '1', '177', 0),
(385, 445, 4886064, 'ACHF', 'VELASQUEZ', 'CUMANDIRI', 'SOLTERO', '10395426', '1', '177', 0),
(386, 446, 4898409, 'ACHF', 'MARUTANO', 'DURAN', 'SOLTERO', '10424514', '1', '175', 0),
(387, 447, 4900360, 'ACHF', 'BAYON', 'MARTINEZ', 'SOLTERO', '7513133', '1', '170', 0),
(388, 448, 4900407, 'ACHF', 'QUISPE', 'DURAN', 'SOLTERO', '7533801', '1', '174', 0),
(389, 449, 4900457, 'ACHF', 'BALCERA', 'MARTINEZ', 'SOLTERO', '10341749', '1', '177', 0),
(390, 450, 4900552, 'ACHF', 'ANDRADE', 'ORTIZ', 'SOLTERO', '10332525', '1', '179', 0),
(391, 451, 4900590, 'ACHF', 'CRUZ', 'LOPEZ', 'SOLTERO', '5686995', '1', '178', 1),
(392, 452, 4900602, 'ACHF', 'PACO', 'TORRES', 'SOLTERO', '12611417', '1', '177', 0),
(393, 453, 4900662, 'ACHF', 'PORTILLO', 'BAREA', 'SOLTERO', '12898226', '1', '172', 0),
(394, 454, 4911967, 'ACHF', 'SERRUDO', 'SAIGUA', 'SOLTERO', '5691204', '1', '180', 0),
(395, 455, 4911973, 'ACHF', 'MOLINA ', 'MAMANI', 'SOLTERO', '13722976', '1', '170', 1),
(396, 456, 4915675, 'ACHF', 'DIAZ', 'QUISPE', 'SOLTERO', '10376919', '1', '174', 1),
(397, 457, 4916587, 'ACHF', 'SERRUDO', 'SAIGUA', 'SOLTERO', '10322293', '1', '173', 0),
(398, 458, 4944050, 'ACHF', 'ARANCIBIA', 'ALVARADO', 'SOLTERO', '4149057', '1', '182', 0),
(399, 459, 4944063, 'ACHF', 'CABA', 'CONDORI', 'SOLTERO', '8622226', '1', '179', 0),
(400, 460, 4944096, 'ACHF', 'CARVAJAL', 'URIONA', 'SOLTERO', '7501954', '1', '170', 0),
(401, 461, 4948979, 'ACHF', 'ORTIZ', 'RAMIREZ', 'SOLTERO', '7551001', '1', '179', 0),
(402, 462, 4948995, 'ACHF', 'NAVARRO', 'MARTINEZ', 'SOLTERO', '12526063', '1', '178', 0),
(403, 463, 4949003, 'ACHF', 'GARCIA', 'TRUJILLO', 'SOLTERO', '10385041', '1', '181', 0),
(404, 464, 4949010, 'ACHF', 'DORADO', 'BONIFAZ', 'SOLTERO', '7518817', '1', '178', 0),
(405, 465, 4957405, 'ACHF', 'MAMANI', 'TORRES', 'SOLTERO', '7498694', '1', '180', 0),
(406, 466, 4957457, 'ACHF', 'CONDORI', 'LEON', 'SOLTERO', '10344135', '1', '170', 0),
(407, 467, 4957625, 'ACHF', 'ROMERO', 'FLORES', 'SOLTERO', '10401096', '1', '170', 0),
(408, 468, 4958541, 'ACHF', 'BALLEJOS', 'ESQUIVEL', 'SOLTERO', '7525188', '1', '185', 0),
(409, 469, 4959184, 'ACHF', 'RAMIREZ', 'VALLEJOS', 'SOLTERO', '12516605', '1', '175', 0),
(410, 470, 4959187, 'ACHF', 'QUISPE', 'QUENTA', 'SOLTERO', '7544433', '1', '177', 0),
(411, 471, 4960732, 'ACHF', 'ZELAYA', 'MARQUEZ', 'SOLTERO', '7546489', '1', '178', 0),
(412, 472, 4961879, 'ACHF', 'ZANABRIA', 'LLALLI', 'SOLTERO', '7486099', '1', '172', 0),
(413, 473, 4962973, 'ACHF', 'PINTO', 'GONZALES', 'SOLTERO', '9588203', '1', '180', 0),
(414, 474, 4962984, 'ACHF', 'CAYO', 'RUIZ', 'SOLTERO', '10635308', '1', '170', 0),
(415, 475, 4962992, 'ACHF', 'SAAVEDRA', 'FLORES', 'SOLTERO', '7531731', '1', '170', 0),
(416, 476, 4963023, 'ACHF', 'FLORES', 'MONTALVO', 'SOLTERO', '12932000', '1', '170', 0),
(417, 477, 4963027, 'ACHF', 'GUZMAN', 'CHAURE', 'SOLTERO', '7540396', '1', '175', 0),
(418, 478, 4963172, 'ACHF', 'VELASQUEZ', 'PANIAGUA', 'SOLTERO', '14491846', '1', '175', 0),
(419, 479, 4963193, 'ACHF', 'VALLEJOS', 'CALLEJAS', 'SOLTERO', '10383839', '1', '176', 0),
(420, 480, 4963201, 'ACHF', 'MIRANDA', 'ORTEGA', 'SOLTERO', '7533046', '1', '172', 0),
(421, 481, 4963207, 'ACHF', 'TELLEZ', 'PACO', 'SOLTERO', '12518124', '1', '178', 0),
(422, 482, 4963222, 'ACHF', 'CHIRARI', 'POVEDA', 'SOLTERO', '8640465', '1', '177', 0),
(423, 483, 4963233, 'ACHF', 'CRUZ', 'MAMANI', 'SOLTERO', '12705574', '1', '177', 0),
(424, 484, 4963244, 'ACHF', 'BRITO', 'RIVERA', 'SOLTERO', '5668091', '1', '177', 0),
(425, 485, 4963312, 'ACHF', 'FLORES', 'GONZALES', 'SOLTERO', '12515738', '1', '175', 0),
(426, 486, 4963683, 'ACHF', 'SUAREZ', 'SUAREZ', 'SOLTERO', '7580020', '1', '178', 0),
(427, 487, 4963749, 'ACHF', 'VILAR', 'RODRIGUEZ', 'SOLTERO', '4110249', '1', '172', 0),
(428, 488, 4963803, 'ACHF', 'RUIZ', 'ORDOÑEZ', 'SOLTERO', '10733403', '1', '175', 0),
(429, 489, 4963859, 'ACHF', 'MERCADO', 'TOMIANOVIC', 'SOLTERO', '5688031', '1', '175', 0),
(430, 490, 4963900, 'ACHF', 'PORCEL', 'SALDOVAL', 'SOLTERO', '5683948', '1', '177', 0),
(431, 491, 4963987, 'ACHF', 'ONTIVEROS', 'VACA', 'SOLTERO', '7561440', '1', '176', 0),
(432, 492, 4964057, 'ACHF', 'CRUZ', 'VASQUEZ', 'SOLTERO', '10330563', '1', '182', 0),
(433, 493, 4964106, 'ACHF', 'CASTRO', 'RIVERA', 'SOLTERO', '7538455', '1', '175', 0),
(434, 494, 4964113, 'ACHF', 'ARANIBAR', 'FACIO', 'SOLTERO', '6293260', '1', '175', 0),
(435, 495, 4964122, 'ACHF', 'LAYME', 'GONZALES', 'SOLTERO', '12548203', '1', '170', 0),
(436, 496, 4964124, 'ACHF', 'FLORES', 'CARVAJAL', 'SOLTERO', '10308699', '1', '170', 0),
(437, 497, 4964128, 'ACHF', 'QUENTA', 'FAJARDO', 'SOLTERO', '10318475', '1', '175', 0),
(438, 498, 4964139, 'ACHF', 'CERVANTES', 'GUZMAN', 'SOLTERO', '7483230', '1', '173', 0),
(439, 499, 4964150, 'ACHF', 'FLORES', 'BARRIOS', 'SOLTERO', '7539212', '1', '173', 0),
(440, 500, 4964251, 'ACHF', 'CORTES', 'CHARCAS', 'SOLTERO', '7502309', '1', '174', 0),
(441, 501, 4969204, 'ACHF', 'LOPEZ', 'ORTIZ', 'SOLTERO', '7561831', '1', '172', 0),
(442, 502, 4969572, 'ACHF', 'ORTEGA', 'ROMERO', 'SOLTERO', '10366651', '1', '176', 0),
(443, 503, 4969651, 'ACHF', 'PUYAL', 'RIOS', 'SOLTERO', '9500067', '1', '175', 0),
(444, 504, 4969700, 'ACHF', 'MORALES', 'YAMPA', 'SOLTERO', '7496281', '1', '174', 0),
(445, 505, 4969768, 'ACHF', 'SALAZAR', 'ALIZAR', 'SOLTERO', '10410911', '1', '174', 0),
(446, 506, 4969795, 'ACHF', 'SALAZAR', 'ALIZAR', 'SOLTERO', '7570296', '1', '175', 0),
(447, 507, 4970687, 'ACHF', 'DURAN', 'BERNAL', 'SOLTERO', '9174217', '1', '174', 0),
(448, 508, 4972325, 'ACHF', 'CADIMA', 'SOLIZ', 'SOLTERO', '7129402', '1', '172', 0),
(449, 509, 4972376, 'ACHF', 'AGUILAR', 'VARGAS', 'SOLTERO', '10359220', '1', '173', 0),
(450, 510, 4972687, 'ACHF', 'CARRANZA', 'ARCE', 'SOLTERO', '5488763', '1', '170', 0),
(451, 511, 4973135, 'ACHF', 'RODAS', 'BARRIOS', 'SOLTERO', '8251853', '1', '171', 0),
(452, 512, 4973148, 'ACHF', 'HERRERA', '', 'SOLTERO', '7507666', '1', '170', 0),
(453, 513, 4973155, 'ACHF', 'ADAN', 'HURTADO', 'SOLTERO', '8908109', '1', '178', 0),
(454, 514, 4973170, 'ACHF', 'ZARATE', 'DURAN', 'SOLTERO', '7509242', '1', '175', 0),
(455, 515, 4973811, 'ACHF', 'QUISPE', 'FLORES', 'SOLTERO', '7487495', '1', '170', 0),
(456, 516, 4973813, 'ACHF', 'SANDOVAL', 'RAMOS', 'SOLTERO', '7499479', '1', '172', 0),
(457, 517, 4973822, 'ACHF', 'ZARATE', 'ZARATE', 'SOLTERO', '10347612', '1', '173', 0),
(458, 518, 4973916, 'ACHF', 'RODRIGUEZ', 'VARGAS', 'SOLTERO', '8616135', '1', '177', 0),
(459, 519, 4973927, 'ACHF', 'TACEO', 'AGUILAR', 'SOLTERO', '13973681', '1', '175', 0),
(460, 520, 4974430, 'ACHF', 'ESPINOZA', 'YAIBONA', 'SOLTERO', '13017405', '1', '175', 0),
(461, 521, 4974640, 'ACHF', 'MARUTANO', 'MOSCOSO', 'SOLTERO', '7482301', '1', '175', 0),
(462, 522, 4974648, 'ACHF', 'PICHA', 'AREQUIPA', 'SOLTERO', '12707747', '1', '176', 0),
(463, 523, 4974652, 'ACHF', 'DAZA', 'ALEGRE', 'SOLTERO', '10334208', '1', '170', 0),
(464, 524, 4974659, 'ACHF', 'HERVAS', 'HERVAS', 'SOLTERO', '7503657', '1', '170', 0),
(465, 525, 4980773, 'ACHF', 'TABOADA', 'POLO', 'SOLTERO', '7502715', '1', '178', 0),
(466, 526, 4980824, 'ACHF', 'GARCIA', 'LLANOS', 'SOLTERO', '10377515', '1', '172', 0),
(467, 527, 4986724, 'ACHF', 'TAPIA', 'VARGAS', 'SOLTERO', '9852627', '1', '171', 0),
(468, 528, 5006524, 'ACHF', 'MUÑOZ', 'CHOQUE', 'SOLTERO', '13217725', '1', '170', 0),
(469, 529, 5006628, 'ACHF', 'LLANQUI', 'MIRANDA', 'SOLTERO', '12706652', '1', '170', 0),
(470, 530, 5006740, 'ACHF', 'GUTIERREZ', 'GARCIA', 'SOLTERO', '12899913', '1', '175', 0),
(471, 531, 5006846, 'ACHF', 'MAMANI', 'VELIZ', 'SOLTERO', '13166892', '1', '173', 0),
(472, 532, 5006924, 'ACHF', 'CRUZ', 'CHOQUE', 'SOLTERO', '12708003', '1', '175', 0),
(473, 533, 5007055, 'ACHF', 'PARINA', 'RIOS', 'SOLTERO', '13026892', '1', '170', 0),
(474, 534, 5007455, 'ACHF', 'CHOQUE', 'SORIA', 'SOLTERO', '897679', '1', '171', 0),
(475, 535, 5015664, 'ACHF', 'SAHONERO', 'CAMPUZANO', 'SOLTERO', '1109460', '1', '173', 0),
(476, 536, 5015777, 'ACHF', 'CRUZ', 'MAMANI', 'SOLTERO', '10341988', '1', '175', 0),
(477, 537, 5018306, 'ACHF', 'PEREZ', 'LOPEZ', 'SOLTERO', '7540453', '1', '175', 0),
(478, 538, 5018493, 'ACHF', 'HEREDIA', '', 'SOLTERO', '10407763', '1', '178', 0),
(479, 539, 5019320, 'ACHF', 'MARTINEZ', 'RIVERA', 'SOLTERO', '10367356', '1', '179', 0),
(480, 540, 5021815, 'ACHF', 'GARCIA', 'MONTES', 'SOLTERO', '7537712', '1', '178', 0),
(481, 541, 5021879, 'ACHF', 'VALLEJOS', '', 'SOLTERO', '7561483', '1', '175', 0),
(482, 542, 5021894, 'ACHF', 'ALMENDRAS', 'ALVARES', 'SOLTERO', '7530024', '1', '173', 0),
(483, 543, 5021905, 'ACHF', 'ALMENDRAS', 'ALVARES', 'SOLTERO', '7530025', '1', '173', 0),
(484, 544, 5021913, 'ACHF', 'RODAS', 'MAMANI', 'SOLTERO', '7540803', '1', '174', 0),
(485, 545, 5022546, 'ACHF', 'ISLA', 'PINTO', 'SOLTERO', '5697568', '1', '173', 0),
(486, 546, 5022584, 'ACHF', 'SAAVEDRA', 'PAREDES', 'SOLTERO', '7508897', '1', '175', 0),
(487, 547, 5022666, 'ACHF', 'CALDERON', 'CHOQUE', 'SOLTERO', '10383344', '1', '180', 0),
(488, 548, 5022691, 'ACHF', 'CRUZ', 'VENTURA', 'SOLTERO', '12739875', '1', '185', 0),
(489, 549, 5025347, 'ACHF', 'CRUZ', 'AVILA', 'SOLTERO', '7527814', '1', '175', 0),
(490, 550, 5025381, 'ACHF', 'ZURITA', 'SOLIZ', 'SOLTERO', '10423301', '1', '170', 0),
(491, 551, 5025410, 'ACHF', 'CUELLAR', 'SANTOS', 'SOLTERO', '10422913', '1', '176', 0),
(492, 552, 5026712, 'ACHF', 'MARTINEZ', 'AGUIRRE', 'SOLTERO', '7144119', '1', '175', 0),
(493, 553, 5026758, 'ACHF', 'MOSTACEDO', 'RIOS', 'SOLTERO', '12566130', '1', '171', 0),
(494, 554, 5027712, 'ACHF', 'MOSTACEDO', 'RIOS', 'SOLTERO', '7579413', '1', '172', 0),
(495, 555, 5027856, 'ACHF', 'VEDIA', 'PADILLA', 'SOLTERO', '7507679', '1', '178', 0),
(496, 556, 5029393, 'ACHF', 'MANCILLA', 'MERCADO', 'SOLTERO', '7474807', '1', '175', 0),
(497, 557, 5029935, 'ACHF', 'QUIROGA', 'FERNANDEZ', 'SOLTERO', '10325663', '1', '176', 0),
(498, 558, 5030325, 'ACHF', 'MAMANI', 'CUEVAS', 'SOLTERO', '12782390', '1', '172', 0),
(499, 559, 5032639, 'ACHF', 'RIQUELME', 'ARANCIBIA', 'SOLTERO', '10421638', '1', '173', 0),
(500, 560, 5032663, 'ACHF', 'VALDA', 'CORONADO', 'SOLTERO', '7514564', '1', '177', 0),
(501, 561, 5032684, 'ACHF', 'QUENTA', 'VEDIA', 'SOLTERO', '7561602', '1', '174', 0),
(502, 562, 5032689, 'ACHF', 'GUZMAN', 'CABEZAS', 'SOLTERO', '10393891', '1', '175', 0),
(503, 563, 5032697, 'ACHF', 'ORTEGA', 'ANGELO', 'SOLTERO', '5548181', '1', '182', 0),
(504, 564, 5032699, 'ACHF', 'CEREZO', 'BARJA', 'SOLTERO', '7540699', '1', '186', 0),
(505, 565, 5033040, 'ACHF', 'BERNAL', 'GONZALES', 'SOLTERO', '5652281', '1', '182', 0),
(506, 566, 5033041, 'ACHF', 'SANDOVAL', 'CARDENAS', 'SOLTERO', '13220174', '1', '171', 0),
(507, 567, 5033114, 'ACHF', 'VALDA', 'SAAVEDRA', 'SOLTERO', '8218526', '1', '175', 0),
(508, 568, 5033393, 'ACHF', 'ZARATE', 'HUANCA', 'SOLTERO', '12547798', '1', '176', 0),
(509, 569, 5034731, 'ACHF', 'CALVIMONTES', 'AGUILAR', 'SOLTERO', '13089661', '1', '175', 0),
(510, 570, 5034739, 'ACHF', 'PICHA', 'CERRUDO', 'SOLTERO', '12366027', '1', '178', 0),
(511, 571, 5034755, 'ACHF', 'DIAZ', 'PEÑARANDA', 'SOLTERO', '10423071', '1', '179', 0),
(512, 572, 5034760, 'ACHF', 'SANDI', 'MONTELLANO', 'SOLTERO', '8195582', '1', '170', 0),
(513, 573, 5034770, 'ACHF', 'MENDEZ', 'PUCHO', 'SOLTERO', '7525664', '1', '175', 0),
(514, 574, 5034777, 'ACHF', 'ANAGUA', 'SANTOS', 'SOLTERO', '5631145', '1', '174', 0),
(515, 575, 5034782, 'ACHF', 'CASTRO', 'VELASCO', 'SOLTERO', '7487172', '1', '172', 0),
(516, 576, 5034795, 'ACHF', 'TAQUICHIRI', 'LOPEZ', 'SOLTERO', '6639653', '1', '178', 0),
(517, 577, 5034806, 'ACHF', 'VEDIA', 'URQUIZU', 'SOLTERO', '7485722', '1', '178', 0),
(518, 578, 5034821, 'ACHF', 'ZARATE', 'PATIÑO', 'SOLTERO', '12687008', '1', '177', 0),
(519, 579, 5034845, 'ACHF', 'YAMPARA', 'DURAN', 'SOLTERO', '10352230', '1', '176', 0),
(520, 580, 5034855, 'ACHF', 'ORELLANA', 'TERRAZAS', 'SOLTERO', '10422435', '1', '170', 0),
(521, 581, 5034866, 'ACHF', 'PANIAGUA', 'VILLANUEVA', 'SOLTERO', '7540726', '1', '172', 0),
(522, 582, 5034931, 'ACHF', 'MUÑOS', 'PORCEL', 'SOLTERO', '13654696', '1', '173', 0),
(523, 583, 5034940, 'ACHF', 'ROMERO', 'MARTINEZ', 'SOLTERO', '7517388', '1', '172', 0),
(524, 584, 5035044, 'ACHF', 'SEGOVIA', 'AGUIRRE', 'SOLTERO', '10362298', '1', '170', 0),
(525, 585, 5035059, 'ACHF', 'MARTINEZ', 'GUEVARA', 'SOLTERO', '7561347', '1', '180', 0),
(526, 586, 5035065, 'ACHF', 'POLO', 'CRUZ', 'SOLTERO', '5669425', '1', '175', 0),
(527, 587, 5035073, 'ACHF', 'ACHALA', 'OLIVERA', 'SOLTERO', '13089526', '1', '170', 0),
(528, 588, 5035086, 'ACHF', 'TAMAREZ', 'MENDEZ', 'SOLTERO', '9588559', '1', '183', 0),
(529, 589, 5035100, 'ACHF', 'FLORES', 'BARRIGA', 'SOLTERO', '10383873', '1', '175', 0),
(530, 590, 5035131, 'ACHF', 'RODRIGUEZ', 'AJA', 'SOLTERO', '10376496', '1', '177', 0),
(531, 591, 5035145, 'ACHF', 'ROSALES', 'LOPEZ', 'SOLTERO', '8195267', '1', '175', 0),
(532, 592, 5035188, 'ACHF', 'CUETO', 'VARGAS', 'SOLTERO', '7478901', '1', '176', 0),
(533, 593, 5035200, 'ACHF', 'MEDRANO', 'RAMIREZ', 'SOLTERO', '10351359', '1', '180', 0),
(534, 594, 5035207, 'ACHF', 'SERNICH', 'CESPEDES', 'SOLTERO', '7503072', '1', '185', 0),
(535, 595, 5035236, 'ACHF', 'OVANDO', 'GUZMAN', 'SOLTERO', '4118286', '1', '177', 0),
(536, 596, 5035244, 'ACHF', 'POZO', 'CIVERA', 'SOLTERO', '10381363', '1', '170', 0),
(537, 597, 5035251, 'ACHF', 'GIMENEZ', 'ABUAWAD', 'SOLTERO', '5651947', '1', '175', 0),
(538, 598, 5035256, 'ACHF', 'PAPUTSACHIS', 'SAINZ', 'SOLTERO', '7487023', '1', '174', 0),
(539, 599, 5035271, 'ACHF', 'JIMENEZ', 'QUINTANILLA', 'SOLTERO', '10343680', '1', '170', 0),
(540, 600, 5035280, 'ACHF', 'TIRADO', 'PINTO', 'SOLTERO', '7475229', '1', '173', 0),
(541, 601, 5035291, 'ACHF', 'MONTES', 'BLACUTT', 'SOLTERO', '8191691', '1', '176', 0),
(542, 602, 5035296, 'ACHF', 'GARRADO', 'BARRON', 'SOLTERO', '14106175', '1', '176', 0),
(543, 603, 5036334, 'ACHF', 'CHAVARRIA', 'CHAVARRIA', 'SOLTERO', '7504458', '1', '182', 0),
(544, 604, 5036346, 'ACHF', 'KALIMAN', 'RENE', 'SOLTERO', '5029225', '1', '183', 0),
(545, 605, 5036387, 'ACHF', 'BULUCUA', 'LOPEZ', 'SOLTERO', '5488120', '1', '180', 0),
(546, 606, 5036420, 'ACHF', 'CAMPOSANO', 'FLORES', 'SOLTERO', '7528454', '1', '175', 0),
(547, 607, 5036440, 'ACHF', 'PEÑARANDA', 'ECOS', 'SOLTERO', '7553482', '1', '175', 0),
(548, 608, 5036505, 'ACHF', 'GUZMAN', 'SANDOVAL', 'SOLTERO', '5693793', '1', '177', 0),
(549, 609, 5036526, 'ACHF', 'BASCOPE', 'LEON', 'SOLTERO', '7501719', '1', '173', 0),
(550, 610, 5036605, 'ACHF', 'PEDRAZA', 'BELLIDO', 'SOLTERO', '7468441', '1', '170', 0),
(551, 611, 5036642, 'ACHF', 'PUMA', 'MENDOZA', 'SOLTERO', '7845198', '1', '172', 0),
(552, 612, 5036703, 'ACHF', 'RICO', 'URQUIZU', 'SOLTERO', '5660984', '1', '179', 0),
(553, 613, 5037416, 'ACHF', 'VILLALTA', 'SENO', 'SOLTERO', '10392515', '1', '172', 0),
(554, 614, 5037423, 'ACHF', 'PEREIRA', 'VARGAS', 'SOLTERO', '7467362', '1', '173', 0),
(555, 615, 5037435, 'ACHF', 'CRUZ', 'ESPINOZA', 'SOLTERO', '10341607', '1', '178', 0),
(556, 616, 5038153, 'ACHF', 'MENDOZA', 'COLQUE', 'SOLTERO', '10401622', '1', '180', 0),
(557, 617, 5038213, 'ACHF', 'FLORES', 'SERRUDO', 'SOLTERO', '12395848', '1', '179', 0),
(558, 618, 5039439, 'ACHF', 'GUZMAN', 'DURAN', 'SOLTERO', '12366547', '1', '176', 0),
(559, 619, 5039503, 'ACHF', 'GUZMAN', 'DURAN', 'SOLTERO', '12518152', '1', '175', 0),
(560, 620, 5047283, 'ACHF', 'ARANCIBIA', 'COPA', 'SOLTERO', '10381800', '1', '172', 0),
(561, 621, 5047628, 'ACHF', 'CONDORI', 'QUISPE', 'SOLTERO', '6794428', '1', '175', 0),
(562, 622, 5055657, 'ACHF', 'LLANOS', 'JIMENEZ', 'SOLTERO', '10421778', '1', '178', 0),
(563, 623, 5055698, 'ACHF', 'AVALOS', 'ESQUIVEL', 'SOLTERO', '9125164', '1', '170', 0),
(564, 624, 5055725, 'ACHF', 'RENTERIA', 'ZUBIA', 'SOLTERO', '7511790', '1', '171', 0),
(565, 625, 5055930, 'ACHF', 'MAMANI', 'CHOQUE', 'SOLTERO', '8532577', '1', '172', 0),
(566, 626, 5055951, 'ACHF', 'QUISPE', 'LEON', 'SOLTERO', '10315727', '1', '178', 0),
(567, 627, 5055982, 'ACHF', 'GABRIEL', 'CERVANTES', 'SOLTERO', '8623683', '1', '175', 0),
(568, 628, 5056004, 'ACHF', 'BRAVO', 'BARRA', 'SOLTERO', '12547477', '1', '174', 0),
(569, 629, 5056023, 'ACHF', 'CARDOZO', '', 'SOLTERO', '7502390', '1', '175', 0),
(570, 630, 5056060, 'ACHF', 'SIVILA', 'MARISCAL', 'SOLTERO', '7567921', '1', '172', 0),
(571, 631, 5056078, 'ACHF', 'CARO', 'AGUILAR', 'SOLTERO', '8567729', '1', '180', 0),
(572, 632, 5056780, 'ACHF', 'FALON', 'MENDOZA', 'SOLTERO', '12518261', '1', '173', 0),
(573, 633, 5057053, 'ACHF', 'FLORES', 'RIVERA', 'SOLTERO', '7506729', '1', '175', 0),
(574, 634, 5057102, 'ACHF', 'ACHO', 'LEON', 'SOLTERO', '7553831', '1', '176', 0),
(575, 635, 5058303, 'ACHF', 'ESPADA', 'CARBAJAL', 'SOLTERO', '13219073', '1', '178', 0),
(576, 636, 5058342, 'ACHF', 'ZELAYA', 'AZURDUY', 'SOLTERO', '10325153', '1', '176', 0),
(577, 637, 5059088, 'ACHF', 'MARTINEZ', 'FERNANDEZ', 'SOLTERO', '7146358', '1', '175', 0),
(578, 638, 5059175, 'ACHF', 'SERRUDO', 'CARVAJAL', 'SOLTERO', '8195285', '1', '174', 0),
(579, 639, 5070860, 'ACHF', 'GUARACHI', 'CLAROS', 'SOLTERO', '1141076', '1', '177', 0),
(580, 640, 5073549, 'ACHF', 'CASILLAS', 'RUIZ', 'SOLTERO', '7521156', '1', '179', 0),
(581, 641, 5073826, 'ACHF', 'MEDRANO', 'BALCERA', 'SOLTERO', '13410915', '1', '182', 0),
(582, 642, 5073899, 'ACHF', 'MAMANI', 'SIERRA', 'SOLTERO', '13884824', '1', '178', 0);
INSERT INTO `jugador` (`id_jugador`, `id_persona`, `n_registro_fbf`, `lfpb_asociacion_liga_provincial`, `nombre_padre`, `nombre_madre`, `estado_civil`, `c_i`, `estado`, `estatura`, `cont_amarilla`) VALUES
(583, 643, 5073930, 'ACHF', 'CASIMIRO', 'BONIFACIO', 'SOLTERO', '4115083', '1', '172', 0),
(584, 644, 5077825, 'ACHF', 'SANCHEZ', 'LLAVE', 'SOLTERO', '5686915', '1', '176', 0),
(585, 645, 5078116, 'ACHF', 'IRALA', 'VALLE', 'SOLTERO', '3656245', '1', '180', 0),
(586, 646, 5080218, 'ACHF', 'CRUZ', 'DIAZ', 'SOLTERO', '10324895', '1', '182', 0),
(587, 647, 5080234, 'ACHF', 'CHAVARRIA', 'SERRUDO', 'SOLTERO', '7476016', '1', '174', 0),
(588, 648, 5080371, 'ACHF', 'MORALES', 'TRIGO', 'SOLTERO', '12932206', '1', '176', 0),
(589, 649, 5086156, 'ACHF', 'MAMANI', 'LOPEZ', 'SOLTERO', '10422587', '1', '178', 0),
(590, 650, 5086582, 'ACHF', 'FERNANDEZ', 'NEGRETE', 'SOLTERO', '7487836', '1', '172', 0),
(591, 651, 5093710, 'ACHF', 'ROCHA', 'ROMERO', 'SOLTERO', '7510151', '1', '176', 0),
(592, 652, 5093749, 'ACHF', 'MUÑOZ', 'AVENDAÑO', 'SOLTERO', '13955931', '1', '179', 0),
(593, 653, 5093778, 'ACHF', 'BENITO', 'BALDERRAMA', 'SOLTERO', '12427837', '1', '175', 0),
(594, 654, 5093997, 'ACHF', 'VEIZAGA', 'MIGUES', 'SOLTERO', '10326120', '1', '183', 0),
(595, 655, 5094029, 'ACHF', 'MAMANI', 'AGUDO', 'SOLTERO', '7494216', '1', '185', 0),
(596, 656, 5096145, 'ACHF', 'AÑAVIRI', 'SANCHEZ', 'SOLTERO', '10320238', '1', '172', 0),
(597, 657, 5096202, 'ACHF', 'ESPADA', 'SUAREZ', 'SOLTERO', '7552143', '1', '176', 0),
(598, 658, 5096404, 'ACHF', 'SANABRIA', 'LLALLI', 'SOLTERO', '7553337', '1', '175', 0),
(599, 659, 5096587, 'ACHF', 'BEJARANO', 'AVILES', 'SOLTERO', '5488506', '1', '179', 0),
(600, 660, 5096588, 'ACHF', 'CHUMACERO', 'PEÑARANDA', 'SOLTERO', '7515508', '1', '172', 0),
(601, 661, 5096590, 'ACHF', 'LOPEZ', 'GONZALES', 'SOLTERO', '4081088', '1', '173', 0),
(602, 662, 5096592, 'ACHF', 'PADILLA', 'AVALOS', 'SOLTERO', '7560867', '1', '175', 0),
(603, 663, 5096593, 'ACHF', 'VACA', 'PEÑARANDA', 'SOLTERO', '5631391', '1', '178', 0),
(604, 664, 5096596, 'ACHF', 'CARDENAS', 'PATZI', 'SOLTERO', '7499108', '1', '172', 0),
(605, 665, 5096597, 'ACHF', 'RUIZ', '', 'SOLTERO', '10305694', '1', '176', 0),
(606, 666, 5096598, 'ACHF', 'VEDIA', 'ZARATE', 'SOLTERO', '7513320', '1', '178', 0),
(607, 667, 5096599, 'ACHF', 'CAYO', 'ATA', 'SOLTERO', '7568510', '1', '185', 0),
(608, 668, 5096600, 'ACHF', 'PUQUI', 'BENITEZ', 'SOLTERO', '10343326', '1', '180', 0),
(609, 669, 5096602, 'ACHF', 'AÑAVIRI', 'SANCHEZ', 'SOLTERO', '10334866', '1', '188', 0),
(610, 670, 5096604, 'ACHF', 'PEREZ', 'LLANOS', 'SOLTERO', '5049573', '1', '182', 0),
(611, 671, 5096606, 'ACHF', 'GARECA', 'VARGAS', 'SOLTERO', '6583142', '1', '176', 0),
(612, 672, 5096609, 'ACHF', 'SARZURI', 'MAMANI', 'SOLTERO', '7515004', '1', '179', 0),
(613, 673, 5096611, 'ACHF', 'AVILA', 'CANO', 'SOLTERO', '5675384', '1', '175', 0),
(614, 674, 5096612, 'ACHF', 'MALDONADO', 'APARICIO', 'SOLTERO', '6346955', '1', '175', 0),
(615, 675, 5096614, 'ACHF', 'MORALES', 'CASTRO', 'SOLTERO', '12428099', '1', '170', 0),
(616, 676, 5096617, 'ACHF', 'FLORES', 'RODRIGUEZ', 'SOLTERO', '7207590', '1', '176', 0),
(617, 677, 5096618, 'ACHF', 'VACA', 'CUATA', 'SOLTERO', '9272397', '1', '174', 0),
(618, 678, 5096619, 'ACHF', 'CAMPOS', 'ANTEQUERA', 'SOLTERO', '10342010', '1', '174', 0),
(619, 679, 5096621, 'ACHF', 'ROMERO', 'VASQUEZ', 'SOLTERO', '7546477', '1', '178', 0),
(620, 680, 5098360, 'ACHF', 'ANDRADE', 'FLORES', 'SOLTERO', '8511627', '1', '176', 0),
(621, 681, 5101232, 'ACHF', 'RIVERO', 'MOYA', 'SOLTERO', '13613620', '1', '180', 0),
(622, 682, 5101415, 'ACHF', 'PINTO', 'BARRON', 'SOLTERO', '5679918', '1', '176', 0),
(623, 683, 5102706, 'ACHF', 'ALBA', 'LEON', 'SOLTERO', '5666809', '1', '178', 0),
(624, 684, 5102749, 'ACHF', 'MORALES', 'MARQUEZ', 'SOLTERO', '10422288', '1', '182', 0),
(625, 685, 5109372, 'ACHF', 'VALVERDE', 'GARABITO', 'SOLTERO', '10329861', '1', '174', 0),
(626, 686, 5109585, 'ACHF', 'FLORES', 'MERCADO', 'SOLTERO', '5663965', '1', '176', 0),
(627, 687, 5109589, 'ACHF', 'REJAS', 'SALAZAR', 'SOLTERO', '5668422', '1', '173', 0),
(628, 688, 5109591, 'ACHF', 'MIRANDA', 'DURAN', 'SOLTERO', '7518961', '1', '172', 0),
(629, 689, 5109852, 'ACHF', 'HUANCA', 'CALIZAYA', 'SOLTERO', '7479012', '1', '171', 0),
(630, 690, 5113508, 'ACHF', 'MOREIRA', 'ORTEGA', 'SOLTERO', '10423395', '1', '178', 0),
(631, 691, 5118791, 'ACHF', 'VILLCA', 'RODRIGUEZ', 'SOLTERO', '5113148', '1', '179', 0),
(632, 692, 5124074, 'ACHF', 'TORRES', 'TERAN', 'SOLTERO', '5489823', '1', '176', 0),
(633, 693, 5126150, 'ACHF', 'DAZA', 'MURILLO', 'SOLTERO', '7479390', '1', '178', 0),
(634, 694, 5126185, 'ACHF', 'FLORES', 'VARGAS', 'SOLTERO', '5666026', '1', '180', 0),
(635, 695, 5128054, 'ACHF', 'THAMES', 'SALAZAR', 'SOLTERO', '10330173', '1', '178', 0),
(636, 696, 5130178, 'ACHF', 'PINTO', 'LOAYZA', 'SOLTERO', '7519430', '1', '176', 0),
(637, 697, 5130261, 'ACHF', 'DURAN', 'HEREDIA', 'SOLTERO', '7534028', '1', '173', 0),
(638, 698, 5133768, 'ACHF', 'CHOQUE', 'PEREZ', 'SOLTERO', '12679869', '1', '175', 0),
(639, 699, 5133903, 'ACHF', 'CRUZ', 'SEGOVIA', 'SOLTERO', '7532822', '1', '183', 0),
(640, 700, 5133905, 'ACHF', 'BARRIENTOS', 'FRANCO', 'SOLTERO', '12426389', '1', '177', 0),
(641, 701, 5133907, 'ACHF', 'VELASQUEZ', 'ALCIBIA', 'SOLTERO', '7516770', '1', '180', 0),
(642, 702, 5133909, 'ACHF', 'VELASQUEZ', 'ALCIBIA', 'SOLTERO', '7500008', '1', '176', 0),
(643, 703, 5133910, 'ACHF', 'CHAVARRIA', 'ZELAYA', 'SOLTERO', '10367279', '1', '172', 0),
(644, 704, 5133911, 'ACHF', 'ZELAYA', 'CHAVARRIA', 'SOLTERO', '7497375', '1', '179', 0),
(645, 705, 5133914, 'ACHF', 'DIAZ', 'VELASCO', 'SOLTERO', '12517460', '1', '178', 0),
(646, 706, 5133916, 'ACHF', 'CALVIMONTES', 'AGUILAR', 'SOLTERO', '12642020', '1', '175', 0),
(647, 707, 5133922, 'ACHF', 'PEREIRA', 'GARCIA', 'SOLTERO', '9272181', '1', '172', 0),
(648, 708, 5134921, 'ACHF', 'GUTIERREZ', 'VELA', 'SOLTERO', '10310211', '1', '173', 0),
(649, 709, 5135239, 'ACHF', 'MOSCOSO', 'ALBA', 'SOLTERO', '12566130', '1', '175', 0),
(650, 710, 5136042, 'ACHF', 'NAVARRO', 'AGUILAR', 'SOLTERO', '7532581', '1', '176', 0),
(651, 711, 5138107, 'ACHF', 'BARRIGA', 'MOSCOSO', 'SOLTERO', '7522382', '1', '175', 0),
(652, 712, 5138360, 'ACHF', 'CESPEDES', 'CHACON', 'SOLTERO', '10314333', '1', '172', 0),
(653, 713, 5138375, 'ACHF', 'PEREZ', 'SERRUDO', 'SOLTERO', '10338623', '1', '173', 0),
(654, 714, 5140426, 'ACHF', 'MENDOZA', 'GONZALES', 'SOLTERO', '10340618', '1', '180', 0),
(655, 715, 5142903, 'ACHF', 'ROJAS', 'MEDRANO', 'SOLTERO', '10340842', '1', '178', 0),
(656, 716, 5142929, 'ACHF', 'MEDINA', 'LOAYZA', 'SOLTERO', '10321599', '1', '173', 0),
(657, 717, 5142940, 'ACHF', 'BEJARANO', 'AVILES', 'SOLTERO', '7557090', '1', '172', 0),
(658, 718, 5142999, 'ACHF', 'NAVARRO', 'LEDEZMA', 'SOLTERO', '7567486', '1', '178', 0),
(659, 719, 5143053, 'ACHF', 'HUARINA', 'MENDOZA', 'SOLTERO', '7571267', '1', '176', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `id_menu_principal` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE latin1_spanish_ci NOT NULL,
  `directorio` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `icono` varchar(70) COLLATE latin1_spanish_ci DEFAULT NULL,
  `imagen` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `color` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `estado` set('1','0') COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `id_menu_principal`, `nombre`, `directorio`, `icono`, `imagen`, `color`, `orden`, `estado`) VALUES
(1, 1, 'Trasferencias', 'jugador/transferencias', '1', '1', '1', 1, NULL),
(2, 1, 'Registrar Jugador', 'registro/jugador', NULL, NULL, NULL, NULL, NULL),
(3, 1, 'Curriculo_Jugador', 'Curriculo', '4', '4', '4', 4, NULL),
(5, 2, 'Club', 'registro/club', NULL, NULL, NULL, NULL, NULL),
(6, 2, 'Categoria', 'registro/categoria', NULL, NULL, NULL, NULL, NULL),
(7, 2, 'Torneo', 'Torneo', '2', '2', '2', 2, NULL),
(8, 2, 'Equipo', 'registro/equipo', NULL, NULL, NULL, NULL, NULL),
(9, 2, 'Registrar una categoria de un club', 'registro/equipo_jugador', NULL, NULL, NULL, NULL, NULL),
(10, 3, 'Estadios', 'registro/estadio', NULL, NULL, NULL, NULL, NULL),
(12, 4, 'Categoria', 'Categoria', '2', '2', '2', 2, NULL),
(13, 4, 'Sorteos', 'planillero', '6', '6', '6', 6, NULL),
(14, 4, 'Rol de partidos', 'planillero/rol_partidos', '7', '7', '7', 7, NULL),
(15, 4, 'Tabla de Posiciones', 'planillero/tabla_posiciones', NULL, NULL, NULL, NULL, NULL),
(16, 4, 'Torneo', 'registro/torneo', NULL, NULL, NULL, NULL, NULL),
(17, 5, 'Categoria_Arbitro', 'Categoria_Arbitro', '1', '1', '1', 1, NULL),
(18, 5, 'Árbitro', 'registro/arbitro', NULL, NULL, NULL, NULL, NULL),
(19, 5, 'Categoría de árbitro', 'registro/categoria_arbitro', NULL, NULL, NULL, NULL, NULL),
(20, 5, 'Partidos de árbitro', 'registro/partidos_arbitro', NULL, NULL, NULL, NULL, NULL),
(21, 5, 'Planillero', 'registro/planillero', NULL, NULL, NULL, NULL, NULL),
(22, 5, 'Asignacion de árbitros', 'planillero/asignacion_arbitros', NULL, NULL, NULL, NULL, NULL),
(24, 7, 'Inscripciones', 'registro/torneo_equipo', NULL, NULL, NULL, NULL, NULL),
(25, 7, 'Concepto de...', 'registro/concepto', NULL, NULL, NULL, NULL, NULL),
(26, 7, 'Pagos', 'planillero/pagos', NULL, NULL, NULL, NULL, NULL),
(27, 7, 'Asignar precios', 'registro/precio_concepto', NULL, NULL, NULL, NULL, NULL),
(29, 8, 'Persona', 'registro/persona', NULL, NULL, NULL, 2, '1'),
(30, 9, 'Persona - Cargo', 'registro/persona_cargo', NULL, NULL, NULL, 1, '1'),
(31, 9, 'Roles', 'registro/roles', NULL, NULL, NULL, 1, ''),
(32, 9, 'Asignacion roles', 'registro/persona_roles', NULL, NULL, NULL, NULL, ''),
(34, 10, 'Menu principal', 'registro/menus_principales', NULL, NULL, NULL, NULL, ''),
(35, 10, 'Submenus', 'registro/menus', NULL, NULL, NULL, NULL, ''),
(36, 10, 'Asignacion Menu Prin.', 'registro/roles_menus_principales', NULL, NULL, NULL, NULL, '1'),
(37, 10, 'Asignacion menu usuario', 'Menu_Opciones/asignacion', NULL, NULL, NULL, NULL, '1'),
(38, 4, 'Habilitar jugadores', 'planillero/habilitacion', NULL, NULL, NULL, NULL, '1'),
(39, 8, 'Cambiar contraseña', 'registro/usuario', NULL, NULL, NULL, NULL, NULL),
(40, 11, 'PAGOS', 'reporte/detalle', NULL, NULL, NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus_principales`
--

CREATE TABLE `menus_principales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE latin1_spanish_ci NOT NULL,
  `icono` varchar(70) COLLATE latin1_spanish_ci DEFAULT NULL,
  `color` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `estado` set('1','0') COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
(10, 'Menu-Usuario', '10', '10', 10, '1'),
(11, 'REPORTES', '11', '11', 11, '1');

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
(19, 'PAGO POR DERECHOS DE PASE DE JUGADOR DE PROVINCIA REGISTRADO EN LA F. B. F.'),
(20, 'PAGO POR PASES EN PROPIEDAD DE JUGADORES (CLUBES DESAPARECIDOS)'),
(21, '1 AMARILLA'),
(22, '2 AMARILLA'),
(23, '3 AMARILLA'),
(24, '4 AMARILLA'),
(25, '5 AMARILLA'),
(26, '6 AMARILLA'),
(27, '7 AMARILLA'),
(28, '8 AMARILLA'),
(29, '9 AMARILLA'),
(30, '10 AMARILLA'),
(31, '1 WALKOVER (W. O.)'),
(32, '2 WALKOVER (W. O.)'),
(33, '2 WALKOVER (W. O.)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `monto` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_precioconcepto` int(11) NOT NULL,
  `id_pagogeneral` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `monto`, `cantidad`, `id_precioconcepto`, `id_pagogeneral`) VALUES
(1, 5, 1, 379, 1),
(2, 500, 1, 1, 2),
(3, 100, 2, 43, 3),
(4, 1000, 1, 44, 3),
(5, 450, 1, 297, 4),
(6, 1500, 1, 519, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagogeneral`
--

CREATE TABLE `pagogeneral` (
  `id_pagogeneral` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `montototal` float NOT NULL,
  `observacion` text COLLATE latin1_spanish_ci,
  `id_inscripcionequipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `pagogeneral`
--

INSERT INTO `pagogeneral` (`id_pagogeneral`, `fecha`, `montototal`, `observacion`, `id_inscripcionequipo`) VALUES
(1, '2020-06-30', 5, '', 2),
(2, '2020-06-30', 500, '', 2),
(3, '2020-06-30', 1100, '', 2),
(4, '2020-06-30', 450, '', 2),
(5, '2020-06-30', 1500, '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id_partidos` int(11) NOT NULL,
  `jornada` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `observaciones` varchar(350) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_planillero` int(11) DEFAULT NULL,
  `id_inscripcion1` int(11) NOT NULL,
  `id_inscripcion2` int(11) NOT NULL,
  `id_estadio` int(11) DEFAULT NULL,
  `id_torneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id_partidos`, `jornada`, `fecha`, `observaciones`, `estado`, `id_planillero`, `id_inscripcion1`, `id_inscripcion2`, `id_estadio`, `id_torneo`) VALUES
(1, 1, '2020-06-25 03:33:00', NULL, 1, 5, 2, 1, 2, 1),
(2, 1, NULL, NULL, NULL, NULL, 7, 5, NULL, 1),
(3, 1, NULL, NULL, NULL, NULL, 8, 4, NULL, 1),
(4, 1, NULL, NULL, NULL, NULL, 9, 3, NULL, 1),
(5, 2, NULL, NULL, NULL, NULL, 3, 1, NULL, 1),
(6, 2, NULL, NULL, NULL, NULL, 7, 6, NULL, 1),
(7, 2, NULL, NULL, NULL, NULL, 8, 5, NULL, 1),
(8, 2, NULL, NULL, NULL, NULL, 9, 4, NULL, 1),
(9, 3, NULL, NULL, NULL, NULL, 3, 2, NULL, 1),
(10, 3, NULL, NULL, NULL, NULL, 4, 1, NULL, 1),
(11, 3, NULL, NULL, NULL, NULL, 8, 6, NULL, 1),
(12, 3, NULL, NULL, NULL, NULL, 9, 5, NULL, 1),
(13, 4, NULL, NULL, NULL, NULL, 4, 2, NULL, 1),
(14, 4, NULL, NULL, NULL, NULL, 5, 1, NULL, 1),
(15, 4, NULL, NULL, NULL, NULL, 8, 7, NULL, 1),
(16, 4, NULL, NULL, NULL, NULL, 9, 6, NULL, 1),
(17, 5, NULL, NULL, NULL, NULL, 4, 3, NULL, 1),
(18, 5, NULL, NULL, NULL, NULL, 5, 2, NULL, 1),
(19, 5, NULL, NULL, NULL, NULL, 6, 1, NULL, 1),
(20, 5, NULL, NULL, NULL, NULL, 9, 7, NULL, 1),
(21, 6, NULL, NULL, NULL, NULL, 5, 3, NULL, 1),
(22, 6, NULL, NULL, NULL, NULL, 6, 2, NULL, 1),
(23, 6, NULL, NULL, NULL, NULL, 7, 1, NULL, 1),
(24, 6, NULL, NULL, NULL, NULL, 9, 8, NULL, 1),
(25, 7, NULL, NULL, NULL, NULL, 5, 4, NULL, 1),
(26, 7, NULL, NULL, NULL, NULL, 6, 3, NULL, 1),
(27, 7, NULL, NULL, NULL, NULL, 7, 2, NULL, 1),
(28, 7, NULL, NULL, NULL, NULL, 8, 1, NULL, 1),
(29, 8, NULL, NULL, NULL, NULL, 6, 4, NULL, 1),
(30, 8, NULL, NULL, NULL, NULL, 7, 3, NULL, 1),
(31, 8, NULL, NULL, NULL, NULL, 8, 2, NULL, 1),
(32, 8, NULL, NULL, NULL, NULL, 9, 1, NULL, 1),
(33, 9, NULL, NULL, NULL, NULL, 6, 5, NULL, 1),
(34, 9, NULL, NULL, NULL, NULL, 7, 4, NULL, 1),
(35, 9, NULL, NULL, NULL, NULL, 8, 3, NULL, 1),
(36, 9, NULL, NULL, NULL, NULL, 9, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombres` varchar(70) COLLATE latin1_spanish_ci DEFAULT NULL,
  `apellido_paterno` varchar(70) COLLATE latin1_spanish_ci DEFAULT NULL,
  `apellido_materno` varchar(70) COLLATE latin1_spanish_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE latin1_spanish_ci DEFAULT 'user.jpg',
  `telefono` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `celular` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `dirección` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(1) COLLATE latin1_spanish_ci DEFAULT NULL,
  `profesión` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nacionalidad` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `email` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `usuario` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `password` varchar(250) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombres`, `apellido_paterno`, `apellido_materno`, `foto`, `telefono`, `celular`, `dirección`, `ciudad`, `fecha_nacimiento`, `sexo`, `profesión`, `nacionalidad`, `email`, `usuario`, `password`) VALUES
(1, 'Carlos Alfredo', 'Ortega', 'Orellana', '3fb0a-avatar5.png', '064-65425', '60322860', 'Ostria Reyes # 125', NULL, '2000-02-02', 'M', 'Estudiante', 'bolivia', 'admin@gmail.com', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(2, 'OSCAR', 'LOREDO', 'ESPAÑA', '', '064-4489106', '75689436', 'Ostria Reyes # 125', 'CHUQUISACA', '1960-08-06', 'M', 'ABOGADO', 'BOLIVIA', 'presi@gmail.com', 'presi', '123456'),
(3, 'REYNA', 'LOPEZ', 'ROZALES', '', '064-4489106', '75689436', 'Ostria Reyes # 125', 'CHUQUISACA', '1963-12-01', 'F', 'SECRETARIA', 'BOLIVIA', 'secre@gmail.com', 'secre', '123456'),
(4, 'TANIA', 'LINARES', 'CASTRO', '', '064-4489106', '75689436', 'Ostria Reyes # 125', 'CHUQUISACA', '1989-05-06', 'F', 'CONTADORA', 'BOLIVIA', 'conta@gmail.com', 'conta', '123456'),
(5, 'JOSE LUIS', 'ROSALES', 'ARANA', '', '064-4489106', '75689436', 'Ostria Reyes # 125', 'CHUQUISACA', '1962-10-22', 'M', 'PROFESOR', 'BOLIVIA', 'profe@gmail.com', 'profemenores', '123456'),
(6, 'SAID', 'SALAZAR', 'CUEVAS', '', '064-4489106', '75689436', 'Ostria Reyes # 125', 'CHUQUISACA', '1969-09-20', 'M', 'PROFESOR', 'BOLIVIA', 'profe@gmail.com', 'profe', '123456'),
(7, 'GUIDO', 'LOAYZA', 'MARIACA', '', '064-4489106', '75689436', 'Ostria GUTIERREZ # 585', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(8, 'CESAR', 'SALINAS', 'SINKA', '', '064-4489106', '75689436', 'PANDO # 321', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(9, 'MARCELO', 'FLORES', 'TORRICO', '', '064-4489106', '75689436', 'AV. LIBERTADORES # 12', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(10, 'JUAN ALFREDO', 'JORDAN', 'ROMERO', '', '064-4244982', '60322860', 'MARCELO QUIROGA # 225', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(11, 'GROVER', 'VARGAS', '', '', '064-4244982', '60322860', 'SONA LAJASTAMBO # 1115', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(12, 'JOSE', 'ERNESTO', 'ALVARES', '', '064-4244982', '60322860', 'CANADA # 2225', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(13, 'MARIO FRANKLIN', 'CHAVEZ', 'MENDEZ', '', '064-4244982', '60322860', 'JUNIN # 1325', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(14, 'JENNI', 'MONTAÑO', '', '', '064-4244982', '60322860', 'GERMAN BUCHS # 925', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(15, 'EDUARDDO', 'RIVERO', 'ZURITA', '', '064-4244982', '60322860', 'RUMI RUMI # 525', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(16, 'CALIXTO', 'SANTOS', 'JAVIER', '', '064-4244982', '60322860', 'CANELAS # 55', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(17, 'WILFREDO', 'CONDORI', 'URDINDINEA', '', '064-4244982', '60322860', 'GARCILAZO # 7125', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(18, 'RAFAL', 'PAZ', 'HURTADO', '', '064-4244982', '60322860', 'RAUL OTERO # 785', 'CHUQUISACA', '2000-02-02', 'M', 'ESTUDIANTE', 'BOLIVIA', 'admin@gmail.com', 'admin', '123456'),
(19, 'CAROLINA', 'ARANCIBIA', 'CARRASCO', '', '064-4244982', '74402507', 'ABAROA # 325', 'CHUQUISACA', '2000-02-26', 'F', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(20, 'EDSON ANTONIO', 'CANEDO', 'REJAS', '', '064-4244982', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1994-01-10', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(21, 'HERIBERTO', 'CARMONA', 'CANAVIRI', '', '064-4244982', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1998-02-18', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(22, 'IVAN', 'CASTILLO', 'MORA', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1996-08-14', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(23, 'JUAN CARLOS', 'CASTILLO', 'MORA', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1994-06-16', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(24, 'SERGIO', 'CASTILLO', 'MORA', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1998-06-04', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(25, 'SIMON', 'CHOQUE', 'CALIZAYA', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1989-10-06', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(26, 'YANDER', 'CHOQUE', 'ZARATE', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '2001-01-01', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(27, 'ZUNILDA', 'CHOQUE', 'SAIGUA', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '2000-05-08', 'F', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(28, 'SAMUEL JERSON', 'CHUCA', 'VALDA', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '2000-06-04', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(29, 'KEVIN ALEXANDER', 'CONDORI', 'CASTRO', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '2000-07-06', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(30, 'MARIO', 'CONDORI', 'PEÑARANDA', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1996-05-25', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(31, 'ALVARO MAURICIO', 'COPA', 'JANCO', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1995-01-15', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(32, 'CIRILO', 'CRUZ', 'PEREZ', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1990-03-18', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(33, 'MARIA NELY', 'CRUZ', 'LOPEZ', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1998-01-01', 'F', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(34, 'JOSE BENITO', 'DAZA', 'CAZON', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1998-09-23', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(35, 'LUCAS CHRISTIAN', 'DIAZ', 'MARTINEZ', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '2001-04-24', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(36, 'ROLANDO', 'DIAZ', 'SERRUDO', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1995-09-04', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(37, 'MARIA JESUS', 'DURAN', 'FLORES', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1999-06-18', 'F', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(38, 'ANGEL', 'FLORES', 'CALDERON', '', '064-4488600', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1977-01-27', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(39, 'ANGEL', 'FLORES', '', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1990-01-01', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(40, 'GREGORIO', 'FLORES', 'LOMAR', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1995-08-28', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(41, 'JONATHAN CARLOS', 'FLORES', 'ROMERO', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '2000-04-14', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(42, 'MARVIN ANGEL', 'GALVAN', 'OROPEZA', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1987-01-12', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(43, 'ROLANDO ARIEL', 'GOMEZ', 'GARCIA', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1998-01-02', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(44, 'NELSON', 'HUARAYO', 'CONDORI', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1984-09-16', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(45, 'DAVID', 'JANCO', 'FLORES', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1995-04-12', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(46, 'JOSE JAIME', 'JORDAN', 'GALLARDO', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1978-03-05', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(47, 'AGUSTIN', 'LLANQUE', 'LLANQUE', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1978-11-30', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(48, 'CIRO ADRIAN', 'MACHUCA', 'HUARACHI', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1997-12-09', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(49, 'GERARDINO ORACIO', 'MAMANI', 'CHAUCA', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1996-07-28', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(50, 'JUAN CARLOS', 'MAMANI', 'QUISPE', '', '064-4245890', '74402507', 'ABAROA # 325', 'CHUQUISACA', '1990-12-12', 'M', 'ARBITRO', 'BOLIVIA', 'arbitro@gmail.com', 'arbitro', '123456'),
(51, 'KEVIN', 'MAMANI', 'CHOQUE', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '2000-01-09', 'M', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(52, 'RAUL', 'MAMANI', 'COPA', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '2000-08-26', 'M', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(53, 'ADOLFO', 'MARTINEZ', 'VARGAS', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '1972-12-10', 'M', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(54, 'JUAN CARLOS', 'MEDRANO', 'HURTADO', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '1997-08-28', 'M', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(55, 'HERIBERTO', 'MOSTAJO', 'SAIGUA', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '1999-06-16', 'M', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(56, 'ROGER BETTO', 'MOSTAJO', 'SAIGUA', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '1996-08-08', 'M', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(57, 'EMAIL JHOVANA', 'OLIVERA', 'DURAN', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '2000-09-12', 'F', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(58, 'MANUEL ALEJANDRO', 'ORTUBE', 'MARIN', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '1990-01-01', 'M', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(59, 'AIDA', 'PACO', 'CHIRULLA', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '1998-06-24', 'F', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(60, 'JAVIER JOSE', 'REYES', 'MENDOZA', '', '064-61633', '67373967', 'ESPAÑA # 389', 'CHUQUISACA', '1991-04-03', 'M', 'PLANILLERO', 'BOLIVIA', 'plani@gmail.com', 'planillero', '123456'),
(61, 'JESUS JHONNY', 'PETERITO', 'CHOQUE', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(62, 'SANTIAGO DANIEL', 'ARANCIBIA', 'SERRUDO', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(63, 'EDSON DAVID', 'PERKA', 'ESTRADA', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(64, 'LIMBER', 'GOMEZ', 'LLANQUE', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(65, 'ANGEL CAMILO', 'ROCHA ', 'MONTAÑO', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(66, 'ALEXANDER', 'SANCHEZ', 'CHILE', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(67, 'ISAAC', 'NINACHI', 'GUERRERA', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(68, 'JUAN CARLOS', 'HIGUERAS', 'MAYAN', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(69, 'RUBEN DARIO', 'SANDI', 'ORTIZ', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(70, 'CRUSITO JAIRO', 'MOSCOSO', 'VILLAGRA', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(71, 'SANTIAGO EXEQUIEL', 'BEIZAGA', 'NOYA', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(72, 'ERLAND MAURICIO', 'MONASTERIOS', 'ROJAS', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(73, 'JOEL', 'CORIA', 'MAMANI', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(74, 'RIKY MARTI', 'QUISPE', 'MONASTERIOS', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(75, 'ELOY', 'CHAVARRIA', 'SANTUNI', '', '064-47020', '68707163', 'SEBASTIAN PAGADOR # 33', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'bolivar@gmail.com', '', ''),
(76, 'JUAN EDWIN', 'MAMANI', 'PEREZ', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(77, 'DANIEL MAURICIO', 'TELLEZ', 'DURAN', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(78, 'ALDRIN KEIDER', 'CUELLAR', 'BARRIGA', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(79, 'AHILTON', 'VARGAS', 'LOAYZA', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(80, 'MIGUEL', 'ALARCON', 'VARGAS', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(81, 'JUAN CARLOS', 'AGUILAR', 'MAMANI', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(82, 'JOSE', 'CHOQUERIME', 'LLANQUE', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(83, 'FAVIO MARIANO', 'MUÑOZ', 'CARDOZO', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(84, 'FARYD MAURICIO', 'CORDERO', 'GONZALEZ', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(85, 'FABRICIO', 'TARDIO', 'RIVERO', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(86, 'FERNANDO YASSIR', 'SELAEZ', 'CABRERA', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(87, 'JORGE LUIS', 'CHUMACERO', 'CUETO', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(88, 'SAUL ALEJANDRO', 'OÑA', 'QUIROGA', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(89, 'LUIS FERNANDO', 'MARTINEZ ', 'IBAÑEZ', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(90, 'JHOJAN KELVIN', 'BERNAL', 'ECHALAR', '', '064-25861', '75016908', 'ADOLFO VILLAR # 192', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'stromgest@gmail.com', '', ''),
(91, 'LUIS MIGUEL', 'CHURQUI', 'PEÑAS', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(92, 'NEISER ALDAIR', 'CABALLERO', 'VALDA', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(93, 'JOSUE AUGUSTO', 'VARGAS', 'LLAVE', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(94, 'OSCAR DIEGO', 'BUEZO', 'VALDA', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(95, 'BRAYAN YHAMIL', 'CUENCA', 'AVILA', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(96, 'CRISTIAN ADIMIR', 'VERA', 'ACEBO', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(97, 'DIEGO', 'FERRUFINO', 'PADILLA', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(98, 'MAURICIO JOSUE', 'TUMIRI', 'TARQUE', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(99, 'JOSE', 'SORIA', 'LIMACHI', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(100, 'ARIEL JAIME', 'SUAREZ', 'SOLIZ', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(101, 'DIEGO HERNAN', 'ARANDO', 'SAAVEDRA', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(102, 'VICTOR HUGO', 'HONORIO', 'ACEBO', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(103, 'LIMBER JOSE', 'MAMANI', 'RODRIGUEZ', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(104, 'JEREMICK', 'BEJARANO', 'MONRROY', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(105, 'JOSE ABDIEL', 'SAAVEDRA', 'HERVAS', '', '064-24052', '60046961', 'AV. LOS ANDES # 366', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'sanjose@gmail.com', '', ''),
(106, 'HENRY', 'MARTINEZ', 'PORTILLO', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(107, 'CRISTIAN', 'KALLATA', 'ROMERO', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(108, 'KEVIN XAVIER', 'CRUZ', 'MARTINEZ', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(109, 'LUIS FERNANDO', 'MARTINEZ', 'TORREZ', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(110, 'CARLOS DANIEL', 'TORRES', 'GONZALES', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(111, 'JHON ALEX', 'ORELLANA', 'CALZADILLA', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(112, 'EDVIN', 'VILLCA', 'TORRIJON', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(113, 'RAUL ESTEBAN', 'HERNANI', 'BUSTILLO', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(114, 'JHOEL JHERAL', 'RENDON', 'RIVERA', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(115, 'BRAYAN', 'YUCRA', 'MATURANO', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(116, 'JUAN DAVID', 'LIMACHI', 'ROJAS', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(117, 'DIEGO ALEJANDRO', 'QUEVEDO', 'DAZA', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(118, 'JAVIER ALEJANDRO', 'DAZA', 'PARDO', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(119, 'JOSE PABLO', 'QUEVEDO', 'DAZA', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(120, 'DIEGO ALEJANDRO', 'SERRUDO', 'ORTIZ', '', '064-44121', '65837972', 'PANDO # 1256', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'blooming@gmail.com', '', ''),
(121, 'LUIS ALBERTO', 'PAZ', 'RODRIGUEZ', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(122, 'JULIO MAURICIO', 'FLORES', 'MATIENZO', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(123, 'HERLAN', 'QUINTANA', 'CHOQUE', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(124, 'SEBASTIAN', 'GONZALES', 'TITO', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(125, 'JORGE DAVID', 'CONDORI', 'LEON', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(126, 'JOSE GABRIEL', 'MARTINEZ', 'SALAMANCA', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(127, 'EMANUEL RODRIGO', 'PINTO', 'ROMERO', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(128, 'JORGE LUIS', 'QUISPE', 'ZARATE', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(129, 'OSCAR GRABRIEL', 'QUISPE', 'ZARATE', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(130, 'ROLANDO', 'RAMOS', 'DAZA', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(131, 'JHONATAN LUCAS', 'ZARATE', 'CONTRERAS', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(132, 'DANIEL YEFERSON', 'SENO', 'FLORES', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(133, 'MASUD SESBASTIAN', 'TAPIA', 'CASTILLO', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(134, 'JORGE LUIS', 'CANASI', 'MAMANI', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(135, 'JHAROLD ALVARO', 'GARCIA ', 'ESPINDOLA', '', '064-37701', '76175322', 'HERNANDO SILES # 21', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'wilster@gmail.com', '', ''),
(136, 'BENJAMIN DAVID', 'LAIME', 'AYAVIRI', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(137, 'JOSE ROLANDO', 'MENDOZA', 'CORTEZ', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(138, 'NEDSER SNEYDER', 'TRUJILLO', 'CAMPOS', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(139, 'MOISES YURI', 'ALIAGA', 'CALLE', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(140, 'ALVARO', 'YUCRA ', 'SERRUDO', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(141, 'SANTIAGO RAFAEL', 'ARDILES', 'JALDIN', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(142, 'HUGO NICOLAS', 'ARDILES', 'JALDIN', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(143, 'MIJAEL', 'SANCHEZ', 'RAMOS', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(144, 'KEVIN JHONATAN', 'RENGIFO', 'AMADOR', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(145, 'SAUL NAHUEL', 'VILLCA', 'CORONADO', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(146, 'FRANCLIN', 'TORIHUANO', 'CLEMENTE', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(147, 'GUSTAVO', 'ESCALIER', 'GONZALES', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(148, 'ANGEL', 'BELTRAN', 'CHOQUE', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(149, 'PAUL IVAN', 'BALLESTEROS', 'QUICHU', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(150, 'JUAN', 'OCHOA', 'AYARACHI', '', '064-63032', '69617871', 'ARENALES # 33521', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'oriente@gmail.com', '', ''),
(151, 'CARLOS ESTEBAN', 'SILVA', 'LAIME', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2025-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(152, 'JAIR ANTONIO', 'GOMEZ', 'MOLANDO', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2020-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(153, 'NONATO ARIEL', 'CABRERA', '', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2007-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(154, 'EDINSON POOL', 'VILLEGAS', 'CALLIRGOS', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2011-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(155, 'EDSON ARANTES', 'BELALCASAR', 'POLO', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2021-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(156, 'DANIEL CRISTIAN', 'MORALES', 'ESCOJA', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2022-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(157, 'ETSON', 'LEDEZMA', 'MAMANI', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2006-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(158, 'JEAN WICHEKAR', 'JEAN', '', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(159, 'DILAN MARCOS', 'GARCIA', 'CHOQUE', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2002-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(160, 'JOSE DIEGO', 'OLIVA', 'SAAVEDRA', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(161, 'GUIDO', 'CAYO', 'CRUZ', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2015-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(162, 'CRISTHIAN RODRIGO', 'CHOQUE', 'MORA', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2004-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(163, 'JOSE MARTIN', 'LLAMPA', 'CRUZ', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2020-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(164, 'YESIT', 'MARTINEZ', 'SALAZAR', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2031-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(165, 'JOSE ANDRES', 'SALVATIERRA', 'SOTO', '', '064-34050', '77788412', 'DESTACAMENTO 317 # 140', 'CHUQUISACA', '2010-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(166, 'JHONATAN', 'CUETO', 'AVENDAÑO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(167, 'MELVIN RAMIRO', 'CRUZ', 'AVILA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(168, 'ALEXANDER', 'EYZAGUIRRE', 'URDININEA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2016-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(169, 'JOEL', 'CUELLAR', 'MARCOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(170, 'SAID HILARION', 'VELASQUEZ', 'FELIPEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2024-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(171, 'RONALD HENRY', 'SANABRIA', 'LLALLI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2027-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(172, 'LUIS	RIOS', 'FLORES', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2021-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(173, 'YASSIR ENRIQUE', 'GALLARDO', 'MENDEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2009-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(174, 'GABRIEL', 'SANCHEZ', 'LLAVE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2009-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(175, 'LUIS DIEGO', 'FLORES', 'CORTEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(176, 'BRAYAN ANTONIO', 'GONZALES', 'ESPADA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(177, 'FRICKMAR DANIEL', 'AGUILAR', 'BALCAZAR', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2009-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(178, 'SAMUEL', 'LAIME', 'QUISPE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(179, 'EDSON JAVIER', 'FUENTES', 'SAIGUA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(180, 'ABEL', 'AYAVIRI', 'LLANQUE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2008-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(181, 'DANIEL', 'FERRUFINO', 'PADILLA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2010-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(182, 'PERCY', 'MORALES', 'CHOQUE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(183, 'SERGIO LEONEL', 'VASQUEZ', 'PINTO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(184, 'JHOJAN ALEJANDRO', 'JIMENEZ', 'SANDY', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2019-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(185, 'EDUARDO', 'FLORES', 'SERRUDO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(186, 'BENITO', 'AGUIRRAYA', 'BRAVO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2005-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(187, 'MIGUEL', 'IBARRA', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2002-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(188, 'ADOLFO', 'CONDO', 'GUTIERREZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2021-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(189, 'OSMAR GABRIEL', 'VELA', 'MORALES', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2009-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(190, 'LUIS', 'CANAVIRI', 'LAYME', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2015-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(191, 'LUIS FERNANDO', 'ESPINOZA', 'TABOADA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2001-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(192, 'ALVARO', 'QUISPE', 'DELGADO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2011-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(193, 'SAMUEL DORIAN', 'HUANCO', 'MAMANI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(194, 'HERNAN', 'PACHECO', 'MAMANI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2006-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(195, 'SAMUEL', 'AUZA', 'ALVAREZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2015-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(196, 'DERLIS KEVIN', 'ARCIENEGA', 'MARTINEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(197, 'EDGAR', 'SAIGUA', 'COLQUE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(198, 'BIMAN RIQUELMO', 'CHAMBI', 'CANASI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(199, 'MISAEL FRANCO', 'CONTRERAS', 'ANTEZANA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(200, 'SERGIO', 'CHIRARI', 'CHOQUE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(201, 'CHRISTIAN', 'VALLEJOS', 'TAPIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2031-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(202, 'SILVERTH DARIO', 'CONDORI', 'HUANCA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2007-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(203, 'ALEX FERNANDO', 'ABAN', 'POMACUSI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2028-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(204, 'JAVIER', 'PICHA', 'PUMA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2016-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(205, 'ELIAS GRABRIEL', 'MANCILLA', 'VARGAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2029-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(206, 'CRISTIAN ALVARO', 'LLANOS', 'CORAITE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(207, 'ROLANDO NORBERTO', 'SEÑA', 'LIMACHI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2016-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(208, 'BRAYAN RODRIGO', 'CERVANTES', 'FERNANDEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(209, 'EDWIN', 'ARANCIBIA', 'BERNAL', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2015-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(210, 'WILBER', 'ACHO', 'QUINTANILLA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2005-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(211, 'JOSE ANTONIO', 'GONZALES', 'RAMOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2003-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(212, 'JOSE MANUEL', 'ZARATE', 'TORREZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2030-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(213, 'MAURICIO', 'ARQUEZ', 'AYALA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2009-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(214, 'CRISTIAN EZEQUIEL', 'GALEAN', 'PACO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2007-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(215, 'JHONNY', 'TORRES', 'SOICA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(216, 'JUAN CARLOS', 'GALLARDO', 'QUISPE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2022-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(217, 'JORGE ROBERTO', 'CORONADO', 'TABORGA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(218, 'KEVIN MICHAEL', 'HIGUERAS', 'MAMANI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2007-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(219, 'JHAMIL PABLO', 'CALLAHUARA', 'POVEDA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2010-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(220, 'DAVID', 'FLORES', 'ROLLANO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2020-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(221, 'ARIEL IVAN', 'SACACA', 'CORO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2009-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(222, 'GARY OMAR', 'JULIAN', 'SACACA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(223, 'LEONARDO SIMON', 'PERALTA', 'GARCIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2005-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(224, 'ALEX PABLO', 'RODRIGUEZ', 'MARTINEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2021-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(225, 'LUIS GUSTABO', 'QUISPE', 'CARDOSO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(226, 'JURGUEN ANDRIUS', 'SALAMANCA', 'DURAN', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(227, 'JUAN MANUEL', 'VELASQUEZ', 'ARANCIBIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(228, 'JORGE LUIS', 'CHIRARI', 'POVEDA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(229, 'CRISTHIAN ALBERTO', 'FLORES', 'RAMOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2019-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(230, 'WILLIAN ISRAEL', 'RODRIGUEZ', 'ARGAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2014-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(231, 'EFRAIN', 'AGUILAR', 'LAIME', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2030-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(232, 'JOSE RODRIGO', 'ZARATE', 'YUCRA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(233, 'WILSON', 'BRITO', 'RIVERA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2009-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(234, 'ARIEL ALEX', 'CRUZ', 'MAMANI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(235, 'MIJAEL GUSTABO', 'CABA', 'CRUZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2011-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(236, 'JUAN SEBASTIAN', 'QUINTANA', 'ZARATE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(237, 'MARCO ANTONIO', 'ROMERO', 'REYES', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(238, 'LUIS DANIEL', 'RIVERO', 'VILLARROEL', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2021-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(239, 'BRAYAN JACINTO', 'PUMA', 'MAYAN', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(240, 'KEVIN', 'ALAZAR', 'ALZAR', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2014-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(241, 'ARIEL', 'PUMA', 'BALTAZAR', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(242, 'PAULINO', 'SANTILLAN', 'ISLA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(243, 'DAVID', 'CHAVARRIA', 'FLORES', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2020-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(244, 'GUALBERTO', 'CAMPOS', 'HUANCA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(245, 'CARLOS LUIS', 'CABALLERO', 'SAAVEDRA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(246, 'CLAUDIO', 'TORRES', 'PACO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2019-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(247, 'JOSE LUIS', 'QUISPE', 'MEJIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(248, 'WILLIANS LIMBER', 'CHOCAYA', 'CALANCHA	 ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(249, 'NAUDIN', 'SOLIZ', 'CHOQUE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2001-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(250, 'MIGUEL ANGEL', 'FERNANDEZ', 'CUPITA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2015-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(251, 'MARCOS', 'CHOQUE', 'CHOQUE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2022-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(252, 'RIVALDO', 'CHOQUE', 'GOMEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2021-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(253, 'HERNAN', 'YUCRA', 'BUEZO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(254, 'MILTON', 'NAVARRO', 'CKUNO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(255, 'WEIMAR', 'PEÑAS', 'DIAZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2015-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(256, 'JUAN CARLOS', 'MUÑOZ', 'TERAN', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2006-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(257, 'LUIS FERNANDO', 'VEDIA', 'URQUIZU', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(258, 'MARCO ANTONIO', 'TERRAZAS', 'MURILLO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2009-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(259, 'CLIVER JUAN PABLO', 'ORTUSTE', 'SANTOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(260, 'JOSE ARMANDO', 'LUGO', 'YUCRA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2022-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(261, 'ANDRES', 'SANTILLAN', 'ISLA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2010-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(262, 'JHON MARTIN', 'TELAO', 'VISALLA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2003-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(263, 'CRISTIAN CLIVER', 'CUELLAR', 'BARRIGA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2020-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(264, 'ORLANDO', 'PANIAGUA', 'GARCIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2016-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(265, 'JHONNY', 'DURAN', 'SANCHEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(266, 'SANTOS VEIMAR', 'ZARATE', 'SERRUDO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2008-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(267, 'JAVIER', 'QUIROGA', 'CRUZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(268, 'IVAN EVO', 'PACAJA', 'CRUZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(269, 'HERNAN', 'FLORES', 'CRUZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(270, 'GUIDO LUIS', 'AGUIRRE', 'CONDORI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2031-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(271, 'WILLIAN', 'DAZA', 'CABRERA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2017-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(272, 'JOSE', 'GOMEZ', 'HUACOTO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2019-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(273, 'GRABRIEL', 'DURAN', 'CARAZANI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2010-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(274, 'ROBERTO CARLOS', 'CABEZAS', 'ENRIQUEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(275, 'SERGIO IGNACIO', 'LOPEZ', 'PADILLA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(276, 'JHERYSON', 'ALARCON', 'BARRON', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2016-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(277, 'ABDON MAURICIO', 'PACHACOPA', 'BEJARANO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2027-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(278, 'JHAMIL ALEXANDER', 'SERRUDO', 'AMACHUY', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2003-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(279, 'CARLOS EDUARDO', 'CAMACHO', 'VILLALPANDO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2002-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(280, 'DENYS GERARDO', 'CAPOBIANCO', 'POQUIVIQUI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(281, 'JUAN DANIEL', 'CARDOSO', 'LOPEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', '');
INSERT INTO `persona` (`id_persona`, `nombres`, `apellido_paterno`, `apellido_materno`, `foto`, `telefono`, `celular`, `dirección`, `ciudad`, `fecha_nacimiento`, `sexo`, `profesión`, `nacionalidad`, `email`, `usuario`, `password`) VALUES
(282, 'CRISTIAN EUGENIO		', 'SANTOS', 'MENDOZA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2014-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(283, 'RODRIGO RAMIRO', 'CASTRO', 'ALARCON', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(284, 'MANUEL', 'ILAFAYA', 'CRUZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2027-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(285, 'RODRIGO', 'CHOQUE', 'CABEZAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(286, 'ORLANDO', 'QUISPE', 'PAYNO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(287, 'KEVIN VICTOR', 'ALVARADO', 'ALANDIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(288, 'JHASMANI MANUEL', 'ALANDIA', 'MOLINA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2029-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(289, 'BRAYAN', 'MAMANI', 'JANKO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2001-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(290, 'EINAR', 'GUERRA', 'PEREZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2002-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(291, 'WILSON', 'CONDORI', 'JANKO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2028-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(292, 'JOSE LUIS', 'MAMANI', 'OCAMPO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2022-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(293, 'RENE', 'CHUI', 'CAYO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(294, 'JUAN CARLOS', 'CAYHUARA', 'ARANCIBIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2001-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(295, 'JUAN CARLOS', 'URIETA', 'ROCHA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(296, 'DANIEL', 'MOLINA', 'DAZA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(297, 'HUGO', 'DURAN', 'MELENDRES', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2006-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(298, 'CESAR', 'OVIDIO', 'CAYO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(299, 'JUAN DANIEL', 'PACAJA', 'FLORES', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2021-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(300, 'MILAN SERGIO VICENTE	', 'ORTUÑO', 'PINAYA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2027-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(301, 'EDSON JHAMIL', 'ORTIZ', 'MENDOZA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2027-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(302, 'VEIMAR LIMACHI', 'CONDORI', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2005-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(303, 'JOSE FERNANDO', 'IRIARTE', 'CHIRINOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2001-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(304, 'JOSUE', 'FLORES', 'FLORES', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2019-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(305, 'WILLIAN FELIPE', 'PEÑARANDA', 'MAMANI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2024-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(306, 'ORLANDO', 'GALLEGO', 'LUNA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2003-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(307, 'ABEL ALEJANDRO', 'FERRUFINO', 'BAYO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(308, 'CRISTIAN OMAR', 'PORTILLO', 'HUANCA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2016-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(309, 'RICHAR FLORES', 'RODRIGUEZ', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2008-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(310, 'LIMBER', 'POLARES', 'BEJARANO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(311, 'JOSE MANUEL', 'VALLEJOS', 'POMA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(312, 'LEONARDO CARLOS', 'PANOSO', 'BARRIGA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(313, 'GABRIEL JHONNATAN', 'OROPEZA', 'DURAN', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2002-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(314, 'MILTON', 'AVALOS', 'DAZA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2017-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(315, 'JOSE XAVIER', 'GALLEGOS', 'HINOJOSA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(316, 'RIDER', 'VEDIA', 'ABALOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(317, 'JOSE LUIS', 'TAQUICHIRI', 'YAVO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2008-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(318, 'LIMBERTH JHOVANNY', 'TAQUICHIRI', 'AVIZA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(319, 'HERLAN', 'QUIROZ', 'ACOSTA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(320, 'WILSON', 'REJAS', 'GUTIERREZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(321, 'REYMAR', 'VASQUEZ', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2003-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(322, 'JOSE MANUEL', 'PACHECO', 'RAMOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(323, 'ELOY', 'VILLCA', 'GOMEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2022-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(324, 'BRAYAN ALEX', 'VASQUEZ', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2031-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(325, 'RENE JHONATAN', 'MARTINEZ', 'LOPEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(326, 'JAMIL', 'ALMENDRA', 'ERNANDEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(327, 'REUNEL', 'VARGAS', 'VARGAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2024-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(328, 'WAITER', 'IRALA', 'CABRERA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2028-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(329, 'JHOEL', 'MOSCOSO', 'ONTIVEROS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(330, 'FRANKLIN', 'ROCHA', 'CORDOVA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2008-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(331, 'VEIMAR', 'FLORES', 'CONDORI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2008-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(332, 'SERGIO ROMEL', 'MARISCAL', 'ROSADO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2010-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(333, 'ELIO EDUARDO', 'GRIMALDES', 'MAQUERA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2022-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(334, 'WILANDER', 'VILLAVICENCIO', 'MURUCHI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(335, 'ELOY ANGEL', 'CHUMACERO', 'MARTINEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2001-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(336, 'FREDDY', 'HUALLPA', 'MENDOZA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2024-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(337, 'DAVID FELIX', 'MICAYO', 'MAMANI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(338, 'BERNABE', 'KALLATA', 'ROMERO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2011-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(339, 'DIEGO ARMANDO', 'CANCHI', 'CUETO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2002-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(340, 'ALEXANDER', 'MAMANI', 'MOSTACEDO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2001-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(341, 'FRANZ WILDER', 'ESCALANTE', 'ZARATE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(342, 'LIMBER', 'DURAN', 'CASILLAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2022-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(343, 'CRISTIAN', 'GUAMANI', 'CRUZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(344, 'LUIS ALBERTO', 'RODRIGUEZ', 'ZELAYA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(345, 'JESUS GONZALO', 'MEDRANO', 'CHUCA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2003-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(346, 'DAMIRO', 'CALVIMONTES', 'CASAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2017-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(347, 'ROGER', 'COLORADO', 'FERREL', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2029-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(348, 'IVAN', 'BARRIENTOS', 'AYALA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2005-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(349, 'JHONATAN ALVARO', 'CATACORA', 'VAQUERA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(350, 'WILMER', 'KALLATA', 'ROMERO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(351, 'RICHARD', 'ALACA', 'RAMIREZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(352, 'RENE JHOEL', 'ARANCIBIA', 'SOLIS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2029-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(353, 'WILBERTH JAIRO', 'LAZCANO', 'TERRAZAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2028-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(354, 'ALVARO', 'CERBANTES', 'PEREZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2008-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(355, 'MIGUEL ANGEL', 'CONDORI', 'CHAVARRIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2003-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(356, 'CARLOS ALBERTO', 'AVILES', 'RUIZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2024-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(357, 'LUIS MANUEL', 'ANDRADE', 'ZAMORA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(358, 'OSCAR FERNANDO', 'ZAMORA', 'LEAÑOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(359, 'JOSE LUIS', 'CABEZAS', 'CORDOVA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(360, 'BAIRON JULIO', 'RUIZ', 'HINOJOSA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(361, 'RONALD FAUSTO', 'ARATEA', 'ORTIZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2007-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(362, 'RONAL', 'SOBIA', 'PARTES', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2020-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(363, 'FRANSNER', 'APAZA', 'MAMANI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2024-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(364, 'PABLO FERNANDO', 'CHOQUE', 'AVALOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2015-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(365, 'EDUIN', 'VELASQUEZ', 'CRUZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2028-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(366, 'MARCOS VINICIUS', 'CORREIA', 'DE ALMEIDA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(367, 'RAMIRO', 'COPA', 'FLORES', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2019-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(368, 'SERGIO DENYS', 'DURAN', 'DAVILA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2011-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(369, 'DANIEL', 'HUALLPA', 'FERNANDEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2010-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(370, 'FRANZ DERICK', 'MENDOZA', 'TARQUI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2027-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(371, 'AURELIO', 'CONDORI', 'PANIAGUA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2025-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(372, 'ALEXIS OLIVER', 'HUANCA', 'BELTRAN', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2004-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(373, 'ELMER', 'TORRES', 'CONDORI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2001-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(374, 'IVERT', 'ORTIZ', 'ORTUÑO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(375, 'VLADIMIR BRUNO', 'MONTALVO', 'RODRIGUEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2030-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(376, 'VLADIMIR BRUNO', 'MONTALVO', 'RODRIGUEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2030-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(377, 'LUIS GUSTAVO', 'BARJA', 'ALVAREZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2023-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(378, 'HANZ WALDEN', 'CLARK', 'MURRIETA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2028-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(379, 'ELIO LEONEL', 'CAMIÑO', 'FLORES', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2019-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(380, 'LUIS GERARDO', 'CHACON', 'ZUÑIGA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(381, 'HUMBERTO', 'CALDERON', 'CHOQUE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(382, 'SAMUEL', 'CABEZAS', 'URQUIZU', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2020-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(383, 'JUAN CARLOS', 'ARIAS', 'CHOQUE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2005-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(384, 'JULIO CESAR', 'ESPINOZA', 'CRUZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2020-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(385, 'RIDER ERNESTO', 'TORRES', 'CASTELLON', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(386, 'BEIMAR', 'MANCILLA', 'VEDIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2002-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(387, 'SERGIO', 'CHOQUE', 'VEDIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2030-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(388, 'MAIKOL JHORDAN', 'GARCIA', 'SEJAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2029-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(389, 'JUAN GABRIEL', 'YUCRA', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2019-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(390, 'AXEL FERNANDO', 'FLORES', 'CORREA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(391, 'BEYMAR', 'SALVA', 'CHURATA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2029-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(392, 'ARLIN RUDY', 'TORREZ', 'VEDIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2011-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(393, 'ARLIN RUDY', 'TORRES', 'VEDIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2011-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(394, 'WILLIAN', 'BARAHONA', 'HINOJOSA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2016-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(395, 'CARLOS RODRIGO', 'SILVA', 'MARTINEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2022-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(396, 'LUIS GUALBERTO', 'VILLARROEL', 'ALVARADO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(397, 'NESTOR ALEJANDRO', 'RODRIGUEZ', 'BARRIGA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(398, 'CIRO ARNALDO', 'PEREZ', 'TORREZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2009-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(399, 'FREDDY ARMANDO', 'HINOJOSA', 'PUMA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2028-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(400, 'TEODORO', 'MURILLO', 'CARDOZO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2028-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(401, 'SAMUEL', 'ALVIZ', 'SANTOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2024-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(402, 'ERIC FABRICIO', 'HERRERA', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(403, 'VICTOR HUGO', 'ARACA', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(404, 'CHRISTIAN', 'PEDRAZA', 'SALAZAR', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2010-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(405, 'CRISTHIAN DAVID', 'CARO', 'PEDRAZAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(406, 'GUMAR', 'RETAMOZO', 'VEDIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2002-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(407, 'RONALD JOAQUIN', 'CESPEDES', 'CRUZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2007-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(408, 'JHONNY', 'COA', 'QUISPE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(409, 'ERWIN', 'MENDEZ', 'VEDIA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(410, 'BRIYAN YERKO', 'GARCIA', 'MARIN', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2005-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(411, 'DANIEL ALEJANDRO', 'COLQUE', 'VILLALBA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(412, 'FERNANDO EMILIO', 'PARACTA', 'LAURA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2017-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(413, 'JUAN MANUEL', 'MEDRANO', '', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2020-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(414, 'JOSE MILTON', 'TAQUIICH', 'IRIAVIZA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2010-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(415, 'EDWARD RODRIGO', 'PARTES', 'VEGA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2006-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(416, 'JAIRO ALEJANDRO', 'MEDINA', 'ANTEQUERA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2010-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(417, 'ELMER', 'RODRIGUEZ', 'NUÑEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2020-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(418, 'CRISTIAN ALEJANDRO', 'ROJAS', 'LOPEZ', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2027-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(419, 'RAMIRO', 'PINTO', 'BASPINEIRO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2027-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(420, 'MARCELO ESTABAN', 'BAPTISTA', 'AIZA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2006-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(421, 'JHONNY', 'MAMANI', 'CARDENAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(422, 'ALI JAMES', 'ZURITA', 'PADILLA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2005-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(423, 'PEDRO GONZALO', 'VENEROS', 'VELASCO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2008-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(424, 'ORLANDO', 'HEREDIA', 'MURILLO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2022-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(425, 'IVAN', 'CHIRARI', ' MAMANI', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2019-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(426, 'JOSELITO', 'GUTIERREZ', 'VIDAL', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2013-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(427, 'KEVIN CARLOS', 'CONDORI', 'CUEVAS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2029-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(428, 'JAFETH', 'PANIAGUA', 'JANCO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2011-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(429, 'MARCIAL', 'PACHECO', 'CHOQUE', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2018-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(430, 'JOSE MIGUEL', 'ROMERO', 'PINTO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2012-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(431, 'MIGUEL ANGEL', 'AZURDUY', 'DURAN', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2016-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(432, 'CRISTHIAN REYNALDO', 'BARRERA', 'CORAGUA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2021-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(433, 'GERSON JOSE', 'CALDERON', 'CHOQUETICLLA', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2011-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(434, 'LUIS FERNANDO', 'SANCHEZ', 'MERCADO', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2026-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(435, 'DANIEL', 'ALVAREZ', 'BARRIOS', '', '064-54410', '78945870', 'COLON # 3548', 'CHUQUISACA', '2006-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(436, 'ALVARO', 'SALAZAR', 'GUTIERREZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(437, 'DIEGO NAZARIO', 'CESPEDES', 'LAZO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2020-09-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(438, 'KEVIN RENATO', 'TORRES', 'MIRANDA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2011-10-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(439, 'WEIMAR', 'QUISPE', 'CERRUDO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(440, 'CARLOS ESTEBAN', 'SOTO', 'GONZALES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(441, 'ROLANDO', 'CHIRARI', 'TABOADA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2004-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(442, 'JOSELO', 'CESPEDES', 'RODRIGUEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2018-01-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(443, 'ELIAN RAMIRO', 'YUCRA', 'ORELLANA', '4dff0-avatar04.png', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', NULL, '2020-07-29', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', NULL, 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(444, 'SAUL FABRICIO', 'YUCRA', 'PEÑARANDA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2025-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(445, 'JUAN JOSE', 'VELASQUEZ', 'CUMANDIRI', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(446, 'JHOEL RODRIGO', 'MATURANO', 'DURAN', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(447, 'RODRIGO FERNANDO', 'BAYON', 'MARTINEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(448, 'JHONNY', 'QUISPE', 'DURAN', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(449, 'CARLOS FERNANDO', 'BALCERA', 'MARTINEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(450, 'JHONATHAN ALEXANDER', 'ANDRADE', 'ORTIZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(451, 'ALVARO XAVIER', 'CRUZ', 'LOPEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(452, 'GUALBERTO', 'PACO', 'TORRES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(453, 'LIDER FERNANDO', 'PORTILLO', 'BAREA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(454, 'JORGE LUIS', 'SERRUDO', 'SAIGUA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(455, 'JOSE LUIS', 'MOLINA', 'MAMANI', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(456, 'ERICK DAVID', 'DIAZ', 'QUISPE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(457, 'LUIS MIGUEL', 'SERRUDO', 'SAIGUA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(458, 'DETTER JOEL', 'ARANCIBIA', 'ALVARADO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(459, 'JOSE ARMANDO', 'CABA', 'CONDORI', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(460, 'JOSE IGNACIO', 'CARVAJAL', 'URIONA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(461, 'ERVIN', 'ORTIZ', 'RAMIREZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(462, 'CRISTIAN ARIEL', 'NAVARRO', 'MARTINEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(463, 'KEVIN FERNANDO', 'GARCIA', 'TRUJILLO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(464, 'MAURICIO', 'DORADO', 'BONIFAZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(465, 'REYNALDO', 'MAMANI', 'TORRES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(466, 'LUIS FERNANDO', 'CONDORI', 'LEON', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(467, 'MOISES', 'ROMERO', 'FLORES', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(468, 'DELIN', 'BALLEJOS', 'ESQUIVEL', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(469, 'CELWIN', 'RAMIREZ', 'VALLEJOS', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(470, 'EDY ARIEL', 'QUISPE', 'QUENTA', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(471, 'MILTON', 'ZELAYA', 'MARQUEZ					', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(472, 'ESTEBAN', 'ZANABRIA', 'LLALLI', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(473, 'DANNY CRISTHIAN', 'PINTO', 'GONZALES', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(474, 'DIEGO EMANUEL', 'CAYO', 'RUIZ', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(475, 'ALDAIR', 'SAAVEDRA', 'FLORES', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(476, 'SIPRIAN', 'FLORES', 'MONTALVO', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(477, 'IBER', 'GUSMAN', 'CHAURE', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(478, 'WILBER', 'VELASQUEZ', 'PANIAGUA', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(479, 'ANJHELO TEOFILO', 'VALLEJOS', 'CALLEJAS', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(480, 'LUIS ALBERTO', 'MIRANDA', 'ORTEGA', '', '064-36511', ' 60322860', 'AITY # 3568', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(481, 'KEVIN WALTER', 'TELLEZ', 'PACO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(482, 'LUIS ANGEL', 'CHIRARI', 'POVEDA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(483, 'ROLANDO', 'CRUZ', 'MAMANI', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(484, 'RABY', 'BRITO', 'RIVERA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(485, 'TEOFILO', 'FLORES', 'GONZALES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(486, 'CARLOS ANDRES', 'SUAREZ', 'SUAREZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(487, 'JORGE', 'VILAR', 'RODRIGUEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(488, 'SERGIO EDUARDO', 'RUIZ', 'ORDOÑEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(489, 'JUAN DIEGO', 'MERCADO', 'TOMIANOVIC', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(490, 'SERGIO', 'PORCEL', 'SANDOVAL', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(491, 'RAUL FERNANDO', 'ONTIVEROS', 'VACA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(492, 'ROBERTO', 'CRUZ', 'VASQUEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(493, 'GUSTAVO RODRIGO', 'CASTRO', 'RIVERA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(494, 'LUIS ANGEL', 'ARANIBAR', 'FACIO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(495, 'FRANCISCO', 'LAYME', 'GONZALEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(496, 'MILTON', 'FLORES', 'CARVAJAL', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(497, 'JUAN ALVINO', 'QUENTA', 'FAJARDO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(498, 'MIGUEL ANGEL', 'CERVANTES', 'GUZMAN', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(499, 'LIMBERT', 'FLORES', 'BARRIOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(500, 'ARIEL', 'CORTES', 'CHARCAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(501, 'JUAN JOSE', 'LOPEZ', 'ORTIZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(502, 'ERLAN', 'ORTEGA', 'ROMERO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(503, 'JAIME', 'PUYAL', 'RIOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(504, 'JUAN CESAR', 'MORALES', 'LLAMPA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(505, 'ARIEL', 'SALAZAR', 'ALIZAR', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(506, 'SERGIO', 'SALAZAR', 'ALIZAR', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(507, 'CRISTHIAN WIDEN', 'DURAN', 'BERNAL', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(508, 'CRISTIAN FERNANDO', 'CADIMA', 'SOLIZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(509, 'ISAEL', 'AGUILAR', 'VARGAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(510, 'IGNACIO', 'CARRANZA', 'ARCE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(511, 'FREDDY', 'RODAS', 'BARRIOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(512, 'JHAMEL LEONARDO', 'HERRERA', '', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(513, 'LUIS DAVID', 'ADAN', 'HURTADO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(514, 'HERIBERTO', 'ZARATE', 'DURAN', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(515, 'MARCO ANTONIO', 'QUISPE', 'FLORES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(516, 'JORGE', 'SANDOVAL', 'RAMOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(517, 'MAX', 'ZARATE', 'ZARATE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(518, 'JOSE MANUEL', 'RODRIGUEZ', 'VARGAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(519, 'ALEJANDRO', 'TACEO', 'AGUILAR', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(520, 'JORGE', 'ESPINOZA', 'YAIBONA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(521, 'DIEGO ARMANDO', 'MATURANO', 'MOSCOSO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(522, 'MIGUEL ANGEL', 'PICHA', 'AREQUIPA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(523, 'EDWIN', 'DAZA', 'ALEGRE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(524, 'LUIS ALEJANDRO', 'HERVAS', 'HERVAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(525, 'PASTOR', 'TABOADA', 'POLO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(526, 'NEVER', 'GARCIA', 'LLANOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(527, 'MARTIN BENITO', 'TAPIA', 'VARGAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2026-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(528, 'JAVIER', 'MUÑOZ', 'CHOQUE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2004-12-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(529, 'CHRIS WILLIANS', 'LLANQUI', 'MIRANDA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2026-05-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(530, 'PATRICIO', 'GUTIERREZ', 'GARCIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2025-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(531, 'RODRIGO EZEQUIEL	', 'MAMANI', 'VELIZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2004-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(532, 'PAULINO', 'CRUZ', 'CHOQUE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2002-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(533, 'GUSTABO', 'PARINA', 'RIOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2028-02-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(534, 'FELICIANO', 'CHOQUE', 'SORIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2009-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(535, 'PABLO MARCELO', 'SAHONERO', 'CAMPUZANO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(536, 'GERONIMO', 'CRUZ', 'MAMANI', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(537, 'CARLOS DANIEL', 'PEREZ', 'LOPEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2015-04-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(538, 'ALVARO', 'HEREDIA', '', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(539, 'FERMIN', 'MARTINEZ', 'RIVERA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(540, 'EDWIN', 'GARCIA', 'MONTES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(541, 'JAROL ALEXIS', 'VALLEJOS', '', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(542, 'WILSON', 'ALMENDRAS', 'ALVAREZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(543, 'WILLAN FELIPE', 'ALMENDRAS', 'ALVAREZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(544, 'JAIRO GUSTAVO', 'RODAS', 'MAMANI', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(545, 'EFRAIN', 'ISLA', 'PINTO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(546, 'EDWARD', 'SAAVEDRA', 'PAREDES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(547, 'MARCOS', 'CALDERON', 'CHOQUE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(548, 'VICTOR HUGO', 'CRUZ', 'VENTURA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(549, 'HELMER', 'CRUZ', 'AVILA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(550, 'YOSMAR ERLAN', 'ZURITA', 'SOLIZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(551, 'AURELIO', 'CUELLAR', 'SANTOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(552, 'VICTOR HUGO', 'MARTINEZ', 'AGUIRRE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(553, 'BLADIMIR	', 'MOSTACEDO', 'RIOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(554, 'RILBERT JAVIER', 'MOSTACEDO', 'RIOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(555, 'ARMANDO', 'VEDIA', 'PADILLA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(556, 'LUIS ALBERTO', 'MANCILLA', 'MERCADO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(557, 'ALEX JHMER', 'QUIROGA', 'FERNANDEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2031-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(558, 'CRISTIAN BRYAN', 'MAMANI', 'CUEVAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2012-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(559, 'JHORDDY', 'RIQUELME', 'ARANCIBIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(560, 'DIMAR', 'VALDA', 'CORONADO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(561, 'ALFREDO', 'QUENTA', 'VEDIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(562, 'JAIME YAMIR', 'GUZMAN', 'CABEZAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(563, 'FAUSTINO', 'ORTEGA', 'ANGELO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(564, 'JHAIRO GONZALO', 'CEREZO', 'BARJA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(565, 'MIGUEL', 'BERNAL', 'GONZALES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', '');
INSERT INTO `persona` (`id_persona`, `nombres`, `apellido_paterno`, `apellido_materno`, `foto`, `telefono`, `celular`, `dirección`, `ciudad`, `fecha_nacimiento`, `sexo`, `profesión`, `nacionalidad`, `email`, `usuario`, `password`) VALUES
(566, 'JOSE MANUEL', 'SANDOVAL', 'CARDENAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(567, 'EDWIN', 'VALDA', 'SAAVEDRA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(568, 'RICARDO JAIRO', 'ZARATE', 'HUANCA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(569, 'WALTER', 'CALVIMONTES', 'AQUILAR', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(570, 'IVAN ADOLFO', 'PICHA', 'SERRUDO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(571, 'JORGE LUIS', 'DIAZ', 'PEÑARANDA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(572, 'JOSE LUIS', 'SANDI', 'MONTELLANO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(573, 'GABRIEL', 'MENDEZ', 'PUCHO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(574, 'OSMAR EDDY', 'ANAGUA', 'SANTOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(575, 'JUAN HAROLD', 'CASTRO', 'VELASCO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(576, 'JORGE LUIS', 'TAQUICHIRI', 'LOPEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(577, 'JOSE ARMANDO', 'VEDIA', 'URQUIZU', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(578, 'AMILCAR', 'ZARATE', 'PATIÑO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(579, 'HUGO', 'YAMPARA', 'DURAN', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(580, 'DIEGO ERNESTO', 'ORELLANA', 'TERRAZAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(581, 'ADEMAR', 'PANIAGUA', 'VILLANUEVA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(582, 'MARIO ALBERTO', 'MUÑOZ', 'PORCEL', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(583, 'OMAR', 'ROMERO', 'MARTINEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(584, 'MARIO', 'SEGOVIA', 'AGUIRRE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(585, 'CARLOS FRANCISCO', 'MARTINEZ', 'GUEVARA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(586, 'LIMBER AGUSTIN', 'POLO', 'CRUZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(587, 'EDWIN FLORENCIO', 'ACHALA', 'OLIVERA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(588, 'DAVID', 'TAMAREZ', 'MENDEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(589, 'RONALD BENITO', 'FLORES', 'BARRIGA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(590, 'JUAN', 'RODRIGUEZ', 'AJA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(591, 'JOSE ALVARO', 'ROSALES', 'LOPEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(592, 'CRISTIAN ANTONIO', 'CUETO', 'VARGAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(593, 'KIFFER', 'MEDRANO', 'RAMIREZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(594, 'MIRKO MIJAILOV', 'SERNICH', 'CESPEDES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(595, 'PAOLO NICOLAS', 'OVANDO', 'GUZMAN', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(596, 'RAUL GERARDO', 'POZO', 'CIVERA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(597, 'PABLO ANTONIO', 'GIMENEZ', 'ABUAWAD', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(598, 'RENATO', 'PAPUTSACHIS', 'SAINZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(599, 'CARLOS ANDRES', 'JIMENEZ', 'QUINTANILLA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(600, 'MARCELO', 'TIRADO', 'PINTO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(601, 'IGNACIO', 'MONTES', 'BLACUTT', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(602, 'WILSON', 'GARRADO', 'BARRON', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(603, 'SERGIO', 'CHAVARRIA', 'CHAVARRIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(604, 'SERGIO HANS', 'KALIMAN', 'REQUE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(605, 'MAURICIO', 'BULUCUA', 'LOPEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(606, 'JUAN CARLOS', 'CAMPOSANO', 'FLORES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(607, 'JORGE ANTONIO', 'PEÑARANDA', 'ECOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(608, 'DIEGO', 'GUZMAN', 'SANDOVAL', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(609, 'JOSE ERLAN', 'BASCOPE', 'LEON', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(610, 'FABRICIO', 'PEDRAZAS', 'BELLIDO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(611, 'DIEGO ORLANDO', 'PUMA', 'MENDOZA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(612, 'RODRIGO ALEJANDRO', 'RICO', 'URQUIZU', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(613, 'JUAN RODRIGO', 'VILLALTA', 'SENO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(614, 'JOSE PABLO', 'EREIRA', 'VARGAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(615, 'NELSON', 'CRUZ', 'ESPINOZA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(616, 'ROMER', 'MENDOZA', 'COLQUE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(617, 'EDWIN VLADIMIR', 'FLORES', 'SERRUDO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(618, 'PABLO GUZMAN', 'DURAN', '', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(619, 'DAVID GUZMAN', 'DURAN', '', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(620, 'AXEL JUAN', 'ARANCIBIA', 'COPA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(621, 'JUAN', 'CONDORI', 'QUISPE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(622, 'ROBERTO CARLOS', 'LLANOS', 'JIMENEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(623, 'EFRAIN', 'AVALOS', 'ESQUIVEL', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(624, 'CARLOS DANIEL', 'RENTERIA', 'ZUBIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(625, 'MANUEL RONALDO', 'MAMANI', 'CHOQUE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(626, 'LUIS ARMANDO', 'QUISPE', 'LEON', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(627, 'YHAMIL AUGUSTO', 'GABRIEL', 'CERVANTES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(628, 'BRAYAN CRISTIAN', 'BRAVO', 'BARRA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(629, 'RUBEN', 'CARDOZO', '', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(630, 'ROLANDO MARTIN', 'SIVILA', 'MARISCAL', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(631, 'MIGUEL ANGEL', 'CARO', 'AGUILAR', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(632, 'ALEXANDER', 'FALON', 'MENDOZA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(633, 'ALBERTOJUANPABLO', 'FLORES', 'RIVERA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(634, ' GUSTAVO EMILIO', 'ACHO', 'LEON', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(635, 'KEVIN YAMIL', 'ESPADA', 'CARBAJAL', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(636, 'JUAN DANIEL', 'ZELAYA', 'AZURDUY', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(637, 'GUILLERMO TOBIAS', 'MARTINEZ', 'FERNANDEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(638, 'DIEGO RODRIGO', 'SERRANO', 'CARVAJAL', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(639, 'CALEB JAVIER', 'GUARACHI', 'CLAROS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(640, 'WILLAN', 'CASILLAS', 'RUIZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(641, 'CELIO TITO', 'MEDRANO', 'BALCERA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(642, 'NELSON', 'MAMANI', 'SIERRA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(643, 'DAVID COSME', 'CASIMIRO', 'BONIFACIO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(644, 'DIEGO ALVARO', 'SANCHEZ', 'LLAVE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(645, 'JUAN JORGE', 'IRALA', 'VALLE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(646, 'JOSE LUIS', 'CRUZ', 'DIAZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(647, 'JERSON ANGEL', 'CHAVARRIA', 'SERRUDO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(648, 'JUAN RUBEN', 'MORALES', 'TRIGO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2005-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(649, 'RAFAEL ALEJANDRO', 'MAMANI', 'LOPEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(650, 'WALDO', 'FERNANDEZ', 'NEGRETE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(651, 'ALCIDES', 'ROCHA', 'ROMERO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2011-06-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(652, 'JOSE LUIS', 'MUÑOZ', 'AVENDAÑO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2007-07-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(653, 'AXEL FERNANDO', 'BENITO', 'BALDERRAMA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2023-08-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(654, 'CRISTIAN', 'VEIZAGA', 'MIGUES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2007-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(655, 'JORGE RICARDO', 'MAMANI', 'AGUDO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2019-03-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(656, 'EFRAIN', 'AÑAVIRI', 'SANCHEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(657, 'ELVER ZENON', 'ESPADA', 'SUAREZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(658, 'LORIS', 'SANABRIA', 'LLALLI', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(659, 'OSCAR', 'BEJARANO', 'AVILES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(660, 'JOSE LUIS', 'CHUMACERO', 'PEÑARANDA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(661, 'GONZALO', 'LOPEZ', 'GONZALES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(662, 'HERANIO GASTON', 'PADILLA', 'AVALOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(663, 'JOSE', 'VACA', 'PEÑARANDA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(664, 'LUIS MIGUEL', 'CARDENAS', 'PATZI', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(665, 'ERLAN', 'RUIZ', '', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(666, 'EDWIN', 'VEDIA', 'ZARATE', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(667, 'DIGNO', 'CAYO', 'ATA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(668, 'IVAN WILLAN', 'PUQUI', 'BENITEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(669, 'FELIX', 'AÑAVIRI', 'SANCHEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(670, 'EDWIN', 'PEREZ', 'LLANOS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(671, 'ROGER MANUEL', 'GARECA', 'VARGAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(672, 'JORGE LUIS', 'SARZURI', 'MAMANI', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(673, 'BASILIO', 'AVILA', 'CANO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(674, 'GIOVANNI', 'MALDONADO', 'APARICIO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(675, 'JOSE CARLOS', 'MORALES', 'CASTRO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(676, 'JUAN CARLOS', 'FLORES', 'RODRIGUEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(677, 'JUAN ARIEL', 'VACA', 'CUATA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(678, 'JOSE LUIS', 'CAMPOS', 'ANTEQUERA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(679, 'YAHIR FRANCO', 'ROMERO', 'VASQUEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(680, 'ARIEL ALEXANDER', 'ANDRADE', 'FLORES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(681, 'LUIS DAVID', 'RIVERO', 'MOYA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2019-11-20', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(682, 'OSCAR', 'PINTO', 'BARRON', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(683, 'SERGIO FABIAN', 'ALBA', 'LEON', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(684, 'JOEL LAZARO', 'MORALES', 'MARQUEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(685, 'WILLIAMS', 'VELARDE', 'GARABITO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(686, 'EDWIN', 'FLORES', 'MERCADO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(687, 'LUIS ALBERTO', 'REJAS', 'SALAZAR', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(688, 'JIMBER', 'MIRANDA', 'DURAN', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(689, 'BENJAMIN HEIBER', 'HUANCA', 'CALIZAYA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(690, 'JESUS', 'MOREIRA', 'ORTEGA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(691, 'YEVER GUSTAVO', 'VILLCA', 'RODRIGUEZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(692, 'JORGE ARMANDO', 'TORRES', 'TERAN', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(693, 'JAIME', 'DAZA', 'MURILLO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(694, 'ERASMO', 'FLORES', 'VARGAS', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(695, 'JHAROL ANDRES', 'THAMES', 'SALAZAR', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(696, 'JORGE LUIS', 'PINTO', 'LOAYZA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(697, 'CLIVER', 'DURAN', 'HEREDIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(698, 'FERNANDO', 'CHOQUE', 'PEREZ', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(699, 'RONALD', 'CRUZ', 'SEGOVIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(700, 'JESUS MANUEL', 'BARRIENTOS', 'FRANCO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(701, 'ROGER', 'VELASQUEZ', 'ALCIBIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(702, 'GONZALO', 'VELASQUEZ	', 'ALCIBIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(703, 'MEDEIROS', 'CHAVARRIA', 'ZELAYA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(704, 'DENILSON JHOEL', 'ZELAYA', 'CHAVARRIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(705, 'MIGUEL ANGEL', 'DIAZ', 'VELASCO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(706, 'DIEGO RENZO', 'CALVIMONTES', 'AGUILAR', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(707, 'ANDI', 'PEREIRA', 'GARCIA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(708, 'FREDDY', 'GUTIERREZ', 'VELA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(709, 'TEODOCIO', 'MOSCOSO', 'ALBA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(710, 'GLOBER', 'NAVARRO', 'AGUILAR', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(711, 'CARMELO', 'BARRIGA', 'MOSCOSO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(712, 'ANDREE JHERY', 'CESPEDES', 'CHACON', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(713, 'ROLANDO', 'PEREZ', 'SERRUDO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(714, 'MILTON HERLAN', 'MENDOZA', 'GONZALES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(715, 'WILBERT', 'ROJAS', 'MEDRANO', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(716, 'JESUS WALTER', 'MEDINA', 'LOAYZA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(717, 'UBERT', 'BEJARANO', 'AVILES', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(718, 'CARLOS FERNANDO', 'NAVARRO', 'LEDEZMA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(719, 'JOSE DENILSON', 'HUARINA', 'MENDOZA', '', '064-32541', ' 71202014', 'GUILLERMO LOAIZA # 258', 'CHUQUISACA', '2000-01-01', 'M', 'FUTBOLISTA', 'BOLIVIA', 'futbol@gmail.com', '', ''),
(720, 'NOEL FERNANDO', 'LLANQUI', 'COLQUE', '', '064-32541', '75849632', 'GUILLERMO LOAIZA # 258', NULL, '2000-06-10', 'M', 'FUTBNOLISTA', 'BOLIVIA', 'futbol@gmail.com', NULL, 'da39a3ee5e6b4b0d3255bfef95601890afd80709');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_roles`
--

CREATE TABLE `personas_roles` (
  `id` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` set('1','0') COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `personas_roles`
--

INSERT INTO `personas_roles` (`id`, `id_persona`, `id_rol`, `fecha`, `estado`) VALUES
(1, 1, 1, '2019-08-28', '1'),
(2, 3, 2, '2020-03-13', '1'),
(3, 4, 2, '2019-08-28', '1'),
(4, 5, 3, '2020-03-13', '1'),
(5, 6, 3, '2019-08-28', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_cargo`
--

CREATE TABLE `persona_cargo` (
  `id_personacargo` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `persona_cargo`
--

INSERT INTO `persona_cargo` (`id_personacargo`, `id_persona`, `id_cargo`, `estado`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 2, 1),
(4, 4, 2, 1),
(5, 5, 3, 1),
(6, 6, 4, 1),
(7, 7, 5, 1),
(8, 8, 5, 1),
(9, 9, 5, 1),
(10, 10, 5, 1),
(11, 11, 5, 1),
(12, 12, 5, 1),
(13, 13, 5, 1),
(14, 14, 5, 1),
(15, 15, 5, 1),
(16, 16, 5, 1),
(17, 17, 5, 1),
(18, 18, 5, 1),
(19, 19, 5, 1),
(20, 20, 5, 1),
(21, 21, 5, 1),
(22, 22, 5, 1),
(23, 23, 5, 1),
(24, 24, 5, 1),
(25, 25, 5, 1),
(26, 26, 6, 1),
(27, 27, 6, 1),
(28, 28, 6, 1),
(29, 29, 6, 1),
(30, 30, 6, 1),
(31, 31, 6, 1),
(32, 32, 6, 1),
(33, 33, 6, 1),
(34, 34, 6, 1),
(35, 35, 6, 1),
(36, 36, 6, 1),
(37, 37, 6, 1),
(38, 38, 6, 1),
(39, 39, 6, 1),
(40, 40, 6, 1),
(41, 41, 6, 1),
(42, 42, 6, 1),
(43, 43, 6, 1),
(44, 44, 6, 1),
(45, 45, 6, 1),
(46, 46, 6, 1),
(47, 47, 6, 1),
(48, 48, 6, 1),
(49, 49, 6, 1),
(50, 50, 6, 1),
(51, 51, 7, 1),
(52, 52, 7, 1),
(53, 53, 7, 1),
(54, 54, 7, 1),
(55, 55, 7, 1),
(56, 56, 7, 1),
(57, 57, 7, 1),
(58, 58, 7, 1),
(59, 59, 7, 1),
(60, 60, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planillero`
--

CREATE TABLE `planillero` (
  `id_planillero` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `disciplinas` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `observaciones` varchar(250) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `planillero`
--

INSERT INTO `planillero` (`id_planillero`, `id_persona`, `disciplinas`, `observaciones`, `estado`) VALUES
(1, 51, 'FÚTBOL', 'NINGUNA', 1),
(2, 52, 'FÚTBOL', 'NINGUNA', 1),
(3, 53, 'FÚTBOL', 'NINGUNA', 1),
(4, 54, 'FÚTBOL', 'NINGUNA', 1),
(5, 55, 'FÚTBOL', 'NINGUNA', 1),
(6, 56, 'FÚTBOL', 'NINGUNA', 1),
(7, 57, 'FÚTBOL', 'NINGUNA', 1),
(8, 58, 'FÚTBOL', 'NINGUNA', 1),
(9, 59, 'FÚTBOL', 'NINGUNA', 1),
(10, 60, 'FÚTBOL', 'NINGUNA', 1);

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
(379, 5, 1, 21, 7),
(380, 5, 2, 21, 7),
(381, 5, 3, 21, 7),
(382, 5, 4, 21, 7),
(383, 5, 5, 21, 7),
(384, 5, 8, 21, 7),
(385, 5, 9, 21, 7),
(386, 5, 13, 21, 7),
(387, 5, 14, 21, 7),
(388, 5, 15, 21, 7),
(389, 5, 16, 21, 7),
(390, 5, 17, 21, 7),
(391, 5, 18, 21, 7),
(392, 5, 19, 21, 7),
(393, 10, 1, 22, 7),
(394, 10, 2, 22, 7),
(395, 10, 3, 22, 7),
(396, 10, 4, 22, 7),
(397, 10, 5, 22, 7),
(398, 10, 8, 22, 7),
(399, 10, 9, 22, 7),
(400, 10, 13, 22, 7),
(401, 10, 14, 22, 7),
(402, 10, 15, 22, 7),
(403, 10, 16, 22, 7),
(404, 10, 17, 22, 7),
(405, 10, 18, 22, 7),
(406, 10, 19, 22, 7),
(407, 15, 1, 23, 7),
(408, 15, 2, 23, 7),
(409, 15, 3, 23, 7),
(410, 15, 4, 23, 7),
(411, 15, 5, 23, 7),
(412, 15, 8, 23, 7),
(413, 15, 9, 23, 7),
(414, 15, 13, 23, 7),
(415, 15, 14, 23, 7),
(416, 15, 15, 23, 7),
(417, 15, 16, 23, 7),
(418, 15, 17, 23, 7),
(419, 15, 18, 23, 7),
(420, 15, 19, 23, 7),
(421, 20, 1, 24, 7),
(422, 20, 2, 24, 7),
(423, 20, 3, 24, 7),
(424, 20, 4, 24, 7),
(425, 20, 5, 24, 7),
(426, 20, 8, 24, 7),
(427, 20, 9, 24, 7),
(428, 20, 13, 24, 7),
(429, 20, 14, 24, 7),
(430, 20, 15, 24, 7),
(431, 20, 16, 24, 7),
(432, 20, 17, 24, 7),
(433, 20, 18, 24, 7),
(434, 20, 19, 24, 7),
(435, 0, 1, 25, 7),
(436, 0, 2, 25, 7),
(437, 0, 3, 25, 7),
(438, 0, 4, 25, 7),
(439, 0, 5, 25, 7),
(440, 0, 8, 25, 7),
(441, 0, 9, 25, 7),
(442, 0, 13, 25, 7),
(443, 0, 14, 25, 7),
(444, 0, 15, 25, 7),
(445, 0, 16, 25, 7),
(446, 0, 17, 25, 7),
(447, 0, 18, 25, 7),
(448, 0, 19, 25, 7),
(449, 10, 1, 26, 7),
(450, 10, 2, 26, 7),
(451, 10, 3, 26, 7),
(452, 10, 4, 26, 7),
(453, 10, 5, 26, 7),
(454, 10, 8, 26, 7),
(455, 10, 9, 26, 7),
(456, 10, 13, 26, 7),
(457, 10, 14, 26, 7),
(458, 10, 15, 26, 7),
(459, 10, 16, 26, 7),
(460, 10, 17, 26, 7),
(461, 10, 18, 26, 7),
(462, 10, 19, 26, 7),
(463, 15, 1, 27, 7),
(464, 15, 2, 27, 7),
(465, 15, 3, 27, 7),
(466, 15, 4, 27, 7),
(467, 15, 5, 27, 7),
(468, 15, 8, 27, 7),
(469, 15, 9, 27, 7),
(470, 15, 13, 27, 7),
(471, 15, 14, 27, 7),
(472, 15, 15, 27, 7),
(473, 15, 16, 27, 7),
(474, 15, 17, 27, 7),
(475, 15, 18, 27, 7),
(476, 15, 19, 27, 7),
(477, 20, 1, 28, 7),
(478, 20, 2, 28, 7),
(479, 20, 3, 28, 7),
(480, 20, 4, 28, 7),
(481, 20, 5, 28, 7),
(482, 20, 8, 28, 7),
(483, 20, 9, 28, 7),
(484, 20, 13, 28, 7),
(485, 20, 14, 28, 7),
(486, 20, 15, 28, 7),
(487, 20, 16, 28, 7),
(488, 20, 17, 28, 7),
(489, 20, 18, 28, 7),
(490, 20, 19, 28, 7),
(491, 25, 1, 29, 7),
(492, 25, 2, 29, 7),
(493, 25, 3, 29, 7),
(494, 25, 4, 29, 7),
(495, 25, 5, 29, 7),
(496, 25, 8, 29, 7),
(497, 25, 9, 29, 7),
(498, 25, 13, 29, 7),
(499, 25, 14, 29, 7),
(500, 25, 15, 29, 7),
(501, 25, 16, 29, 7),
(502, 25, 17, 29, 7),
(503, 25, 18, 29, 7),
(504, 25, 19, 29, 7),
(505, 0, 1, 30, 7),
(506, 0, 2, 30, 7),
(507, 0, 3, 30, 7),
(508, 0, 4, 30, 7),
(509, 0, 5, 30, 7),
(510, 0, 8, 30, 7),
(511, 0, 9, 30, 7),
(512, 0, 13, 30, 7),
(513, 0, 14, 30, 7),
(514, 0, 15, 30, 7),
(515, 0, 16, 30, 7),
(516, 0, 17, 30, 7),
(517, 0, 18, 30, 7),
(518, 0, 19, 30, 7),
(519, 1500, 1, 31, 8),
(520, 1000, 2, 31, 8),
(521, 1000, 3, 31, 8),
(522, 1000, 4, 31, 8),
(523, 1000, 5, 31, 8),
(524, 500, 8, 31, 8),
(525, 100, 9, 31, 8),
(526, 100, 10, 31, 8),
(527, 100, 11, 31, 8),
(528, 80, 12, 31, 8),
(529, 100, 13, 31, 8),
(530, 100, 14, 31, 8),
(531, 100, 15, 31, 8),
(532, 100, 16, 31, 8),
(533, 80, 17, 31, 8),
(534, 80, 18, 31, 8),
(535, 80, 19, 31, 8),
(536, 2500, 1, 32, 8),
(537, 1500, 2, 32, 8),
(538, 1500, 3, 32, 8),
(539, 1500, 4, 32, 8),
(540, 1500, 5, 32, 8),
(541, 1000, 8, 32, 8),
(542, 200, 9, 32, 8),
(543, 200, 10, 32, 8),
(544, 200, 11, 32, 8),
(545, 100, 12, 32, 8),
(546, 200, 13, 32, 8),
(547, 200, 14, 32, 8),
(548, 200, 15, 32, 8),
(549, 150, 16, 32, 8),
(550, 100, 17, 32, 8),
(551, 100, 18, 32, 8),
(552, 100, 19, 32, 8),
(553, 0, 1, 33, 8),
(554, 0, 2, 33, 8),
(555, 0, 3, 33, 8),
(556, 0, 4, 33, 8),
(557, 0, 5, 33, 8),
(558, 0, 8, 33, 8),
(559, 0, 9, 33, 8),
(560, 0, 10, 33, 8),
(561, 0, 11, 33, 8),
(562, 0, 12, 33, 8),
(563, 0, 13, 33, 8),
(564, 0, 14, 33, 8),
(565, 0, 15, 33, 8),
(566, 0, 16, 33, 8),
(567, 0, 17, 33, 8),
(568, 0, 18, 33, 8),
(569, 0, 19, 33, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_partido`
--

CREATE TABLE `resultado_partido` (
  `id_resultadopartido` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_partidos` int(11) NOT NULL,
  `accion` int(11) NOT NULL COMMENT '1=amarilla\r\n2=roja\r\n3=gol',
  `pagado` int(11) DEFAULT NULL COMMENT '0=no pagado por amarilla, 1=pagado por amarilla',
  `minuto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `resultado_partido`
--

INSERT INTO `resultado_partido` (`id_resultadopartido`, `id_jugador`, `id_partidos`, `accion`, `pagado`, `minuto`) VALUES
(1, 391, 1, 1, 1, 12),
(2, 391, 1, 3, 0, 12),
(3, 378, 1, 1, 0, 12),
(4, 379, 1, 3, 0, 12),
(5, 380, 1, 3, 0, 12),
(6, 395, 1, 1, 0, 12),
(7, 396, 1, 1, 0, 12),
(8, 385, 1, 3, 0, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `estado` set('1','0') COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `estado`) VALUES
(1, 'ADMINISTRADOR', '1'),
(2, 'SECRETARIA', '1'),
(3, 'COMITE TECNICO LIBRE', '1'),
(4, 'COMITE TECNICO MENORES', '1'),
(5, 'DELEGADOS', '1'),
(6, 'ARBITROS', '1'),
(7, 'PLANILLEROS', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_menus_principales`
--

CREATE TABLE `roles_menus_principales` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_menu_principal` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` set('1','0') COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `roles_menus_principales`
--

INSERT INTO `roles_menus_principales` (`id`, `id_rol`, `id_menu_principal`, `fecha`, `estado`) VALUES
(65, 2, 1, '2020-03-13', '1'),
(66, 2, 7, '2020-03-13', '1'),
(67, 2, 8, '2020-03-13', '1'),
(68, 3, 1, '2020-03-13', '1'),
(69, 3, 2, '2020-03-13', '1'),
(70, 3, 3, '2020-03-13', '1'),
(71, 3, 4, '2020-03-13', '1'),
(72, 3, 5, '2020-03-13', '1'),
(73, 4, 1, '2020-03-13', '1'),
(74, 4, 2, '2020-03-13', '1'),
(75, 4, 3, '2020-03-13', '1'),
(76, 4, 4, '2020-03-13', '1'),
(77, 4, 5, '2020-03-13', '1'),
(78, 5, 1, '2020-03-13', '1'),
(79, 5, 2, '2020-03-13', '1'),
(80, 5, 3, '2020-03-13', '1'),
(81, 5, 4, '2020-03-13', '1'),
(82, 5, 6, '2020-03-13', '1'),
(83, 5, 7, '2020-03-13', '1'),
(84, 6, 4, '2020-03-13', '1'),
(85, 6, 5, '2020-03-13', '1'),
(86, 7, 4, '2020-03-13', '1'),
(87, 7, 5, '2020-03-13', '1'),
(99, 1, 1, '2020-07-01', '1'),
(100, 1, 2, '2020-07-01', '1'),
(101, 1, 3, '2020-07-01', '1'),
(102, 1, 4, '2020-07-01', '1'),
(103, 1, 5, '2020-07-01', '1'),
(104, 1, 6, '2020-07-01', '1'),
(105, 1, 7, '2020-07-01', '1'),
(106, 1, 8, '2020-07-01', '1'),
(107, 1, 9, '2020-07-01', '1'),
(108, 1, 10, '2020-07-01', '1'),
(109, 1, 11, '2020-07-01', '1');

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
  `nombretorneo` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`id_torneo`, `nombretorneo`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 'Libertad', '2019-02-09', '2019-12-22', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencias`
--

CREATE TABLE `transferencias` (
  `id_transferencias` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_club` int(11) NOT NULL,
  `id_club_destino` int(11) NOT NULL,
  `id_precioconcepto` int(11) NOT NULL,
  `pagado` tinyint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `transferencias`
--

INSERT INTO `transferencias` (`id_transferencias`, `fecha`, `id_jugador`, `id_club`, `id_club_destino`, `id_precioconcepto`, `pagado`) VALUES
(1, '2020-06-29', 434, 4, 3, 313, 1);

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
-- Estructura Stand-in para la vista `v_torneo_activo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_torneo_activo` (
`id_torneo` int(11)
,`nombretorneo` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_personas_menus_principales`
--
DROP TABLE IF EXISTS `v_personas_menus_principales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_personas_menus_principales`  AS  select `persona`.`nombres` AS `nombre_persona`,`persona`.`apellido_paterno` AS `apellido_paterno`,`persona`.`apellido_materno` AS `apellido_materno`,`persona`.`fecha_nacimiento` AS `fecha_nacimiento`,`persona`.`foto` AS `foto`,`persona`.`sexo` AS `sexo`,`persona`.`telefono` AS `telefono`,`persona`.`celular` AS `celular`,`persona`.`usuario` AS `usuario`,`persona`.`password` AS `password`,`personas_roles`.`id` AS `id_persona_rol`,`personas_roles`.`id_persona` AS `id_persona`,`personas_roles`.`id_rol` AS `id_rol`,`roles`.`nombre` AS `nombre_rol`,`roles_menus_principales`.`id_menu_principal` AS `id_menu_principal`,`menus_principales`.`nombre` AS `nombre_menu_principal`,`menus_principales`.`icono` AS `icono`,`menus_principales`.`color` AS `color`,`menus_principales`.`orden` AS `orden`,`menus_principales`.`estado` AS `estado` from ((((`menus_principales` join `roles_menus_principales` on((`menus_principales`.`id` = `roles_menus_principales`.`id_menu_principal`))) join `roles` on((`roles_menus_principales`.`id_rol` = `roles`.`id`))) join `personas_roles` on((`personas_roles`.`id_rol` = `roles`.`id`))) join `persona` on((`personas_roles`.`id_persona` = `persona`.`id_persona`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_torneo_activo`
--
DROP TABLE IF EXISTS `v_torneo_activo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_torneo_activo`  AS  select `torneo`.`id_torneo` AS `id_torneo`,`torneo`.`nombretorneo` AS `nombretorneo` from `torneo` where (`torneo`.`estado` = 1) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arbitro`
--
ALTER TABLE `arbitro`
  ADD PRIMARY KEY (`id_arbitro`),
  ADD KEY `fk_arbitro_persona` (`id_persona`),
  ADD KEY `fk_arbitro_categoriaarbitro` (`id_catarbitro`),
  ADD KEY `fk_arbitro_partidos` (`id_partidos`);

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
-- Indices de la tabla `categoriasorteado`
--
ALTER TABLE `categoriasorteado`
  ADD PRIMARY KEY (`id_categoriasorteado`),
  ADD KEY `fk_sorteoequipos_categoria` (`id_categoria`),
  ADD KEY `fk_sorteoequipos_torneo` (`id_torneo`);

--
-- Indices de la tabla `categoria_arbitro`
--
ALTER TABLE `categoria_arbitro`
  ADD PRIMARY KEY (`id_catarbitro`);

--
-- Indices de la tabla `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id_club`),
  ADD KEY `fk_club_persona` (`id_personacargo`);

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id_concepto`);

--
-- Indices de la tabla `costos`
--
ALTER TABLE `costos`
  ADD PRIMARY KEY (`id_costos`),
  ADD KEY `fk_costos_concepto` (`id_concepto`);

--
-- Indices de la tabla `curriculo_jugador`
--
ALTER TABLE `curriculo_jugador`
  ADD PRIMARY KEY (`id_currijugador`),
  ADD KEY `fk_currijugador_jugador` (`id_jugador`);

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
-- Indices de la tabla `habilitado`
--
ALTER TABLE `habilitado`
  ADD PRIMARY KEY (`id_habilitado`),
  ADD KEY `fk_habilitado_jugador` (`id_jugador`),
  ADD KEY `fk_habilitado_partido` (`id_partidos`);

--
-- Indices de la tabla `inscripcionequipo`
--
ALTER TABLE `inscripcionequipo`
  ADD PRIMARY KEY (`id_inscripcionequipo`),
  ADD KEY `fk_inscripcionequipo_persona` (`id_personacargo`),
  ADD KEY `fk_inscripcionequipo_club` (`id_club`),
  ADD KEY `fk_inscripcionequipo_categoria` (`id_categoria`),
  ADD KEY `fk_inscripcionequipo_torneo` (`id_torneo`);

--
-- Indices de la tabla `inscripcionjugador`
--
ALTER TABLE `inscripcionjugador`
  ADD PRIMARY KEY (`id_inscripcionjugador`),
  ADD KEY `fk_inscripcionjugador_jugador` (`id_jugador`),
  ADD KEY `fk_inscripcionjugador_inscripcionequipo` (`id_inscripcionequipo`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id_jugador`),
  ADD KEY `fk_jugador_persona` (`id_persona`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menu_menuprincipal` (`id_menu_principal`);

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
  ADD KEY `fk_pago_precioconcepto` (`id_precioconcepto`),
  ADD KEY `fk_pago_pagogeneral` (`id_pagogeneral`);

--
-- Indices de la tabla `pagogeneral`
--
ALTER TABLE `pagogeneral`
  ADD PRIMARY KEY (`id_pagogeneral`),
  ADD KEY `fk_pagogeneral_inscripcionequipo` (`id_inscripcionequipo`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id_partidos`),
  ADD KEY `fk_partidos_planilleo` (`id_planillero`),
  ADD KEY `fk_partidos_inscripcionequipo1` (`id_inscripcion1`),
  ADD KEY `fk_partidos_inscripcionequipo2` (`id_inscripcion2`),
  ADD KEY `fk_partidos_estadio` (`id_estadio`),
  ADD KEY `fk_partidos_torneo` (`id_torneo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `personas_roles`
--
ALTER TABLE `personas_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_personaroles_persona` (`id_persona`),
  ADD KEY `fk_personaroles_roles` (`id_rol`);

--
-- Indices de la tabla `persona_cargo`
--
ALTER TABLE `persona_cargo`
  ADD PRIMARY KEY (`id_personacargo`),
  ADD KEY `fk_personacargo_persona` (`id_persona`),
  ADD KEY `fk_personacargo_cargo` (`id_cargo`);

--
-- Indices de la tabla `planillero`
--
ALTER TABLE `planillero`
  ADD PRIMARY KEY (`id_planillero`),
  ADD KEY `fk_planillero_persona` (`id_persona`);

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
  ADD KEY `fk_resultpartido_jugador` (`id_jugador`),
  ADD KEY `fk_resultpartido_partido` (`id_partidos`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles_menus_principales`
--
ALTER TABLE `roles_menus_principales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rolesmenusprincipales_rol` (`id_rol`),
  ADD KEY `fk_rolesmenusprincipales_menuprincipal` (`id_menu_principal`);

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
  ADD PRIMARY KEY (`id_torneo`);

--
-- Indices de la tabla `transferencias`
--
ALTER TABLE `transferencias`
  ADD PRIMARY KEY (`id_transferencias`),
  ADD KEY `fk_transferencias_jugador` (`id_jugador`),
  ADD KEY `fk_transferencias_club` (`id_club`),
  ADD KEY `fk_transferencias_clubdestino` (`id_club_destino`),
  ADD KEY `fk_transferencias_precioconcepto` (`id_precioconcepto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arbitro`
--
ALTER TABLE `arbitro`
  MODIFY `id_arbitro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `arbitro_partido`
--
ALTER TABLE `arbitro_partido`
  MODIFY `id_arbitropartido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `categoriasorteado`
--
ALTER TABLE `categoriasorteado`
  MODIFY `id_categoriasorteado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria_arbitro`
--
ALTER TABLE `categoria_arbitro`
  MODIFY `id_catarbitro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `club`
--
ALTER TABLE `club`
  MODIFY `id_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id_concepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `costos`
--
ALTER TABLE `costos`
  MODIFY `id_costos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `curriculo_jugador`
--
ALTER TABLE `curriculo_jugador`
  MODIFY `id_currijugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT de la tabla `estadio`
--
ALTER TABLE `estadio`
  MODIFY `id_estadio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `id_games` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `habilitado`
--
ALTER TABLE `habilitado`
  MODIFY `id_habilitado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `inscripcionequipo`
--
ALTER TABLE `inscripcionequipo`
  MODIFY `id_inscripcionequipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `inscripcionjugador`
--
ALTER TABLE `inscripcionjugador`
  MODIFY `id_inscripcionjugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=660;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `menus_principales`
--
ALTER TABLE `menus_principales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `motivo`
--
ALTER TABLE `motivo`
  MODIFY `id_motivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pagogeneral`
--
ALTER TABLE `pagogeneral`
  MODIFY `id_pagogeneral` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id_partidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=721;

--
-- AUTO_INCREMENT de la tabla `personas_roles`
--
ALTER TABLE `personas_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `persona_cargo`
--
ALTER TABLE `persona_cargo`
  MODIFY `id_personacargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `planillero`
--
ALTER TABLE `planillero`
  MODIFY `id_planillero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `precio_concepto`
--
ALTER TABLE `precio_concepto`
  MODIFY `id_precioconcepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=570;

--
-- AUTO_INCREMENT de la tabla `resultado_partido`
--
ALTER TABLE `resultado_partido`
  MODIFY `id_resultadopartido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles_menus_principales`
--
ALTER TABLE `roles_menus_principales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `suspencion`
--
ALTER TABLE `suspencion`
  MODIFY `id_suspencion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `id_torneo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arbitro`
--
ALTER TABLE `arbitro`
  ADD CONSTRAINT `fk_arbitro_categoriaarbitro` FOREIGN KEY (`id_catarbitro`) REFERENCES `categoria_arbitro` (`id_catarbitro`),
  ADD CONSTRAINT `fk_arbitro_partidos` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`),
  ADD CONSTRAINT `fk_arbitro_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `arbitro_partido`
--
ALTER TABLE `arbitro_partido`
  ADD CONSTRAINT `fk_arbitropartido_arbitro` FOREIGN KEY (`id_arbitro`) REFERENCES `arbitro` (`id_arbitro`),
  ADD CONSTRAINT `fk_arbitropartido_partidos` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`);

--
-- Filtros para la tabla `categoriasorteado`
--
ALTER TABLE `categoriasorteado`
  ADD CONSTRAINT `fk_sorteoequipos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_sorteoequipos_torneo` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`);

--
-- Filtros para la tabla `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `fk_club_persona` FOREIGN KEY (`id_personacargo`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `costos`
--
ALTER TABLE `costos`
  ADD CONSTRAINT `fk_costos_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`);

--
-- Filtros para la tabla `curriculo_jugador`
--
ALTER TABLE `curriculo_jugador`
  ADD CONSTRAINT `fk_currijugador_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`);

--
-- Filtros para la tabla `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `fk_games_equipo_a` FOREIGN KEY (`id_equipo_a`) REFERENCES `inscripcionequipo` (`id_inscripcionequipo`),
  ADD CONSTRAINT `fk_games_equipo_h` FOREIGN KEY (`id_equipo_h`) REFERENCES `inscripcionequipo` (`id_inscripcionequipo`),
  ADD CONSTRAINT `fk_games_partido` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`);

--
-- Filtros para la tabla `habilitado`
--
ALTER TABLE `habilitado`
  ADD CONSTRAINT `fk_habilitado_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`),
  ADD CONSTRAINT `fk_habilitado_partido` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`);

--
-- Filtros para la tabla `inscripcionequipo`
--
ALTER TABLE `inscripcionequipo`
  ADD CONSTRAINT `fk_inscripcionequipo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_inscripcionequipo_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `fk_inscripcionequipo_persona` FOREIGN KEY (`id_personacargo`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `fk_inscripcionequipo_torneo` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`);

--
-- Filtros para la tabla `inscripcionjugador`
--
ALTER TABLE `inscripcionjugador`
  ADD CONSTRAINT `fk_inscripcionjugador_inscripcionequipo` FOREIGN KEY (`id_inscripcionequipo`) REFERENCES `inscripcionequipo` (`id_inscripcionequipo`),
  ADD CONSTRAINT `fk_inscripcionjugador_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `fk_jugador_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `fk_menu_menuprincipal` FOREIGN KEY (`id_menu_principal`) REFERENCES `menus_principales` (`id`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_pagogeneral` FOREIGN KEY (`id_pagogeneral`) REFERENCES `pagogeneral` (`id_pagogeneral`),
  ADD CONSTRAINT `fk_pago_precioconcepto` FOREIGN KEY (`id_precioconcepto`) REFERENCES `precio_concepto` (`id_precioconcepto`);

--
-- Filtros para la tabla `pagogeneral`
--
ALTER TABLE `pagogeneral`
  ADD CONSTRAINT `fk_pagogeneral_inscripcionequipo` FOREIGN KEY (`id_inscripcionequipo`) REFERENCES `inscripcionequipo` (`id_inscripcionequipo`);

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `fk_partidos_estadio` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`id_estadio`),
  ADD CONSTRAINT `fk_partidos_inscripcionequipo1` FOREIGN KEY (`id_inscripcion1`) REFERENCES `inscripcionequipo` (`id_inscripcionequipo`),
  ADD CONSTRAINT `fk_partidos_inscripcionequipo2` FOREIGN KEY (`id_inscripcion2`) REFERENCES `inscripcionequipo` (`id_inscripcionequipo`),
  ADD CONSTRAINT `fk_partidos_planilleo` FOREIGN KEY (`id_planillero`) REFERENCES `planillero` (`id_planillero`),
  ADD CONSTRAINT `fk_partidos_torneo` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`);

--
-- Filtros para la tabla `personas_roles`
--
ALTER TABLE `personas_roles`
  ADD CONSTRAINT `fk_personaroles_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `fk_personaroles_roles` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `persona_cargo`
--
ALTER TABLE `persona_cargo`
  ADD CONSTRAINT `fk_personacargo_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  ADD CONSTRAINT `fk_personacargo_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `planillero`
--
ALTER TABLE `planillero`
  ADD CONSTRAINT `fk_planillero_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

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
  ADD CONSTRAINT `fk_resultpartido_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`),
  ADD CONSTRAINT `fk_resultpartido_partido` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`);

--
-- Filtros para la tabla `roles_menus_principales`
--
ALTER TABLE `roles_menus_principales`
  ADD CONSTRAINT `fk_rolesmenusprincipales_menuprincipal` FOREIGN KEY (`id_menu_principal`) REFERENCES `menus_principales` (`id`),
  ADD CONSTRAINT `fk_rolesmenusprincipales_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `suspencion`
--
ALTER TABLE `suspencion`
  ADD CONSTRAINT `fk_suspencion_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`),
  ADD CONSTRAINT `fk_suspencion_partidos` FOREIGN KEY (`id_partidos`) REFERENCES `partidos` (`id_partidos`);

--
-- Filtros para la tabla `transferencias`
--
ALTER TABLE `transferencias`
  ADD CONSTRAINT `fk_transferencias_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `fk_transferencias_clubdestino` FOREIGN KEY (`id_club_destino`) REFERENCES `club` (`id_club`),
  ADD CONSTRAINT `fk_transferencias_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`),
  ADD CONSTRAINT `fk_transferencias_precioconcepto` FOREIGN KEY (`id_precioconcepto`) REFERENCES `precio_concepto` (`id_precioconcepto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
