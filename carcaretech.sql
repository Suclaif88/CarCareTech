-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2024 a las 23:14:02
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Documento` char(10) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Celular` char(10) DEFAULT NULL,
  `F_Nacimiento` date DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Documento`, `Nombre`, `Apellido`, `Celular`, `F_Nacimiento`, `Correo`, `Direccion`) VALUES
('1033180822', 'Juan', 'Hernandez', '3023442828', '2006-12-05', 'juanh@gmail.com', 'Cra47a #70-86'),
('1033180823', 'Ana', 'Martinez', '3023442829', '1990-03-15', 'ana.martinez@gmail.com', 'Calle 50 #20-15'),
('1033180824', 'Carlos', 'Lopez', '3023442830', '1985-07-23', 'carlos.lopez@gmail.com', 'Av. Siempre Viva #742'),
('1033180825', 'Maria', 'Gonzalez', '3023442831', '1978-11-30', 'maria.gonzalez@gmail.com', 'Carrera 12 #34-56'),
('1033180826', 'Luis', 'Rodriguez', '3023442832', '1995-06-18', 'luis.rodriguez@gmail.com', 'Calle 45 #67-89'),
('1033180827', 'Carmen', 'Diaz', '3023442833', '1982-05-12', 'carmen.diaz@gmail.com', 'Carrera 23 #12-34'),
('1033180828', 'Jorge', 'Ramirez', '3023442834', '1988-02-20', 'jorge.ramirez@gmail.com', 'Calle 10 #9-87'),
('1033180829', 'Elena', 'Fernandez', '3023442835', '1993-04-08', 'elena.fernandez@gmail.com', 'Carrera 30 #45-67'),
('1033180830', 'Miguel', 'Torres', '3023442836', '1980-10-25', 'miguel.torres@gmail.com', 'Av. Libertador #123'),
('1033180831', 'Isabel', 'Ruiz', '3023442837', '1991-12-14', 'isabel.ruiz@gmail.com', 'Calle 26 #27-48'),
('1033180832', 'Pedro', 'Morales', '3023442838', '1987-08-31', 'pedro.morales@gmail.com', 'Carrera 15 #16-19'),
('1033180833', 'Lucia', 'Garcia', '3023442839', '1994-09-27', 'lucia.garcia@gmail.com', 'Calle 17 #18-21'),
('1033180834', 'Raul', 'Martinez', '3023442840', '1992-01-11', 'raul.martinez@gmail.com', 'Av. Principal #456'),
('1033180835', 'Adriana', 'Hernandez', '3023442841', '1983-05-06', 'adriana.hernandez@gmail.com', 'Carrera 20 #21-23'),
('1033180836', 'Roberto', 'Gomez', '3023442842', '1996-03-02', 'roberto.gomez@gmail.com', 'Calle 35 #36-38'),
('1033180837', 'Patricia', 'Castro', '3023442843', '1981-07-22', 'patricia.castro@gmail.com', 'Carrera 25 #26-29'),
('1033180838', 'Alejandro', 'Ortiz', '3023442844', '1984-11-04', 'alejandro.ortiz@gmail.com', 'Calle 40 #41-43'),
('1033180839', 'Laura', 'Mendez', '3023442845', '1999-12-16', 'laura.mendez@gmail.com', 'Carrera 14 #15-17'),
('1033180840', 'Fernando', 'Suarez', '3023442846', '1990-10-30', 'fernando.suarez@gmail.com', 'Calle 48 #49-51'),
('1033180841', 'Rosa', 'Ramos', '3023442847', '1986-06-21', 'rosa.ramos@gmail.com', 'Av. Victoria #987'),
('1033180842', 'Daniel', 'Romero', '3023442848', '1992-09-19', 'daniel.romero@gmail.com', 'Calle 22 #23-25'),
('1033180843', 'Monica', 'Vargas', '3023442849', '1989-04-25', 'monica.vargas@gmail.com', 'Carrera 10 #11-13'),
('1033180844', 'Andres', 'Silva', '3023442850', '1985-08-17', 'andres.silva@gmail.com', 'Calle 13 #14-16'),
('1033180845', 'Gloria', 'Navarro', '3023442851', '1991-02-28', 'gloria.navarro@gmail.com', 'Carrera 28 #29-31'),
('1033180846', 'Jose', 'Pena', '3023442852', '1987-11-03', 'jose.pena@gmail.com', 'Calle 29 #30-32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_empresa`
--

