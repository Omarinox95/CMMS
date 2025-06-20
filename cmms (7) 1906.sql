-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-06-2025 a las 21:44:57
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
(11112, 'HP Medical', 'roca y coronado 2do y 3er anillo, SCZ', 222687712, 'null@gmail.com', '', '2020-05-21 18:15:03', '2020-05-21 18:17:11'),
(11113, 'Importadora San Martin de Porres', 'Cuellar #222', 3350047, 'percyherreraperez@hotmail.com', 'laboratorio', '2025-06-05 15:00:17', '2025-06-05 15:00:17'),
(11114, 'Intercom', 'Prolongacion Buenos Aires #300', 3360969, 'intercom@gmail.com', 'laboratorio', '2025-06-05 15:01:10', '2025-06-05 15:01:10'),
(11115, 'Biotecno', 'Pedro Velez #41', 3556750, 'info.santacruz@biotecno.com.bo', 'Laboratorio', '2025-06-05 15:01:50', '2025-06-05 15:01:50'),
(11116, 'Jhag Tecnología Y Laboratorio', '21 de Mayo #51', 3267408, 'Johnaaguilar2005@gmail.com', 'Laboratorio', '2025-06-05 15:02:56', '2025-06-05 15:02:56'),
(11117, 'Inter Science', 'Quintachiyu #76', 3421718, 'info@is-bolivia.com', 'Laboratorio', '2025-06-05 15:03:56', '2025-06-05 20:01:14'),
(11118, 'ASC SRL', 'Bermejo #100', 3517197, 'notiene@gmail.com', 'Laboratorio\r\n', '2025-06-05 15:04:42', '2025-06-05 15:04:42'),
(11119, 'ATS SRL', 'Quintachiyu #76', 3598546, 'notiene@gmail.com', 'Laboratorio\r\nFabian tiene buen servicio', '2025-06-05 15:08:36', '2025-06-05 15:09:41'),
(11120, 'DISTECNO MEDICAL SRL', 'C. 25 DE MAYO 6250', 78148808, 'distecnosrl@gmail.com', 'microscopio quirurgico', '2025-06-05 17:51:16', '2025-06-05 19:50:03'),
(11121, 'Rey medica', 'Calle Rafael Peña #250', 77683826, 'notiene@gmail.com', 'TORRE, No comprar equipos excepto si son único proveedor', '2025-06-05 17:59:46', '2025-06-05 19:35:58'),
(11122, 'VG EQUIPMED', 'Calle Chuvi S/N -A 350M de la Av. Doctor Lucas Saucedo (tercer anillo)', 79003330, 'v.gsucursalls.c@gmail.com', 'Equipos clinica', '2025-06-05 19:45:25', '2025-06-05 19:45:25'),
(11123, 'PROSERTEC', 'Av. 4to anillo 3880 y av. Roca y coronado', 3559618, 'notiene@gmail.com', 'GENERADOR DE OXIGENO', '2025-06-05 19:49:02', '2025-06-05 19:49:02'),
(11124, 'INSUMEDIC', 'Av. Omar Chavez #1265 esq. Francisca Lopez', 71632529, 'insumedic.bo@gmail.com', 'Craneotomo', '2025-06-05 19:51:50', '2025-06-05 19:51:50'),
(11125, 'SALUR SRL', 'Calle peru N82 esq. Av. Cristobal de Mendoza', 3372676, 'brenda.vidaurre@salursrl.com', 'Equipos Clinica', '2025-06-05 19:54:33', '2025-06-05 19:54:33'),
(11126, 'INGEVIDA SRL', 'Av. Alemana 4to Anillo Calle Sofia Rodriguez N4490', 62299184, 'notiene@gmail.com', '', '2025-06-05 19:59:31', '2025-06-05 19:59:31'),
(11127, 'MEDIANA', 'Av. 2 de agosto y 6to anillo Edificio Tusequis Nro 6200 planta baja ofi 4', 3459050, 'Adan.medina@medianabolivia.com', 'EEG', '2025-06-05 20:03:34', '2025-06-05 20:03:34'),
(11128, 'PRAXAIR BOLIVIA SRL', 'N/A', 68939081, 'Laura.Melina.Garcia@linde.com', '3461838 int. 3024', '2025-06-05 20:06:08', '2025-06-05 20:06:08'),
(11129, 'OPTONEX', 'Calle Pedro Alvarez Nro 1664, zona Pacata Baja - Sacaba, Cochabamba', 67542628, 'optonex@optonexgroup.com', 'pupinel', '2025-06-05 20:09:25', '2025-06-05 20:09:25'),
(11130, 'SAE SA', 'Av. Cristo Redentor N3733', 3410044, 'saemkdigital@sae.bo', 'COMODATO', '2025-06-05 20:11:40', '2025-06-05 20:11:40'),
(11131, 'Riomed', 'Av. Alameda Junin Nro301', 3333333333, 'rioma@gmail.com', '', '2020-05-21 18:15:03', '2020-05-21 18:17:11'),
(11132, 'COSIN LTDA', 'Calle 8 Oeste (La Plata) Barrio Equipetrol', 33431840, 'info@grupocosin.com', 'Imagenes', '2025-06-12 19:41:55', '2025-06-12 19:41:55');

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
(56, 'Zimmer'),
(135, 'Varios');

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

--
-- Volcado de datos para la tabla `breakdowns`
--

