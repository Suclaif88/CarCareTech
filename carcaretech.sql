-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2024 a las 20:28:34
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
-- Base de datos: `carcaretech`
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
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add clientes', 7, 'add_clientes'),
(26, 'Can change clientes', 7, 'change_clientes'),
(27, 'Can delete clientes', 7, 'delete_clientes'),
(28, 'Can view clientes', 7, 'view_clientes'),
(29, 'Can add usuarios', 8, 'add_usuarios'),
(30, 'Can change usuarios', 8, 'change_usuarios'),
(31, 'Can delete usuarios', 8, 'delete_usuarios'),
(32, 'Can view usuarios', 8, 'view_usuarios'),
(33, 'Can add tipo vehiculo', 9, 'add_tipovehiculo'),
(34, 'Can change tipo vehiculo', 9, 'change_tipovehiculo'),
(35, 'Can delete tipo vehiculo', 9, 'delete_tipovehiculo'),
(36, 'Can view tipo vehiculo', 9, 'view_tipovehiculo'),
(37, 'Can add vehiculo', 10, 'add_vehiculo'),
(38, 'Can change vehiculo', 10, 'change_vehiculo'),
(39, 'Can delete vehiculo', 10, 'delete_vehiculo'),
(40, 'Can view vehiculo', 10, 'view_vehiculo'),
(41, 'Can add empresa', 11, 'add_empresa'),
(42, 'Can change empresa', 11, 'change_empresa'),
(43, 'Can delete empresa', 11, 'delete_empresa'),
(44, 'Can view empresa', 11, 'view_empresa'),
(45, 'Can add tipo producto', 12, 'add_tipoproducto'),
(46, 'Can change tipo producto', 12, 'change_tipoproducto'),
(47, 'Can delete tipo producto', 12, 'delete_tipoproducto'),
(48, 'Can view tipo producto', 12, 'view_tipoproducto'),
(49, 'Can add productos', 13, 'add_productos'),
(50, 'Can change productos', 13, 'change_productos'),
(51, 'Can delete productos', 13, 'delete_productos'),
(52, 'Can view productos', 13, 'view_productos'),
(53, 'Can add servicios', 14, 'add_servicios'),
(54, 'Can change servicios', 14, 'change_servicios'),
(55, 'Can delete servicios', 14, 'delete_servicios'),
(56, 'Can view servicios', 14, 'view_servicios'),
(57, 'Can add metodo pago', 15, 'add_metodopago'),
(58, 'Can change metodo pago', 15, 'change_metodopago'),
(59, 'Can delete metodo pago', 15, 'delete_metodopago'),
(60, 'Can view metodo pago', 15, 'view_metodopago'),
(61, 'Can add factura', 16, 'add_factura'),
(62, 'Can change factura', 16, 'change_factura'),
(63, 'Can delete factura', 16, 'delete_factura'),
(64, 'Can view factura', 16, 'view_factura'),
(65, 'Can add detalle servicio', 17, 'add_detalleservicio'),
(66, 'Can change detalle servicio', 17, 'change_detalleservicio'),
(67, 'Can delete detalle servicio', 17, 'delete_detalleservicio'),
(68, 'Can view detalle servicio', 17, 'view_detalleservicio'),
(69, 'Can add detalle producto', 18, 'add_detalleproducto'),
(70, 'Can change detalle producto', 18, 'change_detalleproducto'),
(71, 'Can delete detalle producto', 18, 'delete_detalleproducto'),
(72, 'Can view detalle producto', 18, 'view_detalleproducto');

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
-- Estructura de tabla para la tabla `clientes_clientes`
--