CREATE TABLE `datos_empresa` (
  `NIT` char(9) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `datos_empresa`
--

INSERT INTO `datos_empresa` (`NIT`, `Nombre`, `Telefono`, `Correo`, `Direccion`) VALUES
('147258369', 'Ruedas y Tuercas', '3195442623', 'ruedas.tuercas@gmail.com', 'Cra76 #53-200');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto`
--

CREATE TABLE `detalle_producto` (
  `Id_Detalle_Producto` tinyint(3) UNSIGNED NOT NULL,
  `Id_Factura` int(11) DEFAULT NULL,
  `Id_producto` smallint(6) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Cantidad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_producto`
--

INSERT INTO `detalle_producto` (`Id_Detalle_Producto`, `Id_Factura`, `Id_producto`, `Precio`, `Cantidad`) VALUES
(1, 1, 4, 27000, 3),
(2, 1, 25, 500000, 2),
(3, 1, 9, 85000, 1),
(4, 2, 2, 35000, 3),
(5, 2, 14, 300000, 1),
(6, 2, 21, 150000, 2),
(7, 3, 22, 300000, 4),
(8, 3, 25, 500000, 3),
(9, 3, 5, 50000, 2),
(10, 4, 21, 150000, 2),
(11, 4, 5, 50000, 2),
(12, 4, 28, 160000, 2),
(13, 5, 16, 95000, 3),
(14, 5, 28, 160000, 2),
(15, 5, 7, 120000, 1),
(16, 6, 10, 130000, 1),
(17, 6, 12, 250000, 3),
(18, 6, 3, 100000, 1),
(19, 7, 18, 135000, 2),
(20, 7, 2, 35000, 3),
(21, 7, 26, 35000, 1),
(22, 8, 12, 250000, 3),
(23, 8, 3, 100000, 1),
(24, 8, 29, 250000, 2),
(25, 9, 26, 35000, 1),
(26, 9, 23, 175000, 4),
(27, 9, 29, 250000, 2),
(28, 10, 6, 80000, 2),
(29, 10, 26, 35000, 2),
(30, 10, 26, 35000, 3),
(31, 11, 28, 160000, 4),
(32, 11, 12, 250000, 3),
(33, 11, 18, 135000, 1),
(34, 12, 30, 375000, 2),
(35, 12, 25, 500000, 4),
(36, 12, 4, 27000, 2),
(37, 13, 10, 130000, 1),
(38, 13, 5, 50000, 4),
(39, 13, 18, 135000, 2),
(40, 14, 24, 180000, 2),
(41, 14, 22, 300000, 1),
(42, 14, 11, 170000, 3),
(43, 15, 13, 200000, 3),
(44, 15, 19, 75000, 3),
(45, 15, 28, 160000, 2),
(46, 16, 1, 25000, 4),
(47, 16, 20, 90000, 3),
(48, 16, 7, 120000, 3),
(49, 17, 14, 300000, 1),
(50, 17, 28, 160000, 1),
(51, 17, 30, 375000, 3),
(52, 18, 8, 100000, 3),
(53, 18, 19, 75000, 2),
(54, 18, 12, 250000, 1),
(55, 19, 13, 200000, 1),
(56, 19, 27, 45000, 1),
(57, 19, 30, 375000, 3),
(58, 20, 25, 500000, 4),
(59, 20, 3, 100000, 4),
(60, 20, 7, 120000, 2),
(61, 21, 22, 300000, 1),
(62, 21, 27, 45000, 3),
(63, 21, 22, 300000, 1),
(64, 22, 27, 45000, 1),
(65, 22, 8, 100000, 4),
(66, 22, 27, 45000, 3),
(67, 23, 13, 200000, 1),
(68, 23, 1, 25000, 1),
(69, 23, 30, 375000, 1),
(70, 24, 2, 35000, 2),
(71, 24, 20, 90000, 4),
(72, 24, 2, 35000, 2),
(73, 25, 3, 100000, 1),
(74, 25, 20, 90000, 4),
(75, 25, 10, 130000, 4),
(76, 26, 12, 250000, 3),
(77, 26, 18, 135000, 4),
(78, 26, 7, 120000, 2),
(79, 27, 1, 25000, 1),
(80, 27, 2, 35000, 3),
(81, 27, 3, 100000, 2),
(82, 28, 24, 180000, 1),
(83, 28, 6, 80000, 2),
(84, 28, 4, 27000, 2),
(85, 29, 3, 100000, 1),
(86, 29, 14, 300000, 3),
(87, 29, 13, 200000, 4),
(88, 30, 19, 75000, 4),
(89, 30, 16, 95000, 1),
(90, 30, 24, 180000, 3),
(91, 31, 10, 130000, 3),
(92, 31, 8, 100000, 3),
(93, 31, 26, 35000, 3),
(94, 32, 16, 95000, 3),
(95, 32, 5, 50000, 2),
(96, 32, 26, 35000, 3),
(97, 33, 6, 80000, 4),
(98, 33, 12, 250000, 1),
(99, 33, 13, 200000, 1),
(100, 34, 10, 130000, 3),
(101, 34, 21, 150000, 1),
(102, 34, 17, 110000, 1),
(103, 35, 14, 300000, 1),
(104, 35, 5, 50000, 2),
(105, 35, 27, 45000, 2),
(106, 36, 27, 45000, 2),
(107, 36, 25, 500000, 2),
(108, 36, 17, 110000, 4),
(109, 37, 8, 100000, 1),
(110, 37, 1, 25000, 2),
(111, 37, 21, 150000, 3),
(112, 38, 17, 110000, 4),
(113, 38, 9, 85000, 3),
(114, 38, 15, 275000, 1),
(115, 39, 12, 250000, 4),
(116, 39, 23, 175000, 2),
(117, 39, 28, 160000, 3),
(118, 40, 3, 100000, 4),
(119, 40, 18, 135000, 4),
(120, 40, 17, 110000, 2),
(121, 41, 14, 300000, 2),
(122, 41, 3, 100000, 1),
(123, 41, 5, 50000, 3),
(124, 42, 9, 85000, 1),
(125, 42, 27, 45000, 1),
(126, 42, 22, 300000, 2),
(127, 43, 29, 250000, 3),
(128, 43, 6, 80000, 3),
(129, 43, 11, 170000, 4),
(130, 44, 18, 135000, 4),
(131, 44, 14, 300000, 2),
(132, 44, 30, 375000, 2),
(133, 45, 7, 120000, 1),
(134, 45, 27, 45000, 4),
(135, 45, 2, 35000, 4),
(136, 46, 21, 150000, 3),
(137, 46, 3, 100000, 4),
(138, 46, 9, 85000, 1),
(139, 47, 18, 135000, 3),
(140, 47, 8, 100000, 2),
(141, 47, 7, 120000, 2),
(142, 48, 26, 35000, 1),
(143, 48, 27, 45000, 4),
(144, 48, 24, 180000, 2),
(145, 49, 8, 100000, 1),
(146, 49, 19, 75000, 4),
(147, 49, 29, 250000, 4),
(148, 50, 8, 100000, 4),
(149, 50, 6, 80000, 2),
(150, 50, 21, 150000, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_servicio`
--

CREATE TABLE `detalle_servicio` (
  `Id_Detalle_Servicio` tinyint(3) UNSIGNED NOT NULL,
  `Id_Factura` int(11) DEFAULT NULL,
  `Id_Servicio` smallint(6) DEFAULT NULL,
  `Precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_servicio`
--

INSERT INTO `detalle_servicio` (`Id_Detalle_Servicio`, `Id_Factura`, `Id_Servicio`, `Precio`) VALUES
(1, 1, 2, 60000),
(2, 1, 1, 50000),
(3, 1, 5, 55000),
(4, 2, 1, 50000),
(5, 2, 4, 45000),
(6, 2, 6, 70000),
(7, 3, 2, 60000),
(8, 3, 3, 40000),
(9, 3, 1, 50000),
(10, 4, 5, 55000),
(11, 4, 1, 50000),
(12, 4, 4, 45000),
(13, 5, 2, 60000),
(14, 5, 3, 40000),
(15, 5, 4, 45000),
(16, 6, 6, 70000),
(17, 6, 2, 60000),
(18, 6, 1, 50000),
(19, 7, 5, 55000),
(20, 7, 3, 40000),
(21, 7, 2, 60000),
(22, 8, 3, 40000),
(23, 8, 1, 50000),
(24, 8, 4, 45000),
(25, 9, 1, 50000),
(26, 9, 1, 50000),
(27, 9, 1, 50000),
(28, 10, 3, 40000),
(29, 10, 1, 50000),
(30, 10, 6, 70000),
(31, 11, 4, 45000),
(32, 11, 6, 70000),
(33, 11, 1, 50000),
(34, 12, 6, 70000),
(35, 12, 1, 50000),
(36, 12, 6, 70000),
(37, 13, 1, 50000),
(38, 13, 1, 50000),
(39, 13, 5, 55000),
(40, 14, 5, 55000),
(41, 14, 1, 50000),
(42, 14, 3, 40000),
(43, 15, 1, 50000),
(44, 15, 4, 45000),
(45, 15, 2, 60000),
(46, 16, 2, 60000),
(47, 16, 4, 45000),
(48, 16, 5, 55000),
(49, 17, 4, 45000),
(50, 17, 6, 70000),
(51, 17, 2, 60000),
(52, 18, 2, 60000),
(53, 18, 5, 55000),
(54, 18, 4, 45000),
(55, 19, 1, 50000),
(56, 19, 6, 70000),
(57, 19, 2, 60000),
(58, 20, 5, 55000),
(59, 20, 1, 50000),
(60, 20, 4, 45000),
(61, 21, 1, 50000),
(62, 21, 5, 55000),
(63, 21, 3, 40000),
(64, 22, 6, 70000),
(65, 22, 5, 55000),
(66, 22, 4, 45000),
(67, 23, 5, 55000),
(68, 23, 2, 60000),
(69, 23, 5, 55000),
(70, 24, 6, 70000),
(71, 24, 4, 45000),
(72, 24, 4, 45000),
(73, 25, 2, 60000),
(74, 25, 2, 60000),
(75, 25, 4, 45000),
(76, 26, 6, 70000),
(77, 26, 3, 40000),
(78, 26, 4, 45000),
(79, 27, 6, 70000),
(80, 27, 2, 60000),
(81, 27, 6, 70000),
(82, 28, 2, 60000),
(83, 28, 3, 40000),
(84, 28, 2, 60000),
(85, 29, 1, 50000),
(86, 29, 3, 40000),
(87, 29, 2, 60000),
(88, 30, 5, 55000),
(89, 30, 4, 45000),
(90, 30, 5, 55000),
(91, 31, 3, 40000),
(92, 31, 6, 70000),
(93, 31, 2, 60000),
(94, 32, 6, 70000),
(95, 32, 3, 40000),
(96, 32, 1, 50000),
(97, 33, 3, 40000),
(98, 33, 1, 50000),
(99, 33, 5, 55000),
(100, 34, 6, 70000),
(101, 34, 5, 55000),
(102, 34, 5, 55000),
(103, 35, 2, 60000),
(104, 35, 5, 55000),
(105, 35, 6, 70000),
(106, 36, 5, 55000),
(107, 36, 6, 70000),
(108, 36, 1, 50000),
(109, 37, 4, 45000),
(110, 37, 1, 50000),
(111, 37, 2, 60000),
(112, 38, 2, 60000),
(113, 38, 3, 40000),
(114, 38, 6, 70000),
(115, 39, 2, 60000),
(116, 39, 5, 55000),
(117, 39, 1, 50000),
(118, 40, 3, 40000),
(119, 40, 2, 60000),
(120, 40, 3, 40000),
(121, 41, 2, 60000),
(122, 41, 1, 50000),
(123, 41, 6, 70000),
(124, 42, 4, 45000),
(125, 42, 2, 60000),
(126, 42, 1, 50000),
(127, 43, 3, 40000),
(128, 43, 3, 40000),
(129, 43, 6, 70000),
(130, 44, 4, 45000),
(131, 44, 4, 45000),
(132, 44, 1, 50000),
(133, 45, 4, 45000),
(134, 45, 2, 60000),
(135, 45, 3, 40000),
(136, 46, 1, 50000),
(137, 46, 4, 45000),
(138, 46, 1, 50000),
(139, 47, 2, 60000),
(140, 47, 4, 45000),
(141, 47, 2, 60000),
(142, 48, 5, 55000),
(143, 48, 5, 55000),
(144, 48, 4, 45000),
(145, 49, 6, 70000),
(146, 49, 3, 40000),
(147, 49, 5, 55000),
(148, 50, 3, 40000),
(149, 50, 5, 55000),
(150, 50, 3, 40000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `Id_factura` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Placa` char(7) DEFAULT NULL,
  `Documento_M` char(10) DEFAULT NULL,
  `Id_Metodo_Pago` tinyint(3) UNSIGNED DEFAULT NULL,
  `NIT` char(9) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Subtotal` double DEFAULT NULL,
  `Iva` double DEFAULT NULL,
  `Descuento` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`Id_factura`, `Fecha`, `Placa`, `Documento_M`, `Id_Metodo_Pago`, `NIT`, `Total`, `Subtotal`, `Iva`, `Descuento`) VALUES
(1, '2024-06-04 07:00:00', 'ABC123', '1078324098', 1, '147258369', 1051490, 1331000, 252890, 532400),
(2, '2024-06-04 08:20:00', 'ABC901', '1078324098', 1, '147258369', 1161300, 1470000, 279300, 588000),
(3, '2024-06-04 08:40:00', 'BCD678', '1078324098', 3, '147258369', 2330500, 2950000, 560500, 1180000),
(4, '2024-06-04 09:00:00', 'BCD890', '1033178014', 1, '147258369', 687300, 870000, 165300, 348000),
(5, '2024-06-04 09:20:00', 'CDE567', '1097213045', 2, '147258369', 687300, 870000, 165300, 348000),
(6, '2024-06-04 09:40:00', 'DEF234', '1078324098', 3, '147258369', 916400, 1160000, 220400, 464000),
(7, '2024-06-04 10:00:00', 'DEF456', '1078324098', 1, '147258369', 446350, 565000, 107350, 226000),
(8, '2024-06-04 10:20:00', 'EFG123', '1097213045', 3, '147258369', 1173150, 1485000, 282150, 594000),
(9, '2024-06-04 10:40:00', 'EFG901', '1078324098', 2, '147258369', 1094150, 1385000, 263150, 554000),
(10, '2024-06-04 11:00:00', 'FGH890', '1033178014', 1, '147258369', 391050, 495000, 94050, 198000),
(11, '2024-06-04 11:20:00', 'GHI567', '1045296032', 3, '147258369', 1335100, 1690000, 321100, 676000),
(12, '2024-06-04 11:40:00', 'GHI789', '1045296032', 2, '147258369', 2365260, 2994000, 568860, 1197600),
(13, '2024-06-04 12:00:00', 'HIJ234', '1033178014', 3, '147258369', 596450, 755000, 143450, 302000),
(14, '2024-06-04 12:20:00', 'HIJ456', '1045296032', 1, '147258369', 1038850, 1315000, 249850, 526000),
(15, '2024-06-04 12:40:00', 'IJK123', '1097213045', 2, '147258369', 1027000, 1300000, 247000, 520000),
(16, '2024-06-04 13:00:00', 'JKL012', '1078324098', 3, '147258369', 703100, 890000, 169100, 356000),
(17, '2024-06-04 13:20:00', 'JKL890', '1097213045', 2, '147258369', 1390400, 1760000, 334400, 704000),
(18, '2024-06-04 13:40:00', 'KLM567', '1078324098', 1, '147258369', 679400, 860000, 163400, 344000),
(19, '2024-06-04 14:00:00', 'KLM789', '1097213045', 2, '147258369', 1224500, 1550000, 294500, 620000),
(20, '2024-06-04 14:20:00', 'LMN456', '1045296032', 3, '147258369', 2204100, 2790000, 530100, 1116000),
(21, '2024-06-04 14:40:00', 'MNO123', '1097213045', 1, '147258369', 695200, 880000, 167200, 352000),
(22, '2024-06-04 15:00:00', 'MNO345', '1033178014', 3, '147258369', 592500, 750000, 142500, 300000),
(23, '2024-06-04 15:20:00', 'NOP012', '1078324098', 2, '147258369', 608300, 770000, 146300, 308000),
(24, '2024-06-04 15:40:00', 'OPQ789', '1033178014', 1, '147258369', 521400, 660000, 125400, 264000),
(25, '2024-06-04 16:00:00', 'PQR456', '1097213045', 3, '147258369', 904550, 1145000, 217550, 458000),
(26, '2024-06-04 16:20:00', 'PQR678', '1078324098', 1, '147258369', 1331150, 1685000, 320150, 674000),
(27, '2024-06-04 16:40:00', 'QRS345', '1097213045', 2, '147258369', 418700, 585000, 100700, 212000),
(28, '2024-06-04 17:00:00', 'RST012', '1078324098', 3, '147258369', 437660, 1080000, 105260, 221600),
(29, '2024-06-04 17:20:00', 'STU789', '1045296032', 1, '147258369', 1540500, 1970000, 370500, 780000),
(30, '2024-06-04 17:40:00', 'STU901', '1078324098', 2, '147258369', 861100, 1090000, 207100, 436000),
(31, '2024-06-04 08:10:00', 'TUV678', '1097213045', 3, '147258369', 762350, 965000, 183350, 386000),
(32, '2024-06-04 08:30:00', 'UVW345', '1033178014', 1, '147258369', 513500, 650000, 123500, 260000),
(33, '2024-06-04 08:50:00', 'VWX012', '1045296032', 2, '147258369', 722850, 915000, 173850, 366000),
(34, '2024-06-04 09:10:00', 'VWX234', '1078324098', 1, '147258369', 655700, 830000, 157700, 332000),
(35, '2024-06-04 09:30:00', 'WXY901', '1078324098', 3, '147258369', 533250, 675000, 128250, 270000),
(36, '2024-06-04 09:50:00', 'XYZ678', '1097213045', 2, '147258369', 1346950, 1705000, 323950, 682000),
(37, '2024-06-04 10:10:00', 'YZA345', '1033178014', 1, '147258369', 596450, 755000, 143450, 302000),
(38, '2024-06-04 10:30:00', 'YZA567', '1097213045', 2, '147258369', 900600, 1140000, 216600, 456000),
(39, '2024-06-04 10:50:00', 'ZAB234', '1078324098', 3, '147258369', 1576050, 1995000, 379050, 798000),
(40, '2024-06-04 11:10:00', 'ABC123', '1097213045', 2, '147258369', 1027000, 1300000, 247000, 520000),
(41, '2024-06-04 11:30:00', 'EFG901', '1045296032', 1, '147258369', 813700, 1030000, 195700, 412000),
(42, '2024-06-04 11:50:00', 'ABC123', '1078324098', 3, '147258369', 699150, 890000, 168150, 354000),
(43, '2024-06-04 12:10:00', 'VWX234', '1045296032', 1, '147258369', 1437800, 1815000, 345800, 728000),
(44, '2024-06-04 12:30:00', 'ZAB234', '1033178014', 2, '147258369', 1603700, 2030000, 385700, 812000),
(45, '2024-06-04 12:50:00', 'STU789', '1078324098', 3, '147258369', 462150, 585000, 111150, 234000),
(46, '2024-06-04 13:10:00', 'CDE567', '1045296032', 1, '147258369', 853200, 1080000, 205200, 432000),
(47, '2024-06-04 13:30:00', 'KLM567', '1078324098', 2, '147258369', 797900, 1010000, 191900, 404000),
(48, '2024-06-04 13:50:00', 'STU789', '1045296032', 3, '147258369', 576700, 730000, 138700, 292000),
(49, '2024-06-04 14:10:00', 'MNO345', '1033178014', 2, '147258369', 1236350, 1565000, 297350, 626000),
(50, '2024-06-04 14:30:00', 'ABC123', '1078324098', 1, '147258369', 1023050, 1295000, 246050, 518000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `Documento` char(10) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Celular` varchar(10) DEFAULT NULL,
  `F_Nacimiento` date DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mecanico`
--

INSERT INTO `mecanico` (`Documento`, `Nombre`, `Apellido`, `Celular`, `F_Nacimiento`, `Correo`) VALUES
('1033178014', 'Sebastian', 'Roldan', '3225319812', '2005-04-24', 'sebasr@gmail.com'),
('1045296032', 'Laura', 'Gomez', '3112459876', '1998-08-12', 'lauragomez@example.com'),
('1078324098', 'Andres', 'Lopez', '3006741234', '1996-12-03', 'andreslopez@example.com'),
('1097213045', 'Maria', 'Martinez', '3105896743', '2000-03-17', 'mariamartinez@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `Id_Metodo_Pago` tinyint(3) UNSIGNED NOT NULL,
  `Tipo` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`Id_Metodo_Pago`, `Tipo`) VALUES
(1, 'Efectivo'),
(2, 'Debito'),
(3, 'Credito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_producto` smallint(6) NOT NULL,
  `Id_tipo_producto` tinyint(3) UNSIGNED DEFAULT NULL,
  `Cantidad_Stock` smallint(6) DEFAULT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_producto`, `Id_tipo_producto`, `Cantidad_Stock`, `Nombre`, `Precio`) VALUES
(1, 1, 50, 'Llave inglesa', 25000),
(2, 1, 30, 'Destornillador de Estrella', 35000),
(3, 1, 20, 'Juego de llaves Allen', 100000),
(4, 1, 40, 'Alicate de corte', 27000),
(5, 1, 25, 'Martillo de bola', 50000),
(6, 2, 100, 'Aceite para motor 5W-30', 80000),
(7, 2, 80, 'Aceite para transmisión', 120000),
(8, 2, 70, 'Lubricante multiusos', 100000),
(9, 2, 60, 'Grasa para rodamientos', 85000),
(10, 2, 50, 'Líquido de frenos', 130000),
(11, 3, 25, 'Neumático 195/65R15', 170000),
(12, 3, 30, 'Neumático 205/55R16', 250000),
(13, 3, 15, 'Neumático 215/60R17', 200000),
(14, 3, 20, 'Neumático 225/45R18', 300000),
(15, 3, 10, 'Neumático 235/50R19', 275000),
(16, 4, 75, 'Filtro de aire', 95000),
(17, 4, 65, 'Filtro de aceite', 110000),
(18, 4, 85, 'Filtro de combustible', 135000),
(19, 4, 55, 'Filtro de cabina', 75000),
(20, 4, 50, 'Filtro hidráulico', 90000),
(21, 5, 20, 'Batería 12V 60Ah', 150000),
(22, 5, 15, 'Batería 12V 70Ah', 300000),
(23, 5, 10, 'Batería 12V 80Ah', 175000),
(24, 5, 12, 'Batería AGM 12V 60Ah', 180000),
(25, 5, 8, 'Batería AGM 12V 70Ah', 500000),
(26, 1, 35, 'Corta tubos', 35000),
(27, 1, 40, 'Llave de tubo', 45000),
(28, 2, 95, 'Anticongelante', 160000),
(29, 2, 70, 'Aceite hidráulico', 250000),
(30, 3, 18, 'Neumático 245/45R20', 375000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `Id_Servicios` smallint(6) NOT NULL,
  `Nombre_Servicio` varchar(50) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Descripcion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`Id_Servicios`, `Nombre_Servicio`, `Precio`, `Descripcion`) VALUES
(1, 'Mecanica General', 50000, 'Evaluacion general del vehiculo'),
(2, 'Latoneria', 60000, 'Reparacion de hundidos y pintura'),
(3, 'Cambio de Aceite', 40000, 'Sustitucion del aceite del motor'),
(4, 'Alineacion y Balanceo', 45000, 'Alineacion y balanceo de las ruedas'),
(5, 'Revisión de Frenos', 55000, 'Chequeo y ajuste del sistema de frenos'),
(6, 'Diagnostico Electronico', 70000, 'Analisis de los sistemas electronicos del vehiculo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `Id_tipo_producto` tinyint(3) UNSIGNED NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`Id_tipo_producto`, `Descripcion`) VALUES
(1, 'Herramientas manuales'),
(2, 'Aceites y lubricantes'),
(3, 'Neumáticos'),
(4, 'Filtros'),
(5, 'Baterías');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

CREATE TABLE `tipo_vehiculo` (
  `Id_Tipo_Vehiculo` tinyint(3) UNSIGNED NOT NULL,
  `Nombre` varchar(15) DEFAULT NULL,
  `Numero_Ruedas` tinyint(3) UNSIGNED DEFAULT NULL,
  `Descripcion` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`Id_Tipo_Vehiculo`, `Nombre`, `Numero_Ruedas`, `Descripcion`) VALUES
(1, 'Carro', 4, 'Camionetas tipo Campero, Automovil, Bus'),
(2, 'Motocicleta', 2, 'Motocicletas de distintas cilindradas y estilos'),
(3, 'Camion', 6, 'Camiones de carga pesada y ligera'),
(4, 'Bicicleta', 2, 'Bicicletas de montaña, de carretera y urbanas'),
(5, 'Autobus', 6, 'Autobuses de pasajeros para transporte público'),
(6, 'Tractor', 4, 'Tractores agrícolas y de construcción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `Placa` char(7) NOT NULL,
  `Modelo` varchar(25) DEFAULT NULL,
  `Marca` varchar(25) DEFAULT NULL,
  `Color` varchar(25) DEFAULT NULL,
  `Transmision` char(10) NOT NULL,
  `Documento` char(10) DEFAULT NULL,
  `Id_Tipo_Vehiculo` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`Placa`, `Modelo`, `Marca`, `Color`, `Transmision`, `Documento`, `Id_Tipo_Vehiculo`) VALUES
('ABC123', '2020', 'Toyota', 'Rojo', 'Automática', '1033180822', 1),
('ABC901', '2019', 'Trek', 'Azul', 'Automática', '1033180824', 4),
('BCD678', '2020', 'Case IH', 'Rojo', 'Automática', '1033180833', 6),
('BCD890', '2022', 'Mercedes', 'Negro', 'Manual', '1033180831', 1),
('CDE567', '2018', 'KTM', 'Naranja', 'Manual', '1033180840', 2),
('DEF234', '2021', 'Specialized', 'Verde', 'Manual', '1033180825', 4),
('DEF456', '2019', 'Honda', 'Azul', 'Manual', '1033180823', 1),
('EFG123', '2020', 'Honda', 'Negro', 'Manual', '1033180832', 2),
('EFG901', '2019', 'New Holland', 'Azul', 'Manual', '1033180834', 6),
('FGH890', '2022', 'Indian', 'Rojo', 'Automática', '1033180841', 2),
('GHI567', '2018', 'Cannondale', 'Negro', 'Automática', '1033180826', 4),
('GHI789', '2021', 'Ford', 'Negro', 'Automática', '1033180824', 1),
('HIJ234', '2021', 'Kubota', 'Naranja', 'Automática', '1033180835', 6),
('HIJ456', '2019', 'Yamaha', 'Azul', 'Automática', '1033180833', 2),
('IJK123', '2020', 'Volvo', 'Blanco', 'Automática', '1033180842', 3),
('JKL012', '2018', 'BMW', 'Blanco', 'Manual', '1033180825', 1),
('JKL890', '2022', 'Scott', 'Blanco', 'Manual', '1033180827', 4),
('KLM567', '2018', 'Claas', 'Verde', 'Manual', '1033180836', 6),
('KLM789', '2021', 'Kawasaki', 'Verde', 'Manual', '1033180834', 2),
('LMN456', '2019', 'Freightliner', 'Azul', 'Manual', '1033180843', 3),
('MNO123', '2020', 'Mercedes-Benz', 'Gris', 'Automática', '1033180828', 5),
('MNO345', '2022', 'Chevrolet', 'Gris', 'Automática', '1033180826', 1),
('NOP012', '2018', 'Suzuki', 'Amarillo', 'Automática', '1033180835', 2),
('OPQ789', '2021', 'Kenworth', 'Negro', 'Automática', '1033180844', 3),
('PQR456', '2019', 'Volvo', 'Azul', 'Manual', '1033180829', 5),
('PQR678', '2020', 'Hyundai', 'Verde', 'Manual', '1033180827', 1),
('QRS345', '2022', 'Ducati', 'Rojo', 'Manual', '1033180836', 2),
('RST012', '2018', 'Peterbilt', 'Rojo', 'Manual', '1033180845', 3),
('STU789', '2021', 'Scania', 'Negro', 'Automática', '1033180830', 5),
('STU901', '2019', 'Nissan', 'Amarillo', 'Automática', '1033180828', 1),
('TUV678', '2020', 'Harley-Davidson', 'Negro', 'Automática', '1033180837', 2),
('UVW345', '2022', 'Mack', 'Gris', 'Automática', '1033180822', 3),
('VWX012', '2018', 'MAN', 'Blanco', 'Manual', '1033180831', 5),
('VWX234', '2021', 'Kia', 'Rojo', 'Manual', '1033180829', 1),
('WXY901', '2019', 'Triumph', 'Blanco', 'Manual', '1033180838', 2),
('XYZ678', '2020', 'Giant', 'Rojo', 'Manual', '1033180823', 4),
('YZA345', '2022', 'John Deere', 'Verde', 'Manual', '1033180832', 6),
('YZA567', '2018', 'Mazda', 'Azul', 'Automática', '1033180830', 1),
('ZAB234', '2021', 'BMW', 'Azul', 'Automática', '1033180839', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Documento`);

--
-- Indices de la tabla `datos_empresa`
--
ALTER TABLE `datos_empresa`
  ADD PRIMARY KEY (`NIT`);

--
-- Indices de la tabla `detalle_producto`
--
ALTER TABLE `detalle_producto`
  ADD PRIMARY KEY (`Id_Detalle_Producto`),
  ADD KEY `FK__Detalle_P__Id_Fa__5441852A` (`Id_Factura`),
  ADD KEY `FK__Detalle_P__Id_pr__5535A963` (`Id_producto`);

--
-- Indices de la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD PRIMARY KEY (`Id_Detalle_Servicio`),
  ADD KEY `FK__Detalle_S__Id_Fa__5070F446` (`Id_Factura`),
  ADD KEY `FK__Detalle_S__Id_Se__5165187F` (`Id_Servicio`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id_factura`),
  ADD KEY `FK__Factura__Placa__4AB81AF0` (`Placa`),
  ADD KEY `FK__Factura__Documen__4BAC3F29` (`Documento_M`),
  ADD KEY `FK__Factura__Id_Meto__4CA06362` (`Id_Metodo_Pago`),
  ADD KEY `FK__Factura__NIT__4D94879B` (`NIT`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`Documento`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`Id_Metodo_Pago`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_producto`),
  ADD KEY `FK__Productos__Id_ti__403A8C7D` (`Id_tipo_producto`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`Id_Servicios`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`Id_tipo_producto`);

--
-- Indices de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  ADD PRIMARY KEY (`Id_Tipo_Vehiculo`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`Placa`),
  ADD KEY `FK__Vehiculo__Docume__3A81B327` (`Documento`),
  ADD KEY `FK__Vehiculo__Id_Tip__3B75D760` (`Id_Tipo_Vehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_producto`
--
ALTER TABLE `detalle_producto`
  MODIFY `Id_Detalle_Producto` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  MODIFY `Id_Detalle_Servicio` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `Id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `Id_Metodo_Pago` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id_producto` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `Id_Servicios` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `Id_tipo_producto` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  MODIFY `Id_Tipo_Vehiculo` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_producto`
--
ALTER TABLE `detalle_producto`
  ADD CONSTRAINT `FK__Detalle_P__Id_Fa__5441852A` FOREIGN KEY (`Id_Factura`) REFERENCES `factura` (`Id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_P__Id_pr__5535A963` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD CONSTRAINT `FK__Detalle_S__Id_Fa__5070F446` FOREIGN KEY (`Id_Factura`) REFERENCES `factura` (`Id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_S__Id_Se__5165187F` FOREIGN KEY (`Id_Servicio`) REFERENCES `servicios` (`Id_Servicios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FK__Factura__Documen__4BAC3F29` FOREIGN KEY (`Documento_M`) REFERENCES `mecanico` (`Documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Factura__Id_Meto__4CA06362` FOREIGN KEY (`Id_Metodo_Pago`) REFERENCES `metodo_pago` (`Id_Metodo_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Factura__NIT__4D94879B` FOREIGN KEY (`NIT`) REFERENCES `datos_empresa` (`NIT`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Factura__Placa__4AB81AF0` FOREIGN KEY (`Placa`) REFERENCES `vehiculo` (`Placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK__Productos__Id_ti__403A8C7D` FOREIGN KEY (`Id_tipo_producto`) REFERENCES `tipo_producto` (`Id_tipo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `FK__Vehiculo__Docume__3A81B327` FOREIGN KEY (`Documento`) REFERENCES `clientes` (`Documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Vehiculo__Id_Tip__3B75D760` FOREIGN KEY (`Id_Tipo_Vehiculo`) REFERENCES `tipo_vehiculo` (`Id_Tipo_Vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