INSERT INTO `breakdowns` (`Code`, `Reason`, `DATE`, `createdAt`, `updatedAt`, `EquipmentCode`) VALUES
(47, 'Equipo con encendido intermitente', '2025-06-05T14:02', '2025-06-06 19:53:31', '2025-06-06 19:53:31', 10),
(48, 'PRUEBA', '2025-06-09T14:02', '2025-06-11 04:05:03', '2025-06-11 04:05:03', 1),
(49, 'encendido intermitente', '2025-06-10T12:41', '2025-06-11 13:38:43', '2025-06-11 13:38:43', 13),
(50, 'SE DETIENE EN ESTUDIOS DE CABEZA', '2025-06-09T08:30', '2025-06-12 19:49:47', '2025-06-12 19:49:47', 72),
(51, 'WORKORDER 19', '2025-04-21T08:30', '2025-06-12 20:04:49', '2025-06-12 20:04:49', 72),
(53, 'WORKORDER 20', '2025-04-14T08:30', '2025-06-12 20:07:56', '2025-06-12 20:07:56', 72),
(54, 'WORKORDER 21', '2025-04-18T12:30', '2025-06-12 20:08:24', '2025-06-12 20:08:24', 72);

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
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clinicalenginners`
--

INSERT INTO `clinicalenginners` (`DSSN`, `FName`, `LName`, `Phone`, `Image`, `Age`, `Email`, `Adress`, `WorkHours`, `Password`, `createdAt`, `updatedAt`) VALUES
(24697, 'Omar', 'Garrido', 1125414586, 'Omar.jpeg', 22, 'omarzaher787@gmail.com', 'medical center', 7, '$2a$10$o9/wxciC2gi1oLzTe.LCtegbaP8aRR8reY702WJrUbmc9b3dIxI66', '2020-05-23 02:59:14', '2020-05-23 13:49:14'),
(454567, 'Paula', 'Montero', 75599878, 'image_IMG-20250612-WA0014.jpg', 22, 'pau@gmail.com', 'Medical center', 8, '$2a$10$dZz/3/kRL11NHbdqvrcLKOy.QPpu65suId9pDkOkPwKO1.vfxF/Oy', '2025-06-13 19:13:04', '2025-06-13 19:13:04'),
(1111111, 'administrador', 'administrador', 77431131, 'image_jefecito.png', 26, 'admin@gmail.com', 'algun lugar del mundo', 8, '$2a$10$a7ouIcDbptaqcPvoia11zub6dZvPSR3MDgDyWzh1mdv8L/1lS9vrO', '2025-06-13 05:38:52', '2025-06-13 05:38:52'),
(6458161, 'Valeria', 'Toro', 77431131, 'image_DSC_9463 (Copiar).jpg', 26, 'valeriatorovargas531@gmail.com', 'sevilla2', 8, '$2a$10$eBru2lMXYeitp/MTdrNUM.7SVZYtHCHpf7hubZFzMU5RZxTGvvhlW', '2024-08-09 20:57:24', '2024-08-09 20:57:24');

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

--
-- Volcado de datos para la tabla `dialyinspections`
--

INSERT INTO `dialyinspections` (`Code`, `DATE`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `Q6`, `Q7`, `Q8`, `createdAt`, `updatedAt`, `EquipmentCode`, `ClinicalEnginnerDSSN`) VALUES
(10, '2025-06-06', 'on', 'on', 'on', 'on', 'off', 'off', 'off', 'off', '2025-06-06 19:56:16', '2025-06-06 19:56:16', 3, 6458161),
(11, '2025-06-01', 'on', 'on', 'on', 'on', 'on', 'on', 'off', 'off', '2025-06-06 20:08:48', '2025-06-06 20:08:48', 1, 6458161),
(12, '2025-06-10', 'on', 'on', 'on', 'off', 'off', 'off', 'off', 'off', '2025-06-10 19:29:14', '2025-06-10 19:29:14', 8, 6458161),
(13, '2025-06-13', 'on', 'on', 'on', 'on', 'on', 'off', 'off', 'off', '2025-06-13 08:17:11', '2025-06-13 08:17:11', 1, 6458161),
(14, '2025-06-13', 'on', 'on', 'on', 'on', 'on', 'off', 'off', 'off', '2025-06-13 19:02:34', '2025-06-13 19:02:34', 1, 6458161),
(15, '2025-06-13', 'on', 'on', 'on', 'on', 'on', 'off', 'off', 'off', '2025-06-13 19:14:29', '2025-06-13 19:14:29', 2, 454567),
(16, '2025-06-13', 'on', 'on', 'on', 'off', 'off', 'off', 'off', 'off', '2025-06-13 19:20:01', '2025-06-13 19:20:01', 3, 454567),
(17, '2025-06-13', 'on', 'on', 'on', 'on', 'on', 'off', 'off', 'off', '2025-06-13 19:46:32', '2025-06-13 19:46:32', 2, 454567);

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
(17, 'Balanza digital con infantometro', 'image_374.jpeg', 6976.00, 'N', '2024-06-01', '2024-06-01', NULL, NULL, NULL, 'Seca', 'Banzer', '', '2025-06-06 06:07:00', '2025-06-06 06:07:00', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2024-06-01', 2, 56),
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
(41, 'MAQUINA DE ANESTESIA', 'image_Prima465.jfif', 305996.00, '4650623-0005', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Penlon', 'Banzer', '', '2025-06-04 03:34:19', '2025-06-04 03:34:19', 11112, 4, 'Si', '1.00.37', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2024-01-06', 27, 22),
(42, 'MESA QUIRURGICA', 'image_BF683TDP.jpg', 131400.00, '4348150', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Barrfab', 'BANZER', '', '2025-06-04 17:20:14', '2025-06-04 17:20:14', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 15, 1, '2024-01-06', 27, 5),
(43, 'MESA QUIRURGICA', 'image_BF683EH.jpg', 196376.40, '162200323', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Barrfab', 'BANZER', '', '2025-06-04 17:20:14', '2025-06-04 17:20:14', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 15, 1, '2024-01-06', 27, 6),
(44, 'COMPRESOR DE MIEMBROS', 'image_900-ARJOHUNTLEIGH.jpg', 16000.00, '2200004493', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Activated Flowtron', 'BANZER', '', '2025-06-04 17:40:49', '2025-06-04 17:40:49', 11112, 5, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 1, 5, 1, '2024-01-06', 34, 3),
(45, 'CUNA PANDA', 'image_PANDA.jpg', 4106.39, 'PC1004266-01', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Fanem', 'BANZER', '', '2025-06-04 17:49:00', '2025-06-04 17:49:00', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 4, 1, '2024-01-06', 26, 19),
(46, 'CUNA PANDA', 'image_PANDA.jpg', 4106.39, 'PC1005706-01', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Fanem', 'BANZER', '', '2025-06-04 17:49:00', '2025-06-04 17:49:00', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 4, 1, '2024-01-06', 26, 19),
(47, 'CUNA PANDA', 'image_PANDA.jpg', 4106.39, 'PC1005706-02', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Fanem', 'BANZER', '', '2025-06-04 17:49:00', '2025-06-04 17:49:00', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 4, 1, '2024-01-06', 26, 19),
(48, 'CUNA PANDA', 'image_PANDA.jpg', 4106.39, 'PC1005706-03', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Fanem', 'BANZER', '', '2025-06-04 17:49:00', '2025-06-04 17:49:00', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 4, 1, '2024-01-06', 26, 19),
(49, 'ELECTROBISTURI', 'image_SMART4.jpg', 83520.00, 'SD-1104621', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Avanteb', 'BANZER', '', '2025-06-04 18:01:06', '2025-06-04 18:01:06', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 2, 14, 1, '2024-01-06', 27, 44),
(50, 'ELECTROBISTURI', 'image_SMART4.jpg', 83520.00, 'SD-1104623', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Avanteb', 'BANZER', '', '2025-06-04 18:01:06', '2025-06-04 18:01:06', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 2, 14, 1, '2024-01-06', 27, 44),
(51, 'INCUBADORA DE TRANSPORTE', 'image_IT158TS.jpg', 95000.00, 'FAU013284', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Fanem', 'BANZER', '', '2025-06-04 18:12:44', '2025-06-04 18:12:44', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2024-01-06', 25, 18),
(52, 'LAMPARA CIALITICA DOS SATELITES', 'image_X2MTX3MT.png', 38927.00, 'S22000008487/S22000008488', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Surgirs', 'BANZER', '', '2025-06-04 18:26:35', '2025-06-04 18:26:35', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 2, 12, 1, '2024-01-06', 19, 45),
(53, 'LAMPARA CIALITICA DOS SATELITES', 'image_X2MTX3MT.png', 200448.00, 'S22000003306/S22000003304', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Surgirs', 'BANZER', '', '2025-06-04 18:26:35', '2025-06-04 18:26:35', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 2, 12, 1, '2024-01-06', 19, 45),
(54, 'LAMPARA CIALITICA MOVIL', 'image_AUXILIAR3LE.png', 38927.28, '418842601', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Sismatec', 'BANZER', '', '2025-06-04 18:41:49', '2025-06-04 18:41:49', 11112, 1, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2024-01-06', 20, 47),
(55, 'ASPIRADOR QUIRURGICO', 'image_HOSPIVAC 400.jpg', 18400.00, '21644', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Ca mi', 'BANZER', '', '2025-06-04 18:52:54', '2025-06-04 18:52:54', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 3, 13, 1, '2026-01-06', 1, 8),
(56, 'MANTA TERMICA', 'image_BAIR HUGGER.jpg', 30000.00, '35552', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', '3M', 'BANZER', '', '2025-06-04 18:57:54', '2025-06-04 18:57:54', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2026-01-06', 32, 1),
(57, 'SERVOCUNA', 'image_2085Ampla.jpg', 50056.32, 'FAU013290', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Fanem', 'BANZER', '', '2025-06-04 19:31:26', '2025-06-04 19:31:26', 11112, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 12, 1, '2026-01-06', 25, 17),
(58, 'VENTILADOR MECANICO', 'image_980Purittan.jpg', 407243.63, '35B2004502', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Puritan benett', 'BANZER', '', '2025-06-04 19:37:21', '2025-06-04 19:37:21', 11112, 5, 'Si', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 3, 17, 1, '2026-01-06', 35, 23),
(59, 'MONITOR MULTIPARAMETRICO', 'image_H8.jpg', 7500.00, '210513628', '2024-08-28', '2024-08-28', NULL, '2024-08-28', '2024-08-28', 'Hwatime', 'BANZER', '', '2025-06-04 19:57:33', '2025-06-04 19:57:33', 11131, 11, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2026-08-28', 22, 48),
(60, 'SISTEMA DE COMPRESION TORAXICA', 'image_CPR.jpg', 66239.00, '23400581', '2024-01-06', '2024-01-06', NULL, '2024-01-06', '2024-01-06', 'Corpuls', 'BANZER', '', '2025-06-04 20:27:44', '2025-06-04 20:27:44', 11112, 1, 'Si', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 2, 17, 1, '2026-01-06', 33, 12),
(61, 'MICROSCOPIO QUIRURGICO', 'image_OHS1.jpeg', 0.00, 'CH9435', '2024-10-28', '2024-10-28', NULL, '2024-10-28', '2024-10-28', 'Leica', 'Banzer', '', '2025-06-05 20:20:23', '2025-06-05 20:20:23', 11120, 10, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 3, '2024-10-28', 27, 50),
(62, 'TORRE LAPAROSCOPIA', 'image_1488.jpg', 0.00, '-', '2024-06-01', '2024-06-01', NULL, NULL, NULL, 'Stryker', 'Banzer', '', '2025-06-05 20:23:43', '2025-06-05 20:23:43', 11121, 10, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 3, '2024-06-01', 27, 51),
(63, 'MONITOR', 'image_UMEC12.jpeg', 25000.00, 'KQ-17070347', '2024-06-01', '2024-06-01', NULL, NULL, NULL, 'Mindray', 'Banzer', '', '2025-06-05 20:30:19', '2025-06-05 20:30:19', 11122, 1, 'Si', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2026-06-01', 22, 39),
(64, 'MONITOR', 'image_UMEC12.jpeg', 25000.00, 'KQ-17070348', '2024-06-01', '2024-06-01', NULL, NULL, NULL, 'Mindray', 'Banzer', '', '2025-06-05 20:30:19', '2025-06-05 20:30:19', 11122, 1, 'Si', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2026-06-01', 22, 39),
(65, 'MONITOR', 'image_UMEC12.jpeg', 25000.00, 'KQ-17070351', '2024-06-01', '2024-06-01', NULL, NULL, NULL, 'Mindray', 'Banzer', '', '2025-06-05 20:30:19', '2025-06-05 20:30:19', 11122, 1, 'Si', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2026-06-01', 22, 39),
(66, 'BOMBA TIVA', 'image_OrchestaBasePrimea.jpeg', 0.00, '23282770', '2024-06-01', '2024-06-01', NULL, NULL, NULL, 'Fresenius', 'Banzer', '', '2025-06-05 21:00:11', '2025-06-05 21:00:11', 11130, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 2, '2024-06-01', 11, 52),
(67, 'TORNIQUETE NEUMATICO', 'image_ATS2000.jpeg', 27900.00, 'FP050420', '2024-06-01', '2024-06-01', NULL, NULL, NULL, 'Zimmer', 'Banzer', '', '2025-06-05 21:03:35', '2025-06-05 21:03:35', 11121, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 1, '2024-06-01', 27, 33),
(68, 'RACK SYS', 'image_TERS700RACK.jpeg', 0.00, '1303010006-1', '2024-01-06', '2024-01-06', NULL, NULL, NULL, 'Terumo', 'Banzer', '', '2025-06-05 21:12:20', '2025-06-05 21:12:20', 11112, 5, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 0, 0, 2, '2026-01-06', 1, 53),
(69, 'RACK SYS', 'image_TERS700RACK.jpeg', 0.00, '1303010006-2', '2024-01-06', '2024-01-06', NULL, NULL, NULL, 'Terumo', 'Banzer', '', '2025-06-05 21:12:20', '2025-06-05 21:12:20', 11112, 5, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, -1, 0, 0, 2, '2026-01-06', 1, 53),
(70, 'BOMBA TIVA', 'image_KAVI.jpeg', 0.00, '25779280', '2024-06-01', '2024-06-01', NULL, NULL, NULL, 'Fresenius', 'Banzer', '', '2025-06-05 21:18:17', '2025-06-05 21:18:17', 11130, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 2, '2026-06-01', 11, 54),
(71, 'BOMBA TIVA', 'image_KAVI.jpeg', 0.00, '25779281', '2024-06-01', '2024-06-01', NULL, NULL, NULL, 'Fresenius', 'Banzer', '', '2025-06-05 21:18:17', '2025-06-05 21:18:17', 11130, 4, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 0, 0, 2, '2026-06-01', 11, 54),
(72, 'RESONADOR MAGNETICO', 'image_SIGMA.jpeg', 90480000.00, 'MRUA2200', '2023-04-01', '2022-12-11', NULL, '2022-12-11', '2022-12-11', 'GE', 'Banzer', '', '2025-06-12 19:44:13', '2025-06-12 19:44:13', 11132, 2, 'Si', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 2, 0, 0, 1, '2026-04-01', 7, 36);

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
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Description` text COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `BreakDownCode` int DEFAULT NULL,
  `ClinicalEnginnerDSSN` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `maintenances`
