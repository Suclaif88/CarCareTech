-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2024 a las 22:36:17
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

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
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Documento`, `Nombre`, `Apellido`, `Celular`, `F_Nacimiento`, `Correo`, `Direccion`) VALUES
('10112223T', 'Marta', 'Medina', '603210987', '1981-08-20', 'marta.medina@example.com', 'Calle Blanca 60'),
('11223344K', 'David', 'Molina', '612109876', '1986-11-15', 'david.molina@example.com', 'Calle Estrella 33'),
('12345678A', 'Juan', 'Pérez', '612345678', '1990-01-15', 'juan.perez@example.com', 'Calle Falsa 123'),
('21223334U', 'Raúl', 'Castro', '602109876', '1990-09-25', 'raul.castro@example.com', 'Calle Roja 15'),
('22334455L', 'Lucía', 'Hernández', '611098765', '1990-12-20', 'lucia.hernandez@example.com', 'Avenida del Mar 10'),
('23456789C', 'Carlos', 'Fernández', '610987654', '1992-03-25', 'carlos.fernandez@example.com', 'Calle Mayor 15'),
('32334445V', 'Cristina', 'Suárez', '601098765', '1984-10-10', 'cristina.suarez@example.com', 'Calle Amarilla 75'),
('33445566M', 'Manuel', 'Jiménez', '610987654', '1983-01-25', 'manuel.jimenez@example.com', 'Calle del Río 44'),
('34567890D', 'Ana', 'López', '619876543', '1980-04-10', 'ana.lopez@example.com', 'Paseo del Prado 56'),
('43445556W', 'Javier', 'Guzmán', '600987654', '1979-11-15', 'javier.guzman@example.com', 'Calle Naranja 14'),
('44556677N', 'Isabel', 'Morales', '609876543', '1991-02-10', 'isabel.morales@example.com', 'Calle Verde 22'),
('45678901E', 'Luis', 'Martínez', '618765432', '1975-05-05', 'luis.martinez@example.com', 'Calle Gran Vía 100'),
('54556667X', 'Patricia', 'Reyes', '599876543', '1991-12-20', 'patricia.reyes@example.com', 'Avenida de la Luz 99'),
('55667788O', 'Pablo', 'Ortega', '608765432', '1977-03-15', 'pablo.ortega@example.com', 'Avenida Central 90'),
('56789012F', 'Laura', 'Sánchez', '617654321', '1995-06-30', 'laura.sanchez@example.com', 'Avenida de la Paz 78'),
('65667778Y', 'Felipe', 'Aguilar', '598765432', '1985-01-25', 'felipe.aguilar@example.com', 'Calle de las Flores 24'),
('66778899P', 'Natalia', 'Romero', '607654321', '1994-04-20', 'natalia.romero@example.com', 'Calle del Bosque 11'),
('67890123G', 'José', 'Gómez', '616543210', '1988-07-15', 'jose.gomez@example.com', 'Calle Nueva 9'),
('77889900Q', 'Andrés', 'Navarro', '606543210', '1989-05-25', 'andres.navarro@example.com', 'Calle Azul 77'),
('78901234H', 'Elena', 'Díaz', '615432109', '1993-08-20', 'elena.diaz@example.com', 'Avenida Libertad 45'),
('87654321B', 'María', 'García', '611234567', '1985-02-20', 'maria.garcia@example.com', 'Avenida Siempre Viva 742'),
('88990011R', 'Teresa', 'Ramos', '605432109', '1987-06-10', 'teresa.ramos@example.com', 'Avenida de la Ciencia 30'),
('89012345I', 'Miguel', 'Torres', '614321098', '1982-09-25', 'miguel.torres@example.com', 'Calle del Sol 88'),
('90123456J', 'Sofía', 'Ruiz', '613210987', '1978-10-10', 'sofia.ruiz@example.com', 'Calle Luna 65'),
('99001122S', 'Sergio', 'Vega', '604321098', '1992-07-15', 'sergio.vega@example.com', 'Calle Dorada 50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_empresa`
--

