-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-06-2025 a las 08:20:49
-- Versión del servidor: 8.0.39
-- Versión de PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cmms`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acquisitiontype`
--

CREATE TABLE `acquisitiontype` (
  `ID` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acquisitiontype`
--

INSERT INTO `acquisitiontype` (`ID`, `Name`) VALUES
(1, 'Nuevo'),
(2, 'Comodato'),
(3, 'Prestamo'),
(4, 'Efectivo'),
(5, 'Credito'),
(6, 'Leasing'),
(7, 'Segunda Mano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentsuppliers`
--

CREATE TABLE `agentsuppliers` (
  `Id` int NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Adress` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Phone` bigint NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Notes` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agentsuppliers`
--

INSERT INTO `agentsuppliers` (`Id`, `Name`, `Adress`, `Phone`, `Email`, `Notes`, `createdAt`, `updatedAt`) VALUES
(11112, 'HP Medical', 'roca y coronado 2do y 3er anillo, SCZ', 222687712, 'null@gmail.com', '', '2020-05-21 18:15:03', '2020-05-21 18:17:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_brand` int NOT NULL,
  `Brand` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_brand`, `Brand`) VALUES
(1, '3M'),
(2, 'Acon Laboratories'),
(3, 'Activated Flowtron'),
(4, 'AGFA'),
(5, 'Airpumb'),
(6, 'Apex'),
(7, 'Avanteb'),
(8, 'Awareness technology inc.'),
(9, 'Barrfab'),
(10, 'Baxter'),
(11, 'Bayer'),
(12, 'Boeco'),
(13, 'Ca mi'),
(14, 'Co-diagnostic inc.'),
(15, 'Codonics'),
(16, 'Contec'),
(17, 'Corpuls'),
(18, 'Dlab'),
(19, 'Domus'),
(20, 'Eppendorf'),
(21, 'Fanem'),
(22, 'Fresenius'),
(23, 'GE'),
(24, 'Human'),
(25, 'Hwatime'),
(26, 'Imax MV'),
(27, 'Instramed'),
(28, 'Jhang tecnologia y laboratorio'),
(29, 'konika minolka'),
(30, 'Leica'),
(31, 'Leistug'),
(32, 'Matachana'),
(33, 'Medical device technology'),
(34, 'Memer'),
(35, 'Mindray'),
(36, 'Neuation'),
(37, 'Nihon khoden'),
(38, 'Optonex'),
(39, 'Penlon'),
(40, 'Philips'),
(41, 'Planmed'),
(42, 'Puritan benett'),
(43, 'Seca'),
(44, 'Siemens'),
(45, 'Sismatec'),
(46, 'Spacelabs'),
(47, 'Spectris'),
(48, 'Stryker'),
(49, 'Surgirs'),
(50, 'Sysmex'),
(51, 'Terumo'),
(52, 'Welch Allyn'),
(53, 'Yco-010 lsm'),
(54, 'Yellowpack'),
(55, 'Zehnder'),
(56, 'Zimmer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `breakdowns`
--

CREATE TABLE `breakdowns` (
  `Code` int NOT NULL,
  `Reason` text COLLATE utf8mb4_general_ci NOT NULL,
  `DATE` text COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EquipmentCode` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `IdCat` int NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`IdCat`, `Name`) VALUES
(1, 'Accesorio'),
(2, 'Repuesto'),
(3, 'Insumo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinicalenginners`
--

CREATE TABLE `clinicalenginners` (
  `DSSN` bigint NOT NULL,
  `FName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `LName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Phone` bigint NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Age` int NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Adress` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `WorkHours` int DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `DepartmentCode` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clinicalenginners`
--

INSERT INTO `clinicalenginners` (`DSSN`, `FName`, `LName`, `Phone`, `Image`, `Age`, `Email`, `Adress`, `WorkHours`, `Password`, `createdAt`, `updatedAt`, `DepartmentCode`) VALUES
(24697, 'Omar', 'Garrido', 1125414586, 'Omar.jpeg', 22, 'omarzaher787@gmail.com', 'medical center', 7, '$2a$10$o9/wxciC2gi1oLzTe.LCtegbaP8aRR8reY702WJrUbmc9b3dIxI66', '2020-05-23 02:59:14', '2020-05-23 13:49:14', NULL),
(6458161, 'Valeria', 'Toro', 77431131, 'image_DSC_9463 (Copiar).jpg', 26, 'valeriatorovargas531@gmail.com', 'sevilla2', 8, '$2a$10$eBru2lMXYeitp/MTdrNUM.7SVZYtHCHpf7hubZFzMU5RZxTGvvhlW', '2024-08-09 20:57:24', '2024-08-09 20:57:24', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `Code` int NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`Code`, `Name`, `Location`, `createdAt`, `updatedAt`) VALUES
(1, 'Emergencia', 'PB', '2025-05-21 18:00:25', '2025-05-21 18:00:25'),
(2, 'Imagenes', 'PB', '2025-05-21 18:10:25', '2025-05-21 18:10:25'),
(3, 'Lab.Clinico', 'PB', '2025-05-21 18:05:25', '2025-05-21 18:05:25'),
(4, 'Quirofano', 'P1', '2025-05-21 18:15:25', '2025-05-21 18:15:25'),
(5, 'UTI', 'P1', '2025-05-21 18:25:25', '2025-05-21 18:25:25'),
(6, 'Consultorios', 'P1', '2025-05-21 18:30:25', '2025-05-21 18:30:25'),
(7, 'Recuperacion', 'P1', '2025-05-21 18:35:25', '2025-05-21 18:35:25'),
(8, 'hospitalizacion', 'P2', '2025-05-21 18:40:25', '2025-05-21 18:40:25'),
(9, 'Lab.Biomolecular', 'Cañoto', '2025-05-21 18:45:25', '2025-05-21 18:45:25'),
(10, 'Externos', 'Externos', '2025-05-21 18:50:25', '2025-05-21 18:50:25'),
(11, 'Ambulancia', 'Ambulancia', '2025-05-21 18:50:25', '2025-05-21 18:50:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dialyinspections`
--

CREATE TABLE `dialyinspections` (
  `Code` int NOT NULL,
  `DATE` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q1` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q2` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q3` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q4` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q5` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q6` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q7` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q8` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EquipmentCode` int DEFAULT NULL,
  `ClinicalEnginnerDSSN` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipment`
--

CREATE TABLE `equipment` (
  `Code` int NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cost` decimal(15,2) NOT NULL,
  `SerialNumber` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `InstallationDate` date NOT NULL,
  `ArrivalDate` date NOT NULL,
  `WarrantyTime` int DEFAULT NULL,
  `AssetInitialDate` date DEFAULT NULL,
  `InsuranceInitialDate` date DEFAULT NULL,
  `Manufacturer` text COLLATE utf8mb4_general_ci,
  `Location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Notes` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AgentSupplierId` int DEFAULT NULL,
  `DepartmentCode` int DEFAULT NULL,
  `Software` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SoftwareVersion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SoftwarePass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NetworkAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AssetStatus` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `InsuranceStatus` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `FuntionalStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ReceptionStatusId` int DEFAULT NULL,
  `Active` tinyint(1) DEFAULT '1',
  `F_record` int NOT NULL,
  `Maintenance_Req` int DEFAULT NULL,
  `GE` int DEFAULT '0',
  `AcquisitionTypeID` int DEFAULT NULL,
  `WarrantyDate` date DEFAULT NULL,
  `NameEquipmentId` int DEFAULT NULL,
  `ModelId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipment`
--

INSERT INTO `equipment` (`Code`, `Name`, `Image`, `Cost`, `SerialNumber`, `InstallationDate`, `ArrivalDate`, `WarrantyTime`, `AssetInitialDate`, `InsuranceInitialDate`, `Manufacturer`, `Location`, `Notes`, `createdAt`, `updatedAt`, `AgentSupplierId`, `DepartmentCode`, `Software`, `SoftwareVersion`, `SoftwarePass`, `NetworkAddress`, `AssetStatus`, `InsuranceStatus`, `FuntionalStatus`, `ReceptionStatusId`, `Active`, `F_record`, `Maintenance_Req`, `GE`, `AcquisitionTypeID`, `WarrantyDate`, `NameEquipmentId`, `ModelId`) VALUES
(1, 'MONITOR MODULAR', 'image_QUBE.jpg', 87870.25, '1390-204199', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Spacelabs', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 4, 'Si', '3.08.03', 'Biomed', '', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 4, 12, 1, '2026-01-06', 23, 30),
(2, 'MONITOR MODULAR', 'image_QUBE.jpg', 87870.25, '1390-204305', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Spacelabs', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 4, 'Si', '3.08.03', 'Biomed', '', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 4, 12, 1, '2026-01-06', 23, 30),
(3, 'MONITOR MODULAR', 'image_QUBE.jpg', 87870.25, '1390-204198', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Spacelabs', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 5, 'Si', '3.08.03', 'Biomed', '192.168.21.11', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 4, 13, 1, '2026-01-06', 22, 30),
(4, 'MONITOR MODULAR', 'image_QUBE.jpg', 87870.25, '1390-104582', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Spacelabs', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 5, 'Si', '3.06.00', 'Biomed', '192.168.21.12', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 4, 13, 1, '2026-01-06', 22, 30),
(5, 'MONITOR MODULAR', 'image_QUBE.jpg', 87870.25, '1390-104582', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Spacelabs', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 5, 'Si', '3.06.00', 'Biomed', '192.168.21.13', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 4, 13, 1, '2026-01-06', 22, 30),
(6, 'MONITOR MODULAR', 'image_C50.jpg', 20004.00, 'K5230324073', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Spacelabs', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 5, 'Si', '4.2.8', '5188/2016', '', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 4, 12, 1, '2026-01-06', 23, 31),
(7, 'MONITOR MODULAR', 'image_C50.jpg', 20004.00, 'K5230324071', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Spacelabs', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 5, 'Si', '4.2.8', '5188/2016', '', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 4, 12, 1, '2026-01-06', 23, 31),
(8, 'MONITOR DESFIBRILADOR', 'image_CORPULS_III.jpg', 139200.00, '20800714', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'CORPULS', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'Si', '', '3333', '', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 4, 18, 1, '2026-01-06', 33, 11),
(9, 'MONITOR DESFIBRILADOR', 'image_CORPULS_I.jpg', 63179.10, '22300677', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'CORPULS', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 4, 'Si', 'C1-2.1.0', '1111/3333', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 4, 18, 1, '2026-01-06', 33, 10),
(10, 'MONITOR DESFIBRILADOR', 'image_CORPULS_I.jpg', 63179.10, '22300673', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'CORPULS', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 5, 'Si', 'C1-2.1', '1111/3333', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 4, 18, 1, '2026-01-06', 33, 10),
(11, 'MONITOR SPOTCHECK', 'image_Connex.jpg', 24661.60, '100083053617', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Welch Allyn', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 2, 4, 15, 1, '2026-01-06', 23, 24),
(12, 'MONITOR SPOTCHECK', 'image_Connex.jpg', 24661.60, '100083003617', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Welch Allyn', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 2, 4, 15, 1, '2026-01-06', 23, 24),
(13, 'MONITOR SPOTCHECK', 'image_Connex.jpg', 24661.60, '100083003617', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Welch Allyn', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 8, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 2, 4, 15, 7, '2026-01-06', 23, 24),
(14, 'MONITOR SPOTCHECK', 'image_Connex.jpg', 24661.60, '100083003617', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Welch Allyn', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 8, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 2, 4, 15, 7, '2026-01-06', 23, 24),
(15, 'DEA', 'image_AED.jpg', 22532.00, '23323340', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'CORPULS', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 11, 'Si', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 3, 18, 1, '2026-01-06', 33, 41),
(16, 'BALANZA DIGITAL CON TALLIMETRO', 'image_SECA703.jpg', 5856.00, '5703184173954', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'SECA', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 2, 10, 1, '2026-01-06', 2, 21),
(18, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010263', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(19, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010271', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(20, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010258', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(21, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010265', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(22, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010261', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(23, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010277', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(24, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010266', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(25, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010278', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(26, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010272', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(27, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1906010271', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(28, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1706010184', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(29, 'BOMBA DE INFUSION', 'image_TELM800.jpg', 19317.00, '1704010216', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 42),
(30, 'BOMBA DE INFUSION', 'image_TELF630.jpg', 19317.00, '2306010135', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 43),
(31, 'BOMBA DE INFUSION', 'image_TELF630.jpg', 19317.00, '2306010134', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 43),
(32, 'BOMBA DE INFUSION', 'image_TELF630.jpg', 19317.00, '2306010132', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 43),
(33, 'BOMBA DE INFUSION', 'image_TELF630.jpg', 19317.00, '2306010131', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 43),
(34, 'BOMBA DE INFUSION', 'image_TELF630.jpg', 19317.00, '2306010137', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 43),
(35, 'BOMBA DE INFUSION', 'image_TELF630.jpg', 19317.00, '2306010130', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 43),
(36, 'BOMBA DE INFUSION', 'image_TELF630.jpg', 19317.00, '2306010128', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 43),
(37, 'BOMBA DE INFUSION', 'image_TELF630.jpg', 19317.00, '2306010129', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'TERUMO', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 1, 3, 13, 1, '2026-01-06', 9, 43),
(38, 'CENTRAL DE MONITOREO', 'image_xhibit.jpg', 115395.66, 'SLA0519F04578', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Spacelabs', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 5, 'Si', '1.3.5.4452', 'Biomed', '192.168.21.10', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 2, 4, 1, '2026-01-06', 24, 32),
(39, 'COLCHON ANTIESCARA', 'image_DOMUS1.jpg', 800.00, 'K012211085300078', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'APEX', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 5, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 2, 4, 1, '2026-01-06', 34, 13),
(40, 'COLCHON ANTIESCARA', 'image_domus3d.jpg', 3500.00, 'K012205064800004', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'APEX', 'BANZER', '', '2025-06-03 19:51:24', '2025-06-03 19:51:24', 11112, 5, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 2, 4, 1, '2026-01-06', 34, 14),
(41, 'Maquina de anestesia', 'image_Prima465.jfif', 305996.00, '4650623-0005', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Penlon', 'Banzer', '', '2025-06-04 03:34:19', '2025-06-04 03:34:19', 11112, 4, 'Si', '1.00.37', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2024-01-06', 27, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipmentspareparts`
--

CREATE TABLE `equipmentspareparts` (
  `id_equipment` int NOT NULL,
  `id_sparepart` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipment_brand_model`
--

CREATE TABLE `equipment_brand_model` (
  `id_equipment` int NOT NULL,
  `id_brand` int NOT NULL,
  `id_model` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insuranceequipment`
--

CREATE TABLE `insuranceequipment` (
  `id_Insurance` int NOT NULL,
  `id_equipment` int DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  `endInsurance` date DEFAULT NULL,
  `insuranceStatus` int DEFAULT NULL,
  `descripcion_actualizacion` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maintenances`
--

CREATE TABLE `maintenances` (
  `Id` int NOT NULL,
  `StartDate` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `EndDate` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `BreakDownCode` int DEFAULT NULL,
  `ClinicalEnginnerDSSN` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `models`
--

CREATE TABLE `models` (
  `id` int NOT NULL,
  `Model` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_brand` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `models`
--

INSERT INTO `models` (`id`, `Model`, `id_brand`) VALUES
(1, 'Bair Hugger', 1),
(2, 'Insight U120 smart', 2),
(3, '900-ARJOHUNTLEIGH', 3),
(4, 'DRYSTAR', 4),
(5, 'BF-683-TDP', 9),
(6, 'BF-683-EH', 9),
(7, 'GS IV', 10),
(8, 'HOSPIVAC 400', 13),
(9, 'AED', 17),
(10, 'CORPULS I', 17),
(11, 'CORPULS III', 17),
(12, 'RCP', 17),
(13, 'DOMUS 1', 19),
(14, 'DOMUS 3D', 19),
(15, '251', 21),
(16, 'Exelsa Baby li16x15', 21),
(17, 'AMPLA 2085', 21),
(18, 'IT-158.TS', 21),
(19, 'Panda', 21),
(20, 'Neuro fax JE-921A', 37),
(21, '7031321993', 43),
(22, 'Prima 465', 39),
(23, '980', 42),
(24, 'CONNEX', 52),
(25, 'Magnetos Essential', 44),
(26, 'MULTI P - X', 44),
(27, 'Mobilett XP Hybrid', 44),
(28, 'BFT II', 44),
(29, '19317', 51),
(30, 'QUBE', 46),
(31, 'C50', 46),
(32, 'Xhibit', 46),
(33, 'ATS2000', 56),
(34, 'AMX II', 23),
(35, 'Prodigy Advance Serie 510493Ma', 23),
(36, 'Sigma Architecr 3T', 23),
(37, 'Revolution', 23),
(38, 'BV Libra', 40),
(39, 'UMEC12', 35),
(40, 'DC-30', 35),
(41, 'CORPULS AED', NULL),
(42, 'TE*LM800', NULL),
(43, 'TE*LF630', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nameequipment`
--

CREATE TABLE `nameequipment` (
  `id_nameE` int NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `function` int NOT NULL,
  `aplication` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nameequipment`
--

INSERT INTO `nameequipment` (`id_nameE`, `Name`, `function`, `aplication`) VALUES
(1, 'Aspirador', 9, 2),
(2, 'Balanza', 6, 2),
(3, 'Ecografo', 6, 3),
(4, 'Electrocardiografo', 6, 3),
(5, 'Electroencefalografo', 6, 3),
(6, 'Esterilizacion', 2, 1),
(7, 'Imagenes Grandes', 6, 2),
(8, 'Imagenes Pequeñas', 2, 2),
(9, 'Infusion simple', 6, 3),
(10, 'infusion inteligente', 2, 1),
(11, 'infusion Tiva', 7, 3),
(12, 'termociclador completo', 5, 3),
(13, 'termociclador simple', 4, 1),
(14, 'Laboratorio Hematologia', 5, 3),
(15, 'Laboratorio Orina', 5, 3),
(16, 'Laboratorio proceso grande', 5, 3),
(17, 'Laboratorio proceso pequeño', 4, 1),
(18, 'Laboratorio Quimica sanguinea', 5, 3),
(19, 'Lampara grande', 9, 7),
(20, 'Lampara mediana', 7, 2),
(21, 'Lampara pequeña', 2, 2),
(22, 'Monitor alto riesgo', 7, 3),
(23, 'Monitor mediano riesgo', 6, 3),
(24, 'Central de monitorizacion', 2, 1),
(25, 'Neonatologia', 7, 3),
(26, 'Neonatologia Muebles', 2, 1),
(27, 'Quirofano alto riesgo Nivel 1', 9, 5),
(28, 'Quirofano alto riesgo Nivel 2', 9, 4),
(29, 'Quirofano alto riesgo Nivel 3', 9, 3),
(30, 'Quirofano mediano riesgo Nivel 1', 7, 4),
(31, 'Quirofano mediano riesgo Nivel 2', 7, 3),
(32, 'Quirofano bajo riesgo', 6, 3),
(33, 'Reanimacion', 10, 5),
(34, 'Terapia', 2, 2),
(35, 'Ventilacion', 9, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordertype`
--

CREATE TABLE `ordertype` (
  `id_typeW` int NOT NULL,
  `work` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordertype`
--

INSERT INTO `ordertype` (`id_typeW`, `work`) VALUES
(1, 'Correctivo'),
(2, 'Capacitación'),
(3, 'Traslado de área'),
(4, 'Compra insumo'),
(5, 'Compra accesorio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ppmquestions`
--

CREATE TABLE `ppmquestions` (
  `Code` int NOT NULL,
  `Q1` text COLLATE utf8mb4_general_ci,
  `Q2` text COLLATE utf8mb4_general_ci,
  `Q3` text COLLATE utf8mb4_general_ci,
  `Q4` text COLLATE utf8mb4_general_ci,
  `Q5` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EquipmentCode` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ppmquestions`
--

INSERT INTO `ppmquestions` (`Code`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `createdAt`, `updatedAt`, `EquipmentCode`) VALUES
(1, 'Examine todas las conexiones de los componentes para verificar su ajuste.', 'Examine las superficies de las unidades en busca de daños en el barniz y raspaduras.', 'Examine todas las partes en busca de daños de transporte, depresiones, desgarros o roturas.', 'Examine todos los cables y conectores en busca de daños externos.', 'Controle que todos los dispositivos de seguridad mecánicos estén en la posición prescrita.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(2, 'Asegúrese de que los conectores, cables del paciente y palas no estén dañados ni vencidos.', 'Asegúrese de que la tarjeta de memoria esté insertada en el dispositivo y tenga suficiente capacidad de almacenamiento.', 'Conecte el dispositivo a una fuente de alimentación externa y verifique que el indicador correspondiente en el panel frontal esté iluminado.', 'Verifique que el grabador tenga papel y que imprima correctamente.', 'Verifique que la batería esté cargada y que no presente signos de daño.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(3, 'Verifique el cable de alimentación cada vez que se use el generador.', 'Verifique la corriente de fuga de alta frecuencia monopolar y bipolar.', 'Verifique la salida de los modos de corte.', 'Verifique la salida de los modos de coagulación.', 'Verifique los fusibles a reemplazar si el generador dejó de funcionar.', '2019-12-22 07:44:22', '2019-12-22 06:27:36', NULL),
(4, 'Verificación operativa del ventilador del techo del gantry.', 'Comprobación de que la unidad giratoria esté firmemente asegurada.', 'Verificación de voltaje de la fuente de alimentación de CC de la consola.', 'Comprobación de interferencias en los cables dentro de la camilla.', 'Lubricación del engranaje de movimiento vertical de la camilla.', '2019-12-22 06:27:36', '2019-12-22 07:44:22', NULL),
(5, 'Verifique la Capa de Media Valor (HVL) del tubo.', 'Verifique la medición del grosor del seno del gantry.', 'Verifique la colimación correcta.', 'Verifique los botones de parada de emergencia del gantry.', 'Verifique la impresora DICOM.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(6, 'Inspección y ajuste de la potencia de salida de radiofrecuencia (RF).', 'Inspección de la calibración del gradiente.', 'Realización de una prueba de bobina de superficie rotacional.', 'Comprobación del funcionamiento de los ventiladores del área de trabajo, entradas y monitor.', 'Realización de la prueba de relación señal-ruido (SNR) en la cabeza.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(7, 'Verifique la función del mezclador de oxígeno.', 'Verifique la ausencia de fugas.', 'Verifique la alarma de baja presión/apnea.', 'Verifique la alarma de suministro de gas.', 'Verifique la alarma de fallo de alimentación.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(8, 'Verifique la velocidad de infusión.', 'Verifique la alarma de puerta abierta.', 'Verifique la alarma de oclusión.', 'Verifique la alarma de aire en línea.', 'Verifique el sensor de tasa de flujo.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(9, 'Verifique los electrodos en busca de suciedad y óxido.', 'Verifique que el cable de alimentación y el cable de conexión no estén dañados.', 'Verifique el funcionamiento en corriente alterna y batería.', 'Verifique la prueba del grabador.', 'Verifique los fusibles de alimentación para evitar averías.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ppms`
--

CREATE TABLE `ppms` (
  `Code` int NOT NULL,
  `DATE` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q1` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q2` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q3` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q4` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Q5` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `N1` text COLLATE utf8mb4_general_ci,
  `N2` text COLLATE utf8mb4_general_ci,
  `N3` text COLLATE utf8mb4_general_ci,
  `N4` text COLLATE utf8mb4_general_ci,
  `N5` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EquipmentCode` int DEFAULT NULL,
  `ClinicalEnginnerDSSN` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preventivetasks`
--

CREATE TABLE `preventivetasks` (
  `id` int NOT NULL,
  `EquipmentCode` int NOT NULL,
  `ScheduledDate` date NOT NULL,
  `Status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'Programada',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptionstatus`
--

CREATE TABLE `receptionstatus` (
  `ID` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receptionstatus`
--

INSERT INTO `receptionstatus` (`ID`, `Name`) VALUES
(1, 'Pendiente de recepción'),
(2, 'Recibido'),
(3, 'En almacén'),
(4, 'En tránsito'),
(5, 'Rechazado'),
(6, 'En evaluación técnica'),
(7, 'Recibido con observaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repairstage`
--

CREATE TABLE `repairstage` (
  `id_Stage` int NOT NULL,
  `Status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FuntionalStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repairstage`
--

INSERT INTO `repairstage` (`id_Stage`, `Status`, `FuntionalStatus`) VALUES
(1, 'Solicitud nueva', 0),
(2, 'En reparación', 0),
(3, 'En espera de repuesto', 0),
(4, 'Espera de proveedor', 0),
(5, 'Baja', 0),
(6, 'Reparado ', 1),
(7, 'Funcional pero con limitación', 1),
(8, 'Equipo entregado en área', 1),
(9, 'Entregado a Almacen', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `spareparts`
--

CREATE TABLE `spareparts` (
  `Id` int NOT NULL,
  `Code` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Amount` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AgentSupplierId` int DEFAULT NULL,
  `CodeManufacter` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CategoryId` int DEFAULT NULL,
  `id_brand` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `spareparts`
--

INSERT INTO `spareparts` (`Id`, `Code`, `Name`, `Image`, `Amount`, `createdAt`, `updatedAt`, `AgentSupplierId`, `CodeManufacter`, `CategoryId`, `id_brand`) VALUES
(991415565, 'as-56-as', 'piernera', 'image_Pierneras_Barrfab1.jpg', 2, '2025-06-04 05:05:02', '2025-06-04 05:05:02', 11112, 'b-25-3', 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stopreason`
--

CREATE TABLE `stopreason` (
  `id_Reason` int NOT NULL,
  `Description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `punctuation` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stopreason`
--

INSERT INTO `stopreason` (`id_Reason`, `Description`, `punctuation`) VALUES
(1, 'Mal uso', 0),
(2, 'Falla equipo', 1),
(3, 'Falta Consumible', 0),
(4, 'Ninguna', 0),
(5, 'Preventivo', 0),
(6, 'Gestion Compra', 0),
(7, 'No hay presupuesto', 0),
(8, 'Equipo Obsoleto', 0),
(9, 'Proveedor sin repuestos', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tagnotifications`
--

CREATE TABLE `tagnotifications` (
  `id_tagn` int NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tagnotifications`
--

INSERT INTO `tagnotifications` (`id_tagn`, `user`, `message`, `createdAt`, `updatedAt`) VALUES
(2, '1', '020202025', '2024-09-24 02:03:32', '2025-02-03 22:30:02'),
(3, '6458161', '', '2024-11-12 18:08:56', '2024-11-12 18:08:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `workorders`
--

CREATE TABLE `workorders` (
  `Code` int NOT NULL,
  `StartDate` text COLLATE utf8mb4_general_ci NOT NULL,
  `EndDate` text COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text COLLATE utf8mb4_general_ci NOT NULL,
  `Cost` decimal(15,2) NOT NULL,
  `Priority` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ClinicalEnginnerDSSN` bigint DEFAULT NULL,
  `EquipmentCode` int DEFAULT NULL,
  `Solution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Workdate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_typeW` int DEFAULT NULL,
  `id_StopReason` int DEFAULT NULL,
  `id_RepairStage` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `workorders`
--

INSERT INTO `workorders` (`Code`, `StartDate`, `EndDate`, `Description`, `Cost`, `Priority`, `createdAt`, `updatedAt`, `ClinicalEnginnerDSSN`, `EquipmentCode`, `Solution`, `Workdate`, `id_typeW`, `id_StopReason`, `id_RepairStage`) VALUES
(15, '2025-06-03', '2025-06-06', 'ruptura de sensor de capnografia', 0.00, 'High', '2025-06-04 07:42:28', '2025-06-04 07:42:28', 6458161, 41, '', '', 5, 6, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acquisitiontype`
--
ALTER TABLE `acquisitiontype`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `agentsuppliers`
--
ALTER TABLE `agentsuppliers`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indices de la tabla `breakdowns`
--
ALTER TABLE `breakdowns`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `EquipmentCode` (`EquipmentCode`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`IdCat`);

--
-- Indices de la tabla `clinicalenginners`
--
ALTER TABLE `clinicalenginners`
  ADD PRIMARY KEY (`DSSN`),
  ADD KEY `DepartmentCode` (`DepartmentCode`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`Code`),
  ADD UNIQUE KEY `Code` (`Code`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indices de la tabla `dialyinspections`
--
ALTER TABLE `dialyinspections`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `EquipmentCode` (`EquipmentCode`),
  ADD KEY `ClinicalEnginnerDSSN` (`ClinicalEnginnerDSSN`);

--
-- Indices de la tabla `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `AgentSupplierId` (`AgentSupplierId`),
  ADD KEY `DepartmentCode` (`DepartmentCode`),
  ADD KEY `fk_equipment_acquisitiontype` (`AcquisitionTypeID`),
  ADD KEY `fk_equipment_reception_status` (`ReceptionStatusId`),
  ADD KEY `fk_equipment_nameequipment` (`NameEquipmentId`),
  ADD KEY `fk_equipment_model` (`ModelId`);

--
-- Indices de la tabla `equipmentspareparts`
--
ALTER TABLE `equipmentspareparts`
  ADD PRIMARY KEY (`id_equipment`,`id_sparepart`),
  ADD KEY `equipmentspareparts_ibfk_2` (`id_sparepart`);

--
-- Indices de la tabla `equipment_brand_model`
--
ALTER TABLE `equipment_brand_model`
  ADD PRIMARY KEY (`id_equipment`,`id_brand`,`id_model`),
  ADD KEY `id_brand` (`id_brand`),
  ADD KEY `id_model` (`id_model`);

--
-- Indices de la tabla `insuranceequipment`
--
ALTER TABLE `insuranceequipment`
  ADD PRIMARY KEY (`id_Insurance`),
  ADD KEY `id_equipment` (`id_equipment`);

--
-- Indices de la tabla `maintenances`
--
ALTER TABLE `maintenances`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BreakDownCode` (`BreakDownCode`),
  ADD KEY `ClinicalEnginnerDSSN` (`ClinicalEnginnerDSSN`);

--
-- Indices de la tabla `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_brand` (`id_brand`);

--
-- Indices de la tabla `nameequipment`
--
ALTER TABLE `nameequipment`
  ADD PRIMARY KEY (`id_nameE`);

--
-- Indices de la tabla `ordertype`
--
ALTER TABLE `ordertype`
  ADD PRIMARY KEY (`id_typeW`);

--
-- Indices de la tabla `ppmquestions`
--
ALTER TABLE `ppmquestions`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `EquipmentCode` (`EquipmentCode`);

--
-- Indices de la tabla `ppms`
--
ALTER TABLE `ppms`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `EquipmentCode` (`EquipmentCode`),
  ADD KEY `ClinicalEnginnerDSSN` (`ClinicalEnginnerDSSN`);

--
-- Indices de la tabla `preventivetasks`
--
ALTER TABLE `preventivetasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EquipmentCode` (`EquipmentCode`);

--
-- Indices de la tabla `receptionstatus`
--
ALTER TABLE `receptionstatus`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `repairstage`
--
ALTER TABLE `repairstage`
  ADD PRIMARY KEY (`id_Stage`);

--
-- Indices de la tabla `spareparts`
--
ALTER TABLE `spareparts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `AgentSupplierId` (`AgentSupplierId`),
  ADD KEY `fk_category` (`CategoryId`),
  ADD KEY `fk_spareparts_brand` (`id_brand`);

--
-- Indices de la tabla `stopreason`
--
ALTER TABLE `stopreason`
  ADD PRIMARY KEY (`id_Reason`);

--
-- Indices de la tabla `tagnotifications`
--
ALTER TABLE `tagnotifications`
  ADD PRIMARY KEY (`id_tagn`);

--
-- Indices de la tabla `workorders`
--
ALTER TABLE `workorders`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `ClinicalEnginnerDSSN` (`ClinicalEnginnerDSSN`),
  ADD KEY `EquipmentCode` (`EquipmentCode`),
  ADD KEY `fk_workorders_ordertype` (`id_typeW`),
  ADD KEY `fk_workorders_stopreason` (`id_StopReason`),
  ADD KEY `fk_workorders_repairstage` (`id_RepairStage`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acquisitiontype`
--
ALTER TABLE `acquisitiontype`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `agentsuppliers`
--
ALTER TABLE `agentsuppliers`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11131;

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT de la tabla `breakdowns`
--
ALTER TABLE `breakdowns`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `IdCat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `dialyinspections`
--
ALTER TABLE `dialyinspections`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `insuranceequipment`
--
ALTER TABLE `insuranceequipment`
  MODIFY `id_Insurance` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maintenances`
--
ALTER TABLE `maintenances`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `models`
--
ALTER TABLE `models`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `nameequipment`
--
ALTER TABLE `nameequipment`
  MODIFY `id_nameE` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT de la tabla `ordertype`
--
ALTER TABLE `ordertype`
  MODIFY `id_typeW` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ppmquestions`
--
ALTER TABLE `ppmquestions`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ppms`
--
ALTER TABLE `ppms`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `preventivetasks`
--
ALTER TABLE `preventivetasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT de la tabla `receptionstatus`
--
ALTER TABLE `receptionstatus`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `repairstage`
--
ALTER TABLE `repairstage`
  MODIFY `id_Stage` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `spareparts`
--
ALTER TABLE `spareparts`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=991415566;

--
-- AUTO_INCREMENT de la tabla `stopreason`
--
ALTER TABLE `stopreason`
  MODIFY `id_Reason` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tagnotifications`
--
ALTER TABLE `tagnotifications`
  MODIFY `id_tagn` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `workorders`
--
ALTER TABLE `workorders`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `breakdowns`
--
ALTER TABLE `breakdowns`
  ADD CONSTRAINT `breakdowns_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `clinicalenginners`
--
ALTER TABLE `clinicalenginners`
  ADD CONSTRAINT `clinicalenginners_ibfk_1` FOREIGN KEY (`DepartmentCode`) REFERENCES `departments` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `dialyinspections`
--
ALTER TABLE `dialyinspections`
  ADD CONSTRAINT `dialyinspections_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `dialyinspections_ibfk_2` FOREIGN KEY (`ClinicalEnginnerDSSN`) REFERENCES `clinicalenginners` (`DSSN`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`AgentSupplierId`) REFERENCES `agentsuppliers` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`DepartmentCode`) REFERENCES `departments` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipment_acquisitiontype` FOREIGN KEY (`AcquisitionTypeID`) REFERENCES `acquisitiontype` (`ID`),
  ADD CONSTRAINT `fk_equipment_model` FOREIGN KEY (`ModelId`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `fk_equipment_nameequipment` FOREIGN KEY (`NameEquipmentId`) REFERENCES `nameequipment` (`id_nameE`),
  ADD CONSTRAINT `fk_equipment_reception_status` FOREIGN KEY (`ReceptionStatusId`) REFERENCES `receptionstatus` (`ID`);

--
-- Filtros para la tabla `equipmentspareparts`
--
ALTER TABLE `equipmentspareparts`
  ADD CONSTRAINT `equipmentspareparts_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipmentspareparts_ibfk_2` FOREIGN KEY (`id_sparepart`) REFERENCES `spareparts` (`Id`);

--
-- Filtros para la tabla `equipment_brand_model`
--
ALTER TABLE `equipment_brand_model`
  ADD CONSTRAINT `equipment_brand_model_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `nameequipment` (`id_nameE`),
  ADD CONSTRAINT `equipment_brand_model_ibfk_2` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`),
  ADD CONSTRAINT `equipment_brand_model_ibfk_3` FOREIGN KEY (`id_model`) REFERENCES `models` (`id`);

--
-- Filtros para la tabla `insuranceequipment`
--
ALTER TABLE `insuranceequipment`
  ADD CONSTRAINT `insuranceequipment_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`Code`);

--
-- Filtros para la tabla `maintenances`
--
ALTER TABLE `maintenances`
  ADD CONSTRAINT `maintenances_ibfk_1` FOREIGN KEY (`BreakDownCode`) REFERENCES `breakdowns` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `maintenances_ibfk_2` FOREIGN KEY (`ClinicalEnginnerDSSN`) REFERENCES `clinicalenginners` (`DSSN`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`);

--
-- Filtros para la tabla `ppmquestions`
--
ALTER TABLE `ppmquestions`
  ADD CONSTRAINT `ppmquestions_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `ppms`
--
ALTER TABLE `ppms`
  ADD CONSTRAINT `ppms_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ppms_ibfk_2` FOREIGN KEY (`ClinicalEnginnerDSSN`) REFERENCES `clinicalenginners` (`DSSN`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `preventivetasks`
--
ALTER TABLE `preventivetasks`
  ADD CONSTRAINT `preventivetasks_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `equipment` (`Code`);

--
-- Filtros para la tabla `spareparts`
--
ALTER TABLE `spareparts`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`IdCat`),
  ADD CONSTRAINT `fk_spareparts_brand` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `spareparts_ibfk_1` FOREIGN KEY (`AgentSupplierId`) REFERENCES `agentsuppliers` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `workorders`
--
ALTER TABLE `workorders`
  ADD CONSTRAINT `fk_workorders_ordertype` FOREIGN KEY (`id_typeW`) REFERENCES `ordertype` (`id_typeW`),
  ADD CONSTRAINT `fk_workorders_repairstage` FOREIGN KEY (`id_RepairStage`) REFERENCES `repairstage` (`id_Stage`),
  ADD CONSTRAINT `fk_workorders_stopreason` FOREIGN KEY (`id_StopReason`) REFERENCES `stopreason` (`id_Reason`),
  ADD CONSTRAINT `workorders_ibfk_1` FOREIGN KEY (`ClinicalEnginnerDSSN`) REFERENCES `clinicalenginners` (`DSSN`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `workorders_ibfk_2` FOREIGN KEY (`EquipmentCode`) REFERENCES `equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
