-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-12-2019 a las 23:15:54
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_achf`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitro`
--

CREATE TABLE `arbitro` (
  `id_arbitro` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_catarbitro` int(11) NOT NULL,
  `disciplina` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(350) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `arbitro`
--

INSERT INTO `arbitro` (`id_arbitro`, `id_persona`, `id_catarbitro`, `disciplina`, `observaciones`, `estado`) VALUES
(1, 6, 1, 'FÚTBOL ', 'NINGUNA', 1),
(2, 7, 2, 'FÚTBOL', NULL, 1),
(3, 8, 3, 'FÚTBOL', NULL, 1),
(4, 9, 4, 'FÚTBOL', NULL, 1),
(5, 12, 6, 'FÚTBOL', NULL, 1),
(6, 13, 6, 'FÚTBOL', NULL, 1),
(7, 14, 7, 'FÚTBOL', NULL, 1),
(8, 15, 7, 'FÚTBOL', NULL, 1),
(9, 16, 7, 'FÚTBOL', NULL, 1);

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
(5, 'Comite_Tecnico', '1');

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
(6, 'CATEGORIA SUB 19', 1),
(7, 'CATEGORIA SUB 17', 1),
(8, 'CATEGORIA SUB 15', 1),
(9, 'CATEGORIA SUB 13', 1),
(10, 'CATEGORIA SUB 11', 1),
(11, 'CATEGORIA SUB 9', 1),
(12, 'CATEGORIA SUB 7', 1),
(13, 'CATEGORIA DAMAS LIBRE', 1),
(14, 'Damas Sub 7', 1),
(15, 'sub', 1);

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
(1, 'REFEREE 5', 1),
(2, 'REFEREE 4', NULL),
(3, 'REFEREE 3', NULL),
(4, 'REFEREE 2', NULL),
(5, 'REFEREE 1', NULL),
(6, 'ASISTENTE 1', NULL),
(7, 'ASISTENTE 2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club`
--

CREATE TABLE `club` (
  `id_club` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `noticias` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `transferencias` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estadisticas` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `club`
--

INSERT INTO `club` (`id_club`, `id_equipo`, `noticias`, `transferencias`, `estadisticas`, `estado`) VALUES
(1, 2, 'Sin noticias', 'transfericias dcomentadasd', '50%', 1),
(2, 1, 'mi club', 'asdfaasdfasdf', 'asdfa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `id_concepto` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`id_concepto`, `nombre`, `fecha`, `estado`) VALUES
(1, 'INSCRIPCIONES ', '2019-05-09', 1),
(2, 'DERECHO DE JUGADOR ', '2019-05-09', 1),
(3, 'PLANILLAS', '2019-05-04', 1),
(4, 'TARJETAS DE ACTUACIÓN ', '2019-05-15', 1),
(5, 'OBSERVACIONES', '2019-05-16', 1),
(6, 'TARJETAS AMARILLAS', '2019-05-16', 1),
(7, 'FICHAS KARDEX', '2019-05-16', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos_torneo`
--

CREATE TABLE `costos_torneo` (
  `id_costostorneo` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL,
  `id_concepto` int(11) NOT NULL,
  `costo` float DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `costos_torneo`
--

INSERT INTO `costos_torneo` (`id_costostorneo`, `id_torneo`, `id_concepto`, `costo`, `estado`) VALUES
(1, 1, 1, 300, 1),
(2, 1, 2, 250, 1),
(3, 1, 3, 10, 1),
(4, 1, 4, 5, 1),
(5, 1, 5, 500, 1);

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
  `nombre_equipo` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ciudad` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `escudo` varchar(200) COLLATE utf8_spanish_ci DEFAULT 'user.jpg',
  `fecha_fundación` varchar(350) COLLATE utf8_spanish_ci DEFAULT NULL,
  `presidente` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entrenador` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id_equipo`, `nombre_equipo`, `direccion`, `ciudad`, `escudo`, `fecha_fundación`, `presidente`, `entrenador`, `observaciones`, `estado`) VALUES
(1, 'INDEPENDIENTE', 'German Bush # 352', 'Chuquisaca', 'c5953-descarga.jpg', '4 de abril de 1932', 'Julio Cueto', 'Marcelo Robledo', 'Campeon del campeonato del futbol Chuquisaqueño de Futbol de la Primera \"A\"', 1),
(2, 'STORMERS SPORTING CLUB', 'Hernando Siles #412', 'Chuquisaca', '', '25 de enero de 1914', 'Dayler Gutiérrez', 'Dayler Gutiérrez', 'Apodo(s): El decano del fútbol Sucrense', 1),
(3, 'UNIVERSITARIO', 'Plazuela Zudañez', 'Chuquisaca', '', '5 de abril de 1961 se fundó el club Universidad Sucre bajo la iniciativa del profesor Alfredo Sandi Navarro', 'Peter Campos', 'Richard Cueto', 'Apodo(s): Uhhh\'Los rojos\', El Docto, Equipo Estudiantil,\"Equipo Capitalino\",\"La U\"', 1),
(4, 'JUNIN', 'Junin #458', 'Chuquisaca', '', '18 de junio 1918', 'Ernesto F. Moor', 'Adhemar Gehain', 'otros', 1),
(5, 'CHURUQUELLA', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Antonio Pinto', 'Antonio Pinto', 'Garra y Coraje Triunfare', 1),
(6, 'MORRO MUNICIPAL', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Abel Gallardo', 'Abel Gallardo', 'Garra y Coraje Triunfare', 1),
(7, 'CORDECHS', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Reina Lopez', 'Reina Lopez', 'Garra y Coraje Triunfare', 1),
(8, 'ALCALA', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Javier Ponce', 'Javier Ponce', 'Garra y Coraje Triunfare', 1),
(9, 'ATL. SAJLINA', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Carlos Ortega', 'Carlos Ortega', 'Garra y Coraje Triunfare', 1),
(10, 'JUDEMI', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Silvio Acebo', 'Silvio Acebo', 'Garra y Coraje Triunfare', 1),
(11, 'VILLA CHARCAS', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Mario Sanches', 'Mario Sanches', 'Garra y Coraje Triunfare', 1),
(12, 'HURACAN DEL VALLE', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Jose Echalar', 'Jose Echalar', 'Garra y Coraje Triunfare', 1),
(13, 'TARABUCO', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Joel Sanches', 'Joel Sanches', 'Garra y Coraje Triunfare', 1),
(14, 'AULLAGAS', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Luis Rojas', 'Luis Rojas', 'Garra y Coraje Triunfare', 1),
(15, 'SAN LUCAS', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Fernando Ayllon ', 'Fernando Ayllon ', 'Garra y Coraje Triunfare', 1),
(16, 'AUDIENCIA', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Alicia Romero', 'Alicia Romero', 'Garra y Coraje Triunfare', 1),
(17, 'LIBERTAD', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Dionel Choque', 'Dionel Choque', 'Garra y Coraje Triunfare', 1),
(18, 'FLORIDA', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Diego', 'Diego', 'Garra y Coraje Triunfare', 1),
(19, 'CEDEPSUR', 'Junin #1258', 'Chuquisaca', '', '25 de Junio de 2001', 'Florencio Flores', 'Florencio Flores', 'Garra y Coraje Triunfare', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_jugador`
--

CREATE TABLE `equipo_jugador` (
  `id_equijugador` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(1, 'Estadio Sucre', '20000', 'Chuquisaca', 'Surapata ', 'user.jpg', '1960-05-01', 1),
(2, 'Estadio Olímpico Patria ', '32700', 'Chuquisaca ', 'Avenida Jaime Mendoza', 'user.jpg', '1992-05-25', 1),
(3, 'Estadio Lurdes de Yotala ', '15000', 'Chuquisaca', 'Yotala', 'user.jpg', '1912-11-29', 1),
(4, 'Garcilazo', '10000', 'Chuquisaca', 'Inca Garcilazo', 'user.jpg', '2000-05-25', 1),
(5, 'Mesa Verde', '5000', 'Chuquisaca', 'Rotari', 'user.jpg', '2005-05-25', 1),
(6, 'Churuquella', '1000', 'Potosi', 'Zona alta', 'foto.jpg', '2019-01-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `id_jornadas` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `año` date DEFAULT NULL,
  `horas` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `categoria` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `club` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `c_i` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `domicilio` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `procede_del_club` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `posicion` varchar(35) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estatura` decimal(10,0) DEFAULT NULL,
  `peso` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id_jugador`, `id_persona`, `n_registro_fbf`, `lfpb_asociacion_liga_provincial`, `nombre_padre`, `nombre_madre`, `estado_civil`, `categoria`, `club`, `c_i`, `domicilio`, `procede_del_club`, `estado`, `posicion`, `estatura`, `peso`) VALUES
(1, 37, 331887, 'A. Tarijeña de Futbol', 'BENJAMIN CASTILLO EGUEZ', 'DELICIA EGUEZ ALVAREZ', 'Soltero', 'PRIMERA \"A\"', 'INDEPENDIENTE ', '7218547', 'Camargo S/N', 'CLUB QUEBRACHO', '1', 'Arquero', '175', '78'),
(2, 36, 387049, 'Asociacion Cruceña de Futbol', 'JULIO CESAR CRUZ', 'DELMA PANIAGUA CUELLAR', 'Soltero', 'PRIMERA \"A\"', 'INDEPENDIENTE ', '10383578', 'Daniel Campos S/N', 'DIOS ES AMOR', '1', 'Medio Campo', '170', '71'),
(3, 35, 39445, NULL, 'JUAN YUCRA REVOLIO', 'LEONA CABA MENDEZ', 'Soltero', 'PRIMERA \"A\"', 'UNIVERSITARIO', '8545519', 'Regimiento Carabineros #136', NULL, '1', 'Lateral Derecho', '165', '62'),
(4, 34, 406496, NULL, 'ABELINO CRUZ MAMANI', 'LEONARDA MAMANI POLO', 'Soltero', 'PRIMERA \"A\"', 'UNIVERSITARIO', '13090549', 'B. Villa Santa S/N', NULL, '1', 'ARQUERO', '157', '55'),
(5, 33, 346304, NULL, 'JUSTO SONCO SILLO', 'ROSARIO RIOS CARDENAS', 'Soltero', 'PRIMERA \"A\"', 'JUNIN', '10300268', 'Lemoine #318', NULL, '1', 'Defenza', '177', '75'),
(6, 32, 406497, NULL, 'ABELINO CRUZ MAMANI', 'LEONARDA MAMANI POLO', 'Soltera', 'PRIMERA \"A\"', 'JUNIN', '10341988', 'Barrio Villa Santa S/N', NULL, '1', 'Medio Campo', '160', '58'),
(7, 31, 370954, 'Asociación Chuquisaqueña de Fútbol ', NULL, 'Silvia Serrano Llanos', 'Soltero', 'PRIMERA \"A\"', 'STORMERS SPORTING CLUB', '7521767', 'Ostria Gutierres # 31', 'JUDEMI', '1', 'Medio Campo', '155', '55'),
(8, 30, 406250, NULL, 'LAURO LLANQUI BAUTISTA', 'NATIVIDAD COLQUE TELLEZ', 'Soltero', 'PRIMERA \"A\"', 'STORMERS SPORTING CLUB', '10305958', 'Lemoine #115', NULL, '1', 'Delantero', '180', '75'),
(9, 29, 406234, NULL, 'TEODORO GOMEZ PACO', 'MARCELINA UMAÑA TICOLLANO', 'Soltero', 'PRIMERA \"B\"', 'CHURUQUELLA', '10465437', 'Hernando Siles #1245', NULL, '1', 'Defenza', '170', '68'),
(10, 28, 396133, NULL, 'MARIO MENACHO MAMANI', 'MERCEDES CALDERON GUZMAN', 'Soltero', 'PRIMERA \"B\"', 'CHURUQUELLA', '10582010', 'Hernando Siles #1245', NULL, '1', 'Medio Campo', '150', '48'),
(11, 27, 386508, NULL, 'RAMIRO GUTIERREZ MALLEA', 'YANNET VICTORIA MONTAÑO GUZMAN', 'Soltero', 'PRIMERA \"B\"', 'MORRO MUNICIPAL', '6676790', 'Hernando Siles #1245', NULL, '1', 'Defenza', '175', '72'),
(12, 26, 366493, NULL, 'RAMON RODRIGUEZ AGUIRRE', 'ELBA YOLANDA CAYO OCHOA', 'Soltero', 'PRIMERA \"B\"', 'MORRO MUNICIPAL', '7506999', 'Hernando Siles #1245', NULL, '1', 'Medio Campo', '170', '65'),
(13, 25, 396252, NULL, 'BENITO LEON MORALES', 'SILDA SANCHEZ CARBALLO', 'Soltero', 'PRIMERA \"B\"', 'CORDECHS', '7542354', 'Hernando Siles #1245', NULL, '1', 'Medio Campo', '172', '65'),
(14, 24, 388405, NULL, 'MARIO MARTINEZ', 'EUSEBIA IBAÑEZ', 'Soltero', 'PRIMERA \"B\"', 'CORDECHS', '1036054', 'German Mendoza #56', NULL, '1', 'Delantero', '155', '50'),
(15, 23, 396132, NULL, 'ELICEO GONGORA CEREZO', 'BENITA BALDERAS CHAVEZ', 'Soltero', 'PRIMERA \"B\"', 'ALCALA', '10322444', 'German Mendoza #56', NULL, '1', 'Delantero', '177', '71'),
(16, 22, 394047, NULL, 'RUFINO MOLLO CHOQUE', 'ASCENCIA DONAIRE CAMATA', 'Soltero', 'PRIMERA \"B\"', 'ALCALA', '8627159', 'German Mendoza #56', NULL, '1', 'Delantero', '160', '58'),
(17, 21, 386507, NULL, 'MARIO LLANOS PORTAL', 'LEONOR GALLARDO VASQUEZ', 'Soltero', 'PRIMERAS DE ASCENSO', 'ATL. SAJLINA', '7509690', 'German Mendoza #56', NULL, '1', 'Arquero', '173', '75'),
(18, 20, 396270, NULL, 'EDUBIGUEZ CHOQUE ZELAYA', 'TEOFILA ESCALANTE GONZALES', 'Soltero', 'PRIMERAS DE ASCENSO', 'ATL. SAJLINA', '10365148', 'German Mendoza #56', NULL, '1', 'Medio Campo', '170', '66'),
(19, 19, 406414, NULL, 'GREGORIO MIRANDA MARCELO', 'FERMINA COPA FERNANDEZ', 'Soltero', 'PRIMERAS DE ASCENSO', 'JUDEMI', '5568104', 'Ostria Reyes #521', NULL, '1', 'Medio Campo', '155', '50'),
(20, 18, 406495, NULL, 'DEMETRIO VERBO GUTIERREZ', 'VICTORIA MARQUEZ ZELAYA', 'Soltero', 'PRIMERAS DE ASCENSO', 'JUDEMI', '8599602', 'Ostria Reyes #521', NULL, '1', 'Defensa Derecho ', '165', '60'),
(21, 17, 359879, NULL, 'MARIO MARTINEZ ROMERO', 'EUSEBIA IBAÑEZ ARROYO', 'Soltero', 'PRIMERAS DE ASCENSO', 'HURACAN DEL VALLE', '7531013', 'Ostria Reyes #521', NULL, '1', 'Defensa Derecho', '170', '65'),
(22, 4, 396253, NULL, 'DELFIN CONDORI VILLARPANDO ', 'FELICIA LAZCANO CAZORLA', 'Soltero', 'PRIMERAS DE ASCENSO', 'HURACAN DEL VALLE', '10346248', 'Ostria Reyes #521', NULL, '1', 'Delantero', '173', '70'),
(23, 3, 386576, NULL, 'MARIO LLANOS PORTAL', 'LEONOR GALLARDO VASQUEZ', 'Soltero', 'PRIMERAS DE ASCENSO', 'VILLA CHARCAS', '5031830', 'Ostria Reyes #521', NULL, '1', 'Defensa Izquierdo', '165', '60'),
(24, 2, 386500, NULL, 'HILARION AVENDAÑO CASTRO', 'EDUARDA FAUSTINA CANO', 'Soltero', 'PRIMERAS DE ASCENSO', 'VILLA CHARCAS', '10310946', 'Ostria Reyes #521', NULL, '1', 'Defenza Central', '172', '65'),
(25, 1, 375025, NULL, 'ISMAEL MARTINEZ ORTEGA', 'SANTUSA CARVAJAL TEJERINA', 'Soltero', 'PRIMERAS DE ASCENSO', 'VILLA CHARCAS', '7531086', 'Ostria Reyes #521', NULL, '1', 'Volante Isquierdo', '170', '68');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador_categoria`
--

CREATE TABLE `jugador_categoria` (
  `id_jugcategoria` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `jugador_categoria`
--

INSERT INTO `jugador_categoria` (`id_jugcategoria`, `id_jugador`, `id_categoria`, `estado`) VALUES
(1, 1, 1, 1);

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
(13, 1, 'Curriculo_Jugador', 'Curriculo', '1', '1', '1', 1, NULL);

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
(8, 'CONTABILIDAD', '8', '8', 8, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id_partidos` int(11) NOT NULL,
  `id_planillero` int(11) NOT NULL,
  `id_torneoequipo1` int(11) NOT NULL,
  `id_torneoequipo2` int(11) NOT NULL,
  `id_jornadas` int(11) NOT NULL,
  `id_estadio` int(11) NOT NULL,
  `id_partarbitro` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` char(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `gol_e1` int(11) DEFAULT NULL,
  `gol_e2` int(11) DEFAULT NULL,
  `observaciones` varchar(350) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `nro_camiseta` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `f_amonestado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `f_expulsado` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `f_goleador` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos_arbitro`
--

CREATE TABLE `partidos_arbitro` (
  `id_partarbitro` int(11) NOT NULL,
  `id_arbitro` int(11) NOT NULL,
  `cargo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `partidos_arbitro`
--

INSERT INTO `partidos_arbitro` (`id_partarbitro`, `id_arbitro`, `cargo`) VALUES
(1, 1, 'REFERÍ'),
(2, 5, 'REFERÍ ASISTENTE '),
(3, 6, 'REFERÍ ASISTENTE ');

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
  `edad` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombres`, `apellido_paterno`, `apellido_materno`, `foto`, `telefono`, `celular`, `dirección`, `ciudad`, `fecha_nacimiento`, `sexo`, `profesión`, `nacionalidad`, `edad`, `estado`, `email`, `usuario`, `password`) VALUES
(1, 'Carlos Alfredo', 'Ortega', 'Orellana', 'user.jpg', '064-65425', '60322860', 'Ostria Reyes # 125', 'Chuquisca', '2000-02-02', 'M', 'Estudiante', 'bolivia', '20', 1, 'admin@gmail.com', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(2, 'Gilverto', 'avendaño', 'Cano', 'user.jpg', '064-220000', '65231578', 'Canada # 1256', 'Chuquisca', '1998-06-22', 'M', 'Estudiante', 'Bolivia', '21', 1, 'cano@gmail.com', 'cano', 'cano'),
(3, 'Diego', 'Llanos ', 'Gallardo', 'user.jpg', '064-22000', '65258985', 'Lemoine # 254', 'Chuquisca', '1997-09-15', 'M', 'Estudiante', 'Bolivia', '22', 1, 'diego@gmail.com', 'diego', 'diego'),
(4, 'Ivan', 'Condori', 'Lascano', 'user.jpg', '064-25635', '71225233', 'Colon # 854', 'Chuquisca', '1998-12-15', 'M', 'Estudiante', 'Bolivia', '20', 1, 'ivan@gmail.com', 'ivan', 'ivan'),
(5, 'Abelardo', 'Cazon', 'Rodrigues', 'user.jpg', '064-25687', '75633522', 'Junin @ 1235', 'Chuquisca', '1865-07-29', 'M', 'Profesor de Educación Física', 'bolivia', '54', 1, 'abelardo@gmail.com', 'abelardo', 'abelardo'),
(6, 'Juan Nelio', 'Garcia', 'Salvatierra', 'user.jpg', '064-65425', '78594562', 'Lemoine # 124', 'Chuquisaca', '1982-02-25', 'M', 'Arbitro Referee', 'Bolivia', '37', 1, 'juan@gmail.com', 'juan', 'juan'),
(7, 'Jose', 'Jordan', 'Vasquez', 'user.jpg', '064-65425', '65878565', 'Lemoine # 254', 'Chuquisaca', '1978-08-29', 'M', 'Arbitro Referee', 'Bolivia', '41', 1, 'jose@gmail.com', 'jose', 'jose'),
(8, 'Ivo Nigel', 'Mendez', 'Chavez', 'user.jpg', '251-0254', '65248763', 'Loa # 1247', 'Chuquisaca', '1991-07-20', 'M', 'Arbitro Referee', 'Bolivia', '28', 1, 'ivo@gmail.com', 'ivo', 'ivo'),
(9, 'Raul', 'Orosco', 'Mendez', 'user.jpg', '124-63254', '61235478', 'Avaroa # 1456', 'Chuquisaca', '1979-01-14', 'M', 'Arbitro Referee', 'Bolivia', '40', 1, 'raul@gmail.com', 'raul', 'raul'),
(10, 'Gery', 'Vargas', 'Chavez', 'user.jpg', '064-25478', '78954612', '25 de mayo # 12', 'Chuquisaca', '1981-05-13', 'M', 'Planillero', 'Bolivia', '38', 1, 'gery@gmail.com', 'gery', 'gery'),
(11, 'Luis Javier', 'Yrusta', 'Campos', 'user.jpg', '124-56879', '71457893', 'Avaroa # 1245', 'Chuquisaca', '1979-07-07', 'M', 'Planillero', 'Bolivia', '40', 1, 'luis@gmail.com', 'luis', 'luis'),
(12, 'Alberto', 'Antelo', 'Campos', 'user.jpg', '064-65425', '71254365', 'Arenales # 231', 'Chuquisaca', '1984-06-24', 'M', 'Arbitro Asistente Referee', 'Bolivia', '35', 1, 'alberto@gmail.com', 'alberto', 'alberto'),
(13, 'Ariel', 'Guizada', 'Herbas', 'user.jpg', '064-54879', '75631245', 'Loa # 258', 'Chuquisaca', '1980-04-26', 'M', 'Arbitro Asistente Referee', 'Bolivia', '39', 1, 'ariel@gmail.com', 'ariel', 'ariel'),
(14, 'Pablo', 'Montano', 'Chavez', 'user.jpg', '064-36547', '72121010', 'Loa # 120', 'Chuquisaca', '1988-03-26', 'M', 'Arbitro Asistente Referee', 'Bolivia', '31', 1, 'pablo@gmail.com', 'pablo', 'pablo'),
(15, 'Edwar', 'Saavedra', 'Vargas', 'user.jpg', '064-58967', '76894111', 'Colon # 365', 'Chuquisca', '1990-08-20', 'M', 'Arbitro Asistente Referee', 'Bolivia', '29', 1, 'edwar@gamail,com', 'edwar', 'edwar'),
(16, 'Reluy', 'Vallejos', 'Ramos', 'user.jpg', '064-56231', '71256898', 'Arenales # 124', 'Chuquisaca', '1985-09-11', 'M', 'Arbitro Asistente Referee', 'Bolivia', '34', 1, 'reluy@gmail.com', 'reluy', 'reluy'),
(17, 'Cristian', 'Martinez', 'Ibañez', 'user.jpg', '063-22222', '65897452', 'Lemoine #12', 'Chuquisaca', '1993-03-16', 'M', 'Estudiante', 'Bolivia', '24', 1, 'cristian@gmail.com', NULL, NULL),
(18, 'JUAN CARLOS ', 'VERBO', 'MARQUEZ', 'user.jpg', NULL, '78594562', 'Loa #12', 'Chuquisaca', '1991-05-10', 'M', 'Estudiante', 'Bolivia', '27', 1, NULL, NULL, NULL),
(19, 'FERNANDO JOSE', 'MIRANDA', 'COPA', 'user.jpg', NULL, '758965488', 'Loa #125', 'Chuquisaca', '2000-01-09', 'M', 'Estudiante', 'Bolivia', '18', 1, NULL, NULL, NULL),
(20, 'JUAN PABLO', 'COLQUE', 'ESCALANTE', 'user.jpg', NULL, '75845585', 'Loa #1254', 'Chuquisaca', '1999-04-24', 'M', 'Estudiante', 'Bolivia', '19', 1, NULL, NULL, NULL),
(21, 'LUIS ALBARO', 'LLANOS', 'GALLARDO', 'user.jpg', NULL, '75879621', 'Abaroa #145', 'Chuquisaca', '1999-01-11', 'M', 'Estudiante', 'Bolivia', '19', 1, NULL, NULL, NULL),
(22, 'EDWIN', 'MOLLO', 'DONAIRE', 'user.jpg', NULL, '75845585', 'Lemoine #124', 'Chuquisaca', '1994-06-10', 'M', 'Estudiante', 'Bolivia', '24', 1, NULL, NULL, NULL),
(23, 'GILBERTO', 'GONGORA', 'BALDERAS', 'user.jpg', NULL, '75124565', 'Lemoine #542', 'Chuquisaca', '1997-08-09', 'M', 'Estudiante', 'Bolivia', '21', 1, NULL, NULL, NULL),
(24, 'MARIO MIGUEL', 'MARTINEZ', 'IBAÑEZ', 'user.jpg', NULL, '75845585', 'Lemoine #5421', 'Chuquisca', '1998-09-05', 'M', 'Estudiante', 'Bolivia', '20', 1, NULL, NULL, NULL),
(25, 'JUAN BENITO', 'LEON ', 'SANCHES', 'user.jpg', NULL, '75124565', 'Lemoine #254', 'Chuquisaca', '1995-03-31', 'M', 'Estudiante', 'Bolivia', '23', 1, NULL, NULL, NULL),
(26, 'REYNER', 'RODRIGUEZ', 'CAYO', 'user.jpg', NULL, '75845585', 'Lemoine #258', 'Chuquisaca', '1995-03-03', 'M', 'Estudiante', 'Bolivia', '23', 1, NULL, NULL, NULL),
(27, 'DANIEL ALEJANDRO', 'GUTIERREZ', 'MONTAÑO', 'user.jpg', NULL, '75124565', 'Lemoine #258', 'Chuquisaca', '1991-09-16', 'M', 'Estudiante', 'Bolivia', '27', 1, NULL, NULL, NULL),
(28, 'DANIEL', 'MENACHO', 'CALDERON', 'user.jpg', NULL, '75879658', 'Lemoine #258', 'Chuquisaca', '2001-04-17', 'M', 'Estudiante', 'Bolivia', '17', 1, NULL, NULL, NULL),
(29, 'HECTOR WILFREDO', 'GOMEZ', 'UMAÑA', 'user.jpg', NULL, '75896421', 'Lemoine #258', 'Chuquisaca', '1993-09-25', 'M', 'Estudiante', 'Bolivia', '25', 1, NULL, NULL, NULL),
(30, 'NOEL FERNANDO', 'LLANQUI', 'COLQUE', 'user.jpg', NULL, '75849632', 'Lemoine #258', 'Chuquisaca', '2000-06-10', 'M', 'Estudiante', 'Bolivia', '18', 1, NULL, NULL, NULL),
(31, 'LUIS MIGUEL', 'SERRANO', NULL, 'user.jpg', NULL, '78594562', 'Lemoine #236', 'Chuquisaca', '1993-06-25', 'M', 'Estudiante', 'Bolivia', '24', 1, NULL, NULL, NULL),
(32, 'GERONIMO', 'CRUZ', 'MAMANI', 'user.jpg', NULL, '75124565', 'Lemoine #236', 'Chuquisaca', '1995-02-08', 'M', 'Estudiante', 'Bolivia', '23', 1, NULL, NULL, NULL),
(33, 'MANUEL NIQUELI', 'SONCO', 'RIOS', 'user.jpg', NULL, '75849658', 'Lemoine #236', 'Chuquisaca', '1994-08-29', 'M', 'Estudiante', 'Bolivia', '24', 1, NULL, NULL, NULL),
(34, 'ARIEL ALEX', 'CRUZ', 'MAMANI', 'user.jpg', NULL, '75896321', 'Lemoine #236', 'Chuquisaca', '1999-07-31', 'M', 'Estudiante', 'Bolivia', '19', 1, NULL, NULL, NULL),
(35, 'BACILIO RIGOBERTO', 'YUCRA', 'CABA', 'user.jpg', NULL, '741235689', 'Lemoine #236', 'Chuquisaca', '1995-01-04', 'M', 'Estudiante', 'Bolivia', '23', 1, NULL, NULL, NULL),
(36, 'GEYSEL DARWIN', 'CRUZ', 'PANIAGUA', 'user.jpg', NULL, '71245638', 'Lemoine #36', 'Chuquisaca', '1998-04-13', 'M', 'Estudiante', 'Bolivia', '20', 1, NULL, NULL, NULL),
(37, 'BENJAMIN', 'CASTILLO', 'EGUEZ', 'user.jpg', NULL, '72356897', 'Lemoine #36', 'Chuquisaca', '1995-01-05', 'M', 'Estudiante', 'Bolivia', '23', 1, NULL, NULL, NULL),
(38, 'Carlos Alfredo', 'Ortega', 'Orellana', 'user.jpg', '464-85255', '74402507', 'Pasaje Tomina # 2', 'Chuquisaca', '1991-04-04', 'M', 'Estudiante', 'Bolivia', '29', 1, 'ortega.orellana.alfredo@gmail.com', 'Carlos', 'carlos'),
(41, 'ivan', 'callata', 'mamani', 'e3f56-avatar_rector.jpg', '2134r12', '2134', 'asdvsdav', 'Oruro', '1988-12-09', 'F', 'asdvfsadv', 'asvdsad', '30', 1, 'ercm@itecaamericano.com', 'ivi', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

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
(1, 1, 1, '2019-08-28', '1');

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
(1, 1, 1, '2019-08-28', '1'),
(2, 1, 2, '2019-08-28', '1'),
(3, 1, 3, '2019-09-02', '1'),
(4, 1, 4, '2019-09-02', '1'),
(5, 1, 5, '2019-09-02', '1'),
(6, 1, 6, '2019-09-02', '1'),
(7, 1, 7, '2019-09-02', '1'),
(8, 1, 8, '2019-09-02', '1'),
(9, 1, 4, '2019-12-09', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `id_torneo` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`id_torneo`, `nombre`, `fecha_inicio`, `fecha_final`, `estado`) VALUES
(1, 'CAMPEONATO PRIMERA A', '2019-02-09', '2019-12-22', 1),
(2, 'CAMPEONATO PRIMERA B', '2019-05-18', '2019-11-24', 1),
(3, 'CAMPEONATO PRIMERAS DE ASCENSO', '2019-05-25', '2019-11-24', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo_equipo`
--

CREATE TABLE `torneo_equipo` (
  `id_torneoEquipo` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `torneo_equipo`
--

INSERT INTO `torneo_equipo` (`id_torneoEquipo`, `id_equipo`, `id_torneo`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 3),
(10, 10, 3),
(11, 11, 3),
(12, 12, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id_transacciones` int(11) NOT NULL,
  `id_costostorneo` int(11) NOT NULL,
  `id_torneoequipo` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`id_transacciones`, `id_costostorneo`, `id_torneoequipo`, `fecha`, `cantidad`, `estado`) VALUES
(1, 4, 1, '2019-05-08', 30, 1),
(2, 2, 1, '2019-05-08', 10, 1),
(3, 1, 9, '2019-12-09', 111, 1),
(4, 5, 9, '2019-12-09', 500, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencias`
--

CREATE TABLE `transferencias` (
  `id_transferencias` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_equipo_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `transferencias`
--

INSERT INTO `transferencias` (`id_transferencias`, `fecha`, `id_jugador`, `id_equipo`, `id_equipo_destino`) VALUES
(1, '2019-08-05', 1, 6, 1),
(2, '2019-09-17', 1, 1, 2),
(3, '2019-10-10', 1, 2, 5),
(4, '2019-10-16', 1, 5, 15),
(5, '2019-10-16', 1, 15, 12),
(6, '2019-10-16', 1, 12, 6),
(7, '2019-10-16', 1, 6, 9),
(8, '2019-10-16', 1, 9, 16),
(9, '2019-10-16', 1, 9, 16),
(10, '2019-10-16', 1, 16, 14),
(11, '2019-10-16', 1, 14, 3),
(12, '2019-10-16', 1, 3, 16),
(13, '2019-10-16', 1, 16, 9);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_costo_torneo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_costo_torneo` (
`id_costostorneo` int(11)
,`torneo_costo` varchar(321)
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
,`edad` varchar(10)
,`nombres` varchar(70)
,`apellido_paterno` varchar(70)
,`apellido_materno` varchar(70)
,`foto` varchar(255)
,`fecha_nacimiento` date
,`sexo` varchar(1)
,`id_jugador` int(11)
,`club` varchar(150)
,`categoria` varchar(150)
,`lfpb_asociacion_liga_provincial` varchar(250)
,`n_registro_fbf` int(11)
,`estado_civil` varchar(50)
,`nombre_padre` varchar(70)
,`nombre_madre` varchar(70)
,`c_i` varchar(30)
,`domicilio` varchar(250)
,`procede_del_club` varchar(250)
,`posicion` varchar(35)
,`estatura` decimal(10,0)
,`peso` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_jugador_categoria`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_jugador_categoria` (
`jugador` varchar(212)
,`id_jugador` int(11)
,`id_persona` int(11)
,`id_categoria` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_partidos_arbitro`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_partidos_arbitro` (
`arbitro` varchar(212)
,`id_arbitro` int(11)
,`id_persona` int(11)
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
-- Estructura Stand-in para la vista `v_torneo_equipo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_torneo_equipo` (
`id_torneoEquipo` int(11)
,`equipo_torneo` varchar(354)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_costo_torneo`
--
DROP TABLE IF EXISTS `v_costo_torneo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_costo_torneo`  AS  select `costos_torneo`.`id_costostorneo` AS `id_costostorneo`,concat('Bs. ',`costos_torneo`.`costo`,'-',`concepto`.`nombre`,' -> ',`torneo`.`nombre`) AS `torneo_costo` from ((`costos_torneo` join `torneo`) join `concepto`) where ((`costos_torneo`.`id_torneo` = `torneo`.`id_torneo`) and (`costos_torneo`.`id_concepto` = `concepto`.`id_concepto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_ficha_kardex`
--
DROP TABLE IF EXISTS `v_ficha_kardex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ficha_kardex`  AS  select `persona`.`id_persona` AS `id_persona`,`persona`.`nacionalidad` AS `nacionalidad`,`persona`.`ciudad` AS `ciudad`,`jugador`.`estado` AS `estado`,`persona`.`edad` AS `edad`,`persona`.`nombres` AS `nombres`,`persona`.`apellido_paterno` AS `apellido_paterno`,`persona`.`apellido_materno` AS `apellido_materno`,`persona`.`foto` AS `foto`,`persona`.`fecha_nacimiento` AS `fecha_nacimiento`,`persona`.`sexo` AS `sexo`,`jugador`.`id_jugador` AS `id_jugador`,`jugador`.`club` AS `club`,`jugador`.`categoria` AS `categoria`,`jugador`.`lfpb_asociacion_liga_provincial` AS `lfpb_asociacion_liga_provincial`,`jugador`.`n_registro_fbf` AS `n_registro_fbf`,`jugador`.`estado_civil` AS `estado_civil`,`jugador`.`nombre_padre` AS `nombre_padre`,`jugador`.`nombre_madre` AS `nombre_madre`,`jugador`.`c_i` AS `c_i`,`jugador`.`domicilio` AS `domicilio`,`jugador`.`procede_del_club` AS `procede_del_club`,`jugador`.`posicion` AS `posicion`,`jugador`.`estatura` AS `estatura`,`jugador`.`peso` AS `peso` from (((`persona` join `jugador` on((`jugador`.`id_persona` = `persona`.`id_persona`))) join `jugador_categoria` on((`jugador_categoria`.`id_jugador` = `jugador`.`id_jugador`))) join `categoria` on((`categoria`.`id_categoria` = `jugador_categoria`.`id_categoria`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_jugador_categoria`
--
DROP TABLE IF EXISTS `v_jugador_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jugador_categoria`  AS  select concat(`persona`.`apellido_paterno`,' ',`persona`.`apellido_materno`,' ',`persona`.`nombres`) AS `jugador`,`jugador`.`id_jugador` AS `id_jugador`,`persona`.`id_persona` AS `id_persona`,`categoria`.`id_categoria` AS `id_categoria` from (((`persona` join `jugador`) join `jugador_categoria`) join `categoria`) where ((`persona`.`id_persona` = `jugador`.`id_persona`) and (`jugador_categoria`.`id_jugador` = `jugador`.`id_jugador`) and (`jugador_categoria`.`id_categoria` = `categoria`.`id_categoria`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_partidos_arbitro`
--
DROP TABLE IF EXISTS `v_partidos_arbitro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_partidos_arbitro`  AS  select concat(`persona`.`apellido_paterno`,' ',`persona`.`apellido_materno`,' ',`persona`.`nombres`) AS `arbitro`,`arbitro`.`id_arbitro` AS `id_arbitro`,`persona`.`id_persona` AS `id_persona` from ((`persona` join `arbitro`) join `partidos_arbitro`) where ((`persona`.`id_persona` = `arbitro`.`id_persona`) and (`partidos_arbitro`.`id_arbitro` = `arbitro`.`id_arbitro`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_personas_menus_principales`
--
DROP TABLE IF EXISTS `v_personas_menus_principales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_personas_menus_principales`  AS  select `persona`.`nombres` AS `nombre_persona`,`persona`.`apellido_paterno` AS `apellido_paterno`,`persona`.`apellido_materno` AS `apellido_materno`,`persona`.`fecha_nacimiento` AS `fecha_nacimiento`,`persona`.`foto` AS `foto`,`persona`.`sexo` AS `sexo`,`persona`.`telefono` AS `telefono`,`persona`.`celular` AS `celular`,`persona`.`usuario` AS `usuario`,`persona`.`password` AS `password`,`personas_roles`.`id` AS `id_persona_rol`,`personas_roles`.`id_persona` AS `id_persona`,`personas_roles`.`id_rol` AS `id_rol`,`roles`.`nombre` AS `nombre_rol`,`roles_menus_principales`.`id_menu_principal` AS `id_menu_principal`,`menus_principales`.`nombre` AS `nombre_menu_principal`,`menus_principales`.`icono` AS `icono`,`menus_principales`.`color` AS `color`,`menus_principales`.`orden` AS `orden`,`menus_principales`.`estado` AS `estado` from ((((`menus_principales` join `roles_menus_principales` on((`menus_principales`.`id` = `roles_menus_principales`.`id_menu_principal`))) join `roles` on((`roles_menus_principales`.`id_rol` = `roles`.`id`))) join `personas_roles` on((`personas_roles`.`id_rol` = `roles`.`id`))) join `persona` on((`personas_roles`.`id_persona` = `persona`.`id_persona`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_torneo_equipo`
--
DROP TABLE IF EXISTS `v_torneo_equipo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_torneo_equipo`  AS  select `torneo_equipo`.`id_torneoEquipo` AS `id_torneoEquipo`,concat(`equipo`.`nombre_equipo`,' -> ',`torneo`.`nombre`) AS `equipo_torneo` from ((`torneo_equipo` join `equipo`) join `torneo`) where ((`torneo_equipo`.`id_equipo` = `equipo`.`id_equipo`) and (`torneo_equipo`.`id_torneo` = `torneo`.`id_torneo`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arbitro`
--
ALTER TABLE `arbitro`
  ADD PRIMARY KEY (`id_arbitro`);

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
-- Indices de la tabla `costos_torneo`
--
ALTER TABLE `costos_torneo`
  ADD PRIMARY KEY (`id_costostorneo`);

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
-- Indices de la tabla `equipo_jugador`
--
ALTER TABLE `equipo_jugador`
  ADD PRIMARY KEY (`id_equijugador`);

--
-- Indices de la tabla `estadio`
--
ALTER TABLE `estadio`
  ADD PRIMARY KEY (`id_estadio`);

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
-- Indices de la tabla `jugador_categoria`
--
ALTER TABLE `jugador_categoria`
  ADD PRIMARY KEY (`id_jugcategoria`);

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
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id_partidos`);

--
-- Indices de la tabla `partidos_arbitro`
--
ALTER TABLE `partidos_arbitro`
  ADD PRIMARY KEY (`id_partarbitro`);

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
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`id_torneo`);

--
-- Indices de la tabla `torneo_equipo`
--
ALTER TABLE `torneo_equipo`
  ADD PRIMARY KEY (`id_torneoEquipo`);

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
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `categoria_arbitro`
--
ALTER TABLE `categoria_arbitro`
  MODIFY `id_catarbitro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `club`
--
ALTER TABLE `club`
  MODIFY `id_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id_concepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `costos_torneo`
--
ALTER TABLE `costos_torneo`
  MODIFY `id_costostorneo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
-- AUTO_INCREMENT de la tabla `equipo_jugador`
--
ALTER TABLE `equipo_jugador`
  MODIFY `id_equijugador` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estadio`
--
ALTER TABLE `estadio`
  MODIFY `id_estadio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `id_jornadas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `jugador_categoria`
--
ALTER TABLE `jugador_categoria`
  MODIFY `id_jugcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `menus_principales`
--
ALTER TABLE `menus_principales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id_partidos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `partidos_arbitro`
--
ALTER TABLE `partidos_arbitro`
  MODIFY `id_partarbitro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `personas_roles`
--
ALTER TABLE `personas_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `roles_menus_principales`
--
ALTER TABLE `roles_menus_principales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `id_torneo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `torneo_equipo`
--
ALTER TABLE `torneo_equipo`
  MODIFY `id_torneoEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id_transacciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `transferencias`
--
ALTER TABLE `transferencias`
  MODIFY `id_transferencias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
