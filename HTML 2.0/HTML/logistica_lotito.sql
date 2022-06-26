DROP DATABASE IF EXISTS `logistica_lotito`;
CREATE DATABASE IF NOT EXISTS `logistica_lotito` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `logistica_lotito`;

DROP TABLE IF EXISTS `almacen_jujuy`;
CREATE TABLE `almacen_jujuy` (
  `ID` int(11) NOT NULL,
  `paquetes` int(11) DEFAULT NULL,
  `paquetes_perdidos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `almacen_tierra_del_fuego`;
CREATE TABLE `almacen_tierra_del_fuego` (
  `ID` int(11) NOT NULL,
  `paquetes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `camion`;
CREATE TABLE `camion` (
  `numero_de_placa` varchar(200) NOT NULL,
  `paquetes` int(11) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `destino` varchar(200) DEFAULT NULL,
  `permiso` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `conductor`;
CREATE TABLE `conductor` (
  `legajo` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `DNI` int(11) DEFAULT NULL,
  `licencia` tinyint(1) DEFAULT NULL,
  `telefono` varchar(200) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `paquetes`;
CREATE TABLE `paquetes` (
  `ID` int(11) NOT NULL,
  `Cliente` varchar(200) DEFAULT NULL,
  `Direcciòn` varchar(200) DEFAULT NULL,
  `Descripciòn` varchar(200) DEFAULT NULL,
  `Fragil` tinyint(1) DEFAULT NULL,
  `Fecha_de_compra` date DEFAULT NULL,
  `Fecha_de_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `paquetes_perdidos`;
CREATE TABLE `paquetes_perdidos` (
  `ID` int(11) NOT NULL,
  `paquetes` int(11) DEFAULT NULL,
  `camion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `almacen_jujuy`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `paquetes` (`paquetes`),
  ADD KEY `paquetes_perdidos` (`paquetes_perdidos`);

ALTER TABLE `almacen_tierra_del_fuego`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `paquetes` (`paquetes`);

ALTER TABLE `camion`
  ADD PRIMARY KEY (`numero_de_placa`),
  ADD KEY `paquetes` (`paquetes`),
  ADD KEY `conductor` (`conductor`);

ALTER TABLE `conductor`
  ADD PRIMARY KEY (`legajo`);

ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `paquetes_perdidos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `paquetes` (`paquetes`),
  ADD KEY `camion` (`camion`);

ALTER TABLE `almacen_jujuy`
  ADD CONSTRAINT `almacen_jujuy_ibfk_1` FOREIGN KEY (`paquetes`) REFERENCES `paquetes` (`ID`),
  ADD CONSTRAINT `almacen_jujuy_ibfk_2` FOREIGN KEY (`paquetes_perdidos`) REFERENCES `paquetes_perdidos` (`ID`);

ALTER TABLE `almacen_tierra_del_fuego`
  ADD CONSTRAINT `almacen_tierra_del_fuego_ibfk_1` FOREIGN KEY (`paquetes`) REFERENCES `paquetes` (`ID`);

ALTER TABLE `camion`
  ADD CONSTRAINT `camion_ibfk_1` FOREIGN KEY (`paquetes`) REFERENCES `paquetes` (`ID`),
  ADD CONSTRAINT `camion_ibfk_2` FOREIGN KEY (`conductor`) REFERENCES `conductor` (`legajo`);

ALTER TABLE `paquetes_perdidos`
  ADD CONSTRAINT `paquetes_perdidos_ibfk_1` FOREIGN KEY (`paquetes`) REFERENCES `paquetes` (`ID`),
  ADD CONSTRAINT `paquetes_perdidos_ibfk_2` FOREIGN KEY (`camion`) REFERENCES `camion` (`numero_de_placa`);
COMMIT;