CREATE TABLE `datos_empresa` (
  `NIT` char(9) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Telefono` varchar(30) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datos_empresa`
--

INSERT INTO `datos_empresa` (`NIT`, `Nombre`, `Telefono`, `Correo`, `Direccion`) VALUES
('890765432', 'Autoservicio Mecánico \"El Rosal\"', '+57 310 234 5678', 'info@autoservicioelrosal.com', 'Carrera 23 #45-67, Barrio El Rosal, Ciudad de Medellín');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_producto`
--

INSERT INTO `detalle_producto` (`Id_Detalle_Producto`, `Id_Factura`, `Id_producto`, `Precio`, `Cantidad`) VALUES
(1, 22, 25, 88000, 4),
(2, 18, 4, 70000, 5),
(3, 5, 28, 27000, 1),
(4, 19, 10, 85000, 9),
(5, 43, 16, 17000, 7),
(6, 23, 19, 75000, 8),
(7, 3, 24, 73000, 5),
(8, 14, 10, 85000, 0),
(9, 6, 6, 18000, 5),
(10, 44, 26, 19000, 8),
(11, 9, 30, 83000, 5),
(12, 21, 5, 80000, 10),
(13, 30, 2, 5000, 9),
(14, 24, 26, 19000, 10),
(15, 15, 21, 14000, 7),
(16, 8, 4, 70000, 9),
(17, 47, 9, 72000, 5),
(18, 33, 8, 27000, 3),
(19, 42, 18, 26000, 6),
(20, 39, 5, 80000, 9),
(21, 1, 18, 26000, 10),
(22, 13, 30, 83000, 3),
(23, 49, 6, 18000, 7),
(24, 11, 10, 85000, 6),
(25, 35, 28, 27000, 9),
(26, 27, 4, 70000, 0),
(27, 20, 17, 5200, 7),
(28, 37, 24, 73000, 4),
(29, 10, 21, 14000, 1),
(30, 4, 12, 6000, 3),
(31, 26, 10, 85000, 9),
(32, 40, 23, 28000, 9),
(33, 48, 28, 27000, 9),
(34, 16, 2, 5000, 5),
(35, 34, 23, 28000, 4),
(36, 50, 20, 90000, 7),
(37, 7, 22, 5800, 1),
(38, 38, 3, 25000, 9),
(39, 46, 7, 5500, 7),
(40, 12, 24, 73000, 2),
(41, 17, 5, 80000, 7),
(42, 28, 12, 6000, 3),
(43, 32, 6, 18000, 8),
(44, 2, 6, 18000, 9),
(45, 31, 7, 5500, 2),
(46, 45, 7, 5500, 8),
(47, 29, 7, 5500, 8),
(48, 25, 19, 75000, 5),
(49, 36, 19, 75000, 2),
(50, 41, 23, 28000, 10),
(51, 23, 22, 5800, 8),
(52, 11, 15, 82000, 5),
(53, 41, 21, 14000, 3),
(54, 37, 28, 27000, 2),
(55, 35, 22, 5800, 9),
(56, 3, 5, 80000, 6),
(57, 2, 17, 5200, 1),
(58, 15, 24, 73000, 9),
(59, 6, 17, 5200, 7),
(60, 46, 9, 72000, 2),
(61, 27, 3, 25000, 5),
(62, 32, 23, 28000, 6),
(63, 48, 7, 5500, 3),
(64, 45, 12, 6000, 6),
(65, 18, 26, 19000, 7),
(66, 44, 8, 27000, 7),
(67, 29, 12, 6000, 2),
(68, 31, 30, 83000, 2),
(69, 17, 14, 68000, 2),
(70, 24, 28, 27000, 2),
(71, 21, 16, 17000, 7),
(72, 33, 8, 27000, 3),
(73, 26, 30, 83000, 5),
(74, 38, 2, 5000, 8),
(75, 22, 2, 5000, 0),
(76, 19, 13, 24000, 10),
(77, 40, 4, 70000, 1),
(78, 25, 28, 27000, 7),
(79, 39, 30, 83000, 1),
(80, 36, 12, 6000, 0),
(81, 8, 13, 24000, 10),
(82, 47, 4, 70000, 0),
(83, 49, 17, 5200, 1),
(84, 5, 4, 70000, 0),
(85, 16, 6, 18000, 1),
(86, 12, 5, 80000, 5),
(87, 14, 28, 27000, 8),
(88, 13, 10, 85000, 7),
(89, 42, 27, 5300, 4),
(90, 30, 13, 24000, 4),
(91, 28, 24, 73000, 2),
(92, 1, 20, 90000, 9),
(93, 9, 19, 75000, 1),
(94, 7, 9, 72000, 8),
(95, 34, 9, 72000, 5),
(96, 43, 16, 17000, 8),
(97, 50, 19, 75000, 6),
(98, 10, 12, 6000, 6),
(99, 20, 16, 17000, 6),
(100, 4, 13, 24000, 8),
(101, 36, 18, 26000, 0),
(102, 13, 10, 85000, 9),
(103, 10, 19, 75000, 6),
(104, 44, 5, 80000, 3),
(105, 27, 28, 27000, 10),
(106, 48, 15, 82000, 8),
(107, 41, 3, 25000, 9),
(108, 35, 7, 5500, 1),
(109, 20, 14, 68000, 4),
(110, 19, 8, 27000, 1),
(111, 3, 22, 5800, 7),
(112, 29, 6, 18000, 10),
(113, 50, 25, 88000, 8),
(114, 7, 14, 68000, 10),
(115, 4, 9, 72000, 9),
(116, 39, 12, 6000, 5),
(117, 38, 18, 26000, 7),
(118, 31, 14, 68000, 9),
(119, 28, 18, 26000, 4),
(120, 1, 27, 5300, 3),
(121, 43, 23, 28000, 10),
(122, 47, 15, 82000, 2),
(123, 33, 7, 5500, 9),
(124, 32, 27, 5300, 6),
(125, 25, 18, 26000, 3),
(126, 14, 10, 85000, 5),
(127, 21, 1, 15000, 2),
(128, 15, 28, 27000, 0),
(129, 9, 23, 28000, 5),
(130, 45, 15, 82000, 2),
(131, 49, 26, 19000, 8),
(132, 2, 2, 5000, 7),
(133, 42, 4, 70000, 5),
(134, 22, 20, 90000, 9),
(135, 17, 15, 82000, 10),
(136, 46, 15, 82000, 9),
(137, 26, 28, 27000, 5),
(138, 18, 5, 80000, 6),
(139, 12, 12, 6000, 4),
(140, 11, 20, 90000, 6),
(141, 37, 11, 16000, 4),
(142, 23, 2, 5000, 7),
(143, 6, 7, 5500, 2),
(144, 16, 3, 25000, 0),
(145, 8, 15, 82000, 3),
(146, 5, 29, 71000, 2),
(147, 34, 28, 27000, 3),
(148, 40, 30, 83000, 4),
(149, 30, 10, 85000, 2),
(150, 24, 28, 27000, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_servicio`
--

CREATE TABLE `detalle_servicio` (
  `Id_Detalle_Servicio` tinyint(3) UNSIGNED NOT NULL,
  `Id_Factura` int(11) DEFAULT NULL,
  `Id_Servicio` smallint(6) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Cantidad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_servicio`
--

INSERT INTO `detalle_servicio` (`Id_Detalle_Servicio`, `Id_Factura`, `Id_Servicio`, `Precio`, `Cantidad`) VALUES
(1, 41, 3, 210000, 3),
(2, 14, 3, 210000, 8),
(3, 6, 4, 360000, 1),
(4, 8, 3, 210000, 3),
(5, 49, 5, 900000, 5),
(6, 17, 5, 900000, 7),
(7, 29, 2, 240000, 2),
(8, 33, 4, 360000, 2),
(9, 28, 2, 240000, 4),
(10, 47, 6, 180000, 8),
(11, 34, 1, 150000, 4),
(12, 9, 5, 900000, 4),
(13, 50, 5, 900000, 1),
(14, 1, 3, 210000, 6),
(15, 4, 2, 240000, 5),
(16, 39, 2, 240000, 9),
(17, 36, 1, 150000, 5),
(18, 11, 2, 240000, 9),
(19, 45, 2, 240000, 8),
(20, 24, 2, 240000, 2),
(21, 5, 3, 210000, 5),
(22, 7, 5, 900000, 4),
(23, 13, 5, 900000, 2),
(24, 42, 6, 180000, 2),
(25, 15, 6, 180000, 6),
(26, 27, 4, 360000, 2),
(27, 16, 4, 360000, 6),
(28, 3, 2, 240000, 6),
(29, 35, 1, 150000, 6),
(30, 18, 6, 180000, 6),
(31, 41, 5, 900000, 7),
(32, 6, 5, 900000, 9),
(33, 18, 1, 150000, 8),
(34, 32, 2, 240000, 8),
(35, 40, 1, 150000, 7),
(36, 21, 5, 900000, 6),
(37, 30, 2, 240000, 6),
(38, 39, 2, 240000, 9),
(39, 25, 2, 240000, 6),
(40, 49, 5, 900000, 7),
(41, 29, 1, 150000, 2),
(42, 16, 1, 150000, 4),
(43, 20, 1, 150000, 4),
(44, 7, 4, 360000, 7),
(45, 14, 3, 210000, 6),
(46, 47, 4, 360000, 4),
(47, 26, 2, 240000, 3),
(48, 24, 6, 180000, 6),
(49, 36, 1, 150000, 9),
(50, 31, 4, 360000, 3),
(51, 37, 6, 180000, 7),
(52, 12, 4, 360000, 4),
(53, 48, 1, 150000, 5),
(54, 34, 6, 180000, 5),
(55, 13, 5, 900000, 5),
(56, 19, 1, 150000, 1),
(57, 3, 1, 150000, 6),
(58, 50, 5, 900000, 2),
(59, 42, 1, 150000, 7),
(60, 10, 4, 360000, 2),
(61, 23, 3, 210000, 4),
(62, 9, 2, 240000, 7),
(63, 33, 5, 900000, 1),
(64, 11, 1, 150000, 2),
(65, 17, 3, 210000, 8),
(66, 5, 3, 210000, 6),
(67, 2, 6, 180000, 3),
(68, 4, 3, 210000, 7),
(69, 8, 6, 180000, 2),
(70, 1, 1, 150000, 9),
(71, 43, 3, 210000, 8),
(72, 44, 1, 150000, 6),
(73, 22, 5, 900000, 8),
(74, 28, 1, 150000, 6),
(75, 45, 5, 900000, 1),
(76, 27, 2, 240000, 9),
(77, 15, 3, 210000, 2),
(78, 35, 6, 180000, 9),
(79, 46, 2, 240000, 9),
(80, 38, 4, 360000, 4),
(81, 48, 2, 240000, 9),
(82, 22, 5, 900000, 6),
(83, 31, 6, 180000, 1),
(84, 19, 2, 240000, 7),
(85, 28, 4, 360000, 7),
(86, 17, 5, 900000, 1),
(87, 47, 5, 900000, 7),
(88, 12, 3, 210000, 6),
(89, 34, 5, 900000, 10),
(90, 18, 2, 240000, 6),
(91, 42, 5, 900000, 3),
(92, 50, 3, 210000, 4),
(93, 39, 6, 180000, 5),
(94, 35, 5, 900000, 9),
(95, 10, 3, 210000, 4),
(96, 40, 2, 240000, 3),
(97, 5, 4, 360000, 2),
(98, 2, 3, 210000, 5),
(99, 11, 3, 210000, 4),
(100, 49, 3, 210000, 1),
(101, 25, 6, 180000, 3),
(102, 1, 6, 180000, 7),
(103, 9, 1, 150000, 8),
(104, 27, 1, 150000, 3),
(105, 46, 3, 210000, 9),
(106, 6, 4, 360000, 2),
(107, 29, 5, 900000, 7),
(108, 3, 3, 210000, 8),
(109, 30, 1, 150000, 6),
(110, 14, 4, 360000, 9),
(111, 33, 3, 210000, 2),
(112, 4, 5, 900000, 9),
(113, 20, 4, 360000, 9),
(114, 24, 4, 360000, 7),
(115, 43, 5, 900000, 9),
(116, 32, 6, 180000, 7),
(117, 45, 4, 360000, 3),
(118, 36, 1, 150000, 4),
(119, 8, 5, 900000, 6),
(120, 41, 6, 180000, 7),
(121, 38, 1, 150000, 8),
(122, 15, 6, 180000, 3),
(123, 23, 1, 150000, 9),
(124, 13, 4, 360000, 8),
(125, 21, 3, 210000, 1),
(126, 44, 6, 180000, 8),
(127, 26, 4, 360000, 1),
(128, 16, 1, 150000, 9),
(129, 7, 6, 180000, 5),
(130, 37, 1, 150000, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-11 20:33:41.234068'),
(2, 'auth', '0001_initial', '2024-06-11 20:35:35.598471'),
(3, 'admin', '0001_initial', '2024-06-11 20:35:40.905994'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-11 20:35:40.978611'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-11 20:35:41.051173'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-11 20:35:49.023051'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-11 20:35:50.689753'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-11 20:35:52.516642'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-11 20:35:52.597793'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-11 20:35:53.533958'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-11 20:35:53.594483'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-11 20:35:53.653612'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-11 20:35:53.852307'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-11 20:35:54.059340'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-11 20:35:54.636505'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-11 20:35:55.876565'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-11 20:35:58.537053'),
(18, 'sessions', '0001_initial', '2024-06-11 20:35:59.931090');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Subtotal` bigint(20) DEFAULT NULL,
  `Iva` double DEFAULT NULL,
  `Descuento` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`Id_factura`, `Fecha`, `Placa`, `Documento_M`, `Id_Metodo_Pago`, `NIT`, `Total`, `Subtotal`, `Iva`, `Descuento`) VALUES
(1, '2023-10-01 00:00:00', 'PQR345', '4567890123', 3, '890765432', 5894693, 4955900, 941621, 2828),
(2, '2023-12-13 00:00:00', 'EFG890', '1234567890', 2, '890765432', 2130580, 1792200, 340518, 2138),
(3, '2023-09-08 00:00:00', 'HIJ123', '5678901234', 2, '890765432', 5836390, 4905600, 932064, 1274),
(4, '2023-08-28 00:00:00', 'VWX901', '4567890123', 2, '890765432', 13834245, 11628000, 2209320, 3075),
(5, '2024-02-25 00:00:00', 'STU901', '3456789012', 1, '890765432', 3804392, 3199000, 607810, 2418),
(6, '2023-06-24 00:00:00', 'EFG890', '5678901234', 1, '890765432', 11086373, 9317400, 1770306, 1333),
(7, '2023-11-24 00:00:00', 'HIJ456', '5678901234', 2, '890765432', 9850469, 8281800, 1573542, 4873),
(8, '2023-10-29 00:00:00', 'GHI789', '3456789012', 3, '890765432', 8927847, 7506000, 1426140, 4293),
(9, '2023-08-11 00:00:00', 'STU901', '3456789012', 2, '890765432', 8456883, 7110000, 1350900, 4017),
(10, '2023-11-25 00:00:00', 'MNO345', '4567890123', 2, '890765432', 2449422, 2060000, 391400, 1978),
(11, '2023-06-23 00:00:00', 'BCD567', '4567890123', 3, '890765432', 5660481, 4760000, 904400, 3919),
(12, '2023-12-05 00:00:00', 'STU901', '5678901234', 1, '890765432', 3886783, 3270000, 621300, 4517),
(13, '2024-05-28 00:00:00', 'KLM456', '1234567890', 1, '890765432', 12835018, 10789000, 2049910, 3892),
(14, '2023-08-16 00:00:00', 'BCD567', '4567890123', 3, '890765432', 8113768, 6821000, 1295990, 3222),
(15, '2023-09-29 00:00:00', 'DEF456', '4567890123', 1, '890765432', 3325022, 2795000, 531050, 1028),
(16, '2023-08-03 00:00:00', 'YZA678', '1234567890', 1, '890765432', 4937818, 4153000, 789070, 4252),
(17, '2023-09-12 00:00:00', 'YZA234', '1234567890', 3, '890765432', 12370707, 10396000, 1975240, 533),
(18, '2024-04-02 00:00:00', 'EFG234', '5678901234', 1, '890765432', 5571636, 4683000, 889770, 1134),
(19, '2023-10-21 00:00:00', 'NOP789', '4567890123', 3, '890765432', 3403546, 2862000, 543780, 2234),
(20, '2023-08-07 00:00:00', 'EFG890', '4567890123', 3, '890765432', 5055537, 4250400, 807576, 2439),
(21, '2024-03-03 00:00:00', 'VWX345', '3456789012', 2, '890765432', 7800214, 6559000, 1246210, 4996),
(22, '2024-03-21 00:00:00', 'BCD234', '3456789012', 3, '890765432', 16376510, 13762000, 2614780, 270),
(23, '2024-02-03 00:00:00', 'STU901', '1234567890', 2, '890765432', 3414324, 2871400, 545566, 2642),
(24, '2023-06-13 00:00:00', 'PQR456', '4567890123', 3, '890765432', 5337465, 4486000, 852340, 875),
(25, '2023-06-21 00:00:00', 'KLM789', '1234567890', 1, '890765432', 3120158, 2622000, 498180, 22),
(26, '2024-04-07 00:00:00', 'MNO345', '4567890123', 1, '890765432', 2846519, 2395000, 455050, 3531),
(27, '2023-12-06 00:00:00', 'STU012', '4567890123', 1, '890765432', 4432098, 3725000, 707750, 652),
(28, '2024-05-20 00:00:00', 'BCD567', '4567890123', 3, '890765432', 5526614, 4648000, 883120, 4506),
(29, '2023-09-21 00:00:00', 'DEF456', '5678901234', 3, '890765432', 8702346, 7316000, 1390040, 3694),
(30, '2024-01-28 00:00:00', 'NOP012', '3456789012', 3, '890765432', 3151002, 2651000, 503690, 3688),
(31, '2024-03-22 00:00:00', 'HIJ890', '4567890123', 2, '890765432', 2433801, 2049000, 389310, 4509),
(32, '2023-11-04 00:00:00', 'BCD890', '5678901234', 1, '890765432', 4189440, 3523800, 669522, 3882),
(33, '2024-01-24 00:00:00', 'HIJ890', '3456789012', 1, '890765432', 2679245, 2251500, 427785, 40),
(34, '2024-05-05 00:00:00', 'VWX678', '3456789012', 1, '890765432', 13151609, 11053000, 2100070, 1461),
(35, '2023-06-14 00:00:00', 'BCD234', '5678901234', 1, '890765432', 12991265, 10920700, 2074933, 4368),
(36, '2023-12-16 00:00:00', 'DEF456', '5678901234', 3, '890765432', 3390258, 2850000, 541500, 1242),
(37, '2024-02-14 00:00:00', 'EFG890', '5678901234', 1, '890765432', 3412488, 2870000, 545300, 2812),
(38, '2024-03-17 00:00:00', 'KLM789', '1234567890', 1, '890765432', 3671002, 3087000, 586530, 2528),
(39, '2024-05-27 00:00:00', 'HIJ567', '5678901234', 2, '890765432', 7202246, 6053000, 1150070, 824),
(40, '2024-03-05 00:00:00', 'DEF456', '4567890123', 3, '890765432', 2881385, 2424000, 460560, 3175),
(41, '2024-03-28 00:00:00', 'BCD234', '5678901234', 1, '890765432', 10393608, 8737000, 1660030, 3422),
(42, '2023-07-05 00:00:00', 'STU901', '4567890123', 3, '890765432', 5516833, 4637200, 881068, 1435),
(43, '2024-03-04 00:00:00', 'VWX234', '3456789012', 1, '890765432', 12270755, 10315000, 1959850, 4095),
(44, '2023-08-03 00:00:00', 'MNO345', '3456789012', 2, '890765432', 3472623, 2921000, 554990, 3367),
(45, '2024-01-05 00:00:00', 'KLM890', '5678901234', 3, '890765432', 4926374, 4144000, 787360, 4986),
(46, '2023-12-30 00:00:00', 'STU012', '1234567890', 1, '890765432', 5910011, 4970500, 944395, 4884),
(47, '2023-08-31 00:00:00', 'STU012', '4567890123', 1, '890765432', 11543968, 9704000, 1843760, 3792),
(48, '2024-04-19 00:00:00', 'NOP456', '5678901234', 3, '890765432', 4550493, 3825500, 726845, 1852),
(49, '2024-01-15 00:00:00', 'VWX901', '3456789012', 3, '890765432', 13435817, 11293200, 2145708, 3091),
(50, '2024-03-01 00:00:00', 'STU901', '1234567890', 1, '890765432', 6333278, 5324000, 1011560, 2282);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mecanico`
--

INSERT INTO `mecanico` (`Documento`, `Nombre`, `Apellido`, `Celular`, `F_Nacimiento`, `Correo`) VALUES
('1234567890', 'Juan', 'González', '3101234567', '1990-05-15', 'juan.gonzalez@example.com'),
('3456789012', 'Carlos', 'Martínez', '3303456789', '1992-03-10', 'carlos.martinez@example.com'),
('4567890123', 'Pedro', 'Sánchez', '3404567890', '1988-11-25', 'pedro.sanchez@example.com'),
('5678901234', 'Alejandro', 'López', '3505678901', '1987-09-20', 'alejandro.lopez@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `Id_Metodo_Pago` tinyint(3) UNSIGNED NOT NULL,
  `Tipo` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`Id_Metodo_Pago`, `Tipo`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta'),
(3, 'Crédito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_producto` smallint(6) NOT NULL,
  `Id_tipo_producto` tinyint(3) UNSIGNED DEFAULT NULL,
  `Cantidad_Stock` smallint(6) DEFAULT NULL,
  `Nombre` varchar(200) DEFAULT NULL,
  `Precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_producto`, `Id_tipo_producto`, `Cantidad_Stock`, `Nombre`, `Precio`) VALUES
