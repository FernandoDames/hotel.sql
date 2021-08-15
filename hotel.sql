-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'servicio'
-- 
-- ---

DROP TABLE IF EXISTS `servicio`;
		
CREATE TABLE `servicio` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'habitaciones'
-- 
-- ---

DROP TABLE IF EXISTS `habitaciones`;
		
CREATE TABLE `habitaciones` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `numero_hab` INTEGER(10) NOT NULL,
  `ocupado` BINARY NOT NULL,
  `id_tipo_de_habitacion` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'tipo_de_habitacion'
-- 
-- ---

DROP TABLE IF EXISTS `tipo_de_habitacion`;
		
CREATE TABLE `tipo_de_habitacion` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(25) NOT NULL,
  `valor` DECIMAL(5) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'cocheras'
-- 
-- ---

DROP TABLE IF EXISTS `cocheras`;
		
CREATE TABLE `cocheras` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `numero` TINYINT(3) NOT NULL,
  `ocupado` BINARY NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'mesas_restaurant'
-- 
-- ---

DROP TABLE IF EXISTS `mesas_restaurant`;
		
CREATE TABLE `mesas_restaurant` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `numero` TINYINT(3) NOT NULL,
  `ocupado` BINARY NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'medio_pago'
-- 
-- ---

DROP TABLE IF EXISTS `medio_pago`;
		
CREATE TABLE `medio_pago` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'empleados'
-- 
-- ---

DROP TABLE IF EXISTS `empleados`;
		
CREATE TABLE `empleados` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `puesto` VARCHAR(20) NOT NULL,
  `ingreso` DATE NOT NULL,
  `egreso` DATE NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'clientes'
-- 
-- ---

DROP TABLE IF EXISTS `clientes`;
		
CREATE TABLE `clientes` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `direccion` VARCHAR(30) NOT NULL,
  `tel` INTEGER(20) NOT NULL,
  `mail` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ventas'
-- 
-- ---

DROP TABLE IF EXISTS `ventas`;
		
CREATE TABLE `ventas` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `numero_factura` INTEGER(20) NOT NULL,
  `fecha` DATETIME(6) NOT NULL,
  `importe` INTEGER(10) NOT NULL,
  `id_clientes` INTEGER(10) NOT NULL,
  `id_venta_servicio` INTEGER(10) NOT NULL,
  `id_venta_habitaciones` INTEGER(10) NOT NULL,
  `id_venta_restaurant` INTEGER(10) NOT NULL,
  `id_venta_cocheras` INTEGER(10) NOT NULL,
  `id_medio_pago` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'compras'
-- 
-- ---

DROP TABLE IF EXISTS `compras`;
		
CREATE TABLE `compras` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `razon_social` VARCHAR(30) NOT NULL,
  `numero_factura` INTEGER(10) NOT NULL,
  `importe` INTEGER(10) NOT NULL,
  `id_proveedores` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'proveedores'
-- 
-- ---

DROP TABLE IF EXISTS `proveedores`;
		
CREATE TABLE `proveedores` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(30) NOT NULL,
  `tel` INTEGER(20) NOT NULL,
  `mail` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'venta_servicio'
-- 
-- ---

DROP TABLE IF EXISTS `venta_servicio`;
		
CREATE TABLE `venta_servicio` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME(6) NOT NULL,
  `cantidad` INTEGER(2) NOT NULL,
  `id_clientes` INTEGER(10) NOT NULL,
  `id_servicio` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'venta_restaurant'
-- 
-- ---

DROP TABLE IF EXISTS `venta_restaurant`;
		
CREATE TABLE `venta_restaurant` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME(6) NOT NULL,
  `id_clientes` INTEGER(10) NOT NULL,
  `id_mesas_restaurant` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'venta_cocheras'
-- 
-- ---

DROP TABLE IF EXISTS `venta_cocheras`;
		
CREATE TABLE `venta_cocheras` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME(6) NOT NULL,
  `id_clientes` INTEGER(10) NOT NULL,
  `id_cocheras` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'venta_habitaciones'
-- 
-- ---

DROP TABLE IF EXISTS `venta_habitaciones`;
		