CREATE TABLE `clientes_clientes` (
  `Documento` varchar(10) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Celular` varchar(10) DEFAULT NULL,
  `F_Nacimiento` date DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes_clientes`
--

INSERT INTO `clientes_clientes` (`Documento`, `Nombre`, `Apellido`, `Celular`, `F_Nacimiento`, `Correo`, `Direccion`) VALUES
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
(7, 'Clientes', 'clientes'),
(5, 'contenttypes', 'contenttype'),
(11, 'Empresa', 'empresa'),
(18, 'Factura', 'detalleproducto'),
(17, 'Factura', 'detalleservicio'),
(16, 'Factura', 'factura'),
(15, 'Factura', 'metodopago'),
(13, 'Productos', 'productos'),
(12, 'Productos', 'tipoproducto'),
(14, 'Servicios', 'servicios'),
(6, 'sessions', 'session'),
(8, 'Usuarios', 'usuarios'),
(9, 'Vehiculo', 'tipovehiculo'),
(10, 'Vehiculo', 'vehiculo');

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
(1, 'Clientes', '0001_initial', '2024-06-24 17:53:05.484086'),
(2, 'Empresa', '0001_initial', '2024-06-24 17:53:05.878725'),
(3, 'Vehiculo', '0001_initial', '2024-06-24 17:53:10.867237'),
(4, 'Usuarios', '0001_initial', '2024-06-24 17:53:11.157722'),
(5, 'Servicios', '0001_initial', '2024-06-24 17:53:12.120800'),
(6, 'Productos', '0001_initial', '2024-06-24 17:53:19.160178'),
(7, 'Factura', '0001_initial', '2024-06-24 17:53:45.548498'),
(8, 'contenttypes', '0001_initial', '2024-06-24 17:53:50.602136'),
(9, 'auth', '0001_initial', '2024-06-24 17:54:30.371523'),
(10, 'admin', '0001_initial', '2024-06-24 17:54:33.124662'),
(11, 'admin', '0002_logentry_remove_auto_add', '2024-06-24 17:54:33.194161'),
(12, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-24 17:54:33.372349'),
(13, 'contenttypes', '0002_remove_content_type_name', '2024-06-24 17:54:37.596726'),
(14, 'auth', '0002_alter_permission_name_max_length', '2024-06-24 17:54:41.472270'),
(15, 'auth', '0003_alter_user_email_max_length', '2024-06-24 17:54:41.623062'),
(16, 'auth', '0004_alter_user_username_opts', '2024-06-24 17:54:41.686826'),
(17, 'auth', '0005_alter_user_last_login_null', '2024-06-24 17:54:42.604398'),
(18, 'auth', '0006_require_contenttypes_0002', '2024-06-24 17:54:42.718171'),
(19, 'auth', '0007_alter_validators_add_error_messages', '2024-06-24 17:54:42.795735'),
(20, 'auth', '0008_alter_user_username_max_length', '2024-06-24 17:54:42.959575'),
(21, 'auth', '0009_alter_user_last_name_max_length', '2024-06-24 17:54:43.145827'),
(22, 'auth', '0010_alter_group_name_max_length', '2024-06-24 17:54:43.503113'),
(23, 'auth', '0011_update_proxy_permissions', '2024-06-24 17:54:43.552589'),
(24, 'auth', '0012_alter_user_first_name_max_length', '2024-06-24 17:54:43.831930'),
(25, 'sessions', '0001_initial', '2024-06-24 17:54:47.105681');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4wst3r0p8j85cevx325ti8hk57vidxdj', 'eyJ1c3VhcmlvX2F1dGVudGljYWRvIjoiMTEifQ:1sLo3i:PXRrrBFh3_5gFQcEiCBHNuCklrR7d-nBmRjAsUHfahY', '2024-07-08 18:04:54.164483');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_empresa`
--

CREATE TABLE `empresa_empresa` (
  `nit` varchar(9) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa_empresa`
--

INSERT INTO `empresa_empresa` (`nit`, `nombre`, `telefono`, `correo`, `direccion`) VALUES
('147258369', 'CarCareTech', '3195442623', 'carcaretech@gmail.com', 'Cra76 #53-200');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_detalleproducto`
--

CREATE TABLE `factura_detalleproducto` (
  `id_detalle_producto` int(11) NOT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` smallint(5) UNSIGNED DEFAULT NULL CHECK (`cantidad` >= 0),
  `producto_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_detalleproducto`
--

INSERT INTO `factura_detalleproducto` (`id_detalle_producto`, `precio`, `cantidad`, `producto_id`, `factura_id`) VALUES
(1, 25000, 5, 1, 1),
(2, 50000, 10, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_detalleservicio`
--

CREATE TABLE `factura_detalleservicio` (
  `id_detalle_servicio` int(11) NOT NULL,
  `precio` decimal(20,0) DEFAULT NULL,
  `documento_mecanico_id` varchar(10) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_detalleservicio`
--

INSERT INTO `factura_detalleservicio` (`id_detalle_servicio`, `precio`, `documento_mecanico_id`, `servicio_id`, `factura_id`) VALUES
(1, 50000, '1045296032', 1, 1),
(2, 60000, '1078324098', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_factura`
--

CREATE TABLE `factura_factura` (
  `id_factura` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `Total` double NOT NULL,
  `Subtotal` double NOT NULL,
  `Iva` double NOT NULL,
  `Descuento` double NOT NULL,
  `nit` varchar(9) NOT NULL,
  `placa` varchar(7) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_factura`
--

INSERT INTO `factura_factura` (`id_factura`, `fecha`, `Total`, `Subtotal`, `Iva`, `Descuento`, `nit`, `placa`, `id_metodo_pago`) VALUES
(1, '2024-06-24 13:13:00.000000', 874650, 735000, 19, 0, '147258369', 'ABC123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_metodopago`
--

CREATE TABLE `factura_metodopago` (
  `id_metodo_pago` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_metodopago`
--

INSERT INTO `factura_metodopago` (`id_metodo_pago`, `tipo`) VALUES
(1, 'Efectivo'),
(2, 'Debito'),
(3, 'Credito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_productos`
--

CREATE TABLE `productos_productos` (
  `id_producto` int(11) NOT NULL,
  `cantidad_stock` smallint(5) UNSIGNED NOT NULL CHECK (`cantidad_stock` >= 0),
  `nombre` varchar(200) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `id_tipo_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_productos`
--

INSERT INTO `productos_productos` (`id_producto`, `cantidad_stock`, `nombre`, `precio`, `id_tipo_producto`) VALUES
(1, 50, 'Llave inglesa', 25000, 1),
(2, 30, 'Destornillador de Estrella', 35000, 1),
(3, 20, 'Juego de llaves Allen', 100000, 1),
(4, 40, 'Alicate de corte', 27000, 1),
(5, 25, 'Martillo de bola', 50000, 1),
(6, 100, 'Aceite para motor 5W-30', 80000, 2),
(7, 80, 'Aceite para transmisión', 120000, 2),
(8, 70, 'Lubricante multiusos', 100000, 2),
(9, 60, 'Grasa para rodamientos', 85000, 2),
(10, 50, 'Líquido de frenos', 130000, 2),
(11, 25, 'Neumático 195/65R15', 170000, 3),
(12, 30, 'Neumático 205/55R16', 250000, 3),
(13, 15, 'Neumático 215/60R17', 200000, 3),
(14, 20, 'Neumático 225/45R18', 300000, 3),
(15, 10, 'Neumático 235/50R19', 275000, 3),
(16, 75, 'Filtro de aire', 95000, 4),
(17, 65, 'Filtro de aceite', 110000, 4),
(18, 85, 'Filtro de combustible', 135000, 4),
(19, 55, 'Filtro de cabina', 75000, 4),
(20, 50, 'Filtro hidráulico', 90000, 4),
(21, 20, 'Batería 12V 60Ah', 150000, 5),
(22, 15, 'Batería 12V 70Ah', 300000, 5),
(23, 10, 'Batería 12V 80Ah', 175000, 5),
(24, 12, 'Batería AGM 12V 60Ah', 180000, 5),
(25, 8, 'Batería AGM 12V 70Ah', 500000, 5),
(26, 35, 'Corta tubos', 35000, 1),
(27, 40, 'Llave de tubo', 45000, 1),
(28, 95, 'Anticongelante', 160000, 2),
(29, 70, 'Aceite hidráulico', 250000, 2),
(30, 18, 'Neumático 245/45R20', 375000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_tipoproducto`
--

CREATE TABLE `productos_tipoproducto` (
  `id_tipo_producto` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_tipoproducto`
--

INSERT INTO `productos_tipoproducto` (`id_tipo_producto`, `descripcion`) VALUES
(1, 'Herramientas manuales'),
(2, 'Aceites y lubricantes'),
(3, 'Neumáticos'),
(4, 'Filtros'),
(5, 'Baterías');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_servicios`
--

CREATE TABLE `servicios_servicios` (
  `id_servicios` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios_servicios`
--

INSERT INTO `servicios_servicios` (`id_servicios`, `nombre`, `precio`, `descripcion`) VALUES
(1, 'Mecanica General', 50000, 'Evaluacion general del vehiculo'),
(2, 'Latoneria', 60000, 'Reparacion de hundidos y pintura'),
(3, 'Cambio de Aceite', 40000, 'Sustitucion del aceite del motor'),
(4, 'Alineacion y Balanceo', 45000, 'Alineacion y balanceo de las ruedas'),
(5, 'Revisión de Frenos', 55000, 'Chequeo y ajuste del sistema de frenos'),
(6, 'Diagnostico Electronico', 70000, 'Analisis de los sistemas electronicos del vehiculo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_usuarios`
--

CREATE TABLE `usuarios_usuarios` (
  `Documento` varchar(10) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Celular` varchar(10) DEFAULT NULL,
  `F_Nacimiento` date DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios_usuarios`
--

INSERT INTO `usuarios_usuarios` (`Documento`, `Nombre`, `Apellido`, `Celular`, `F_Nacimiento`, `Correo`, `Rol`) VALUES
('10', 'Juan', 'Hernandez', '302', '1111-11-11', 'hgfds@gmail.com', 2),
('1045296032', 'Laura', 'Gomez', '3112459876', '1998-08-12', 'lauragomez@example.com', 1),
('1078324098', 'Andres', 'Lopez', '3006741234', '1996-12-03', 'andreslopez@example.com', 1),
('1097213045', 'Maria', 'Martinez', '3105896743', '2000-03-17', 'mariamartinez@example.com', 1),
('11', 'Sebastian', 'Roldan', '3225319812', '2005-04-24', 'sebasr@gmail.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_tipovehiculo`
--

CREATE TABLE `vehiculo_tipovehiculo` (
  `id_tipo_vehiculo` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `numero_ruedas` smallint(5) UNSIGNED DEFAULT NULL CHECK (`numero_ruedas` >= 0),
  `descripcion` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo_tipovehiculo`
--

INSERT INTO `vehiculo_tipovehiculo` (`id_tipo_vehiculo`, `nombre`, `numero_ruedas`, `descripcion`) VALUES
(1, 'Carro', 4, 'Camionetas tipo Campero, Automovil, Bus'),
(2, 'Motocicleta', 2, 'Motocicletas de distintas cilindradas y estilos'),
(3, 'Camion', 6, 'Camiones de carga pesada y ligera'),
(4, 'Bicicleta', 2, 'Bicicletas de montaña, de carretera y urbanas'),
(5, 'Autobus', 6, 'Autobuses de pasajeros para transporte público'),
(6, 'Tractor', 4, 'Tractores agrícolas y de construcción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_vehiculo`
--

CREATE TABLE `vehiculo_vehiculo` (
  `placa` varchar(7) NOT NULL,
  `modelo` varchar(25) DEFAULT NULL,
  `marca` varchar(25) DEFAULT NULL,
  `color` varchar(25) DEFAULT NULL,
  `transmision` varchar(30) DEFAULT NULL,
  `Documento` varchar(10) NOT NULL,
  `id_tipo_vehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo_vehiculo`
--

INSERT INTO `vehiculo_vehiculo` (`placa`, `modelo`, `marca`, `color`, `transmision`, `Documento`, `id_tipo_vehiculo`) VALUES
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
-- Indices de la tabla `clientes_clientes`
--
ALTER TABLE `clientes_clientes`
  ADD PRIMARY KEY (`Documento`);

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
-- Indices de la tabla `empresa_empresa`
--
ALTER TABLE `empresa_empresa`
  ADD PRIMARY KEY (`nit`);

--
-- Indices de la tabla `factura_detalleproducto`
--
ALTER TABLE `factura_detalleproducto`
  ADD PRIMARY KEY (`id_detalle_producto`),
  ADD KEY `Factura_detalleprodu_producto_id_785fceb0_fk_Productos` (`producto_id`),
  ADD KEY `Factura_detalleprodu_factura_id_53cf187b_fk_Factura_f` (`factura_id`);

--
-- Indices de la tabla `factura_detalleservicio`
--
ALTER TABLE `factura_detalleservicio`
  ADD PRIMARY KEY (`id_detalle_servicio`),
  ADD KEY `Factura_detalleservi_documento_mecanico_i_68375984_fk_Usuarios_` (`documento_mecanico_id`),
  ADD KEY `Factura_detalleservi_servicio_id_ae146b22_fk_Servicios` (`servicio_id`),
  ADD KEY `Factura_detalleservi_factura_id_a5866ac5_fk_Factura_f` (`factura_id`);

--
-- Indices de la tabla `factura_factura`
--
ALTER TABLE `factura_factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `Factura_factura_nit_d7f32b5e_fk_Empresa_empresa_nit` (`nit`),
  ADD KEY `Factura_factura_placa_3a5ccf6b_fk_Vehiculo_vehiculo_placa` (`placa`),
  ADD KEY `Factura_factura_id_metodo_pago_7f7937ec_fk_Factura_m` (`id_metodo_pago`);

--
-- Indices de la tabla `factura_metodopago`
--
ALTER TABLE `factura_metodopago`
  ADD PRIMARY KEY (`id_metodo_pago`);

--
-- Indices de la tabla `productos_productos`
--
ALTER TABLE `productos_productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `Productos_productos_id_tipo_producto_c75ef1b3_fk_Productos` (`id_tipo_producto`);

--
-- Indices de la tabla `productos_tipoproducto`
--
ALTER TABLE `productos_tipoproducto`
  ADD PRIMARY KEY (`id_tipo_producto`);

--
-- Indices de la tabla `servicios_servicios`
--
ALTER TABLE `servicios_servicios`
  ADD PRIMARY KEY (`id_servicios`);

--
-- Indices de la tabla `usuarios_usuarios`
--
ALTER TABLE `usuarios_usuarios`
  ADD PRIMARY KEY (`Documento`);

--
-- Indices de la tabla `vehiculo_tipovehiculo`
--
ALTER TABLE `vehiculo_tipovehiculo`
  ADD PRIMARY KEY (`id_tipo_vehiculo`);

--
-- Indices de la tabla `vehiculo_vehiculo`
--
ALTER TABLE `vehiculo_vehiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `Vehiculo_vehiculo_Documento_60495f0a_fk_Clientes_` (`Documento`),
  ADD KEY `Vehiculo_vehiculo_id_tipo_vehiculo_e39adc51_fk_Vehiculo_` (`id_tipo_vehiculo`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `factura_detalleproducto`
--
ALTER TABLE `factura_detalleproducto`
  MODIFY `id_detalle_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura_detalleservicio`
--
ALTER TABLE `factura_detalleservicio`
  MODIFY `id_detalle_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura_factura`
--
ALTER TABLE `factura_factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura_metodopago`
--
ALTER TABLE `factura_metodopago`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos_productos`
--
ALTER TABLE `productos_productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `productos_tipoproducto`
--
ALTER TABLE `productos_tipoproducto`
  MODIFY `id_tipo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicios_servicios`
--
ALTER TABLE `servicios_servicios`
  MODIFY `id_servicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `vehiculo_tipovehiculo`
--
ALTER TABLE `vehiculo_tipovehiculo`
  MODIFY `id_tipo_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `factura_detalleproducto`
--
ALTER TABLE `factura_detalleproducto`
  ADD CONSTRAINT `Factura_detalleprodu_factura_id_53cf187b_fk_Factura_f` FOREIGN KEY (`factura_id`) REFERENCES `factura_factura` (`id_factura`),
  ADD CONSTRAINT `Factura_detalleprodu_producto_id_785fceb0_fk_Productos` FOREIGN KEY (`producto_id`) REFERENCES `productos_productos` (`id_producto`);

--
-- Filtros para la tabla `factura_detalleservicio`
--
ALTER TABLE `factura_detalleservicio`
  ADD CONSTRAINT `Factura_detalleservi_documento_mecanico_i_68375984_fk_Usuarios_` FOREIGN KEY (`documento_mecanico_id`) REFERENCES `usuarios_usuarios` (`Documento`),
  ADD CONSTRAINT `Factura_detalleservi_factura_id_a5866ac5_fk_Factura_f` FOREIGN KEY (`factura_id`) REFERENCES `factura_factura` (`id_factura`),
  ADD CONSTRAINT `Factura_detalleservi_servicio_id_ae146b22_fk_Servicios` FOREIGN KEY (`servicio_id`) REFERENCES `servicios_servicios` (`id_servicios`);

--
-- Filtros para la tabla `factura_factura`
--
ALTER TABLE `factura_factura`
  ADD CONSTRAINT `Factura_factura_id_metodo_pago_7f7937ec_fk_Factura_m` FOREIGN KEY (`id_metodo_pago`) REFERENCES `factura_metodopago` (`id_metodo_pago`),
  ADD CONSTRAINT `Factura_factura_nit_d7f32b5e_fk_Empresa_empresa_nit` FOREIGN KEY (`nit`) REFERENCES `empresa_empresa` (`nit`),
  ADD CONSTRAINT `Factura_factura_placa_3a5ccf6b_fk_Vehiculo_vehiculo_placa` FOREIGN KEY (`placa`) REFERENCES `vehiculo_vehiculo` (`placa`);

--
-- Filtros para la tabla `productos_productos`
--
ALTER TABLE `productos_productos`
  ADD CONSTRAINT `Productos_productos_id_tipo_producto_c75ef1b3_fk_Productos` FOREIGN KEY (`id_tipo_producto`) REFERENCES `productos_tipoproducto` (`id_tipo_producto`);

--
-- Filtros para la tabla `vehiculo_vehiculo`
--
ALTER TABLE `vehiculo_vehiculo`
  ADD CONSTRAINT `Vehiculo_vehiculo_Documento_60495f0a_fk_Clientes_` FOREIGN KEY (`Documento`) REFERENCES `clientes_clientes` (`Documento`),
  ADD CONSTRAINT `Vehiculo_vehiculo_id_tipo_vehiculo_e39adc51_fk_Vehiculo_` FOREIGN KEY (`id_tipo_vehiculo`) REFERENCES `vehiculo_tipovehiculo` (`id_tipo_vehiculo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
