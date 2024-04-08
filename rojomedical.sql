-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: cj2605076-001.eu.clouddb.ovh.net:35672
-- Tiempo de generación: 08-04-2024 a las 17:24:31
-- Versión del servidor: 8.0.35
-- Versión de PHP: 8.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rojomedical`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `fecha_alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_disp` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

CREATE TABLE `dispositivos` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero_de_serie` varchar(20) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `id_parche_ad` int DEFAULT NULL,
  `id_parche_ni` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimientos`
--

CREATE TABLE `mantenimientos` (
  `id` int NOT NULL,
  `id_us` int DEFAULT NULL,
  `id_dis` int DEFAULT NULL,
  `id_p_a` int DEFAULT NULL,
  `id_p_n` int DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_dispositivo`
--

CREATE TABLE `modelo_dispositivo` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_parche_adulto` int DEFAULT NULL,
  `id_parche_nino` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modelo_dispositivo`
--

INSERT INTO `modelo_dispositivo` (`id`, `nombre`, `modelo`, `descripcion`, `id_parche_adulto`, `id_parche_nino`) VALUES
(1, 'Desfibrilador Compacto', 'DC-1001', 'Pequeño y manejable, ideal para espacios reducidos.', 1, 2),
(2, 'Desfibrilador Avanzado', 'DA-1002', 'Incluye funciones avanzadas para profesionales.', 2, 3),
(3, 'Desfibrilador Estándar', 'DE-1003', 'Equilibrio perfecto entre funcionalidad y precio.', 3, 4),
(4, 'Desfibrilador Portátil', 'DP-1004', 'Ligero y fácil de transportar para emergencias.', 4, 5),
(5, 'Desfibrilador Integral', 'DI-1005', 'Completo con todas las funciones necesarias para hospitales.', 5, 1),
(6, 'Desfibrilador Básico', 'DB-1006', 'Funciones básicas, ideal para lugares públicos.', 1, 2),
(7, 'Desfibrilador Marino', 'DM-1007', 'Resistente al agua y diseñado para el uso en el mar.', 2, 3),
(8, 'Desfibrilador de Campo', 'DF-1008', 'Robusto para condiciones exteriores difíciles.', 3, 4),
(9, 'Desfibrilador Doméstico', 'DD-1009', 'Simple y seguro para uso doméstico.', 4, 5),
(10, 'Desfibrilador de Aula', 'DA-1010', 'Diseñado para el entorno educativo, con guías sencillas.', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_parche_adulto`
--

CREATE TABLE `modelo_parche_adulto` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modelo_parche_adulto`
--

INSERT INTO `modelo_parche_adulto` (`id`, `nombre`, `modelo`, `descripcion`) VALUES
(1, 'Parche Cardio', 'PC-101', 'Parche cardíaco estándar para adultos.'),
(2, 'Parche Plus', 'PP-202', 'Parche con sensibilidad mejorada para monitoreo a largo plazo.'),
(3, 'Parche Pro', 'PPR-303', 'Parche de alta duración con adhesivo extra fuerte.'),
(4, 'Parche Soft', 'PS-404', 'Parche con material suave y flexible, ideal para pieles sensibles.'),
(5, 'Parche Flex', 'PF-505', 'Parche flexible para una amplia gama de movimientos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_parche_nino`
--

CREATE TABLE `modelo_parche_nino` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modelo_parche_nino`
--

INSERT INTO `modelo_parche_nino` (`id`, `nombre`, `modelo`, `descripcion`) VALUES
(1, 'Parche Kid', 'PK-101', 'Diseñado específicamente para el uso pediátrico, seguro para la piel de los niños.'),
(2, 'Parche Junior', 'PJ-202', 'Parche de tamaño reducido para un mejor ajuste en niños.'),
(3, 'Parche Baby', 'PB-303', 'Parche pequeño para neonatos y bebés, adhesivo suave.'),
(4, 'Parche Teen', 'PT-404', 'Parche para adolescentes con diseño discreto.'),
(5, 'Parche School', 'PS-505', 'Parche resistente al agua, ideal para el entorno escolar.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parches_adultos`
--

CREATE TABLE `parches_adultos` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero_de_serie` varchar(20) NOT NULL,
  `modelo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parches_niños`
--

CREATE TABLE `parches_niños` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero_de_serie` varchar(20) NOT NULL,
  `modelo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'administrador'),
(2, 'cliente'),
(3, 'tecnico'),
(4, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text,
  `id_rol` int DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `ultima_actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `password`, `nombre`, `apellido`, `telefono`, `direccion`, `id_rol`, `fecha_creacion`, `ultima_actualizacion`) VALUES
(1, 'JuanaCerda', 'juana.cerda.serrano@gmail.com', 'juana2024', 'Juana', 'Cerda Serrano', '123456789', 'Calle Ficticia 123, Ciudad Imaginaria', 1, '2024-04-07 15:39:41', '2024-04-07 15:39:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_disp` (`id_disp`);

--
-- Indices de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_parche_ad` (`id_parche_ad`),
  ADD KEY `id_parche_ni` (`id_parche_ni`);

--
-- Indices de la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_us` (`id_us`),
  ADD KEY `id_dis` (`id_dis`),
  ADD KEY `id_p_a` (`id_p_a`),
  ADD KEY `id_p_n` (`id_p_n`);

--
-- Indices de la tabla `modelo_dispositivo`
--
ALTER TABLE `modelo_dispositivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_parche_adulto` (`id_parche_adulto`),
  ADD KEY `id_parche_nino` (`id_parche_nino`);

--
-- Indices de la tabla `modelo_parche_adulto`
--
ALTER TABLE `modelo_parche_adulto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelo_parche_nino`
--
ALTER TABLE `modelo_parche_nino`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parches_adultos`
--
ALTER TABLE `parches_adultos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parches_niños`
--
ALTER TABLE `parches_niños`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modelo_dispositivo`
--
ALTER TABLE `modelo_dispositivo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `modelo_parche_adulto`
--
ALTER TABLE `modelo_parche_adulto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `modelo_parche_nino`
--
ALTER TABLE `modelo_parche_nino`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `parches_adultos`
--
ALTER TABLE `parches_adultos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parches_niños`
--
ALTER TABLE `parches_niños`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_disp`) REFERENCES `dispositivos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD CONSTRAINT `dispositivos_ibfk_1` FOREIGN KEY (`id_parche_ad`) REFERENCES `parches_adultos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `dispositivos_ibfk_2` FOREIGN KEY (`id_parche_ni`) REFERENCES `parches_niños` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  ADD CONSTRAINT `mantenimientos_ibfk_1` FOREIGN KEY (`id_us`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `mantenimientos_ibfk_2` FOREIGN KEY (`id_dis`) REFERENCES `dispositivos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `mantenimientos_ibfk_3` FOREIGN KEY (`id_p_a`) REFERENCES `parches_adultos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `mantenimientos_ibfk_4` FOREIGN KEY (`id_p_n`) REFERENCES `parches_niños` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelo_dispositivo`
--
ALTER TABLE `modelo_dispositivo`
  ADD CONSTRAINT `modelo_dispositivo_ibfk_1` FOREIGN KEY (`id_parche_adulto`) REFERENCES `modelo_parche_adulto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `modelo_dispositivo_ibfk_2` FOREIGN KEY (`id_parche_nino`) REFERENCES `modelo_parche_nino` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
