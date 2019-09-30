-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019 m. Rgs 30 d. 12:35
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keliones`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `keliones`
--

CREATE TABLE `keliones` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `aprasymas` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `kaina` double UNSIGNED NOT NULL,
  `flag_poilsine` tinyint(3) UNSIGNED DEFAULT NULL,
  `flag_pazintine` tinyint(3) UNSIGNED DEFAULT NULL,
  `flag_viskas_iskaiciuota` tinyint(3) UNSIGNED DEFAULT NULL,
  `flag_laisvai_pasirenkama` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `klientai`
--

CREATE TABLE `klientai` (
  `id` int(10) UNSIGNED NOT NULL,
  `vardas` varchar(32) COLLATE utf8_lithuanian_ci NOT NULL,
  `pavarde` varchar(32) COLLATE utf8_lithuanian_ci NOT NULL,
  `flag_poilsine` tinyint(3) UNSIGNED DEFAULT NULL,
  `flag_pazintine` tinyint(3) UNSIGNED DEFAULT NULL,
  `flag_viskas_iskaiciuota` tinyint(3) UNSIGNED DEFAULT NULL,
  `flag_laisvai_pasirenkama` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `klientu_keliones`
--

CREATE TABLE `klientu_keliones` (
  `id` int(10) UNSIGNED NOT NULL,
  `klientai_id` int(10) UNSIGNED NOT NULL,
  `keliones_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keliones`
--
ALTER TABLE `keliones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klientai`
--
ALTER TABLE `klientai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klientu_keliones`
--
ALTER TABLE `klientu_keliones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keliones_id` (`keliones_id`),
  ADD KEY `klientai_id` (`klientai_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keliones`
--
ALTER TABLE `keliones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klientai`
--
ALTER TABLE `klientai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klientu_keliones`
--
ALTER TABLE `klientu_keliones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `klientu_keliones`
--
ALTER TABLE `klientu_keliones`
  ADD CONSTRAINT `klientu_keliones_ibfk_1` FOREIGN KEY (`keliones_id`) REFERENCES `keliones` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `klientu_keliones_ibfk_2` FOREIGN KEY (`klientai_id`) REFERENCES `klientai` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
