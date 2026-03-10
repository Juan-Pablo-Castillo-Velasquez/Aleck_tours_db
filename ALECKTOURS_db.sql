-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql_db:3306
-- Tiempo de generación: 10-03-2026 a las 15:15:16
-- Versión del servidor: 8.0.45
-- Versión de PHP: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Aleck_tours`
--
CREATE DATABASE IF NOT EXISTS `Aleck_tours` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `Aleck_tours`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas_hotel`
--

CREATE TABLE `caracteristicas_hotel` (
  `id_caracteristica` int NOT NULL,
  `nombre_caracteristica` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `caracteristicas_hotel`
--

INSERT INTO `caracteristicas_hotel` (`id_caracteristica`, `nombre_caracteristica`) VALUES
(1, 'WiFi'),
(2, 'Piscina'),
(3, 'Spa'),
(4, 'Gimnasio'),
(5, 'Restaurante'),
(6, 'Bar'),
(7, 'Parqueadero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_servicio`
--

CREATE TABLE `categoria_servicio` (
  `id_categoria` int NOT NULL,
  `nombre_categoria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria_servicio`
--

INSERT INTO `categoria_servicio` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Tour'),
(2, 'Transporte'),
(3, 'Gastronomía'),
(4, 'Aventura'),
(5, 'Cultura'),
(6, 'Deporte'),
(7, 'Relajación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` int NOT NULL,
  `nombre_ciudad` varchar(100) NOT NULL,
  `id_pais` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `nombre_ciudad`, `id_pais`) VALUES
(1, 'Bogotá', 1),
(2, 'Medellín', 1),
(3, 'Cartagena', 1),
(4, 'Ciudad de México', 2),
(5, 'Guadalajara', 2),
(6, 'Lima', 3),
(7, 'Cusco', 3),
(8, 'Santiago', 4),
(9, 'Buenos Aires', 5),
(10, 'Madrid', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `id_direccion` int DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `cedula`, `correo`, `celular`, `id_direccion`, `fecha_nacimiento`, `fecha_registro`) VALUES
(1, 'Juan', 'Pérez', '1001', 'juan@mail.com', '3100000001', 1, '1995-05-10', '2026-03-10 15:12:37'),
(2, 'Ana', 'García', '1002', 'ana@mail.com', '3100000002', 2, '1998-03-12', '2026-03-10 15:12:37'),
(3, 'Carlos', 'López', '1003', 'carlos@mail.com', '3100000003', 3, '1990-07-01', '2026-03-10 15:12:37'),
(4, 'Laura', 'Martínez', '1004', 'laura@mail.com', '3100000004', 4, '1997-02-14', '2026-03-10 15:12:37'),
(5, 'Pedro', 'Ramírez', '1005', 'pedro@mail.com', '3100000005', 5, '1992-09-22', '2026-03-10 15:12:37'),
(6, 'Sofía', 'Torres', '1006', 'sofia@mail.com', '3100000006', 6, '1999-11-30', '2026-03-10 15:12:37'),
(7, 'Luis', 'Hernández', '1007', 'luis@mail.com', '3100000007', 7, '1989-04-10', '2026-03-10 15:12:37'),
(8, 'Marta', 'Castro', '1008', 'marta@mail.com', '3100000008', 8, '1993-06-15', '2026-03-10 15:12:37'),
(9, 'Diego', 'Morales', '1009', 'diego@mail.com', '3100000009', 9, '1996-08-20', '2026-03-10 15:12:37'),
(10, 'Paula', 'Rojas', '1010', 'paula@mail.com', '3100000010', 10, '2000-01-01', '2026-03-10 15:12:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id_destino` int NOT NULL,
  `nombre_destino` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `id_ciudad` int DEFAULT NULL,
  `temporada_alta_inicio` date DEFAULT NULL,
  `temporada_alta_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`id_destino`, `nombre_destino`, `descripcion`, `id_ciudad`, `temporada_alta_inicio`, `temporada_alta_fin`) VALUES
(1, 'Cartagena Playa', 'Destino turístico de playa', 3, '2025-12-01', '2026-01-15'),
(2, 'Bogotá Cultural', 'Tour cultural por Bogotá', 1, '2025-06-01', '2025-08-30'),
(3, 'Medellín Innovación', 'Tour tecnológico', 2, '2025-07-01', '2025-08-15'),
(4, 'Cusco Histórico', 'Destino arqueológico', 7, '2025-06-10', '2025-09-10'),
(5, 'Lima Gastronómico', 'Tour gastronómico', 6, '2025-05-01', '2025-07-30'),
(6, 'Santiago Andes', 'Turismo de montaña', 8, '2025-07-01', '2025-09-01'),
(7, 'Madrid Histórico', 'Tour europeo cultural', 10, '2025-04-01', '2025-06-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `id_direccion` int NOT NULL,
  `direccion_linea` varchar(255) DEFAULT NULL,
  `id_ciudad` int DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`id_direccion`, `direccion_linea`, `id_ciudad`, `codigo_postal`) VALUES
(1, 'Calle 10 #20-30', 1, '110111'),
(2, 'Carrera 50 #40-20', 2, '050001'),
(3, 'Av Caribe 100', 3, '130001'),
(4, 'Centro Histórico', 4, '06000'),
(5, 'Av Reforma 200', 4, '06001'),
(6, 'Miraflores 456', 6, '15074'),
(7, 'Plaza Mayor 10', 10, '28001'),
(8, 'Av Libertador 300', 9, '1000'),
(9, 'Calle 80 #45-10', 1, '110221'),
(10, 'Av Las Palmas 20', 2, '050021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `id_direccion` int DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellido`, `cedula`, `correo_electronico`, `celular`, `id_direccion`, `fecha_nacimiento`, `fecha_contratacion`, `activo`) VALUES
(1, 'Mario', 'Lopez', '2001', 'mario@mail.com', '3200000001', 1, '1985-05-10', '2022-01-01', 1),
(2, 'Lucia', 'Perez', '2002', 'lucia@mail.com', '3200000002', 2, '1990-03-15', '2021-02-10', 1),
(3, 'Jorge', 'Ramos', '2003', 'jorge@mail.com', '3200000003', 3, '1988-06-20', '2020-03-01', 1),
(4, 'Diana', 'Castillo', '2004', 'diana@mail.com', '3200000004', 4, '1992-09-10', '2022-05-12', 1),
(5, 'Andres', 'Vega', '2005', 'andres@mail.com', '3200000005', 5, '1987-11-11', '2019-07-01', 1),
(6, 'Carla', 'Suarez', '2006', 'carla@mail.com', '3200000006', 6, '1994-01-22', '2023-01-15', 1),
(7, 'Oscar', 'Medina', '2007', 'oscar@mail.com', '3200000007', 7, '1986-12-05', '2018-04-30', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_roles`
--

CREATE TABLE `empleados_roles` (
  `id_empleado` int NOT NULL,
  `id_rol` int NOT NULL,
  `fecha_asignacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleados_roles`
--

INSERT INTO `empleados_roles` (`id_empleado`, `id_rol`, `fecha_asignacion`) VALUES
(1, 1, '2022-01-01'),
(2, 2, '2021-02-10'),
(3, 3, '2020-03-01'),
(4, 2, '2022-05-12'),
(5, 4, '2019-07-01'),
(6, 5, '2023-01-15'),
(7, 6, '2018-04-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `id_habitacion` int NOT NULL,
  `id_hotel` int DEFAULT NULL,
  `id_tipo_habitacion` int DEFAULT NULL,
  `numero_habitacion` varchar(20) DEFAULT NULL,
  `precio_noche` decimal(10,2) DEFAULT NULL,
  `estado` enum('disponible','ocupada','mantenimiento') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`id_habitacion`, `id_hotel`, `id_tipo_habitacion`, `numero_habitacion`, `precio_noche`, `estado`) VALUES
(1, 1, 1, '101', 120000.00, 'disponible'),
(2, 1, 2, '102', 180000.00, 'disponible'),
(3, 2, 2, '201', 170000.00, 'ocupada'),
(4, 2, 3, '202', 200000.00, 'disponible'),
(5, 3, 4, '301', 350000.00, 'disponible'),
(6, 4, 5, '401', 220000.00, 'disponible'),
(7, 5, 6, '501', 260000.00, 'ocupada'),
(8, 6, 1, '601', 100000.00, 'disponible'),
(9, 7, 2, '701', 150000.00, 'disponible'),
(10, 3, 3, '302', 210000.00, 'mantenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int NOT NULL,
  `nombre_hotel` varchar(100) DEFAULT NULL,
  `calificacion` int DEFAULT NULL,
  `id_direccion` int DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `nombre_hotel`, `calificacion`, `id_direccion`, `correo_electronico`, `telefono`) VALUES
(1, 'Hotel Caribe', 5, 3, 'caribe@hotel.com', '3001111111'),
(2, 'Hotel Capital', 4, 1, 'capital@hotel.com', '3002222222'),
(3, 'Hotel Montaña', 4, 2, 'montana@hotel.com', '3003333333'),
(4, 'Hotel Playa', 5, 3, 'playa@hotel.com', '3004444444'),
(5, 'Hotel Imperial', 5, 4, 'imperial@hotel.com', '3005555555'),
(6, 'Hotel Colonial', 4, 7, 'colonial@hotel.com', '3006666666'),
(7, 'Hotel Central', 3, 8, 'central@hotel.com', '3007777777');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_caracteristicas`
--

CREATE TABLE `hotel_caracteristicas` (
  `id_hotel` int NOT NULL,
  `id_caracteristica` int NOT NULL,
  `disponible` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `hotel_caracteristicas`
--

INSERT INTO `hotel_caracteristicas` (`id_hotel`, `id_caracteristica`, `disponible`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 5, 1),
(2, 1, 1),
(2, 4, 1),
(3, 1, 1),
(3, 2, 0),
(4, 2, 1),
(5, 3, 1),
(6, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id_metodo` int NOT NULL,
  `nombre_metodo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `metodos_pago`
--

INSERT INTO `metodos_pago` (`id_metodo`, `nombre_metodo`) VALUES
(1, 'Tarjeta Crédito'),
(2, 'Tarjeta Débito'),
(3, 'Efectivo'),
(4, 'Transferencia'),
(5, 'PayPal'),
(6, 'Nequi'),
(7, 'Daviplata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int NOT NULL,
  `id_reserva` int DEFAULT NULL,
  `id_metodo_pago` int DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `estado` enum('pendiente','pagado','rechazado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_reserva`, `id_metodo_pago`, `monto`, `fecha_pago`, `referencia`, `estado`) VALUES
(1, 1, 1, 500000.00, '2026-03-10 15:12:37', 'REF001', 'pagado'),
(2, 2, 2, 200000.00, '2026-03-10 15:12:37', 'REF002', 'pendiente'),
(3, 3, 3, 700000.00, '2026-03-10 15:12:37', 'REF003', 'pagado'),
(4, 4, 4, 300000.00, '2026-03-10 15:12:37', 'REF004', 'rechazado'),
(5, 5, 1, 450000.00, '2026-03-10 15:12:37', 'REF005', 'pagado'),
(6, 6, 5, 600000.00, '2026-03-10 15:12:37', 'REF006', 'pendiente'),
(7, 7, 6, 250000.00, '2026-03-10 15:12:37', 'REF007', 'pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id_pais` int NOT NULL,
  `nombre_pais` varchar(100) NOT NULL,
  `codigo_iso` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre_pais`, `codigo_iso`) VALUES
(1, 'Colombia', 'CO'),
(2, 'México', 'MX'),
(3, 'Perú', 'PE'),
(4, 'Chile', 'CL'),
(5, 'Argentina', 'AR'),
(6, 'España', 'ES'),
(7, 'Estados Unidos', 'US');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes`
--

CREATE TABLE `paquetes` (
  `id_paquete` int NOT NULL,
  `nombre_paquete` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `duracion_dias` int DEFAULT NULL,
  `precio_base` decimal(10,2) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `paquetes`
--

INSERT INTO `paquetes` (`id_paquete`, `nombre_paquete`, `descripcion`, `duracion_dias`, `precio_base`, `activo`) VALUES
(1, 'Caribe Vacaciones', 'Paquete turístico en Cartagena', 5, 1200000.00, 1),
(2, 'Bogotá Cultural', 'Experiencia cultural', 3, 600000.00, 1),
(3, 'Medellín Aventura', 'Paquete aventura', 4, 800000.00, 1),
(4, 'Cusco Histórico', 'Turismo arqueológico', 5, 1500000.00, 1),
(5, 'Lima Gourmet', 'Experiencia gastronómica', 3, 700000.00, 1),
(6, 'Andes Trek', 'Excursión montaña', 4, 900000.00, 1),
(7, 'Madrid Cultura', 'Paquete europeo', 6, 2000000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete_hotel`
--

CREATE TABLE `paquete_hotel` (
  `id_paquete` int NOT NULL,
  `id_hotel` int NOT NULL,
  `noches_incluidas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `paquete_hotel`
--

INSERT INTO `paquete_hotel` (`id_paquete`, `id_hotel`, `noches_incluidas`) VALUES
(1, 1, 4),
(2, 2, 2),
(3, 3, 3),
(4, 5, 4),
(5, 6, 2),
(6, 4, 3),
(7, 7, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete_servicios`
--

CREATE TABLE `paquete_servicios` (
  `id_paquete` int NOT NULL,
  `id_servicio` int NOT NULL,
  `dia_actividad` int DEFAULT NULL,
  `incluido` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `paquete_servicios`
--

INSERT INTO `paquete_servicios` (`id_paquete`, `id_servicio`, `dia_actividad`, `incluido`) VALUES
(1, 7, 2, 1),
(1, 8, 1, 1),
(2, 1, 2, 1),
(2, 5, 1, 1),
(3, 4, 2, 1),
(3, 6, 1, 1),
(4, 10, 1, 1),
(5, 9, 1, 1),
(6, 4, 1, 1),
(7, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_servicios`
--

CREATE TABLE `proveedores_servicios` (
  `id_proveedor` int NOT NULL,
  `nombre_proveedor` varchar(100) DEFAULT NULL,
  `tipo_proveedor` varchar(50) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `id_direccion` int DEFAULT NULL,
  `comision_porcentaje` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedores_servicios`
--

INSERT INTO `proveedores_servicios` (`id_proveedor`, `nombre_proveedor`, `tipo_proveedor`, `contacto`, `telefono`, `correo_electronico`, `id_direccion`, `comision_porcentaje`) VALUES
(1, 'Tours Caribe', 'Turismo', 'Carlos Ruiz', '3011111111', 'tour1@mail.com', 3, 10.00),
(2, 'Transportes Rápidos', 'Transporte', 'Luis Mora', '3022222222', 'trans@mail.com', 1, 8.00),
(3, 'Restaurante Lima', 'Gastronomía', 'Ana Vega', '3033333333', 'rest@mail.com', 6, 12.00),
(4, 'Aventura Andes', 'Aventura', 'Pedro Castro', '3044444444', 'avent@mail.com', 8, 15.00),
(5, 'Cultura Bogotá', 'Cultura', 'Laura Díaz', '3055555555', 'cult@mail.com', 1, 9.00),
(6, 'BiciTour Medellín', 'Deporte', 'Mario Soto', '3066666666', 'bici@mail.com', 2, 10.00),
(7, 'Spa Caribe', 'Relajación', 'Sofia Luna', '3077777777', 'spa@mail.com', 3, 11.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `id_paquete` int DEFAULT NULL,
  `fecha_reserva` datetime DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `numero_personas` int DEFAULT NULL,
  `estado` enum('pendiente','confirmada','cancelada','finalizada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `id_cliente`, `id_empleado`, `id_paquete`, `fecha_reserva`, `fecha_inicio`, `fecha_fin`, `numero_personas`, `estado`) VALUES
(1, 1, 1, NULL, '2026-03-10 15:12:37', '2025-07-01', '2025-07-05', 2, 'confirmada'),
(2, 2, 2, NULL, '2026-03-10 15:12:37', '2025-07-10', '2025-07-12', 1, 'pendiente'),
(3, 3, 3, NULL, '2026-03-10 15:12:37', '2025-07-15', '2025-07-18', 3, 'confirmada'),
(4, 4, 4, NULL, '2026-03-10 15:12:37', '2025-08-01', '2025-08-04', 2, 'cancelada'),
(5, 5, 5, NULL, '2026-03-10 15:12:37', '2025-08-10', '2025-08-12', 2, 'confirmada'),
(6, 6, 6, NULL, '2026-03-10 15:12:37', '2025-09-01', '2025-09-05', 4, 'pendiente'),
(7, 7, 7, NULL, '2026-03-10 15:12:37', '2025-09-10', '2025-09-15', 2, 'confirmada'),
(8, 8, 1, NULL, '2026-03-10 15:12:37', '2025-10-01', '2025-10-03', 1, 'confirmada'),
(9, 9, 2, NULL, '2026-03-10 15:12:37', '2025-10-05', '2025-10-09', 2, 'pendiente'),
(10, 10, 3, NULL, '2026-03-10 15:12:37', '2025-11-01', '2025-11-06', 3, 'confirmada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_habitaciones`
--

CREATE TABLE `reserva_habitaciones` (
  `id_reserva` int NOT NULL,
  `id_habitacion` int NOT NULL,
  `fecha_checkin` date DEFAULT NULL,
  `fecha_checkout` date DEFAULT NULL,
  `precio_acordado` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reserva_habitaciones`
--

INSERT INTO `reserva_habitaciones` (`id_reserva`, `id_habitacion`, `fecha_checkin`, `fecha_checkout`, `precio_acordado`) VALUES
(1, 1, '2025-07-01', '2025-07-05', 120000.00),
(2, 2, '2025-07-10', '2025-07-12', 180000.00),
(3, 3, '2025-07-15', '2025-07-18', 170000.00),
(4, 4, '2025-08-01', '2025-08-04', 200000.00),
(5, 5, '2025-08-10', '2025-08-12', 350000.00),
(6, 6, '2025-09-01', '2025-09-05', 220000.00),
(7, 7, '2025-09-10', '2025-09-15', 260000.00),
(8, 8, '2025-10-01', '2025-10-03', 100000.00),
(9, 9, '2025-10-05', '2025-10-09', 150000.00),
(10, 10, '2025-11-01', '2025-11-06', 210000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_servicios`
--

CREATE TABLE `reserva_servicios` (
  `id_reserva` int NOT NULL,
  `id_servicio` int NOT NULL,
  `fecha_servicio` date DEFAULT NULL,
  `numero_personas` int DEFAULT NULL,
  `precio_acordado` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reserva_servicios`
--

INSERT INTO `reserva_servicios` (`id_reserva`, `id_servicio`, `fecha_servicio`, `numero_personas`, `precio_acordado`) VALUES
(1, 1, '2025-07-02', 2, 80000.00),
(2, 2, '2025-07-10', 1, 50000.00),
(3, 3, '2025-07-16', 3, 120000.00),
(4, 4, '2025-08-02', 2, 150000.00),
(5, 5, '2025-08-11', 2, 90000.00),
(6, 6, '2025-09-02', 4, 60000.00),
(7, 7, '2025-09-11', 2, 140000.00),
(8, 8, '2025-10-02', 1, 110000.00),
(9, 9, '2025-10-06', 2, 95000.00),
(10, 10, '2025-11-02', 3, 200000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int NOT NULL,
  `nombre_rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Recepcionista'),
(3, 'Gerente'),
(4, 'Contador'),
(5, 'Limpieza'),
(6, 'Seguridad'),
(7, 'Soporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL,
  `nombre_servicio` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `id_categoria` int DEFAULT NULL,
  `id_destino` int DEFAULT NULL,
  `duracion_horas` decimal(4,1) DEFAULT NULL,
  `precio_base` decimal(10,2) DEFAULT NULL,
  `capacidad_maxima` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre_servicio`, `descripcion`, `id_categoria`, `id_destino`, `duracion_horas`, `precio_base`, `capacidad_maxima`) VALUES
(1, 'Tour Centro Histórico', 'Recorrido por el centro', 1, 2, 4.0, 80000.00, 20),
(2, 'Transporte Aeropuerto', 'Traslado aeropuerto hotel', 2, 1, 1.0, 50000.00, 10),
(3, 'Cena Gourmet', 'Cena típica local', 3, 5, 2.0, 120000.00, 30),
(4, 'Caminata Andes', 'Excursión de montaña', 4, 6, 6.0, 150000.00, 15),
(5, 'Museos Bogotá', 'Visita guiada a museos', 5, 2, 5.0, 90000.00, 20),
(6, 'Ciclismo Urbano', 'Tour en bicicleta', 6, 3, 3.0, 60000.00, 12),
(7, 'Spa Relax', 'Sesión de spa', 7, 1, 2.0, 140000.00, 8),
(8, 'Tour Playa', 'Excursión playa', 1, 1, 5.0, 110000.00, 25),
(9, 'Ruta Gastronómica', 'Tour comida local', 3, 5, 4.0, 95000.00, 20),
(10, 'Excursión Cusco', 'Tour arqueológico', 5, 4, 6.0, 200000.00, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_proveedor`
--

CREATE TABLE `servicio_proveedor` (
  `id_servicio` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `precio_proveedor` decimal(10,2) DEFAULT NULL,
  `es_proveedor_principal` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `servicio_proveedor`
--

INSERT INTO `servicio_proveedor` (`id_servicio`, `id_proveedor`, `precio_proveedor`, `es_proveedor_principal`) VALUES
(1, 1, 60000.00, 1),
(2, 2, 30000.00, 1),
(3, 3, 80000.00, 1),
(4, 4, 100000.00, 1),
(5, 5, 50000.00, 1),
(6, 6, 40000.00, 1),
(7, 7, 90000.00, 1),
(8, 1, 70000.00, 0),
(9, 3, 65000.00, 0),
(10, 4, 120000.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitacion`
--

CREATE TABLE `tipo_habitacion` (
  `id_tipo_habitacion` int NOT NULL,
  `nombre_tipo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `capacidad_personas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_habitacion`
--

INSERT INTO `tipo_habitacion` (`id_tipo_habitacion`, `nombre_tipo`, `descripcion`, `capacidad_personas`) VALUES
(1, 'Simple', 'Habitación individual', 1),
(2, 'Doble', 'Habitación doble', 2),
(3, 'Triple', 'Habitación triple', 3),
(4, 'Suite', 'Suite de lujo', 2),
(5, 'Familiar', 'Habitación familiar', 4),
(6, 'Deluxe', 'Habitación deluxe', 2),
(7, 'Presidencial', 'Suite presidencial', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas_hotel`
--
ALTER TABLE `caracteristicas_hotel`
  ADD PRIMARY KEY (`id_caracteristica`);

--
-- Indices de la tabla `categoria_servicio`
--
ALTER TABLE `categoria_servicio`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id_destino`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indices de la tabla `empleados_roles`
--
ALTER TABLE `empleados_roles`
  ADD PRIMARY KEY (`id_empleado`,`id_rol`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`id_habitacion`),
  ADD KEY `id_hotel` (`id_hotel`),
  ADD KEY `id_tipo_habitacion` (`id_tipo_habitacion`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indices de la tabla `hotel_caracteristicas`
--
ALTER TABLE `hotel_caracteristicas`
  ADD PRIMARY KEY (`id_hotel`,`id_caracteristica`),
  ADD KEY `id_caracteristica` (`id_caracteristica`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`id_metodo`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_reserva` (`id_reserva`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`id_paquete`);

--
-- Indices de la tabla `paquete_hotel`
--
ALTER TABLE `paquete_hotel`
  ADD PRIMARY KEY (`id_paquete`,`id_hotel`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Indices de la tabla `paquete_servicios`
--
ALTER TABLE `paquete_servicios`
  ADD PRIMARY KEY (`id_paquete`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `proveedores_servicios`
--
ALTER TABLE `proveedores_servicios`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_paquete` (`id_paquete`);

--
-- Indices de la tabla `reserva_habitaciones`
--
ALTER TABLE `reserva_habitaciones`
  ADD PRIMARY KEY (`id_reserva`,`id_habitacion`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `reserva_servicios`
--
ALTER TABLE `reserva_servicios`
  ADD PRIMARY KEY (`id_reserva`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_destino` (`id_destino`);

--
-- Indices de la tabla `servicio_proveedor`
--
ALTER TABLE `servicio_proveedor`
  ADD PRIMARY KEY (`id_servicio`,`id_proveedor`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD PRIMARY KEY (`id_tipo_habitacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicas_hotel`
--
ALTER TABLE `caracteristicas_hotel`
  MODIFY `id_caracteristica` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categoria_servicio`
--
ALTER TABLE `categoria_servicio`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id_ciudad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id_destino` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `id_direccion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `id_habitacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id_metodo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  MODIFY `id_paquete` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedores_servicios`
--
ALTER TABLE `proveedores_servicios`
  MODIFY `id_proveedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  MODIFY `id_tipo_habitacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id_direccion`);

--
-- Filtros para la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD CONSTRAINT `destinos_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id_direccion`);

--
-- Filtros para la tabla `empleados_roles`
--
ALTER TABLE `empleados_roles`
  ADD CONSTRAINT `empleados_roles_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `empleados_roles_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`),
  ADD CONSTRAINT `habitaciones_ibfk_2` FOREIGN KEY (`id_tipo_habitacion`) REFERENCES `tipo_habitacion` (`id_tipo_habitacion`);

--
-- Filtros para la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id_direccion`);

--
-- Filtros para la tabla `hotel_caracteristicas`
--
ALTER TABLE `hotel_caracteristicas`
  ADD CONSTRAINT `hotel_caracteristicas_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`),
  ADD CONSTRAINT `hotel_caracteristicas_ibfk_2` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas_hotel` (`id_caracteristica`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodos_pago` (`id_metodo`);

--
-- Filtros para la tabla `paquete_hotel`
--
ALTER TABLE `paquete_hotel`
  ADD CONSTRAINT `paquete_hotel_ibfk_1` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes` (`id_paquete`),
  ADD CONSTRAINT `paquete_hotel_ibfk_2` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`);

--
-- Filtros para la tabla `paquete_servicios`
--
ALTER TABLE `paquete_servicios`
  ADD CONSTRAINT `paquete_servicios_ibfk_1` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes` (`id_paquete`),
  ADD CONSTRAINT `paquete_servicios_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `proveedores_servicios`
--
ALTER TABLE `proveedores_servicios`
  ADD CONSTRAINT `proveedores_servicios_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id_direccion`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes` (`id_paquete`);

--
-- Filtros para la tabla `reserva_habitaciones`
--
ALTER TABLE `reserva_habitaciones`
  ADD CONSTRAINT `reserva_habitaciones_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  ADD CONSTRAINT `reserva_habitaciones_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`);

--
-- Filtros para la tabla `reserva_servicios`
--
ALTER TABLE `reserva_servicios`
  ADD CONSTRAINT `reserva_servicios_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  ADD CONSTRAINT `reserva_servicios_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_servicio` (`id_categoria`),
  ADD CONSTRAINT `servicios_ibfk_2` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id_destino`);

--
-- Filtros para la tabla `servicio_proveedor`
--
ALTER TABLE `servicio_proveedor`
  ADD CONSTRAINT `servicio_proveedor_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `servicio_proveedor_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores_servicios` (`id_proveedor`);
--
-- Base de datos: `colegio`
--
CREATE DATABASE IF NOT EXISTS `colegio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `colegio`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
