-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-04-2014 a las 00:04:47
-- Versión del servidor: 5.5.35
-- Versión de PHP: 5.4.4-14+deb7u8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bankito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE IF NOT EXISTS `bancos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de banco',
  `nombre` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE IF NOT EXISTS `cuentas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cuenta',
  `alias` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Alias (nombre) del banco',
  `numero_cuenta` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Numero de cuenta (definido por el banco)',
  `tipo_cuenta` bigint(20) unsigned NOT NULL COMMENT 'Tipo de cuenta (catalogo cuenta_tipo)',
  `banco` bigint(20) unsigned NOT NULL COMMENT 'Instiucion_bancaria (catalogo bancos)',
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`),
  KEY `banco` (`banco`),
  KEY `tipo_cuenta` (`tipo_cuenta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- RELACIONES PARA LA TABLA `cuentas`:
--   `tipo_cuenta`
--       `cuentas_tipo` -> `id`
--   `banco`
--       `bancos` -> `id`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_tipo`
--

DROP TABLE IF EXISTS `cuentas_tipo`;
CREATE TABLE IF NOT EXISTS `cuentas_tipo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador tipo de cuenta',
  `descripcion` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripción tipo de cuenta',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tipos de cuentas' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
CREATE TABLE IF NOT EXISTS `transacciones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de transaccion',
  `descripcion` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Descripción de la transacción',
  `cargo` bigint(20) unsigned NOT NULL,
  `abono` bigint(20) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cargo` (`cargo`),
  KEY `abono` (`abono`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Transacciones' AUTO_INCREMENT=1 ;

--
-- RELACIONES PARA LA TABLA `transacciones`:
--   `cargo`
--       `cuentas` -> `id`
--   `abono`
--       `cuentas` -> `id`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de usuario',
  `usuario` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de usuario',
  `pass` varchar(32) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'PaSS' COMMENT 'Inseguridad total',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Usuarios' AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`tipo_cuenta`) REFERENCES `cuentas_tipo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentas_ibfk_2` FOREIGN KEY (`banco`) REFERENCES `bancos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `cuentas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`abono`) REFERENCES `cuentas` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
