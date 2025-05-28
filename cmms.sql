-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2025 a las 08:33:41
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
(6, 'Leasing');

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
(11111, 'El Flwa', 'junin ecuador', 2235651272, 'Fal_med@elfalwa.com', '', '2020-05-21 18:12:28', '2020-05-21 18:12:28'),
(11112, 'HP Medical', 'roca y coronado 2do y 3er anillo, SCZ', 222687712, 'null@gmail.com', '', '2020-05-21 18:15:03', '2020-05-21 18:17:11'),
(11113, 'Gesca', '45 la salle, SCZ', 223919696, 'info@gesca.com', '', '2020-05-21 18:16:55', '2020-05-21 18:16:55'),
(11114, 'Medical Techology for Trading', '16 El Khartom st,Masr El Gdeda,Cairo', 1001908922, 'null@gmail.com', '', '2020-05-21 18:20:12', '2020-05-21 18:20:12'),
(11115, 'Servomed', 'Sheraton El Matar , Cairo', 222680940, 'servomed@link.net', '', '2020-05-21 18:21:44', '2020-05-21 18:21:44'),
(11116, 'Ghalioungui', 'El Kods Mosque , El Ebagya ,Cairo', 1001703154, 'mail@ghalioungui.com', '', '2020-05-21 18:23:56', '2020-05-21 18:23:56'),
(11117, 'New Technology', '39 El Shahed Abd El Monem Hafz st, ALmaza ,Cairo', 223902736, 'New_technology45@yahoo.com', '', '2020-05-21 18:25:56', '2020-05-21 18:25:56'),
(11118, 'General Electric', ' 14 Elmaza st ,Masr El Gdeda ,Cairo', 227267511, 'null@gmail.com', '', '2020-05-21 18:53:36', '2020-05-21 18:53:36'),
(11119, 'Intermed Hospital', '15 El Sheikh Ali Mahmoud , Masr El Gdeda , Cairo', 226441554, 'null@gmail.com', '', '2020-05-21 18:54:38', '2020-05-21 18:54:38'),
(11120, 'Mindray', '11 Mohamed metwally Imam st ,El Amerya ,Cairo', 222691046, 'service@mindray.com', '', '2020-05-21 18:56:27', '2020-05-21 18:56:27'),
(11121, 'CX-Medical', '28 Mokhles El Alphy st,Nasr City ,Cairo', 224048410, 'cxmedical@gmailc.om', '', '2020-05-21 18:58:41', '2020-05-21 18:58:41'),
(11122, 'Philips', 'C13, CFC Business Park, Cairo ', 233312726, 'null@gmail.com', '', '2020-05-21 18:59:41', '2020-05-21 18:59:41'),
(11123, 'The Medical Trade', '15 Mostafa Kamel st,Cairo', 222687714, 'null@gmail.com', '', '2020-05-21 19:00:36', '2020-05-21 19:00:36'),
(11124, 'Technoscientific', '178 Ter3a El zomr , El Haram ,Giza', 235734687, 'sales@technoscientific.net', '', '2020-05-21 19:01:49', '2020-05-21 19:01:49'),
(11125, 'El Fanar Medical Center', ' 29 Italian Hospital st ,ALex', 34253062, 'null@gmail.com', '', '2020-05-21 19:02:53', '2020-05-21 19:02:53'),
(11126, 'MD Medical Suppliers', 'Nasr City ,Cairo', 222756545, 'null@gmail.com', '', '2020-05-21 19:05:13', '2020-05-21 19:05:13'),
(11127, 'Techno Ray ', '126 El Seka EL Hadid st , El Nozha , Cairo', 22468968, 'trabie@med-technology.net', '', '2020-05-21 19:07:51', '2020-05-21 19:07:51'),
(11128, 'Delta Office', '2 El Sloly st Garden City, Cairo', 227956669, 'null@gmail.com', '', '2020-05-21 19:08:54', '2020-05-21 19:08:54'),
(11129, 'International Company for Medical Equipment ', '24 Gam3a Eldol st,Giza ', 233050795, 'info@icme.com.eg', '', '2020-05-21 19:10:51', '2020-05-21 19:10:51'),
(11130, 'El Kan Medical', '1 Wady El Nile  , El Agoza ,Giza', 233043511, 'alkanmedical@alkan.com', '', '2020-05-21 19:12:11', '2020-05-21 19:12:11');

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

--
-- Volcado de datos para la tabla `breakdowns`
--