--

INSERT INTO `maintenances` (`Id`, `StartDate`, `EndDate`, `Description`, `createdAt`, `updatedAt`, `BreakDownCode`, `ClinicalEnginnerDSSN`) VALUES
(16, '2025-06-06 14:02:00', '2025-06-06 14:02:00', 'PRUEBA', '2025-06-06 19:54:23', '2025-06-06 19:54:23', 47, 6458161),
(17, '2025-06-09 15:02:00', '2025-06-12 02:00:00', 'PRUEBA', '2025-06-11 04:05:43', '2025-06-11 04:05:43', 48, 6458161),
(18, '2025-06-09 15:02:00', '2025-06-11 09:39:00', 'se llamo a la empresa, nos cambiaron la placa de...', '2025-06-11 13:39:51', '2025-06-11 13:39:51', 49, 6458161),
(19, '2025-06-09 08:30:00', '2025-06-09 14:30:00', 'CAMBIO DE TRANSCEIVERS EN ICE JO2 Y DPP1 J9', '2025-06-12 19:50:17', '2025-06-12 19:52:35', 50, 6458161),
(20, '2025-04-21 08:30:00', '2025-04-21 17:00:00', 'EQUIPO NO FUNCIONA', '2025-06-12 20:05:30', '2025-06-12 20:05:30', 51, 6458161),
(21, '2025-04-14 08:30:00', '2025-04-14 16:30:00', 'SCAN STOPPED DUE TO ERROR RECEIVER', '2025-06-12 20:10:17', '2025-06-12 20:10:17', 53, 6458161),
(22, '2025-04-18 12:30:00', '2025-04-18 16:30:00', 'TRACKBALL 1 Y 2 NO FUNCIONAN', '2025-06-12 20:10:54', '2025-06-12 20:10:54', 54, 6458161);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `models`
--