(1, 1, 50, 'Aceite Mineral 5W-30', 15000),
(2, 2, 30, 'Filtro de Aire para Motor de Gasolina', 5000),
(3, 3, 20, 'Pastillas de Freno Cerámicas', 25000),
(4, 4, 40, 'Llanta Todo Terreno 265/70R17', 70000),
(5, 5, 15, 'Batería para Automóvil 12V 600CCA', 80000),
(6, 1, 60, 'Aceite Sintético 5W-40', 18000),
(7, 2, 25, 'Filtro de Aire de Alto Flujo', 5500),
(8, 3, 18, 'Pastillas de Freno Semi-Metálicas', 27000),
(9, 4, 35, 'Llanta para Auto Deportivo 225/45R18', 72000),
(10, 5, 12, 'Batería para Camión 24V 800CCA', 85000),
(11, 1, 45, 'Aceite Semisintético 10W-30', 16000),
(12, 2, 28, 'Filtro de Aire para Motor Diésel', 6000),
(13, 3, 22, 'Pastillas de Freno Premium', 24000),
(14, 4, 38, 'Llanta de Verano 195/65R15', 68000),
(15, 5, 17, 'Batería de Ciclo Profundo para RV 12V', 82000),
(16, 1, 55, 'Aceite Sintético 0W-20', 17000),
(17, 2, 33, 'Filtro de Aire de Cabina', 5200),
(18, 3, 25, 'Pastillas de Freno Performance', 26000),
(19, 4, 42, 'Llanta de Invierno 205/55R16', 75000),
(20, 5, 20, 'Batería para Motocicleta 12V', 90000),
(21, 1, 48, 'Aceite Mineral 20W-50', 14000),
(22, 2, 27, 'Filtro de Aire para ATV', 5800),
(23, 3, 19, 'Pastillas de Freno para Camioneta', 28000),
(24, 4, 37, 'Llanta de Verano 225/40R18', 73000),
(25, 5, 14, 'Batería de Gel 12V 100Ah', 88000),
(26, 1, 58, 'Aceite Sintético 5W-30', 19000),
(27, 2, 31, 'Filtro de Aire de Repuesto', 5300),
(28, 3, 24, 'Pastillas de Freno para SUV', 27000),
(29, 4, 39, 'Llanta de Todo Terreno 33x12.50R15', 71000),
(30, 5, 16, 'Batería de Ciclo Profundo 6V', 83000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `Id_Servicios` smallint(6) NOT NULL,
  `Nombre_Servicio` varchar(50) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Descripcion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`Id_Servicios`, `Nombre_Servicio`, `Precio`, `Descripcion`) VALUES