INSERT INTO `breakdowns` (`Code`, `Reason`, `DATE`, `createdAt`, `updatedAt`, `EquipmentCode`) VALUES
(44, 'Fallo canal 1 ', '2024-10-30', '2024-10-31 03:31:07', '2024-10-31 03:31:07', 531),
(45, 'Pantalla: Err 25-5-48 touchscreen fail', '2025-05-18', '2025-05-18 19:05:59', '2025-05-18 19:05:59', 23454321),
(46, 'Equipo con encendido intermitente', '2025-05-26', '2025-05-27 16:47:18', '2025-05-27 16:47:18', 23454321);

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
(24697, 'Omar', 'Garrido', 1125414586, 'Omar.jpeg', 22, 'omarzaher787@gmail.com', 'medical center', 7, '$2a$10$o9/wxciC2gi1oLzTe.LCtegbaP8aRR8reY702WJrUbmc9b3dIxI66', '2020-05-23 02:59:14', '2020-05-23 13:49:14', 3456),
(31098, 'Sara', 'Adel', 1120592405, 'image_sara.jpeg', 21, 'sarahadel540@gmail.com', '15 May City', 8, '$2a$10$n9BqUSxMIs.uiQLP2Bhp3OJJ2e2JPfa0W6CIrKIF4XB2.d98igTs6', '2020-05-23 05:19:11', '2020-05-25 13:17:01', 7686),
(6458161, 'Valeria', 'Toro', 77431131, 'image_DSC_9463 (Copiar).jpg', 26, 'valeriatorovargas531@gmail.com', 'sevilla2', 8, '$2a$10$eBru2lMXYeitp/MTdrNUM.7SVZYtHCHpf7hubZFzMU5RZxTGvvhlW', '2024-08-09 20:57:24', '2024-08-09 20:57:24', 7686),
(29151719, 'Rawan', 'Sayed', 1210004644, 'image_Rawan.jpeg', 21, 'rawansayed2021@gmail.com', '6 October Street  Zahraa Nasr City', 8, '$2a$10$SEUBJeUSrX47p0e7fUxMBek46h1YINuMPlhotVthSZO0NliFMi2wm', '2020-05-23 02:15:56', '2020-05-23 02:15:56', 9119),
(9921050746980, 'Remon', 'Albear', 1121963376, 'image_remon profile.jpg', 21, 'remonalbear522@gmail.com', '5 marzok shokry st giza', 8, '$2a$10$SqBzUGUAz1fLF.rsiU09N.b08FhgIJaLMtA78op8s/tZePEGEXUk.', '2020-05-21 18:03:56', '2020-05-25 13:17:11', 1010),
(29809090102359, 'Salma', 'Ayman', 1120448157, 'image_IMG_20190318_154724_250.JPG', 21, 'soayman9@gmail.com', '15 Azam Mosque', 9, '$2a$10$Q1iScIY0CUR2OMTV2VZFX.v37oSZ2K023v8iSKL6vgfBuxk0c2NEK', '2020-05-23 13:33:26', '2020-05-23 13:33:26', 9119);

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
(1010, 'CSSD', 'First floor', '2020-05-21 18:01:44', '2020-05-21 18:01:44'),
(3456, 'ICU', 'Second Floor', '2020-05-21 18:00:06', '2020-05-21 18:00:06'),
(7686, 'Radiology', 'Ground floor', '2020-05-21 18:01:04', '2020-05-21 18:01:04'),
(9119, 'OR', 'Third Floor', '2020-05-21 18:00:25', '2020-05-21 18:00:25');

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
(2, '2020-02-04', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', '2020-05-23 18:52:57', '2020-05-23 18:52:57', 781396, 9921050746980),
(3, '2024-08-10', 'on', 'off', 'on', 'off', 'on', 'off', 'on', 'off', '2024-08-10 14:25:11', '2024-08-10 14:25:11', 12220, 6458161),
(4, '2024-08-23', 'on', 'on', 'off', 'on', 'on', 'on', 'off', 'off', '2024-08-23 14:38:20', '2024-08-23 14:38:20', 61242056, 6458161),
(5, '2024-10-18', 'on', 'on', 'on', 'off', 'on', 'off', 'on', 'on', '2024-10-18 14:47:39', '2024-10-18 14:47:39', 1050023, 6458161),
(6, '2024-10-29', 'on', 'on', 'off', 'on', 'off', 'on', 'off', 'on', '2024-10-30 03:36:24', '2024-10-30 03:36:24', 531, 6458161),
(7, '2024-11-23', 'on', 'on', 'off', 'off', 'off', 'off', 'on', 'on', '2024-11-23 14:44:45', '2024-11-23 14:44:45', 1222222, 6458161),
(8, '2024-11-23', 'on', 'on', 'on', 'on', 'on', 'on', 'off', 'off', '2024-11-23 16:06:48', '2024-11-23 16:06:48', 12269856, 6458161),
(9, '2024-11-23', 'on', 'off', 'on', 'on', 'off', 'off', 'off', 'off', '2024-11-23 17:11:08', '2024-11-23 17:11:08', 531, 6458161);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipment`
--

CREATE TABLE `equipment` (
  `Code` int NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cost` bigint NOT NULL,
  `Model` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `SerialNumber` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `InstallationDate` date NOT NULL,
  `ArrivalDate` date NOT NULL,
  `WarrantyTime` int DEFAULT NULL,
  `AssetInitialDate` date DEFAULT NULL,
  `InsuranceInitialDate` date DEFAULT NULL,
  `Manufacturer` text COLLATE utf8mb4_general_ci,
  `Location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `PM` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
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
  `Maintenance_Req` int NOT NULL,
  `GE` int DEFAULT '0',
  `AcquisitionTypeID` int DEFAULT NULL,
  `WarrantyDate` date DEFAULT NULL,
  `NameEquipmentId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipment`
--

INSERT INTO `equipment` (`Code`, `Name`, `Image`, `Cost`, `Model`, `SerialNumber`, `InstallationDate`, `ArrivalDate`, `WarrantyTime`, `AssetInitialDate`, `InsuranceInitialDate`, `Manufacturer`, `Location`, `PM`, `Notes`, `createdAt`, `updatedAt`, `AgentSupplierId`, `DepartmentCode`, `Software`, `SoftwareVersion`, `SoftwarePass`, `NetworkAddress`, `AssetStatus`, `InsuranceStatus`, `FuntionalStatus`, `ReceptionStatusId`, `Active`, `F_record`, `Maintenance_Req`, `GE`, `AcquisitionTypeID`, `WarrantyDate`, `NameEquipmentId`) VALUES
(1, 'PRUEBAMIERCOLES', 'image_ElevateCard.png', 5632, '4008s', '255k', '2025-05-28', '2025-05-28', NULL, NULL, NULL, 'Eppendorf', 'A2', 'Semestral', '', '2025-05-28 08:32:40', '2025-05-28 08:32:40', 11128, 2, 'No', '', '', '', 'Activo', 'Activo', 'Sin Consumible', 2, 1, -1, 0, 0, 2, '2027-06-16', 4),
(375, 'Lithotrispy', 'image_Lithotripsy SPHINIX 30 LITHO.jpg', 236823, '30 Litho', '375', '2020-02-21', '2020-02-21', NULL, NULL, NULL, 'SPHINIX', 'Room 25', 'Anual', '', '2020-05-21 19:42:58', '2024-08-09 21:06:25', 11118, 9119, '0', '', '', '', '', '', '', NULL, 1, 0, 0, 5, NULL, NULL, 7),
(531, 'holter', 'image_YR02197-YR02062-YR02063-IMG.jpg', 6000, 'eccosur', '53-5236-24', '2024-04-20', '2024-04-20', NULL, NULL, NULL, 'ekosur', 'cardiologia', 'Semestral', '', '2024-09-24 02:42:18', '2024-11-07 18:53:21', 11124, 9119, '0', '', '', '', '', '', '', NULL, 1, 0, 3, 0, NULL, NULL, 4),
(12220, 'Mammography', 'image_Mammography GE Performa.jpg', 85650, 'Performa M Gf 110', '12220', '2019-06-19', '2019-05-28', NULL, NULL, NULL, 'GE', 'Room 9', 'Anual', '', '2020-05-21 19:40:14', '2020-05-21 19:40:14', 11118, 7686, '0', '', '', '', '', '', '', NULL, 1, 0, 5, 0, NULL, NULL, 7),
(69690, 'Desitometry', 'image_Densitometry GE Prodigy.jpg', 205170, 'Prodigy', '69690', '2019-11-05', '2019-11-05', NULL, NULL, NULL, 'GE', 'Room 16A', 'Anual', '', '2020-05-21 19:32:47', '2024-11-07 18:53:33', 11127, 7686, '0', '', '', '', '', '', '', NULL, 1, 0, 5, 0, NULL, NULL, 8),
(69891, 'CT-Scan', 'image_CT-scan GE Lightspeed Ultra advantage.png', 1578820, 'Lightspeed Ultra advantage', '', '2019-06-16', '2019-06-16', NULL, NULL, NULL, 'GE', 'Room 15', 'Anual', '', '2020-05-21 19:35:32', '2024-11-07 18:53:42', 11118, 9119, '0', '', '', '', '', '', '', NULL, 1, 0, 5, 0, NULL, NULL, 7),
(656565, 'Maquina de anestesia', 'image_qrcode-generado.png', 35000, 'Spacelabs', 'gdfgrdgdrg', '2025-03-07', '2025-03-01', NULL, NULL, NULL, 'Spacelabs', 'Qx1', 'Trimestral', '', '2025-03-03 22:06:05', '2025-03-03 22:06:05', 11111, 9119, 'No', '', '', '', 'Activo', 'Activo', 'Reparación', NULL, 1, 0, 2, 0, NULL, NULL, 17),
(712345, 'Infusion Pump', 'image_top-3300.jpg', 37000, '3300', 'FN60-7265', '2019-12-06', '2019-12-06', NULL, NULL, NULL, 'Top-3300', 'Room 12', 'Anual', '', '2020-05-21 18:38:56', '2024-11-07 18:53:52', 11111, 3456, '0', '', '', '', '', '', '', NULL, 1, 0, 2, 0, NULL, NULL, 9),
(781396, 'MRI', 'image_MRI philips INGENIA.jpg', 92002000, 'IGENIA', '781396', '2019-04-26', '2019-04-26', NULL, NULL, NULL, 'Philips', 'Room 1A', 'Semestral', '', '2020-05-21 19:23:16', '2024-11-07 18:54:15', 11122, 7686, '0', '', '', '', '', '', '', NULL, 1, 0, 5, 0, NULL, NULL, 7),
(1050023, 'holter', 'image_HolterHT103P_03-600x600-1.jpg', 7500, 'eccosur', '53-5236-26', '2023-02-07', '2023-02-07', NULL, NULL, NULL, 'ekosur', 'cardiologia', 'Anual', '', '2024-10-08 00:38:19', '2024-11-07 18:54:04', 11113, 9119, '0', '', '', '', '', '', '', NULL, 1, 0, 3, 0, NULL, NULL, 4),
(1222222, 'Maquina de anestesia', 'image_YR02197-YR02062-YR02063-IMG.jpg', 520000, 'Spacelabs', '1222222', '2024-09-18', '2024-09-18', NULL, NULL, NULL, 'Spacelabs', 'Qx2', 'Semestral', '', '2024-09-24 02:20:08', '2024-11-07 18:54:46', 11114, 9119, '0', '', '', '', '', '', '', NULL, 1, 0, 2, 0, NULL, NULL, 30),
(4573397, 'Ultrasound', 'image_Ultrasound Toshiba NEMIO SSA.550A.jpg', 227900, 'NEMIO_SSA.550A', 'L4573397', '2019-01-05', '2019-01-05', NULL, NULL, NULL, 'Toshiba', 'Room 22', 'Anual', '', '2020-05-21 19:26:34', '2024-11-07 18:54:57', 11114, 7686, '0', '', '', '', '', '', '', NULL, 1, 0, 5, 0, NULL, NULL, 21),
(8545678, 'holter', 'image_qrcode-generado.png', 36000, '4008s', '65465jgtfhh', '2025-03-14', '2025-03-07', NULL, NULL, NULL, 'Fresenius', 'Qx1', 'Semestral', '', '2025-03-07 22:08:55', '2025-03-07 22:08:55', 11111, 9119, 'Si', '', '', '', 'Activo', 'Activo', 'Funcionando', NULL, 1, 0, 3, 0, NULL, NULL, 11),
(12269856, 'monitor de signos vitales', 'image_monitor spacelabs.jpeg', 12000, 'qube', 'M65226-6556', '2024-11-08', '2024-10-18', NULL, NULL, NULL, 'Spacelabs', 'Qx1', 'Anual', '', '2024-11-23 03:42:55', '2024-11-23 03:42:55', 11125, 3456, '0', '', '', '', '', '', '', NULL, 1, 0, 4, 0, NULL, NULL, 34),
(20202025, 'ELECTROCARDIOGRAFO', 'image_images.jpeg', 12000, 'Spacelabs', '215256165151131', '2024-11-06', '2024-11-06', NULL, NULL, NULL, 'Spacelabs', 'cardiologia', 'Anual', '', '2024-11-06 21:46:31', '2024-11-07 18:56:07', 11120, 3456, '0', '', '', '', '', '', '', NULL, 1, 0, 3, 0, NULL, NULL, 4),
(23454321, 'PRUEBA', 'image_limpiezanihonkohden.PNG', 2000, 'PRUEBITA', 'WDEF4342', '2025-05-18', '2025-05-17', NULL, NULL, NULL, 'Fresenius', 'cardiologia', 'Anual', '', '2025-05-18 04:22:59', '2025-05-18 04:22:59', 11112, 7686, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 2, 5, 1, '2027-06-24', 8),
(61242056, 'CT-Scan', 'image_CT-scan Toshiba Aquilion one.jpg', 8784240, 'AquillionOne', '6AA1242056', '2019-07-01', '2019-07-01', NULL, NULL, NULL, 'Toshiba', 'Room 18', 'Anual', '', '2020-05-21 19:38:23', '2024-11-07 18:55:57', 11114, 7686, '0', '', '', '', '', '', '', NULL, 1, 0, 5, 0, NULL, NULL, 7),
(66666555, 'prueba', 'image_HolterHT103P_03-600x600-1.jpg', 650000, 'prueba', '65efsfwef', '2024-10-11', '2024-10-11', NULL, NULL, NULL, 'franeus', 'cardiologia', 'Semestral', '', '2024-10-11 14:24:37', '2024-11-07 18:55:43', 11111, 9119, '0', '', '', '', '', '', '', NULL, 1, 0, 4, 0, NULL, NULL, 16),
(82532024, 'Maquina de anestesia', 'image_YR02197-YR02062-YR02063-IMG.jpg', 0, 'Spacelabs', '82532024', '2024-09-23', '2024-09-23', NULL, NULL, NULL, 'Spacelabs', 'Qx1', 'Semestral', '', '2024-09-24 00:45:37', '2024-11-07 18:55:22', 11123, 9119, '0', '', '', '', '', '', '', NULL, 1, 0, 5, 0, NULL, NULL, 27),
(98995566, 'prueba13', 'image_WhatsApp Image 2024-06-11 at 23.32.40 (1).jpeg', 65666, 'mayo', '2025', '2025-05-13', '2025-05-12', NULL, NULL, NULL, 'Amer', 'cardiologia', 'Trimestral', '', '2025-05-13 20:44:56', '2025-05-13 20:44:56', 11112, 3456, 'No', '', '', '', 'Activo', 'Activo', 'Funcionando', 2, 1, 0, 3, 0, 1, '2028-11-24', 19),
(105002366, 'maquina de aferesis', 'image_aferesis_equipo.jpeg', 98000, 'z20', '5434364sef', '2024-10-11', '2024-10-11', NULL, NULL, NULL, 'franeus', 'Qx1', 'Semestral', '', '2024-10-11 14:17:19', '2024-11-07 18:55:32', 11111, 9119, '0', '', '', '', '', '', '', NULL, 1, 0, 5, 0, NULL, NULL, 3),
(564298763, 'holter', 'image_DiagramasActividades-Orden de trabajo.drawio (2).png', 96000, 'eccosur', '23-65899-366', '2025-03-07', '2025-03-01', NULL, NULL, NULL, 'ekosur', 'cardiologia', 'Anual', '', '2025-03-04 02:37:28', '2025-03-04 02:37:28', 11111, 3456, 'Si', '1.236.3', 'eccosur', '', 'Activo', 'Activo', 'Sin Consumible', NULL, 1, 0, 4, 2, NULL, NULL, 4),
(991415561, 'Ultrasound', 'image_Ultrasound Toshiba Nemio MX.jpg', 227900, 'NEMIO MX', '99A1415561', '2019-05-06', '2019-05-06', NULL, NULL, NULL, 'Toshiba', 'Room 23', 'Anual', '', '2020-05-21 19:30:33', '2024-11-07 18:55:13', 11114, 7686, '0', '', '', '', '', '', '', NULL, 1, 0, 5, 4, NULL, NULL, 6);

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

--
-- Volcado de datos para la tabla `equipmentspareparts`
--

INSERT INTO `equipmentspareparts` (`id_equipment`, `id_sparepart`, `createdAt`, `updatedAt`, `quantity`) VALUES
(1, 781229, '2025-05-28 08:32:40', '2025-05-28 08:32:40', 1),
(656565, 78155, '2025-03-03 22:06:05', '2025-03-03 22:06:05', 2),
(656565, 78226, '2025-03-03 22:06:05', '2025-03-03 22:06:05', 2),
(8545678, 5942, '2025-03-07 22:08:56', '2025-03-07 22:08:56', 1),
(8545678, 15541, '2025-03-07 22:08:56', '2025-03-07 22:08:56', 1),
(23454321, 79189, '2025-05-18 04:22:59', '2025-05-18 04:22:59', 1),
(98995566, 15541, '2025-05-13 20:44:57', '2025-05-13 20:44:57', 1),
(564298763, 44582, '2025-03-04 02:37:28', '2025-03-04 02:37:28', 1);

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

--
-- Volcado de datos para la tabla `maintenances`
--

INSERT INTO `maintenances` (`Id`, `StartDate`, `EndDate`, `Description`, `createdAt`, `updatedAt`, `BreakDownCode`, `ClinicalEnginnerDSSN`) VALUES
(13, '2024-10-30', '2024-10-30', 'fall pm', '2024-10-31 03:31:49', '2025-05-18 18:56:47', 44, 6458161),
(14, '2025-05-18', '2025-05-18', 'Se cambia la pantalla', '2025-05-18 19:06:21', '2025-05-18 19:07:52', 45, 6458161),
(15, '2025-05-24', '2025-05-27', 'cambiado el boton', '2025-05-27 16:47:46', '2025-05-27 16:47:46', 46, 6458161);

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
(40, 'DC-30', 35);

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
(1, 'Examine todas las conexiones de los componentes para verificar su ajuste.', 'Examine las superficies de las unidades en busca de daños en el barniz y raspaduras.', 'Examine todas las partes en busca de daños de transporte, depresiones, desgarros o roturas.', 'Examine todos los cables y conectores en busca de daños externos.', 'Controle que todos los dispositivos de seguridad mecánicos estén en la posición prescrita.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 375),
(2, 'Asegúrese de que los conectores, cables del paciente y palas no estén dañados ni vencidos.', 'Asegúrese de que la tarjeta de memoria esté insertada en el dispositivo y tenga suficiente capacidad de almacenamiento.', 'Conecte el dispositivo a una fuente de alimentación externa y verifique que el indicador correspondiente en el panel frontal esté iluminado.', 'Verifique que el grabador tenga papel y que imprima correctamente.', 'Verifique que la batería esté cargada y que no presente signos de daño.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 531),
(3, 'Verifique el cable de alimentación cada vez que se use el generador.', 'Verifique la corriente de fuga de alta frecuencia monopolar y bipolar.', 'Verifique la salida de los modos de corte.', 'Verifique la salida de los modos de coagulación.', 'Verifique los fusibles a reemplazar si el generador dejó de funcionar.', '2019-12-22 07:44:22', '2019-12-22 06:27:36', 12220),
(4, 'Verificación operativa del ventilador del techo del gantry.', 'Comprobación de que la unidad giratoria esté firmemente asegurada.', 'Verificación de voltaje de la fuente de alimentación de CC de la consola.', 'Comprobación de interferencias en los cables dentro de la camilla.', 'Lubricación del engranaje de movimiento vertical de la camilla.', '2019-12-22 06:27:36', '2019-12-22 07:44:22', 69891),
(5, 'Verifique la Capa de Media Valor (HVL) del tubo.', 'Verifique la medición del grosor del seno del gantry.', 'Verifique la colimación correcta.', 'Verifique los botones de parada de emergencia del gantry.', 'Verifique la impresora DICOM.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 1222222),
(6, 'Inspección y ajuste de la potencia de salida de radiofrecuencia (RF).', 'Inspección de la calibración del gradiente.', 'Realización de una prueba de bobina de superficie rotacional.', 'Comprobación del funcionamiento de los ventiladores del área de trabajo, entradas y monitor.', 'Realización de la prueba de relación señal-ruido (SNR) en la cabeza.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 781396),
(7, 'Verifique la función del mezclador de oxígeno.', 'Verifique la ausencia de fugas.', 'Verifique la alarma de baja presión/apnea.', 'Verifique la alarma de suministro de gas.', 'Verifique la alarma de fallo de alimentación.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 4573397),
(8, 'Verifique la velocidad de infusión.', 'Verifique la alarma de puerta abierta.', 'Verifique la alarma de oclusión.', 'Verifique la alarma de aire en línea.', 'Verifique el sensor de tasa de flujo.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 712345),
(9, 'Verifique los electrodos en busca de suciedad y óxido.', 'Verifique que el cable de alimentación y el cable de conexión no estén dañados.', 'Verifique el funcionamiento en corriente alterna y batería.', 'Verifique la prueba del grabador.', 'Verifique los fusibles de alimentación para evitar averías.', '2019-12-22 06:27:36', '2019-12-22 06:27:36', 991415561);

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

--
-- Volcado de datos para la tabla `ppms`
--

INSERT INTO `ppms` (`Code`, `DATE`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `N1`, `N2`, `N3`, `N4`, `N5`, `createdAt`, `updatedAt`, `EquipmentCode`, `ClinicalEnginnerDSSN`) VALUES
(1, '2020-05-22', 'on', 'on', 'on', 'on', 'on', '', '', '', '', '', '2020-05-23 18:53:29', '2020-05-23 18:53:29', 781396, 9921050746980),
(2, '2024-11-06', 'on', 'on', 'on', 'on', 'on', '', '', '', '', 'BATERIA VENCIDA', '2024-11-07 18:27:32', '2024-11-07 18:27:32', 531, 6458161),
(4, '2025-05-11', 'on', 'on', 'on', 'on', 'on', '', 'calibrado en 2 meses', '', '', '', '2025-05-12 02:52:18', '2025-05-12 02:52:18', 781396, 6458161),
(8, '2025-05-11', 'on', 'on', 'on', 'on', 'on', '', '', '', 'no funciono', '', '2025-05-12 04:04:25', '2025-05-12 04:04:25', 991415561, 6458161),
(9, '2025-05-11', 'on', 'on', 'on', 'on', 'on', '', '', '', 'no funciono', '', '2025-05-12 04:13:46', '2025-05-12 04:13:46', 991415561, 6458161),
(10, '2025-05-27', 'on', 'on', 'on', 'on', 'on', 'vence el 07/05/26', '', '', 'no queda papel, comprar', '', '2025-05-27 16:45:17', '2025-05-27 16:45:17', 531, 6458161),
(11, '2025-05-27', 'on', 'on', 'on', 'on', 'on', 'vence el 07/05/26', '', '', 'no queda papel, comprar', '', '2025-05-27 16:45:19', '2025-05-27 16:45:19', 531, 6458161);

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
(130, 375, '2021-02-22', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(131, 375, '2022-02-22', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(132, 531, '2025-04-21', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(133, 531, '2026-04-21', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(134, 12220, '2020-06-19', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(135, 12220, '2021-06-21', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(136, 69690, '2020-11-05', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(137, 69690, '2021-11-05', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(138, 69690, '2022-11-07', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(139, 69891, '2020-06-16', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(140, 69891, '2021-06-16', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(141, 69891, '2022-06-16', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(142, 656565, '2026-03-09', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(143, 656565, '2027-03-09', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(144, 712345, '2020-12-07', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(145, 712345, '2021-12-07', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(146, 781396, '2020-04-27', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(147, 781396, '2021-04-27', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(148, 1050023, '2024-02-07', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(149, 1050023, '2025-02-07', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(150, 1050023, '2026-02-09', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(151, 1222222, '2025-09-18', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(152, 1222222, '2026-09-18', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(153, 1222222, '2027-09-20', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(154, 4573397, '2020-01-06', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(155, 4573397, '2021-01-06', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(156, 8545678, '2026-03-16', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(157, 8545678, '2027-03-16', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(158, 12269856, '2025-11-10', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(159, 12269856, '2026-11-10', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(160, 20202025, '2025-11-06', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(161, 20202025, '2026-11-06', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(162, 20202025, '2027-11-08', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(163, 23454321, '2026-05-18', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(164, 23454321, '2027-05-18', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(165, 23454321, '2028-05-18', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(166, 61242056, '2020-07-01', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(167, 61242056, '2021-07-01', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(168, 61242056, '2022-07-01', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(169, 66666555, '2025-10-13', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(170, 66666555, '2026-10-13', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(171, 82532024, '2025-09-23', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(172, 82532024, '2026-09-23', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(173, 82532024, '2027-09-23', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(174, 98995566, '2026-05-13', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(175, 98995566, '2027-05-13', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(176, 98995566, '2028-05-15', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(177, 105002366, '2025-10-13', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(178, 105002366, '2026-10-13', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(179, 564298763, '2026-03-09', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(180, 564298763, '2027-03-09', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(181, 991415561, '2020-05-06', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(182, 991415561, '2021-05-06', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51'),
(183, 991415561, '2022-05-06', 'Programada', '2025-05-21 13:36:51', '2025-05-21 13:36:51');

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
  `Code` int NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Amount` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AgentSupplierId` int DEFAULT NULL,
  `EquipmentCode` int DEFAULT NULL,
  `CodeManufacter` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CategoryId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `spareparts`
--

INSERT INTO `spareparts` (`Code`, `Name`, `Image`, `Amount`, `createdAt`, `updatedAt`, `AgentSupplierId`, `EquipmentCode`, `CodeManufacter`, `CategoryId`) VALUES
(942, 'X-ray tubes', 'image_X-ray tubes.jpg', 2, '2020-05-21 21:25:12', '2025-03-03 21:03:18', 11114, NULL, '', 2),
(5441, 'Water Hose Assembly ', 'image_Water Hose Assembly .jpg', 1, '2020-05-21 21:32:27', '2025-03-03 21:29:47', 11114, NULL, '', 2),
(5942, 'condor power supply', 'image_condor power supply .jpg', 1, '2020-05-21 21:12:07', '2025-03-03 21:03:18', 11127, NULL, '', 2),
(7842, 'Mammography Lamp Set  ', 'image_Mammography Lamp Set.jpg', 1, '2020-05-21 21:31:03', '2025-03-03 20:16:26', 11118, NULL, '', 2),
(15541, 'Programmed PL 103 CPU Board ', 'image_Programmed PL 103 CPU Board.jpg', 1, '2020-05-21 21:32:00', '2020-05-21 21:32:00', 11114, 12220, '', 2),
(18122, 'Single Gas Spring 450mm 2550 Newtons', 'image_Single Gas Spring 450mm 2550 Newtons.jpg', 1, '2020-05-21 21:29:50', '2020-05-21 21:29:50', 11114, 12220, '', 2),
(44547, 'Power Supply', 'image_Power supply.jpg', 3, '2020-05-21 21:08:07', '2020-05-21 21:10:45', 11114, 4573397, '', 2),
(44582, 'Monitor', 'image_Monitor.jpg', 2, '2020-05-21 21:09:48', '2025-03-03 21:39:51', 11114, NULL, '', 2),
(58912, 'CCA board', 'image_CCA board .jpg', 1, '2020-05-21 21:17:53', '2020-05-21 21:17:53', 11127, 69690, '', 2),
(78155, 'X-ray Generator', 'image_X-ray Generator.png', 1, '2020-05-21 21:22:29', '2025-03-03 21:39:51', 11118, NULL, '', 2),
(78226, 'Tube head', 'image_Tube head .jpg', 1, '2020-05-21 21:18:24', '2020-05-21 21:18:24', 11127, 69690, '', 2),
(79189, 'Monitor', 'image_Monitor.jpg', 1, '2020-05-21 21:21:35', '2025-03-03 21:29:47', 11118, NULL, '', 2),
(87812, 'Probes', 'image_Probes.png', 2, '2020-05-21 21:38:43', '2020-05-21 21:38:43', 11114, 375, '', 2),
(87942, 'Power cord', 'image_Power cord.jpg', 2, '2020-05-21 21:38:17', '2020-05-21 21:38:17', 11118, 375, '', 2),
(95553, 'collimator', 'image_collimator .jpg', 1, '2020-05-21 21:17:16', '2020-05-21 21:17:16', 11127, 69690, '', 2),
(98412, ' acquisition computer ', 'image_acquisition computer.jpg', 1, '2020-05-21 21:18:57', '2020-05-21 21:18:57', 11127, 69690, '', 2),
(145557, 'Footswitch', 'image_Footswitch.jpg', 2, '2020-05-21 21:37:38', '2020-05-21 21:37:38', 11114, 375, '', 2),
(181588, 'high voltage tank', 'image_High voltage tank.jpg', 2, '2020-05-21 21:24:12', '2025-03-03 20:10:42', 11114, NULL, '', 2),
(742189, 'Rotation Potentiometer ', 'image_Rotation Potentiometer .jpg', 1, '2020-05-21 21:29:04', '2020-05-21 21:29:04', 11118, 12220, '', 2),
(781229, 'Transducer probe', 'image_Transducer probe.jpg', 4, '2020-05-21 21:07:26', '2020-05-21 21:10:59', 11114, 4573397, '', 2),
(785632, 'Power Supply', 'image_Power Supply.jpg', 1, '2020-05-21 21:01:06', '2020-05-21 21:01:06', 11122, 781396, '', 2),
(845316, ' RF Amplifier', 'image_RF Amplifier.jpg', 2, '2020-05-21 21:00:26', '2020-05-21 21:00:26', 11122, 781396, '', 2),
(941389, 'UPS Battery', 'image_UPS Battery.jpg', 1, '2020-05-21 21:31:33', '2020-05-21 21:31:33', 11114, 12220, '', 2),
(968946, 'Gradient Amplifier', 'image_Gradient Amplifier.jpg', 2, '2020-05-21 20:59:49', '2020-05-21 20:59:49', 11122, 781396, '', 2),
(1234458, 'Keyboard', 'image_Keyboard.jpg', 1, '2020-05-21 21:10:21', '2020-05-21 21:10:21', 11114, 4573397, '', 2),
(4573397, 'Breast Coil', 'image_Breast Coil.jpg', 2, '2020-05-21 20:34:38', '2025-03-03 20:10:42', 11122, NULL, '', 2),
(7801255, 'Face Shield Assembly', 'image_Face Shield Assembly.jpg', 1, '2020-05-21 21:30:28', '2020-05-21 21:30:28', 11114, 12220, '', 2),
(7919411, 'KA connecting cable', 'image_KA connecting cable.jpg', 1, '2020-05-21 21:37:12', '2020-05-21 21:37:12', 11118, 375, '', 2),
(991415561, 'Head Coil', 'image_Head Coil.jpg', 1, '2020-05-21 20:59:11', '2020-05-21 20:59:11', 11122, 781396, '', 2);

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
  `Cost` int NOT NULL,
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
(10, '2024-08-09', '2024-08-09', 'FALLO 131', 0, 'High', '2024-08-09 20:58:00', '2024-08-10 15:07:22', 6458161, 12220, 'aun', '', NULL, 2, NULL),
(11, '2024-10-29', '2024-10-30', 'Falla 110', 0, 'Low', '2024-08-10 15:06:10', '2024-08-16 14:51:59', 6458161, 4573397, 'si', '2024-08-10', NULL, NULL, NULL),
(12, '2024-08-16', '2024-08-30', 'fall pp', 0, 'Medium', '2024-08-16 15:21:23', '2024-08-17 14:15:20', 6458161, 61242056, 'si, se cambio...', '', NULL, NULL, NULL),
(13, '2024-10-29', '2024-10-29', 'PRUEBA DE ERRROR DEL EQUIPO, SOLO ES UNA PRUEBA', 0, 'Low', '2024-10-30 02:53:03', '2024-10-30 02:53:03', 6458161, 375, '', '', NULL, 2, NULL),
(14, '2024-11-23', '2024-11-23', 'limpieza de cabezales', 0, 'High', '2024-11-23 17:08:47', '2024-11-23 17:08:47', 6458161, 375, '', '', NULL, 2, NULL);

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
  ADD KEY `fk_equipment_nameequipment` (`NameEquipmentId`);

--
-- Indices de la tabla `equipmentspareparts`
--
ALTER TABLE `equipmentspareparts`
  ADD PRIMARY KEY (`id_equipment`,`id_sparepart`),
  ADD KEY `id_sparepart` (`id_sparepart`);

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
  ADD PRIMARY KEY (`Code`),
  ADD KEY `AgentSupplierId` (`AgentSupplierId`),
  ADD KEY `EquipmentCode` (`EquipmentCode`),
  ADD KEY `fk_category` (`CategoryId`);

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
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `Code` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  ADD CONSTRAINT `fk_equipment_nameequipment` FOREIGN KEY (`NameEquipmentId`) REFERENCES `nameequipment` (`id_nameE`),
  ADD CONSTRAINT `fk_equipment_reception_status` FOREIGN KEY (`ReceptionStatusId`) REFERENCES `receptionstatus` (`ID`);

--
-- Filtros para la tabla `equipmentspareparts`
--
ALTER TABLE `equipmentspareparts`
  ADD CONSTRAINT `equipmentspareparts_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipmentspareparts_ibfk_2` FOREIGN KEY (`id_sparepart`) REFERENCES `spareparts` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `spareparts_ibfk_1` FOREIGN KEY (`AgentSupplierId`) REFERENCES `agentsuppliers` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `spareparts_ibfk_2` FOREIGN KEY (`EquipmentCode`) REFERENCES `equipment` (`Code`) ON DELETE SET NULL ON UPDATE CASCADE;

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