CREATE TABLE `venta_habitaciones` (
  `id` INTEGER(10) NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` DATETIME(6) NOT NULL,
  `fecha_egreso` DATETIME(6) NULL DEFAULT NULL,
  `noches` INTEGER(3) NOT NULL,
  `id_clientes` INTEGER(10) NOT NULL,
  `id_habitaciones` INTEGER(10) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `habitaciones` ADD FOREIGN KEY (id_tipo_de_habitacion) REFERENCES `tipo_de_habitacion` (`id`);
ALTER TABLE `ventas` ADD FOREIGN KEY (id_clientes) REFERENCES `clientes` (`id`);
ALTER TABLE `ventas` ADD FOREIGN KEY (id_venta_servicio) REFERENCES `venta_servicio` (`id`);
ALTER TABLE `ventas` ADD FOREIGN KEY (id_venta_habitaciones) REFERENCES `venta_habitaciones` (`id`);
ALTER TABLE `ventas` ADD FOREIGN KEY (id_venta_restaurant) REFERENCES `venta_restaurant` (`id`);
ALTER TABLE `ventas` ADD FOREIGN KEY (id_venta_cocheras) REFERENCES `venta_cocheras` (`id`);
ALTER TABLE `ventas` ADD FOREIGN KEY (id_medio_pago) REFERENCES `medio_pago` (`id`);
ALTER TABLE `compras` ADD FOREIGN KEY (id_proveedores) REFERENCES `proveedores` (`id`);
ALTER TABLE `venta_servicio` ADD FOREIGN KEY (id_clientes) REFERENCES `clientes` (`id`);
ALTER TABLE `venta_servicio` ADD FOREIGN KEY (id_servicio) REFERENCES `servicio` (`id`);
ALTER TABLE `venta_restaurant` ADD FOREIGN KEY (id_clientes) REFERENCES `clientes` (`id`);
ALTER TABLE `venta_restaurant` ADD FOREIGN KEY (id_mesas_restaurant) REFERENCES `mesas_restaurant` (`id`);
ALTER TABLE `venta_cocheras` ADD FOREIGN KEY (id_clientes) REFERENCES `clientes` (`id`);
ALTER TABLE `venta_cocheras` ADD FOREIGN KEY (id_cocheras) REFERENCES `cocheras` (`id`);
ALTER TABLE `venta_habitaciones` ADD FOREIGN KEY (id_clientes) REFERENCES `clientes` (`id`);
ALTER TABLE `venta_habitaciones` ADD FOREIGN KEY (id_habitaciones) REFERENCES `habitaciones` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `servicio` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `habitaciones` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tipo_de_habitacion` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `cocheras` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `mesas_restaurant` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `medio_pago` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `empleados` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `clientes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ventas` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `compras` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `proveedores` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `venta_servicio` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `venta_restaurant` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `venta_cocheras` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `venta_habitaciones` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `servicio` (`id`,`nombre`) VALUES
-- ('','');
-- INSERT INTO `habitaciones` (`id`,`numero_hab`,`ocupado`,`id_tipo_de_habitacion`) VALUES
-- ('','','','');
-- INSERT INTO `tipo_de_habitacion` (`id`,`tipo`,`valor`) VALUES
-- ('','','');
-- INSERT INTO `cocheras` (`id`,`numero`,`ocupado`) VALUES
-- ('','','');
-- INSERT INTO `mesas_restaurant` (`id`,`numero`,`ocupado`) VALUES
-- ('','','');
-- INSERT INTO `medio_pago` (`id`,`tipo`,`nombre`) VALUES
-- ('','','');
-- INSERT INTO `empleados` (`id`,`nombre`,`puesto`,`ingreso`,`egreso`) VALUES
-- ('','','','','');
-- INSERT INTO `clientes` (`id`,`nombre`,`direccion`,`tel`,`mail`) VALUES
-- ('','','','','');
-- INSERT INTO `ventas` (`id`,`numero_factura`,`fecha`,`importe`,`id_clientes`,`id_venta_servicio`,`id_venta_habitaciones`,`id_venta_restaurant`,`id_venta_cocheras`,`id_medio_pago`) VALUES
-- ('','','','','','','','','','');
-- INSERT INTO `compras` (`id`,`razon_social`,`numero_factura`,`importe`,`id_proveedores`) VALUES
-- ('','','','','');
-- INSERT INTO `proveedores` (`id`,`nombre`,`direccion`,`tel`,`mail`) VALUES
-- ('','','','','');
-- INSERT INTO `venta_servicio` (`id`,`fecha`,`cantidad`,`id_clientes`,`id_servicio`) VALUES
-- ('','','','','');
-- INSERT INTO `venta_restaurant` (`id`,`fecha`,`id_clientes`,`id_mesas_restaurant`) VALUES
-- ('','','','');
-- INSERT INTO `venta_cocheras` (`id`,`fecha`,`id_clientes`,`id_cocheras`) VALUES
-- ('','','','');
-- INSERT INTO `venta_habitaciones` (`id`,`fecha_ingreso`,`fecha_egreso`,`noches`,`id_clientes`,`id_habitaciones`) VALUES
-- ('','','','','','');