-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 08:52 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cc_slim`
--
CREATE DATABASE IF NOT EXISTS `cc_slim` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cc_slim`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0,
  `show_child` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `parent_id`, `active`, `show_child`, `created_at`, `updated_at`) VALUES
(1, 'DNames', 0, 0, 0, '2021-04-29 07:57:23', NULL),
(2, 'Accessoires', 1, 0, 0, '2021-04-29 07:57:23', NULL),
(3, 'Handschoenen', 2, 0, 0, '2021-04-29 07:57:23', NULL),
(4, 'Mutsen en Hoeden', 2, 0, 0, '2021-04-29 07:57:23', NULL),
(5, 'Portemonnees', 2, 0, 0, '2021-04-29 07:57:23', NULL),
(6, 'Riemen', 2, 0, 0, '2021-04-29 07:57:23', NULL),
(7, 'Sieraden & Horloges', 2, 0, 0, '2021-04-29 07:57:23', NULL),
(8, 'Sjaals', 2, 0, 0, '2021-04-29 07:57:23', NULL),
(9, 'Tassen', 2, 0, 0, '2021-04-29 07:57:23', NULL),
(10, 'Armbanden', 7, 0, 0, '2021-04-29 07:57:23', NULL),
(11, 'Broches & pins', 7, 0, 0, '2021-04-29 07:57:23', NULL),
(12, 'Horloges', 7, 0, 0, '2021-04-29 07:57:23', NULL),
(13, 'Kettingen', 7, 0, 0, '2021-04-29 07:57:23', NULL),
(14, 'Oorbellen', 7, 0, 0, '2021-04-29 07:57:23', NULL),
(15, 'Ringen', 7, 0, 0, '2021-04-29 07:57:23', NULL),
(16, 'Clutches', 9, 0, 0, '2021-04-29 07:57:23', NULL),
(17, 'Handtassen', 9, 0, 0, '2021-04-29 07:57:23', NULL),
(18, 'Rugzakken', 9, 0, 0, '2021-04-29 07:57:23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