(1, 'Cambio de Aceite', 150000, 'Servicio completo de cambio de aceite para carros y motos, incluyendo filtro de aceite.'),
(2, 'Revisión de Frenos', 240000, 'Inspección y ajuste de frenos, reemplazo de pastillas de freno si es necesario.'),
(3, 'Alineación y Balanceo', 210000, 'Alineación y balanceo de las ruedas para mejorar el rendimiento y seguridad del vehículo.'),
(4, 'Mantenimiento General', 360000, 'Servicio de mantenimiento general que incluye revisión de fluidos, filtros, y sistemas principales del vehículo.'),
(5, 'Reparación de Motor', 900000, 'Diagnóstico y reparación de problemas en el motor, incluye cambio de piezas defectuosas.'),
(6, 'Cambio de Neumáticos', 180000, 'Servicio de cambio de neumáticos, incluye balanceo y montaje de nuevas llantas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `Id_tipo_producto` tinyint(3) UNSIGNED NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`Id_tipo_producto`, `Descripcion`) VALUES
(1, 'Aceites y Lubricantes'),
(2, 'Filtros'),
(3, 'Pastillas de Freno'),
(4, 'Llantas'),
(5, 'Baterías');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

CREATE TABLE `tipo_vehiculo` (
  `Id_Tipo_Vehiculo` tinyint(3) UNSIGNED NOT NULL,
  `Nombre` char(30) DEFAULT NULL,
  `Numero_Ruedas` tinyint(3) UNSIGNED DEFAULT NULL,
  `Descripcion` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`Id_Tipo_Vehiculo`, `Nombre`, `Numero_Ruedas`, `Descripcion`) VALUES
(1, 'Motocicleta', 2, 'Vehículo de dos ruedas, adecuado para transporte individual.'),
(2, 'Automóvil', 4, 'Vehículo de cuatro ruedas, usado para transporte personal y familiar.'),
(3, 'Camioneta', 4, 'Vehículo de cuatro ruedas con mayor capacidad de carga, ideal para transporte de mercancías y uso familiar.'),
(4, 'Camión', 6, 'Vehículo de gran tamaño y seis ruedas, usado principalmente para transporte de carga pesada.'),
(5, 'Autobús', 6, 'Vehículo de transporte público de pasajeros, con capacidad para una gran cantidad de personas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `Placa` char(7) NOT NULL,
  `Modelo` varchar(25) DEFAULT NULL,
  `Marca` varchar(25) DEFAULT NULL,
  `Color` varchar(25) DEFAULT NULL,
  `Transmision` char(30) DEFAULT NULL,
  `Documento` char(10) DEFAULT NULL,
  `Id_Tipo_Vehiculo` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`Placa`, `Modelo`, `Marca`, `Color`, `Transmision`, `Documento`, `Id_Tipo_Vehiculo`) VALUES
('ABC123', '2019', 'Toyota', 'Rojo', 'Automática', '12345678A', 2),
('BCD234', '2017', 'Jeep', 'Gris', 'Automática', '45678901E', 1),
('BCD567', '2017', 'Porsche', 'Azul', 'Automática', '10112223T', 1),
('BCD890', '2019', 'Renault', 'Negro', 'Manual', '11223344K', 1),
('BCD901', '2019', 'Land Rover', 'Negro', 'Manual', '44556677N', 1),
('DEF456', '2018', 'Honda', 'Azul', 'Manual', '23456789C', 1),
('EFG123', '2016', 'Mercedes-Benz', 'Azul', 'Automática', '22334455L', 2),
('EFG234', '2018', 'Fiat', 'Rojo', 'Automática', '55667788O', 2),
('EFG567', '2019', 'Hummer', 'Blanco', 'Manual', '56789012F', 2),
('EFG890', '2019', 'Bugatti', 'Gris', 'Manual', '21223334U', 2),
('GHI789', '2020', 'Ford', 'Blanco', 'Automática', '34567890D', 3),
('HIJ123', '2018', 'McLaren', 'Blanco', 'Automática', '32334445V', 3),
('HIJ456', '2018', 'BMW', 'Gris', 'Automática', '33445566M', 3),
('HIJ567', '2016', 'Jeep', 'Plateado', 'Automática', '66778899P', 3),
('HIJ890', '2018', 'Tesla', 'Negro', 'Automática', '67890123G', 3),
('JKL012', '2017', 'Chevrolet', 'Negro', 'Automática', '45678901E', 4),
('KLM123', '2016', 'Ferrari', 'Rojo', 'Manual', '78901234H', 4),
('KLM456', '2020', 'Rolls-Royce', 'Negro', 'Automática', '43445556W', 4),
('KLM789', '2020', 'Audi', 'Blanco', 'Manual', '44556677N', 4),
('KLM890', '2017', 'Mini Cooper', 'Negro', 'Manual', '77889900Q', 4),
('MNO345', '2015', 'Volkswagen', 'Gris', 'Manual', '56789012F', 2),
('NOP012', '2015', 'Subaru', 'Negro', 'Automática', '55667788O', 1),
('NOP123', '2019', 'Tesla', 'Azul', 'Automática', '88990011R', 1),
('NOP456', '2017', 'Bugatti', 'Plateado', 'Automática', '89012345I', 1),
('NOP789', '2015', 'Bentley', 'Rojo', 'Manual', '54556667X', 1),
('PQR012', '2017', 'Jaguar', 'Plateado', 'Automática', '65667778Y', 5),
('PQR345', '2017', 'Volvo', 'Rojo', 'Automática', '66778899P', 5),
('PQR456', '2018', 'Hummer', 'Gris', 'Automática', '99001122S', 5),
('PQR678', '2016', 'Hyundai', 'Verde', 'Automática', '67890123G', 5),
('PQR789', '2019', 'McLaren', 'Negro', 'Automática', '90123456J', 5),
('STU012', '2018', 'Rolls-Royce', 'Azul', 'Manual', '11223344K', 2),
('STU345', '2019', 'Land Rover', 'Blanco', 'Automática', '12345678A', 2),
('STU678', '2019', 'Tesla', 'Plateado', 'Automática', '77889900Q', 2),
('STU901', '2019', 'Kia', 'Plateado', 'Automática', '78901234H', 3),
('VWX234', '2018', 'Mazda', 'Blanco', 'Automática', '89012345I', 2),
('VWX345', '2016', 'Bentley', 'Gris', 'Automática', '22334455L', 3),
('VWX678', '2018', 'Fiat', 'Negro', 'Manual', '23456789C', 3),
('VWX901', '2018', 'Ferrari', 'Blanco', 'Manual', '88990011R', 3),
('YZA234', '2016', 'Lamborghini', 'Negro', 'Automática', '99001122S', 4),
('YZA567', '2017', 'Nissan', 'Rojo', 'Manual', '90123456J', 4),
('YZA678', '2017', 'Jaguar', 'Blanco', 'Automática', '33445566M', 4),
('YZA901', '2016', 'Mini Cooper', 'Azul', 'Automática', '34567890D', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

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
  ADD KEY `FK__Detalle_P__Id_Fa__6754599E` (`Id_Factura`),
  ADD KEY `FK__Detalle_P__Id_pr__68487DD7` (`Id_producto`);

--
-- Indices de la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD PRIMARY KEY (`Id_Detalle_Servicio`),
  ADD KEY `FK__Detalle_S__Id_Fa__6383C8BA` (`Id_Factura`),
  ADD KEY `FK__Detalle_S__Id_Se__6477ECF3` (`Id_Servicio`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id_factura`),
  ADD KEY `FK__Factura__Placa__5DCAEF64` (`Placa`),
  ADD KEY `FK__Factura__Documen__5EBF139D` (`Documento_M`),
  ADD KEY `FK__Factura__Id_Meto__5FB337D6` (`Id_Metodo_Pago`),
  ADD KEY `FK__Factura__NIT__60A75C0F` (`NIT`);

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
  ADD KEY `FK__Productos__Id_ti__534D60F1` (`Id_tipo_producto`);

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
  ADD KEY `FK__Vehiculo__Docume__4D94879B` (`Documento`),
  ADD KEY `FK__Vehiculo__Id_Tip__4E88ABD4` (`Id_Tipo_Vehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `detalle_producto`
--
ALTER TABLE `detalle_producto`
  ADD CONSTRAINT `FK__Detalle_P__Id_Fa__6754599E` FOREIGN KEY (`Id_Factura`) REFERENCES `factura` (`Id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_P__Id_pr__68487DD7` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD CONSTRAINT `FK__Detalle_S__Id_Fa__6383C8BA` FOREIGN KEY (`Id_Factura`) REFERENCES `factura` (`Id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Detalle_S__Id_Se__6477ECF3` FOREIGN KEY (`Id_Servicio`) REFERENCES `servicios` (`Id_Servicios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FK__Factura__Documen__5EBF139D` FOREIGN KEY (`Documento_M`) REFERENCES `mecanico` (`Documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Factura__Id_Meto__5FB337D6` FOREIGN KEY (`Id_Metodo_Pago`) REFERENCES `metodo_pago` (`Id_Metodo_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Factura__NIT__60A75C0F` FOREIGN KEY (`NIT`) REFERENCES `datos_empresa` (`NIT`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Factura__Placa__5DCAEF64` FOREIGN KEY (`Placa`) REFERENCES `vehiculo` (`Placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK__Productos__Id_ti__534D60F1` FOREIGN KEY (`Id_tipo_producto`) REFERENCES `tipo_producto` (`Id_tipo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `FK__Vehiculo__Docume__4D94879B` FOREIGN KEY (`Documento`) REFERENCES `clientes` (`Documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__Vehiculo__Id_Tip__4E88ABD4` FOREIGN KEY (`Id_Tipo_Vehiculo`) REFERENCES `tipo_vehiculo` (`Id_Tipo_Vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