CREATE TABLE `models` (
  `id` int NOT NULL,
  `Model` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_brand` int DEFAULT NULL,
  `Q1` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `Q2` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `Q3` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `Q4` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `Q5` varchar(500) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `models`
--

INSERT INTO `models` (`id`, `Model`, `id_brand`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`) VALUES
(1, 'Bair Hugger', 1, 'Prende sin problema', 'Opera en todos sus modos', 'El equipo no presenta deterioro', 'La manguera no tiene fuga', 'El acople para portasuero no presenta problema'),
(2, 'Insight U120 smart', 2, '', '', '', '', ''),
(3, '900-ARJOHUNTLEIGH', 3, '', '', '', '', ''),
(4, 'DRYSTAR', 4, '', '', '', '', ''),
(5, 'BF-683-TDP', 9, '', '', '', '', ''),
(6, 'BF-683-EH', 9, '¿Enciende correctamente?', '¿La pantalla y los botones funcionan correctamente?', '¿El sistema de alarma se activa correctamente?', '¿El mecanismo interno (riel) esta sin desgaste ni roturas?', '¿La medición de prueba se realiza de forma correcta sin problemas de oclusión?'),
(7, 'GS IV', 10, '', '', '', '', ''),
(8, 'HOSPIVAC 400', 13, '', '', '', '', ''),
(9, 'AED', 17, '', '', '', '', ''),
(10, 'CORPULS I', 17, 'El equipo prende sin problemas', 'La prueba de desfibrilación para exitosamente', 'ECG no tiene problemas', 'Todos los botones y parlantes funcionan normalmente', 'Las paletas y parches estan en buen estado'),
(11, 'CORPULS III', 17, '', '', '', '', ''),
(12, 'RCP', 17, '¿El equipo puede prende sin problemas? ', '¿El equipo esta cargado y funcional?', '¿Puedes hacer los movimientos del brazo?', '¿El brazo hacer las compresiones coordinadas con el ritmo de rcp ?', '¿El equipo no presento ningún mensaje al apagarlo?'),
(13, 'DOMUS 1', 19, '', '', '', '', ''),
(14, 'DOMUS 3D', 19, '', '', '', '', ''),
(15, '251', 21, '', '', '', '', ''),
(16, 'Exelsa Baby li16x15', 21, '', '', '', '', ''),
(17, 'AMPLA 2085', 21, '', '', '', '', ''),
(18, 'IT-158.TS', 21, '', '', '', '', ''),
(19, 'Panda', 21, '', '', '', '', ''),
(20, 'Neuro fax JE-921A', 37, '', '', '', '', ''),
(21, '7031321993', 43, '', '', '', '', ''),
(22, 'Prima 465', 39, '', '', '', '', ''),
(23, '980', 42, '¿Las mangueras estan en buen estado, sin fugas?', '¿El equipo paso su auto test de manera correcta?', '¿El compresor funciona de manera correcta?', '¿La pantalla funciona de manera correcta?', ''),
(24, 'CONNEX', 52, '¿Enciende correctamente sin errores o códigos de fallo?', '¿Los cables, sensores y accesorios estan sin daños fisicos?', '¿El sensor de SpO2 realiza una medición correcta?', '¿El sensor de temperatura realiza una medición correcta?', '¿El sensor de PANI realiza una medición correcta?'),
(25, 'Magnetos Essential', 44, '', '', '', '', ''),
(26, 'MULTI P - X', 44, '', '', '', '', ''),
(27, 'Mobilett XP Hybrid', 44, '', '', '', '', ''),
(28, 'BFT II', 44, '', '', '', '', ''),
(29, '19317', 51, '', '', '', '', ''),
(30, 'QUBE', 46, '¿Enciende correctamente sin errores o códigos de fallo?', '¿La pantalla y los botones funcionan correctamente?', '¿El sensor de SpO2 realiza una medición correcta?', '¿El sensor de temperatura realiza una medición correcta?', '¿El sensor de PANI realiza una medicion correcta?'),
(31, 'C50', 46, '', '', '', '', ''),
(32, 'Xhibit', 46, '', '', '', '', ''),
(33, 'ATS2000', 56, '', '', '', '', ''),
(34, 'AMX II', 23, '', '', '', '', ''),
(35, 'Prodigy Advance Serie 510493Ma', 23, '', '', '', '', ''),
(36, 'Sigma Architecr 3T', 23, '', '', '', '', ''),
(37, 'Revolution', 23, '', '', '', '', ''),
(38, 'BV Libra', 40, '', '', '', '', ''),
(39, 'UMEC12', 35, '¿Enciende correctamente sin errores o codigos de fallo?', '¿El sensor de SpO2 realiza una medición correcta?', '¿El sensor de temperatura realiza una medición correcta?', '¿El sensor de PANI realiza una medición correcta?', '¿El modulo de ECG realiza la medición de las señales de manera correcta?'),
(40, 'DC-30', 35, '', '', '', '', ''),
(41, 'CORPULS AED', 17, '', '', '', '', ''),
(42, 'TE*LM800', 51, '', '', '', '', ''),
(43, 'TE*LF630', 51, '¿Enciende correctamente?', '¿La pantalla y los botones funcionan correctamente?', '¿El sistema de alarma se activa correctamente?', '¿El mecanismo interno (riel) esta sin desgaste ni roturas?', '¿La medición de prueba se realiza de forma correcta sin problemas de oclusión?'),
(44, 'SMART4', 7, '', '', '', '', ''),
(45, 'X3MT/X2MT', 49, '', '', '', '', ''),
(46, 'X2MT/X2MT', 49, '', '', '', '', ''),
(47, '3-LE', 45, '', '', '', '', ''),
(48, 'H8', 25, '', '', '', '', ''),
(49, 'VAC PRO', 6, '', '', '', '', ''),
(50, 'OHS-1', 30, '', '', '', '', ''),
(51, '1488', 48, '', '', '', '', ''),
(52, 'Orchesta Base Primea', 22, '', '', '', '', ''),
(53, 'TE-RS-700', 51, '', '', '', '', ''),
(54, 'KABI TIVA', 22, '', '', '', '', ''),
(55, 'Varios', 135, '', '', '', '', ''),
(56, '374', 43, '', '', '', '', '');

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
(1, 'Correctivo/Falla Equipo'),
(2, 'Capacitación'),
(3, 'Traslado de área'),
(4, 'Compra insumo'),
(5, 'Compra accesorio'),
(6, 'Config/Ade'),
(7, 'Diagnostico'),
(8, 'Correctivo/Por Percance');

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
(1, 'Examine todas las conexiones de los componentes para verificar su ajuste.', 'Examine las superficies de las unidades en busca de daños en el barniz y raspaduras.', 'Examine todas las partes en busca de daños de transporte, depresiones, desgarros o roturas.', 'Examine todos los cables y conectores en busca de daños externos.', 'Controle que todos los dispositivos de seguridad mecánicos estén en la posición prescrita.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 1),
(2, 'Asegúrese de que los conectores, cables del paciente y palas no estén dañados ni vencidos.', 'Asegúrese de que la tarjeta de memoria esté insertada en el dispositivo y tenga suficiente capacidad de almacenamiento.', 'Conecte el dispositivo a una fuente de alimentación externa y verifique que el indicador correspondiente en el panel frontal esté iluminado.', 'Verifique que el grabador tenga papel y que imprima correctamente.', 'Verifique que la batería esté cargada y que no presente signos de daño.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 3),
(3, 'Verifique el cable de alimentación cada vez que se use el generador.', 'Verifique la corriente de fuga de alta frecuencia monopolar y bipolar.', 'Verifique la salida de los modos de corte.', 'Verifique la salida de los modos de coagulación.', 'Verifique los fusibles a reemplazar si el generador dejó de funcionar.', '2019-12-22 07:44:22', '2019-12-22 06:27:36', NULL),
(4, 'Verificación operativa del ventilador del techo del gantry.', 'Comprobación de que la unidad giratoria esté firmemente asegurada.', 'Verificación de voltaje de la fuente de alimentación de CC de la consola.', 'Comprobación de interferencias en los cables dentro de la camilla.', 'Lubricación del engranaje de movimiento vertical de la camilla.', '2019-12-22 06:27:36', '2019-12-22 07:44:22', NULL),
(5, 'Verifique la Capa de Media Valor (HVL) del tubo.', 'Verifique la medición del grosor del seno del gantry.', 'Verifique la colimación correcta.', 'Verifique los botones de parada de emergencia del gantry.', 'Verifique la impresora DICOM.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(6, 'Inspección y ajuste de la potencia de salida de radiofrecuencia (RF).', 'Inspección de la calibración del gradiente.', 'Realización de una prueba de bobina de superficie rotacional.', 'Comprobación del funcionamiento de los ventiladores del área de trabajo, entradas y monitor.', 'Realización de la prueba de relación señal-ruido (SNR) en la cabeza.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(7, 'Verifique la función del mezclador de oxígeno.', 'Verifique la ausencia de fugas.', 'Verifique la alarma de baja presión/apnea.', 'Verifique la alarma de suministro de gas.', 'Verifique la alarma de fallo de alimentación.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(8, 'Verifique la velocidad de infusión.', 'Verifique la alarma de puerta abierta.', 'Verifique la alarma de oclusión.', 'Verifique la alarma de aire en línea.', 'Verifique el sensor de tasa de flujo.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 66),
(9, 'Verifique los electrodos en busca de suciedad y óxido.', 'Verifique que el cable de alimentación y el cable de conexión no estén dañados.', 'Verifique el funcionamiento en corriente alterna y batería.', 'Verifique la prueba del grabador.', 'Verifique los fusibles de alimentación para evitar averías.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', NULL),
(10, 'Verifique la velocidad de infusión.', 'Verifique la alarma de puerta abierta.', 'Verifique la alarma de oclusión.', 'Verifique la alarma de aire en línea.', 'Verifique el sensor de tasa de flujo.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 67),
(16, 'Comprobaciones de modo servicio', 'Testeo y limpieza de todos los sensores', 'Testeo de la pantalla táctil', 'Comprobación de movimientos del brazo', 'Inspección de batería', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 63),
(17, 'Comprobaciones de modo servicio', 'Testeo y limpieza de todos los sensores', 'Testeo de la pantalla táctil', 'Comprobación de movimientos del brazo', 'Inspección de batería', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 64),
(18, 'Comprobaciones de modo servicio', 'Testeo y limpieza de todos los sensores', 'Testeo de la pantalla táctil', 'Comprobación de movimientos del brazo', 'Inspección de batería', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 65);

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
  `ClinicalEnginnerDSSN` bigint DEFAULT NULL,
  `signature` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ppms`
--

INSERT INTO `ppms` (`Code`, `DATE`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `N1`, `N2`, `N3`, `N4`, `N5`, `createdAt`, `updatedAt`, `EquipmentCode`, `ClinicalEnginnerDSSN`, `signature`) VALUES
(12, '2025-06-18', 'on', 'on', 'on', 'on', 'on', '', '', '', '', '', '2025-06-18 17:10:01', '2025-06-18 17:10:01', 63, 6458161, NULL),
(18, '2025-06-19', 'on', 'on', 'on', 'on', 'on', '', '', '', '', '', '2025-06-19 05:02:07', '2025-06-19 05:02:07', 64, 6458161, ''),
(19, '2025-06-19', 'on', 'on', 'on', 'on', 'on', '', '', '', '', '', '2025-06-19 05:14:52', '2025-06-19 05:14:52', 63, 6458161, 'data:image/png;base64,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');

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

--
-- Volcado de datos para la tabla `preventivetasks`
--

INSERT INTO `preventivetasks` (`id`, `EquipmentCode`, `ScheduledDate`, `Status`, `createdAt`, `updatedAt`) VALUES
(184, 1, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(185, 1, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(186, 1, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(187, 2, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(188, 2, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(189, 2, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(190, 3, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(191, 3, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(192, 3, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(193, 4, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(194, 4, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(195, 4, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(196, 5, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(197, 5, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(198, 5, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(199, 6, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(200, 6, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(201, 6, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(202, 7, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(203, 7, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(204, 7, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(205, 8, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(206, 8, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(207, 8, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(208, 9, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(209, 9, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(210, 9, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(211, 10, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(212, 10, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(213, 10, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(214, 11, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(215, 11, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(216, 11, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(217, 12, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(218, 12, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(219, 12, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(220, 13, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(221, 13, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(222, 13, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(223, 14, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(224, 14, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(225, 14, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(226, 15, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(227, 15, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(228, 15, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(229, 16, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(230, 16, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(231, 16, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(232, 17, '2025-06-02', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(233, 17, '2026-06-02', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(234, 18, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(235, 18, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(236, 18, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(237, 19, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(238, 19, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(239, 19, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(240, 20, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(241, 20, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(242, 20, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(243, 21, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(244, 21, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(245, 21, '2027-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(246, 22, '2025-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(247, 22, '2026-01-06', 'Programada', '2025-06-06 19:51:12', '2025-06-06 19:51:12'),
(248, 22, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(249, 23, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(250, 23, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(251, 23, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(252, 24, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(253, 24, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(254, 24, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(255, 25, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(256, 25, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(257, 25, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(258, 26, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(259, 26, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(260, 26, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(261, 27, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(262, 27, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(263, 27, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(264, 28, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(265, 28, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(266, 28, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(267, 29, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(268, 29, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(269, 29, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(270, 30, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(271, 30, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(272, 30, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(273, 31, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(274, 31, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(275, 31, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(276, 32, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(277, 32, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(278, 32, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(279, 33, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(280, 33, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(281, 33, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(282, 34, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(283, 34, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(284, 34, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(285, 35, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(286, 35, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(287, 35, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(288, 36, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(289, 36, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(290, 36, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(291, 37, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(292, 37, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(293, 37, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(294, 38, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(295, 38, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(296, 38, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(297, 39, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(298, 39, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(299, 39, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(300, 40, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(301, 40, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(302, 40, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(303, 41, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(304, 41, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(305, 41, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(306, 42, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(307, 42, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(308, 42, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(309, 43, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(310, 43, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(311, 43, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(312, 44, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(313, 44, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(314, 44, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(315, 45, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(316, 45, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(317, 45, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(318, 46, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(319, 46, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(320, 46, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(321, 47, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(322, 47, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(323, 47, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(324, 48, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(325, 48, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(326, 48, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(327, 49, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(328, 49, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(329, 49, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(330, 50, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(331, 50, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(332, 50, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(333, 51, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(334, 51, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(335, 51, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(336, 52, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(337, 52, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(338, 52, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(339, 53, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(340, 53, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(341, 53, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(342, 54, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(343, 54, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(344, 54, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(345, 55, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(346, 55, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(347, 55, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(348, 56, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(349, 56, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(350, 56, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(351, 57, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(352, 57, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(353, 57, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(354, 58, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(355, 58, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(356, 58, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(357, 59, '2025-08-28', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(358, 59, '2026-08-28', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(359, 59, '2027-08-30', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(360, 60, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(361, 60, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(362, 60, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(363, 61, '2025-10-28', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(364, 61, '2026-10-28', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(365, 61, '2027-10-28', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(366, 62, '2025-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(367, 62, '2026-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(368, 63, '2025-06-02', 'Finalizada', '2025-06-06 19:51:13', '2025-06-19 05:14:53'),
(369, 63, '2026-06-02', 'Finalizada', '2025-06-06 19:51:13', '2025-06-19 05:14:53'),
(370, 64, '2025-06-02', 'Finalizada', '2025-06-06 19:51:13', '2025-06-19 05:02:07'),
(371, 64, '2026-06-02', 'Finalizada', '2025-06-06 19:51:13', '2025-06-19 05:02:07'),
(372, 65, '2025-06-02', 'Finalizada', '2025-06-06 19:51:13', '2025-06-19 04:55:56'),
(373, 65, '2026-06-02', 'Finalizada', '2025-06-06 19:51:13', '2025-06-19 04:55:56'),
(374, 66, '2025-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(375, 66, '2026-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(376, 67, '2025-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(377, 67, '2026-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(378, 68, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(379, 68, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(380, 68, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(381, 69, '2025-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(382, 69, '2026-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(383, 69, '2027-01-06', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(384, 70, '2025-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(385, 70, '2026-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(386, 71, '2025-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13'),
(387, 71, '2026-06-02', 'Programada', '2025-06-06 19:51:13', '2025-06-06 19:51:13');

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
(9, 'Entregado a Almacen', 1),
(10, 'En espera de reparación', 0);

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
(991415565, 'as-56-as', 'piernera', 'image_Pierneras_Barrfab1.jpg', 2, '2025-06-04 05:05:02', '2025-06-04 05:05:02', 11112, 'b-25-3', 1, 9),
(991415566, '02-c', 'ELECTRODOS PRECORDIALES', 'image_Chest electrodes.jpg', 6, '2025-06-05 18:05:57', '2025-06-05 18:05:57', 11112, 'C3215', 1, 135),
(991415567, 'H8-OX-MON', 'Sensor oximetro completo HWA', 'image_OXIMETRO_COMPLETO_HWA.jpg', 1, '2025-06-05 21:29:59', '2025-06-05 21:29:59', 11131, 'h', 1, 25),
(991415568, 'C-AC-AM', 'Cable AC norma Americana', 'image_cable_AC_Americana.jpg', 1, '2025-06-05 21:33:14', '2025-06-05 21:33:14', 11112, 'Cable AC', 1, 135),
(991415569, 'C-AC-SC', 'Cable AC norma Schuko', 'image_cable_schuko.jpg', 1, '2025-06-05 21:33:48', '2025-06-05 21:33:48', 11112, 'Cable AC', 1, 135),
(991415570, 'C-ECG-5-HW', 'Cable ECG 5 vías HWA', 'image_Cable ECG_5_HWATime.jpeg', 1, '2025-06-05 21:36:50', '2025-06-05 21:36:50', 11131, 'cable ecg 5', 1, 25),
(991415571, 'F-M-Q-V', 'FUENTE DE ALIMENTACIÓN MONITOR', 'image_fuente_spacelabs.jpg', 1, '2025-06-15 03:29:01', '2025-06-15 03:29:01', 11112, '119-0480-00-20', 1, 46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stoporder`
--

CREATE TABLE `stoporder` (
  `id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `punctuation` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stoporder`
--

INSERT INTO `stoporder` (`id`, `description`, `punctuation`) VALUES
(1, 'Gestión de compra', 0),
(2, 'No hay presupuesto', 0),
(3, 'Equipo obsoleto', 0),
(4, 'Proveedor sin repuestos', 0),
(5, 'Ninguna', 0);

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
(4, 'Diagnostico', 0),
(5, 'Preventivo', 0);

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
(184, '1', '4', '2025-06-14 17:35:16', '2025-06-14 17:35:16'),
(185, '1', '4', '2025-06-14 17:35:54', '2025-06-14 17:35:54'),
(186, '1', '4', '2025-06-14 17:37:05', '2025-06-14 17:37:05'),
(187, '1', '4', '2025-06-14 17:38:40', '2025-06-14 17:38:40'),
(188, '1', '11', '2025-06-14 17:41:25', '2025-06-14 17:41:25'),
(189, '1', '24', '2025-06-14 17:41:43', '2025-06-14 17:41:43'),
(190, '1', '24', '2025-06-14 17:42:30', '2025-06-14 17:42:30'),
(191, '1', '11', '2025-06-14 17:43:20', '2025-06-14 17:43:20'),
(192, '1', '24', '2025-06-14 17:43:48', '2025-06-14 17:43:48'),
(193, '1', '11', '2025-06-14 17:44:00', '2025-06-14 17:44:00'),
(194, '1', '4', '2025-06-14 17:44:15', '2025-06-14 17:44:15'),
(195, '1', '4', '2025-06-14 17:44:33', '2025-06-14 17:44:33'),
(196, '1', '24', '2025-06-14 17:45:13', '2025-06-14 17:45:13'),
(197, '1', '11', '2025-06-14 17:45:43', '2025-06-14 17:45:43'),
(198, '1', '72', '2025-06-14 18:00:28', '2025-06-14 18:00:28'),
(199, '1', '11', '2025-06-14 18:01:06', '2025-06-14 18:01:06'),
(200, '1', '72', '2025-06-14 18:02:25', '2025-06-14 18:02:25'),
(201, '1', '72', '2025-06-14 18:02:43', '2025-06-14 18:02:43'),
(202, '1', '72', '2025-06-14 18:03:12', '2025-06-14 18:03:12'),
(203, '1', '72', '2025-06-14 18:07:11', '2025-06-14 18:07:11'),
(204, '1', '4', '2025-06-14 18:07:36', '2025-06-14 18:07:36'),
(205, '1', '72', '2025-06-14 18:07:48', '2025-06-14 18:07:48'),
(206, '1', '11', '2025-06-14 18:08:00', '2025-06-14 18:08:00'),
(207, '1', '72', '2025-06-14 18:08:06', '2025-06-14 18:08:06'),
(208, '1', '72', '2025-06-14 18:08:17', '2025-06-14 18:08:17'),
(209, '1', '4', '2025-06-14 18:09:48', '2025-06-14 18:09:48'),
(210, '1', '11', '2025-06-14 18:10:18', '2025-06-14 18:10:18'),
(211, '1', '11', '2025-06-14 18:10:41', '2025-06-14 18:10:41'),
(212, '1', '23', '2025-06-14 18:11:05', '2025-06-14 18:11:05'),
(213, '1', '72', '2025-06-14 18:11:28', '2025-06-14 18:11:28'),
(214, '1', '4', '2025-06-14 18:14:02', '2025-06-14 18:14:02'),
(215, '1', '11', '2025-06-14 18:14:37', '2025-06-14 18:14:37'),
(216, '1', '23', '2025-06-14 18:15:10', '2025-06-14 18:15:10'),
(217, '1', '15', '2025-06-14 18:22:21', '2025-06-14 18:22:21'),
(218, '1', '72', '2025-06-14 18:22:52', '2025-06-14 18:22:52'),
(219, '1', '6', '2025-06-14 18:26:27', '2025-06-14 18:26:27'),
(220, '1', '6', '2025-06-15 01:38:06', '2025-06-15 01:38:06'),
(221, '1', '1', '2025-06-15 01:38:35', '2025-06-15 01:38:35'),
(222, '1', '15', '2025-06-15 01:38:55', '2025-06-15 01:38:55'),
(223, '1', '23', '2025-06-15 01:39:15', '2025-06-15 01:39:15'),
(224, '1', '17', '2025-06-15 01:40:25', '2025-06-15 01:40:25'),
(225, '1', '6', '2025-06-15 01:59:12', '2025-06-15 01:59:12'),
(226, '1', '6', '2025-06-15 02:02:27', '2025-06-15 02:02:27'),
(227, '1', '6', '2025-06-15 02:02:51', '2025-06-15 02:02:51'),
(228, '1', '6', '2025-06-15 02:03:05', '2025-06-15 02:03:05'),
(229, '1', '1', '2025-06-15 02:11:06', '2025-06-15 02:11:06'),
(230, '1', '6', '2025-06-15 02:14:41', '2025-06-15 02:14:41'),
(231, '1', '1', '2025-06-15 02:27:13', '2025-06-15 02:27:13'),
(232, '1', '23', '2025-06-15 02:30:25', '2025-06-15 02:30:25'),
(233, '1', '23', '2025-06-15 02:39:03', '2025-06-15 02:39:03'),
(234, '1', '6', '2025-06-15 02:43:18', '2025-06-15 02:43:18'),
(235, '1', '6', '2025-06-15 02:44:53', '2025-06-15 02:44:53'),
(236, '1', '23', '2025-06-15 02:46:16', '2025-06-15 02:46:16'),
(237, '1', '1', '2025-06-15 02:47:06', '2025-06-15 02:47:06'),
(238, '1', '23', '2025-06-15 02:47:18', '2025-06-15 02:47:18'),
(239, '1', '23', '2025-06-15 03:09:56', '2025-06-15 03:09:56'),
(240, '1', '23', '2025-06-15 03:10:19', '2025-06-15 03:10:19'),
(241, '1', '23', '2025-06-15 03:10:45', '2025-06-15 03:10:45'),
(242, '1', '6', '2025-06-15 03:10:57', '2025-06-15 03:10:57'),
(243, '1', '1', '2025-06-15 03:11:14', '2025-06-15 03:11:14'),
(244, '1', '17', '2025-06-15 03:11:37', '2025-06-15 03:11:37'),
(245, '1', '6', '2025-06-15 03:11:52', '2025-06-15 03:11:52'),
(246, '1', '23', '2025-06-15 03:12:01', '2025-06-15 03:12:01'),
(247, '1', '6', '2025-06-15 03:15:23', '2025-06-15 03:15:23'),
(248, '1', '23', '2025-06-15 04:55:41', '2025-06-15 04:55:41'),
(249, '1', '6', '2025-06-15 04:56:03', '2025-06-15 04:56:03'),
(250, '1', '17', '2025-06-15 04:56:14', '2025-06-15 04:56:14'),
(251, '1', '17', '2025-06-15 04:57:07', '2025-06-15 04:57:07'),
(252, '1', '23', '2025-06-15 04:57:17', '2025-06-15 04:57:17'),
(253, '1', '23', '2025-06-15 05:04:37', '2025-06-15 05:04:37'),
(254, '1', '23', '2025-06-15 05:05:22', '2025-06-15 05:05:22'),
(255, '1', '23', '2025-06-15 05:05:43', '2025-06-15 05:05:43'),
(256, '1', '23', '2025-06-15 05:08:49', '2025-06-15 05:08:49'),
(257, '1', '17', '2025-06-15 05:08:59', '2025-06-15 05:08:59'),
(258, '1', '6', '2025-06-15 07:39:50', '2025-06-15 07:39:50'),
(259, '1', '6', '2025-06-15 07:40:09', '2025-06-15 07:40:09'),
(260, '1', '6', '2025-06-15 07:40:39', '2025-06-15 07:40:39'),
(261, '1', '6', '2025-06-15 07:41:02', '2025-06-15 07:41:02'),
(262, '1', '6', '2025-06-15 07:41:16', '2025-06-15 07:41:16'),
(263, '1', '1', '2025-06-15 07:41:29', '2025-06-15 07:41:29'),
(264, '1', '1', '2025-06-15 08:10:58', '2025-06-15 08:10:58'),
(265, '1', '23', '2025-06-15 08:12:39', '2025-06-15 08:12:39'),
(266, '1', '6', '2025-06-17 20:56:37', '2025-06-17 20:56:37'),
(267, '1', '6', '2025-06-17 21:04:33', '2025-06-17 21:04:33'),
(268, '1', '6', '2025-06-17 21:04:55', '2025-06-17 21:04:55'),
(269, '1', '1', '2025-06-18 22:04:14', '2025-06-18 22:04:14'),
(270, '1', '6', '2025-06-18 22:04:27', '2025-06-18 22:04:27'),
(271, '1', '23', '2025-06-18 22:04:35', '2025-06-18 22:04:35'),
(272, '1', '72', '2025-06-18 22:04:54', '2025-06-18 22:04:54'),
(273, '1', '1', '2025-06-18 22:05:35', '2025-06-18 22:05:35'),
(274, '1', '1', '2025-06-18 23:57:08', '2025-06-18 23:57:08'),
(275, '1', '1', '2025-06-19 00:00:02', '2025-06-19 00:00:02');

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
  `id_RepairStage` int DEFAULT NULL,
  `id_stopOrder` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `workorders`
--

INSERT INTO `workorders` (`Code`, `StartDate`, `EndDate`, `Description`, `Cost`, `Priority`, `createdAt`, `updatedAt`, `ClinicalEnginnerDSSN`, `EquipmentCode`, `Solution`, `Workdate`, `id_typeW`, `id_StopReason`, `id_RepairStage`, `id_stopOrder`) VALUES
(15, '2025-06-03T14:02', '2025-06-04T14:02', 'ruptura de sensor de capnografia', 626.80, 'High', '2025-06-04 07:42:28', '2025-06-05 14:28:03', 6458161, 41, 'se compró un sensor nuevo', '2025-06-04', 5, 4, 4, NULL),
(16, '2025-06-09T14:02', '2025-06-10T14:02', 'Falla de pantalla', 0.00, 'Medium', '2025-06-10 03:22:54', '2025-06-13 07:10:42', 6458161, 3, 'Se cambio la pantalla por el proveedor', '2025-06-09T17:09', 1, 2, 8, 5),
(17, '2025-06-09T14:02', '2025-06-12T02:00', 'PRUEBA', 0.00, 'Low', '2025-06-11 04:01:00', '2025-06-11 04:02:06', 6458161, 1, 'si, se cambio...', '2025-06-09T15:04', 1, 2, 8, NULL),
(18, '2025-06-09T08:30', '2025-06-09T14:30', 'ESTUDIO DE CABEZA SE DETIENE', 0.00, 'High', '2025-06-12 19:47:59', '2025-06-12 19:49:09', 6458161, 72, 'CAMBIO DE TRANSCEIVERS EN ICE JO2 Y DPP1 J9', '2025-06-09T08:30', 1, 2, 6, NULL),
(19, '2025-04-21T08:30', '2025-04-21T17:00', 'EQUIPO NO FUNCIONA', 0.00, 'High', '2025-06-12 19:54:37', '2025-06-12 19:54:37', 6458161, 72, '', '', 1, 2, 6, NULL),
(20, '2025-04-14T08:30', '2025-04-14T16:30', 'SCAN STOPPED DUE TO ERROR RECEIVER', 0.00, 'High', '2025-06-12 19:57:25', '2025-06-12 19:57:25', 6458161, 72, '', '', 1, 2, 6, NULL),
(21, '2025-04-18T12:30', '2025-04-18T16:30', 'TRACKBALL 1 Y 2 NO FUNCIONAN', 0.00, 'High', '2025-06-12 20:01:50', '2025-06-12 20:01:50', 6458161, 72, '', '', 1, 2, 6, NULL),
(22, '2025-03-06T08:30', '2025-03-06T09:00', 'CONFIGURACION DE WORKLIST', 0.00, 'Medium', '2025-06-12 20:03:34', '2025-06-12 20:03:34', 6458161, 72, '', '', 2, 4, 6, NULL),
(23, '2024-12-19T14:00', '2024-12-19T16:00', 'SIN MOVIMIENTO DE PUNTERO', 0.00, 'High', '2025-06-12 20:13:22', '2025-06-12 20:13:22', 6458161, 72, '', '', 1, 2, 4, NULL),
(24, '2024-12-24T11:00', '2024-12-24T12:00', 'BAJO CAUDAL DE COMPRESOR', 0.00, 'Medium', '2025-06-12 20:14:09', '2025-06-12 20:14:09', 6458161, 72, '', '', 2, 2, 6, NULL),
(25, '2024-11-05T15:30', '2024-11-05T17:30', 'POSICION DE HOME DE MESA CON DESFASE', 0.00, 'Medium', '2025-06-12 20:14:52', '2025-06-12 20:14:52', 6458161, 72, '', '', 1, 2, 6, NULL),
(26, '2024-10-04T15:30', '2024-10-04T16:30', 'NO SE PUEDE CORRER LA CALIBRACION CUSHIN', 0.00, 'Medium', '2025-06-12 20:16:35', '2025-06-12 20:16:35', 6458161, 72, '', '', 1, 2, 6, NULL),
(27, '2025-09-30T16:00', '2025-09-30T17:00', 'CONFIGURACION DE WORKLIST', 0.00, 'Low', '2025-06-12 20:20:05', '2025-06-12 20:20:05', 6458161, 72, '', '', 6, 4, 6, NULL),
(28, '2024-12-10T08:30', '2024-12-10T09:00', 'GANTRY NO ENCIENDE', 0.00, 'High', '2025-06-12 20:23:08', '2025-06-12 20:23:08', 6458161, 72, '', '', 1, 2, 6, NULL),
(29, '2024-06-22T09:30', '2024-06-22T13:45', 'MENSAJE FALTA DE ESPACIO EN APPLICATION SYSTEM DISK', 0.00, 'High', '2025-06-12 20:24:32', '2025-06-12 20:24:32', 6458161, 72, '', '', 1, 2, 6, NULL),
(30, '2024-07-26T14:00', '2024-07-26T18:15', 'DIAGNOSTICO', 0.00, 'Medium', '2025-06-12 20:25:57', '2025-06-12 20:25:57', 6458161, 72, '', '', 7, 2, 6, NULL),
(31, '2024-08-15T17:00', '2024-08-15T18:00', 'CONFIGURACION', 0.00, 'Low', '2025-06-12 20:27:15', '2025-06-12 20:27:15', 6458161, 72, '', '', 6, 4, 6, NULL),
(32, '2024-08-02T15:00', '2024-08-02T17:30', 'DIAGNOSTICO', 0.00, 'Low', '2025-06-12 20:27:57', '2025-06-12 20:27:57', 6458161, 72, '', '', 7, 4, 6, NULL),
(33, '2024-05-16T08:45', '2024-05-16T09:45', 'CAUDAL DE AGUA AL LIMITE', 0.00, 'Medium', '2025-06-12 20:29:10', '2025-06-12 20:29:10', 6458161, 72, '', '', 1, 2, 6, NULL),
(34, '2025-04-24T16:00', '2025-04-24T18:00', 'FALLO MAGNET MONITOR', 0.00, 'High', '2025-06-12 20:29:51', '2025-06-12 20:29:51', 6458161, 72, '', '', 1, 2, 6, NULL),
(35, '2024-04-10T15:30', '2024-04-10T16:30', 'BOBINA DE HOMBRO CON VALORES INCORRECTOS', 0.00, 'Medium', '2025-06-12 20:32:53', '2025-06-12 20:32:53', 6458161, 72, '', '', 1, 2, 6, NULL),
(36, '2024-04-09T08:30', '2024-04-09T09:00', 'MAGNET MONITOR NO ENCIENDE', 0.00, 'High', '2025-06-12 20:33:29', '2025-06-12 20:33:29', 6458161, 72, '', '', 1, 2, 6, NULL),
(37, '2024-03-05T09:03', '2024-03-05T12:05', 'NO HAY RAYOS X', 0.00, 'Medium', '2025-06-12 20:34:30', '2025-06-12 20:34:30', 6458161, 72, '', '', 1, 2, 6, NULL),
(38, '2024-02-29T13:00', '2024-02-29T14:00', 'MCQA PRESENTA FALLO CANAL 4', 0.00, 'High', '2025-06-12 20:35:18', '2025-06-12 20:35:18', 6458161, 72, '', '', 1, 2, 6, NULL),
(44, '2025-06-13T03:43', '2025-06-13T03:43', 'Telegram 3', 0.00, 'Low', '2025-06-13 07:43:30', '2025-06-13 07:43:30', 24697, 8, '', '', 1, 2, 1, 5),
(45, '2025-06-13T03:55', '2025-06-13T03:56', 'PRUEBA DE GRUPO', 0.00, 'Low', '2025-06-13 07:55:19', '2025-06-13 07:55:19', 6458161, 10, '', '', 1, 2, 1, 5),
(46, '2025-06-13T14:52', '2025-06-13T14:52', 'Tele medical', 0.00, 'Low', '2025-06-13 18:52:38', '2025-06-13 18:52:38', 454567, 23, '', '', 7, 2, 1, 5),
(47, '2025-06-16T15:45', '2025-06-17T15:45', 'PARA REVISION', 0.00, 'Low', '2025-06-16 19:46:20', '2025-06-16 19:46:20', 6458161, 42, '', '', 7, 4, 1, 5),
(48, '2025-06-17T16:57', '2025-06-18T22:57', 'PRUEBA', 0.00, 'Medium', '2025-06-17 20:59:03', '2025-06-17 20:59:03', 6458161, 6, '', '', 1, 1, 1, 5),
(49, '2025-06-18T19:57', '2025-06-19T19:57', 'prueba pre defensa', 0.00, 'Medium', '2025-06-18 23:57:32', '2025-06-18 23:57:32', 24697, 1, '', '', 1, 2, 1, 5);

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
  ADD PRIMARY KEY (`DSSN`);

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
-- Indices de la tabla `stoporder`
--
ALTER TABLE `stoporder`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `fk_workorders_repairstage` (`id_RepairStage`),
  ADD KEY `fk_workorders_stopOrder` (`id_stopOrder`);

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
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11133;

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT de la tabla `breakdowns`
--
ALTER TABLE `breakdowns`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `IdCat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `dialyinspections`
--
ALTER TABLE `dialyinspections`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `insuranceequipment`
--
ALTER TABLE `insuranceequipment`
  MODIFY `id_Insurance` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maintenances`
--
ALTER TABLE `maintenances`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `models`
--
ALTER TABLE `models`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `nameequipment`
--
ALTER TABLE `nameequipment`
  MODIFY `id_nameE` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT de la tabla `ordertype`
--
ALTER TABLE `ordertype`
  MODIFY `id_typeW` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ppmquestions`
--
ALTER TABLE `ppmquestions`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ppms`
--
ALTER TABLE `ppms`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `preventivetasks`
--
ALTER TABLE `preventivetasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=388;

--
-- AUTO_INCREMENT de la tabla `receptionstatus`
--
ALTER TABLE `receptionstatus`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `repairstage`
--
ALTER TABLE `repairstage`
  MODIFY `id_Stage` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `spareparts`
--
ALTER TABLE `spareparts`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=991415572;

--
-- AUTO_INCREMENT de la tabla `stoporder`
--
ALTER TABLE `stoporder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `stopreason`
--
ALTER TABLE `stopreason`
  MODIFY `id_Reason` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tagnotifications`
--
ALTER TABLE `tagnotifications`
  MODIFY `id_tagn` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT de la tabla `workorders`
--
ALTER TABLE `workorders`
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `breakdowns`
--
ALTER TABLE `breakdowns`
  ADD CONSTRAINT `breakdowns_ibfk_1` FOREIGN KEY (`EquipmentCode`) REFERENCES `equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_workorders_stopOrder` FOREIGN KEY (`id_stopOrder`) REFERENCES `stoporder` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_workorders_stopreason` FOREIGN KEY (`id_StopReason`) REFERENCES `stopreason` (`id_Reason`),
  ADD CONSTRAINT `workorders_ibfk_1` FOREIGN KEY (`ClinicalEnginnerDSSN`) REFERENCES `clinicalenginners` (`DSSN`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `workorders_ibfk_2` FOREIGN KEY (`EquipmentCode`) REFERENCES `equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
