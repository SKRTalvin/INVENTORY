-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2020 at 05:26 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appId` int(3) NOT NULL,
  `patientIc` bigint(12) NOT NULL,
  `scheduleId` int(10) NOT NULL,
  `appSymptom` varchar(100) NOT NULL,
  `appComment` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'process'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appId`, `patientIc`, `scheduleId`, `appSymptom`, `appComment`, `status`) VALUES
(86, 123, 40, 'Headache', 'Headeache', 'done');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `icDoctor` bigint(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `doctorId` int(3) NOT NULL,
  `doctorFirstName` varchar(50) NOT NULL,
  `doctorLastName` varchar(50) NOT NULL,
  `doctorAddress` varchar(100) NOT NULL,
  `doctorPhone` varchar(15) NOT NULL,
  `doctorEmail` varchar(20) NOT NULL,
  `doctorDOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`icDoctor`, `password`, `doctorId`, `doctorFirstName`, `doctorLastName`, `doctorAddress`, `doctorPhone`, `doctorEmail`, `doctorDOB`) VALUES
(123456789, '123', 123, 'Fatima', 'Dela Cruz', 'Caloocan City', '09261653616', 'delacruzfatima@gmail.com', '2002-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `doctorschedule`
--

CREATE TABLE `doctorschedule` (
  `scheduleId` int(11) NOT NULL,
  `scheduleDate` date NOT NULL,
  `scheduleDay` varchar(15) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `bookAvail` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorschedule`
--

INSERT INTO `doctorschedule` (`scheduleId`, `scheduleDate`, `scheduleDay`, `startTime`, `endTime`, `bookAvail`) VALUES
(40, '2022-02-29', 'Sunday', '09:00:00', '10:00:00', 'notavail');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `icPatient` bigint(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `patientFirstName` varchar(20) NOT NULL,
  `patientLastName` varchar(20) NOT NULL,
  `patientMaritialStatus` varchar(10) NOT NULL,
  `patientDOB` date NOT NULL,
  `patientGender` varchar(10) NOT NULL,
  `patientAddress` varchar(100) NOT NULL,
  `patientPhone` varchar(15) NOT NULL,
  `patientEmail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`icPatient`, `password`, `patientFirstName`, `patientLastName`, `patientMaritialStatus`, `patientDOB`, `patientGender`, `patientAddress`, `patientPhone`, `patientEmail`) VALUES
(123, '123', 'Fatima', 'Dela Cruz', 'single', '2022-05-17', 'female', 'Caloocan City', '09261653615' ,'delacruzfatima@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appId`),
  ADD UNIQUE KEY `scheduleId_2` (`scheduleId`),
  ADD KEY `patientIc` (`patientIc`),
  ADD KEY `scheduleId` (`scheduleId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`icDoctor`);

--
-- Indexes for table `doctorschedule`
--
ALTER TABLE `doctorschedule`
  ADD PRIMARY KEY (`scheduleId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`icPatient`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `doctorschedule`
--
ALTER TABLE `doctorschedule`
  MODIFY `scheduleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_4` FOREIGN KEY (`patientIc`) REFERENCES `patient` (`icPatient`),
  ADD CONSTRAINT `appointment_ibfk_5` FOREIGN KEY (`scheduleId`) REFERENCES `doctorschedule` (`scheduleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;