CREATE DATABASE  IF NOT EXISTS `inventariofarmacia` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `inventariofarmacia`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inventariofarmacia
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `botiquinchico`
--

DROP TABLE IF EXISTS `botiquinchico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `botiquinchico` (
  `idBotiquinChico` varbinary(100) NOT NULL,
  `IdRebajeStock` varbinary(100) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idBotiquinChico`),
  UNIQUE KEY `idBotiquinChico_UNIQUE` (`idBotiquinChico`),
  KEY `RebajeStockId_idx` (`IdRebajeStock`),
  CONSTRAINT `idRebajeStockBC` FOREIGN KEY (`IdRebajeStock`) REFERENCES `rebajestock` (`idRebajeStock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botiquinchico`
--

LOCK TABLES `botiquinchico` WRITE;
/*!40000 ALTER TABLE `botiquinchico` DISABLE KEYS */;
INSERT INTO `botiquinchico` VALUES ('1030929211C01E1C65755AA59A6B10A8','1',50);
/*!40000 ALTER TABLE `botiquinchico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` varbinary(100) NOT NULL,
  `idTipo` varbinary(100) NOT NULL,
  `NombreCategoria` varchar(30) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `idCategoria_UNIQUE` (`idCategoria`),
  UNIQUE KEY `NombreCategoria_UNIQUE` (`NombreCategoria`),
  KEY `idTipoCategoria_idx` (`idTipo`),
  CONSTRAINT `idTipoCategoria` FOREIGN KEY (`idTipo`) REFERENCES `tipocategoria` (`idTipoCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('1','1','Aspirina'),('B6FD00F42BC4DDD2D114B59F780C2C0F','1','BAYER');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprafactura`
--

DROP TABLE IF EXISTS `comprafactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprafactura` (
  `idCompraFactura` varbinary(100) NOT NULL,
  `idOrdenCompra` varbinary(100) NOT NULL,
  `idFactura` varbinary(100) NOT NULL,
  PRIMARY KEY (`idCompraFactura`),
  UNIQUE KEY `idCompraFactura_UNIQUE` (`idCompraFactura`),
  KEY `idOrdenCompraCF_idx` (`idOrdenCompra`),
  KEY `idFacturaCF_idx` (`idFactura`),
  CONSTRAINT `idFacturaCF` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idOrdenCompraCF` FOREIGN KEY (`idOrdenCompra`) REFERENCES `ordencompra` (`idOrdenCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprafactura`
--

LOCK TABLES `comprafactura` WRITE;
/*!40000 ALTER TABLE `comprafactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprafactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daños`
--

DROP TABLE IF EXISTS `daños`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daños` (
  `idDaños` varbinary(100) NOT NULL,
  `IdRebajeStock` varbinary(100) NOT NULL,
  `Motivo` varchar(200) DEFAULT NULL,
  `NumeroDocumento` varchar(30) NOT NULL,
  `Documento` varchar(30) NOT NULL,
  PRIMARY KEY (`idDaños`),
  UNIQUE KEY `idDaños_UNIQUE` (`idDaños`),
  KEY `idRebajeStockDÑ_idx` (`IdRebajeStock`),
  CONSTRAINT `idRebajeStockDÑ` FOREIGN KEY (`IdRebajeStock`) REFERENCES `rebajestock` (`idRebajeStock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daños`
--

LOCK TABLES `daños` WRITE;
/*!40000 ALTER TABLE `daños` DISABLE KEYS */;
INSERT INTO `daños` VALUES ('02772C754691A73825690A83412861BD','1','da','12','12'),('9F5F8E3B02D509E15BC583AA5068630F','1','CAGÓ','FX863','25');
/*!40000 ALTER TABLE `daños` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desactivacion`
--

DROP TABLE IF EXISTS `desactivacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desactivacion` (
  `idDesactivacion` varbinary(100) NOT NULL,
  `idTabla` varbinary(100) NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`idDesactivacion`),
  UNIQUE KEY `iddesactivacion_UNIQUE` (`idDesactivacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desactivacion`
--

LOCK TABLES `desactivacion` WRITE;
/*!40000 ALTER TABLE `desactivacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `desactivacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despachocp`
--

DROP TABLE IF EXISTS `despachocp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despachocp` (
  `idDespachoCP` varbinary(100) NOT NULL,
  `IdRebajeStock` varbinary(100) NOT NULL,
  `NumeroGuia` varchar(30) NOT NULL,
  `Guia` varchar(30) NOT NULL,
  PRIMARY KEY (`idDespachoCP`),
  UNIQUE KEY `idDespachoCP_UNIQUE` (`idDespachoCP`),
  KEY `idRebajeStockDCP_idx` (`IdRebajeStock`),
  CONSTRAINT `idRebajeStockDCP` FOREIGN KEY (`IdRebajeStock`) REFERENCES `rebajestock` (`idRebajeStock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despachocp`
--

LOCK TABLES `despachocp` WRITE;
/*!40000 ALTER TABLE `despachocp` DISABLE KEYS */;
INSERT INTO `despachocp` VALUES ('5E4BB9F64BEE223D2B2DDCA57DA7E6BD','1','FXD123','4545');
/*!40000 ALTER TABLE `despachocp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despachoespecial`
--

DROP TABLE IF EXISTS `despachoespecial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despachoespecial` (
  `idDespachoEspecial` varbinary(100) NOT NULL,
  `IdRebajeStock` varbinary(100) NOT NULL,
  `Guia` varchar(40) NOT NULL,
  `NumeroGuia` varchar(40) NOT NULL,
  PRIMARY KEY (`idDespachoEspecial`),
  UNIQUE KEY `idDespachoEspecial_UNIQUE` (`idDespachoEspecial`),
  KEY `idRebajeStockDEP_idx` (`IdRebajeStock`),
  CONSTRAINT `idRebajeStockDEP` FOREIGN KEY (`IdRebajeStock`) REFERENCES `rebajestock` (`idRebajeStock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despachoespecial`
--

LOCK TABLES `despachoespecial` WRITE;
/*!40000 ALTER TABLE `despachoespecial` DISABLE KEYS */;
INSERT INTO `despachoespecial` VALUES ('A5A21D6EB4D1F66B4D03E48568D75114','1','hsdhsh','31313');
/*!40000 ALTER TABLE `despachoespecial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucionserviciosalud`
--

DROP TABLE IF EXISTS `devolucionserviciosalud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucionserviciosalud` (
  `idDevolucionServicioSalud` varbinary(100) NOT NULL,
  `IdRebajeStock` varbinary(100) NOT NULL,
  `Documento` varchar(30) NOT NULL,
  `NumeroDocumento` varchar(30) NOT NULL,
  PRIMARY KEY (`idDevolucionServicioSalud`),
  UNIQUE KEY `idDevolucionServicioSalud_UNIQUE` (`idDevolucionServicioSalud`),
  KEY `idRebajeStockDSS_idx` (`IdRebajeStock`),
  CONSTRAINT `idRebajeStockDSS` FOREIGN KEY (`IdRebajeStock`) REFERENCES `rebajestock` (`idRebajeStock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucionserviciosalud`
--

LOCK TABLES `devolucionserviciosalud` WRITE;
/*!40000 ALTER TABLE `devolucionserviciosalud` DISABLE KEYS */;
INSERT INTO `devolucionserviciosalud` VALUES ('03C56B0350DD7AE0D48D190400FF1C3C','1','ff2321521f','123123');
/*!40000 ALTER TABLE `devolucionserviciosalud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dosis`
--

DROP TABLE IF EXISTS `dosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dosis` (
  `iddosis` varbinary(100) NOT NULL,
  `idCategoria` varbinary(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`iddosis`),
  UNIQUE KEY `iddosis_UNIQUE` (`iddosis`),
  KEY `idCategoriaDosis_idx` (`idCategoria`),
  CONSTRAINT `idCategoriaDosis` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosis`
--

LOCK TABLES `dosis` WRITE;
/*!40000 ALTER TABLE `dosis` DISABLE KEYS */;
INSERT INTO `dosis` VALUES ('0E187D7D1CFF9F753A412F41F9B55CA5','1',45646),('E28A99BB83EDDFF1928B54A84EB634B9','B6FD00F42BC4DDD2D114B59F780C2C0F',8987);
/*!40000 ALTER TABLE `dosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `idFactura` varbinary(100) NOT NULL,
  `NumeroFactura` varchar(45) NOT NULL,
  `ValorNeto` int(11) NOT NULL,
  `Iva` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `NumeroLote` varchar(30) NOT NULL,
  `Caracteristicas` varchar(45) NOT NULL,
  `FechaIngreso` date NOT NULL,
  PRIMARY KEY (`idFactura`),
  UNIQUE KEY `idFactura_UNIQUE` (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES ('B9DB39588EF3B15D705E6D30E3E74950C6B18C6433800178570BB861F16DD637','3123123',1313,99,9,'ddd111','ddddd','2016-05-05'),('BCFBC5DB2BB8F8A0922D6D68FACB7116','1',1,1,1,'1','1','2018-04-04'),('FC5308C4792257CCD8889F6D8060EC43','5464',4654,65465,6546,'65464','sadas','2018-04-04');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentoordencompra`
--

DROP TABLE IF EXISTS `medicamentoordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentoordencompra` (
  `idMedicamentoOrdenCompra` varbinary(100) NOT NULL,
  `idOrdenCompra` varbinary(100) NOT NULL,
  `NombreMedicamento` varchar(45) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idMedicamentoOrdenCompra`),
  UNIQUE KEY `idMedicamentoOrdenCompra_UNIQUE` (`idMedicamentoOrdenCompra`),
  KEY `idOrdenCompraMOC_idx` (`idOrdenCompra`),
  CONSTRAINT `idOrdenCompraMOC` FOREIGN KEY (`idOrdenCompra`) REFERENCES `ordencompra` (`idOrdenCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentoordencompra`
--

LOCK TABLES `medicamentoordencompra` WRITE;
/*!40000 ALTER TABLE `medicamentoordencompra` DISABLE KEYS */;
INSERT INTO `medicamentoordencompra` VALUES ('F36869ABF5935249CE8C34C78270E9CD','31','adadadad',123);
/*!40000 ALTER TABLE `medicamentoordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merma`
--

DROP TABLE IF EXISTS `merma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merma` (
  `idMerma` varbinary(100) NOT NULL,
  `IdRebajeStock` varbinary(100) NOT NULL,
  `Documento` varchar(30) NOT NULL,
  `NumeroDocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`idMerma`),
  UNIQUE KEY `idMerma_UNIQUE` (`idMerma`),
  KEY `idRebajeStockME_idx` (`IdRebajeStock`),
  CONSTRAINT `idRebajeStockME` FOREIGN KEY (`IdRebajeStock`) REFERENCES `rebajestock` (`idRebajeStock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merma`
--

LOCK TABLES `merma` WRITE;
/*!40000 ALTER TABLE `merma` DISABLE KEYS */;
INSERT INTO `merma` VALUES ('3A9E3FF695F5CF5B313415F7EDD381E5','1','dfer34','dsdsd'),('7B51B0B2BCEF6DBD2221332DB4C6112B','1','45646','646'),('A8CFA6C389A7EE89C5EBE36F4B6B7618','1','dfer34','dsds'),('E4C2D94B795E2A4F61392559843FA07F','1','12','12');
/*!40000 ALTER TABLE `merma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompra`
--

DROP TABLE IF EXISTS `ordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordencompra` (
  `idOrdenCompra` varbinary(100) NOT NULL,
  `idProveedor` varbinary(100) NOT NULL,
  `Detalle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idOrdenCompra`),
  KEY `idProveedorOC_idx` (`idProveedor`),
  CONSTRAINT `idProveedorOC` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompra`
--

LOCK TABLES `ordencompra` WRITE;
/*!40000 ALTER TABLE `ordencompra` DISABLE KEYS */;
INSERT INTO `ordencompra` VALUES ('','BB5136075A532A153FF92485603030D86D9522AB00328E4153FA230741BFEE40','hahahahah'),('31','BB5136075A532A153FF92485603030D86D9522AB00328E4153FA230741BFEE40','Jujujua'),('4268FF12208AF9C79903566EE7AF6DCF45AA5A8C742915F1CAFD23C39360B80B','5B083F3A9EEAD2EE13DA1489F230FD60E94EE29853EBA78791C153C4FCDCB6A6','Que!'),('4268FF12208AF9C79903566EE7AF6DCFEF6D79028D2872CF5804CEF27EBE1DE9','5B083F3A9EEAD2EE13DA1489F230FD60E94EE29853EBA78791C153C4FCDCB6A6','SDAD'),('84C262D74E53D0427F69311EAFA82A76122B94114CAEAC6757CE3464AD349924','1FE17CBD3BC922FA426B30D11B927F9795507E942EB0EAD3E84B211063FBF1BB','0'),('84C262D74E53D0427F69311EAFA82A7629EEB6E68FF729DB1C09FEE306ED05D5','1FE17CBD3BC922FA426B30D11B927F9795507E942EB0EAD3E84B211063FBF1BB','noooo'),('84C262D74E53D0427F69311EAFA82A7664DECC0499F351485893DD4AE95CDC91','1FE17CBD3BC922FA426B30D11B927F9795507E942EB0EAD3E84B211063FBF1BB','0'),('84C262D74E53D0427F69311EAFA82A7695FCC62860FCF452D74595F7E8183825','1FE17CBD3BC922FA426B30D11B927F9795507E942EB0EAD3E84B211063FBF1BB','holamUndo'),('84C262D74E53D0427F69311EAFA82A76B07E3902122159D2104DFFE33EF89B2E','1FE17CBD3BC922FA426B30D11B927F9795507E942EB0EAD3E84B211063FBF1BB','SADAS'),('84C262D74E53D0427F69311EAFA82A76F33B22CBC6A20D52749D3BAE1DDF1794','1FE17CBD3BC922FA426B30D11B927F9795507E942EB0EAD3E84B211063FBF1BB','5464');
/*!40000 ALTER TABLE `ordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `idPerfil` varbinary(100) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idPerfil`),
  UNIQUE KEY `idPerfil_UNIQUE` (`idPerfil`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES ('1','Administrador','Persona que tiene completo acceso al sistema'),('2','Farmaceutica','Persona que tiene acceso casi todo');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` varbinary(100) NOT NULL,
  `idCategoria` varbinary(100) NOT NULL,
  `TipoInsumo` varchar(50) NOT NULL,
  `Lote` varchar(20) NOT NULL,
  `NombreFarmacologico` varchar(50) NOT NULL,
  `FechaVencimiento` datetime NOT NULL,
  `CantidadUnidad` int(11) NOT NULL,
  `DescripcionProducto` varchar(100) NOT NULL,
  `Canje` tinyint(4) NOT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `idProducto_UNIQUE` (`idProducto`),
  UNIQUE KEY `Lote_UNIQUE` (`Lote`),
  KEY `idCategoriaP_idx` (`idCategoria`),
  CONSTRAINT `idCategoriaP` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('1','1','1','A1','Aspirineichon','2018-02-02 00:00:00',25,'La tipica aspirina',0),('8B05FD41160F76AD67AB178BCCAA1106','1','1','23','Aspirina','2018-05-05 00:00:00',500,'Cosas',0);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoproveedor`
--

DROP TABLE IF EXISTS `productoproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoproveedor` (
  `idProductoProveedor` varbinary(100) NOT NULL,
  `idProducto` varbinary(100) NOT NULL,
  `idProveedor` varbinary(100) NOT NULL,
  PRIMARY KEY (`idProductoProveedor`),
  UNIQUE KEY `idProductoProveedor_UNIQUE` (`idProductoProveedor`),
  KEY `ProductoId_idx` (`idProducto`),
  KEY `idProveedorPP_idx` (`idProveedor`),
  CONSTRAINT `idProductoPP` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idProveedorPP` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoproveedor`
--

LOCK TABLES `productoproveedor` WRITE;
/*!40000 ALTER TABLE `productoproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorefrigerado`
--

DROP TABLE IF EXISTS `productorefrigerado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productorefrigerado` (
  `idProductoRefrigerado` varbinary(100) NOT NULL,
  `IdRebajeStock` varbinary(100) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Documento` varchar(30) NOT NULL,
  `NumeroDocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`idProductoRefrigerado`),
  UNIQUE KEY `idProductoRefrigerado_UNIQUE` (`idProductoRefrigerado`),
  KEY `idRebajeStock_idx` (`IdRebajeStock`),
  CONSTRAINT `idRebajeStock` FOREIGN KEY (`IdRebajeStock`) REFERENCES `rebajestock` (`idRebajeStock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorefrigerado`
--

LOCK TABLES `productorefrigerado` WRITE;
/*!40000 ALTER TABLE `productorefrigerado` DISABLE KEYS */;
INSERT INTO `productorefrigerado` VALUES ('FEDD15E2F0C6CF34D7890130BA1B2F78','1','dasdasd','sdaw4123','123123');
/*!40000 ALTER TABLE `productorefrigerado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idProveedor` varbinary(100) NOT NULL,
  `RutProveedor` varchar(15) NOT NULL,
  `NombreProveedor` varchar(50) NOT NULL,
  `Direccion` varchar(70) NOT NULL,
  `FormaContacto` varchar(30) NOT NULL,
  `TipoProveedor` varchar(30) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE KEY `RutProveedor_UNIQUE` (`RutProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('1CAF75BAA2ED9C5DCD411AA9B2EA3DDA7F9A84FF5851E00C4D869EFBFD7DFA46','190119048','ignacio','sadasd','6453','convenio marco'),('1FE17CBD3BC922FA426B30D11B927F9795507E942EB0EAD3E84B211063FBF1BB','17141132-8','Pepito','Dios sabe donde','89628425','Licitacion'),('5877F3441D2B58F7F542826E72CB8B8D2A26D42A822DB210FDA6C4C959C50B56','1901199','hfhg','sasa','45646','convenio marco'),('5B083F3A9EEAD2EE13DA1489F230FD60E94EE29853EBA78791C153C4FCDCB6A6','190119041','asdsad','sadds','124131233','convenio marco'),('BB5136075A532A153FF92485603030D86D9522AB00328E4153FA230741BFEE40','17141132-7','Joselito','Miramar','569842369','Licitacion');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rebajestock`
--

DROP TABLE IF EXISTS `rebajestock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rebajestock` (
  `idRebajeStock` varbinary(100) NOT NULL,
  `idProducto` varbinary(100) NOT NULL,
  PRIMARY KEY (`idRebajeStock`),
  UNIQUE KEY `idRebajeStock_UNIQUE` (`idRebajeStock`),
  KEY `idProductoRS_idx` (`idProducto`),
  CONSTRAINT `idProductoRS` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rebajestock`
--

LOCK TABLES `rebajestock` WRITE;
/*!40000 ALTER TABLE `rebajestock` DISABLE KEYS */;
INSERT INTO `rebajestock` VALUES ('1','1');
/*!40000 ALTER TABLE `rebajestock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidacanje`
--

DROP TABLE IF EXISTS `salidacanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salidacanje` (
  `idSalidaCanje` varbinary(100) NOT NULL,
  `IdRebajeStock` varbinary(100) NOT NULL,
  `CodigoEnvio` int(11) NOT NULL,
  `GuiaDespacho` varchar(30) NOT NULL,
  `DocumentoLab` varchar(30) NOT NULL,
  `Fecha` date NOT NULL,
  `NumeroDocumento` varchar(45) NOT NULL,
  `NumeroGuia` varchar(45) NOT NULL,
  PRIMARY KEY (`idSalidaCanje`),
  UNIQUE KEY `idSalidaCanje_UNIQUE` (`idSalidaCanje`),
  KEY `idRebajeStockSC_idx` (`IdRebajeStock`),
  CONSTRAINT `idRebajeStockSC` FOREIGN KEY (`IdRebajeStock`) REFERENCES `rebajestock` (`idRebajeStock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidacanje`
--

LOCK TABLES `salidacanje` WRITE;
/*!40000 ALTER TABLE `salidacanje` DISABLE KEYS */;
INSERT INTO `salidacanje` VALUES ('08C764A62BF5596D598D0E644E58EDE7','1',1,'1','111','2018-04-04','1','1'),('31D17CE951E3AB3A9B4C6A4C082C907F','1',25,'fgtr44','dasd563','2018-01-01','hfaaw14124','1313412'),('9D4D415925C4EBF39F5262A619542707','1',22,'222','2222','2018-04-04','22222','2323');
/*!40000 ALTER TABLE `salidacanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `idStock` varbinary(100) NOT NULL,
  `IdProducto` varbinary(100) NOT NULL,
  `Minimo` int(11) NOT NULL,
  `Maximo` int(11) NOT NULL,
  `cantidadStock` int(11) NOT NULL,
  `diasAviso` int(11) NOT NULL,
  PRIMARY KEY (`idStock`),
  UNIQUE KEY `idStock_UNIQUE` (`idStock`),
  KEY `idProductoST_idx` (`IdProducto`),
  CONSTRAINT `idProductoST` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('1','1',10,100,25,0);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocategoria`
--

DROP TABLE IF EXISTS `tipocategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocategoria` (
  `idTipoCategoria` varbinary(100) NOT NULL,
  `NombreTipo` varchar(30) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTipoCategoria`),
  UNIQUE KEY `idTipoCategoria_UNIQUE` (`idTipoCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocategoria`
--

LOCK TABLES `tipocategoria` WRITE;
/*!40000 ALTER TABLE `tipocategoria` DISABLE KEYS */;
INSERT INTO `tipocategoria` VALUES ('1','Aspirina',500),('6CDFFAB2EDFBEA45FDE135D117C4F654','Alcohol',232);
/*!40000 ALTER TABLE `tipocategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` varbinary(100) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `idPerfil` varbinary(100) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`),
  KEY `idPerfil_idx` (`idPerfil`),
  CONSTRAINT `idPerfil` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('1','Admin','Admin','1'),('CA828A5B8D8F7F193EC03C627A394CED','roma','123','1');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'inventariofarmacia'
--

--
-- Dumping routines for database 'inventariofarmacia'
--
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_botiquinchico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_botiquinchico`(IN idRebajeStock VARBINARY(100), cantidad INT)
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    
    BEGIN
		SET contador = (SELECT COUNT(*)+1 FROM botiquinchico);
        SET codigo = CONCAT('BC',cantidad , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO botiquinchico SET idBotiquinChico = codigo, IdRebajeStock = idRebajeStock, Cantidad = cantidad;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_categoria`(IN idTipo VARBINARY(100), nombre VARCHAR(30))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE nombreM  VARCHAR(30);
    BEGIN
		SET contador = (SELECT COUNT(*)+1 FROM categoria);
        SET nombreM = (SELECT LEFT(nombre ,3));
        SET codigo = CONCAT('CT',nombreM , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO categoria SET idCategoria = codigo, idTipo = idTipo, NombreCategoria = LOWER(nombre);
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_comprafactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_comprafactura`(IN idOrdenCompra VARCHAR(100), idFactura VARCHAR(100))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE idOrdenCompraM VARCHAR(100);
    DECLARE idFacturaM VARCHAR(100);
    
    BEGIN
		SET idOrdenCompraM = AES_DECRYPT(UNHEX(idOrdenCompra), 'gendarmeria');
        SET idFacturaM = AES_DECRYPT(UNHEX(idFactura), 'gendarmeria');
		SET contador = (SELECT COUNT(*)+1 FROM comprafactura);
        SET codigo = CONCAT('CF',idOrdenCompraM ,idFacturaM , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO comprafactura SET idCompraFactura = codigo, idOrdenCompra = idOrdenCompra, idFactura = idFactura;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_daños` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_daños`(IN nombreFarma VARCHAR(100),IN motivo VARCHAR(200),IN numeroDoc VARCHAR(30),IN documento VARCHAR(45))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE idPro  VARCHAR(100);
    DECLARE idReba  VARCHAR(100);
    
    BEGIN
    
    SET idPro =(SELECT idProducto FROM producto WHERE NombreFarmacologico = nombreFarma);
    
    SET idReba = (SELECT idRebajestock FROM rebajestock WHERE idProducto = idPro);
    
		SET contador = (SELECT COUNT(*)+1 FROM daños);
        SET codigo = CONCAT('DS',documento , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO daños SET idDaños = codigo, IdRebajeStock = idReba, Motivo = LOWER(motivo), NumeroDocumento = numeroDoc, Documento = documento;
        
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_desactivacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_desactivacion`(IN idTabla VARCHAR(100))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE idTablaM VARCHAR(100);
    DECLARE Fecha DATETIME;
    
    BEGIN
		SET idTablaM = AES_DECRYPT(UNHEX(idTabla), 'gendarmeria');
		SET contador = (SELECT COUNT(*)+1 FROM desactivacion);
        SET codigo = CONCAT('DE',idTablaM , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        SET Fecha = SYSDATE();
        
        INSERT INTO desactivacion SET idDesactivacion = codigo, idTabla = idTabla, Fecha = Fecha;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_despachocp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_despachocp`(IN IdRebajeStock VARBINARY(100), numeroGuia VARCHAR(30), guia VARCHAR(30))
BEGIN
    DECLARE contador INT;
    DECLARE codigo VARBINARY(100);

    BEGIN 
        SET contador = (SELECT COUNT(*)+1 FROM despachocp);
        SET codigo = CONCAT('DCP',numeroGuia , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO despachocp SET idDespachoCP = codigo, IdRebajeStock = IdRebajeStock, NumeroGuia = numeroGuia, Guia = guia;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_despachoespecial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_despachoespecial`(IN IdRebajeStock VARBINARY(100), guia VARCHAR(40), numeroGuia VARCHAR(40))
BEGIN
    DECLARE contador INT;
    DECLARE codigo VARBINARY(100);

    BEGIN 
        SET contador = (SELECT COUNT(*)+1 FROM despachoespecial);
        SET codigo = CONCAT('DES',numeroGuia , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO despachoespecial SET idDespachoEspecial = codigo, IdRebajeStock = IdRebajeStock, Guia = guia, NumeroGuia = numeroGuia;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_devolucionserviciosalud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_devolucionserviciosalud`(IN IdRebajeStock VARBINARY(100), documento VARCHAR(30), numeroDocumento VARCHAR(30))
BEGIN
    DECLARE contador INT;
    DECLARE codigo VARBINARY(100);

    BEGIN 
        SET contador = (SELECT COUNT(*)+1 FROM devolucionserviciosalud);
        SET codigo = CONCAT('DSS',numeroDocumento , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO devolucionserviciosalud SET idDevolucionServicioSalud = codigo, IdRebajeStock = IdRebajeStock, Documento = documento, NumeroDocumento = numeroDocumento;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_dosis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_dosis`(IN NombreCat VARCHAR(100), Cantidad INT)
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE idCat VARCHAR(100);
    
    BEGIN
		SET contador = (SELECT COUNT(*)+1 FROM dosis);
        SET codigo = CONCAT('DO', Cantidad , NombreCat);
        SET codigo = UPPER(codigo);
        
        SET idCat = (SELECT idCategoria FROM categoria WHERE NombreCategoria = NombreCat); 
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO dosis SET iddosis = codigo, idCategoria = idCat, cantidad = Cantidad;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_factura`(IN NumeroFactura VARCHAR(45),IN ValorNeto INT,IN Iva INT,IN Total INT, 
IN NumeroLote VARCHAR(30),IN Caracteristicas VARCHAR(45))
BEGIN
    DECLARE contador INT;
    DECLARE codigo VARBINARY(100);

    BEGIN 
        SET contador = (SELECT COUNT(*)+1 FROM factura);
        SET codigo = CONCAT('FT',NumeroFactura ,NumeroLote, contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO factura SET idFactura = codigo, NumeroFactura= NumeroFactura, ValorNeto = ValorNeto, Iva = Iva, Total = Total, NumeroLote = NumeroLote, Caracteristicas = LOWER(Caracteristicas),
        FechaIngreso = NOW();
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_medicamentoordencompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_medicamentoordencompra`(IN idOrdenCompra VARBINARY(100), nombreMedicamento VARCHAR(45), Cantidad INT)
BEGIN
    DECLARE contador INT;
    DECLARE nombreM VARCHAR(10);
    DECLARE codigo VARBINARY(100);
    BEGIN
        SET contador = (SELECT COUNT(*)+1 FROM medicamentoordencompra);
        SET nombreM = (SELECT LEFT(nombreMedicamento,3));
        SET codigo = CONCAT('MOC',nombreM , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO medicamentoordencompra SET idMedicamentoOrdenCompra = codigo, idOrdenCompra = idOrdenCompra, NombreMedicamento = LOWER(nombreMedicamento), Cantidad = Cantidad;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_merma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_merma`(IN nombreFarma VARCHAR(100), IN documento VARCHAR(30),IN numeroDocumento VARCHAR(45))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
     DECLARE idPro  VARCHAR(100);
    DECLARE idReba  VARCHAR(100);
    BEGIN
    SET idPro =(SELECT idProducto FROM producto WHERE NombreFarmacologico = nombreFarma);
    
    SET idReba = (SELECT idRebajestock FROM rebajestock WHERE idProducto = idPro);
		SET contador = (SELECT COUNT(*)+1 FROM merma);
        SET codigo = CONCAT('MR',numeroDocumento , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO merma SET idMerma = codigo, IdRebajeStock = idReba, Documento = documento, NumeroDocumento = numeroDocumento;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_ordencompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_ordencompra`(IN nomProv VARCHAR(100),IN detalle VARCHAR(30))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE idProveedorM VARCHAR(100);
    DECLARE idProv VARCHAR(100);

    
    BEGIN
		SET idProv = (SELECT idProveedor FROM proveedor WHERE NombreProveedor = nomProv);
		
		SET idProveedorM = AES_DECRYPT(UNHEX(idProv), 'gendarmeria');
		SET contador = (SELECT COUNT(*)+1 FROM ordencompra);
        SET codigo = CONCAT('OC',idProveedorM, contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        
        INSERT INTO ordencompra VALUES (codigo, idProv, detalle);
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_producto`(IN idCategoria VARBINARY(100), tipoInsumo VARCHAR(50), lote VARCHAR(20), NombreFarmacologico VARCHAR(50),
FechaVencimiento DATETIME, CantidadUnidad INT, DescripcionProducto VARCHAR(100), Canje TINYINT)
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    BEGIN
		SET contador = (SELECT COUNT(*)+1 FROM producto);
        SET codigo = CONCAT('PRO',tipoInsumo ,lote , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO producto SET idProducto = codigo, idCategoria = idCategoria, TipoInsumo = LOWER(tipoInsumo), Lote = lote, NombreFarmacologico = LOWER(NombreFarmacologico), 
        FechaVencimiento = FechaVencimiento, CantidadUnidad = CantidadUnidad, DescripcionProducto = LOWER(DescripcionProducto), Canje = Canje;
    END;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_productoproveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_productoproveedor`(IN idProducto VARCHAR(100), idProveedor VARCHAR(100))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE idProveedorM VARCHAR(100);
    DECLARE idProductoM VARCHAR(100);

    
    BEGIN
		SET idProveedorM = AES_DECRYPT(UNHEX(idProveedor), 'gendarmeria');
        SET idProductoM = AES_DECRYPT(UNHEX(idProducto), 'gendarmeria');
		SET contador = (SELECT COUNT(*)+1 FROM productoproveedor);
        SET codigo = CONCAT('PP',idProductoM ,idProveedorM , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO productoproveedor SET idProductoProveedor = codigo, idProducto = idProducto, idProveedor = idProveedor;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_productorefrigerado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_productorefrigerado`(IN IdRebajeStock VARBINARY(100), Descripcion VARCHAR(200), documento VARCHAR(30), numeroDocumento VARCHAR(45))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    
    BEGIN
		SET contador = (SELECT COUNT(*)+1 FROM productorefrigerado);
        SET codigo = CONCAT('PROR',numeroDocumento , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO productorefrigerado SET idProductoRefrigerado = codigo, IdRebajeStock = IdRebajeStock, Descripcion = LOWER(Descripcion), Documento = documento, NumeroDocumento = numeroDocumento;
    END;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_proveedor`(IN `rut` VARCHAR(45), IN `nombre` VARCHAR(45), IN `direccion` VARCHAR(45), IN `contacto` VARCHAR(45), IN `tipo` VARCHAR(45))
BEGIN

	DECLARE contador INT;

    DECLARE rutM VARCHAR(45);

    DECLARE codigo VARBINARY(100);

    

    BEGIN

		SET rutM = (SELECT REPLACE(rut, '-', ''));

        SET rutM = (SELECT RIGHT(rutM, 3));

        SET tipo = (SELECT TRIM(tipo));

		SET contador = (SELECT COUNT(*)+1 FROM proveedor);

        SET codigo = CONCAT('PROV',rutM ,tipo , contador);

        SET codigo = UPPER(codigo);

        

        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));

        

        

        INSERT INTO proveedor SET idProveedor = codigo, RutProveedor = rut , NombreProveedor = LOWER(nombre) , Direccion = LOWER(direccion) , FormaContacto = LOWER(contacto) , TipoProveedor = LOWER(tipo);

    END;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_rebajestock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_rebajestock`(IN idProducto VARCHAR(100))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE idProductoM VARCHAR(100);
    
    BEGIN
        SET idProductoM = AES_DECRYPT(UNHEX(idProducto), 'gendarmeria');
		SET contador = (SELECT COUNT(*)+1 FROM rebajestock);
        SET codigo = CONCAT('RBE',idProductoM , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO rebajestock SET idRebajeStock = codigo, idProducto = idProducto;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_salidacanje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_salidacanje`(IN nombreFarma VARCHAR(100),IN codigoEnvio INT,IN GuiaDespacho VARCHAR(30),IN DocumentoLab VARCHAR(30),IN 
NumeroDocumento VARCHAR(45),IN NumeroGuia VARCHAR(45))
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE idProdo VARCHAR(100);
    DECLARE idReba VARCHAR(100);
    
    BEGIN
		SET idProdo = (SELECT idProducto FROM producto WHERE NombreFarmacologico = nombreFarma);
		
        SET idReba = (SELECT idRebajestock FROM rebajestock WHERE idProducto = idProdo);

		SET contador = (SELECT COUNT(*)+1 FROM salidacanje);
        SET codigo = CONCAT('SC',codigoEnvio , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO salidacanje SET idSalidaCanje = codigo, IdRebajeStock = idReba, CodigoEnvio = codigoEnvio, GuiaDespacho = GuiaDespacho, DocumentoLab = DocumentoLab, Fecha = NOW(),
        NumeroDocumento = NumeroDocumento, NumeroGuia = NumeroGuia;
    END;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_stock`(IN idProducto VARCHAR(100), Minimo INT, Maximo INT, cantidadStock INT, diasAviso INT)
BEGIN
	DECLARE contador INT;
    DECLARE codigo VARBINARY(100);
    DECLARE idProductoM VARCHAR(100);
    
    BEGIN
        SET idProductoM = AES_DECRYPT(UNHEX(idProducto), 'gendarmeria');
		SET contador = (SELECT COUNT(*)+1 FROM stock);
        SET codigo = CONCAT('SCK',idProductoM , contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO stock SET idStock = codigo, idProducto = idProducto, Minimo = Minimo, Maximo = Maximo, cantidadStock = cantidadStock, diasAviso = diasAviso;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_tipocategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_tipocategoria`(IN nombreTipo VARCHAR(30), cantidad INT )
BEGIN
    DECLARE contador INT;
    DECLARE nombreM VARCHAR(10);
    DECLARE codigo VARBINARY(100);
    BEGIN
        SET contador = (SELECT COUNT(*)+1 FROM tipocategoria);
        SET nombreM = (SELECT RIGHT(nombreTipo,3));
        SET codigo = CONCAT('TC',nombreM ,cantidad, contador);
        SET codigo = UPPER(codigo);
        
        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));
        
        INSERT INTO tipocategoria SET idTipoCategoria = codigo, NombreTipo = LOWER(nombreTipo), Cantidad = cantidad;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Generar_Id_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Generar_Id_usuario`(IN `Nombre` VARCHAR(25), IN `Contraseña` VARCHAR(255), IN `idPerfil` VARBINARY(100))
BEGIN

	DECLARE contador INT;

    DECLARE codigo VARBINARY(100);

    

    BEGIN

		SET contador = (SELECT COUNT(*)+1 FROM usuario);

        SET codigo = CONCAT('USU' ,idPerfil ,Nombre ,contador);

        SET codigo = UPPER(codigo);

        

        SET codigo = HEX(AES_ENCRYPT(codigo, 'gendarmeria'));

        

        INSERT INTO usuario SET idUsuario = codigo, Nombre = Nombre, Contraseña = Contraseña, idPerfil = idPerfil;

    END;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-05 18:52:33
