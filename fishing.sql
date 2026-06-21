-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2026 at 02:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fishing`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_bait`
--

CREATE TABLE `t_bait` (
  `bait_id` int(11) NOT NULL,
  `bait_name` varchar(100) NOT NULL,
  `bait_description` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_bait`
--

INSERT INTO `t_bait` (`bait_id`, `bait_name`, `bait_description`, `created_date`) VALUES
(1, 'Bread', 'A simple bait that attracts common freshwater fish.', '2026-06-20 14:05:22'),
(2, 'Worm', 'A classic bait favored by many river fish.', '2026-06-20 14:05:22'),
(3, 'Shrimp', 'A tasty bait effective against larger fish.', '2026-06-20 14:05:22'),
(4, 'Minnow', 'A small live fish used to attract predators.', '2026-06-20 14:05:22'),
(5, 'Insect', 'A common bait that works well in lakes and rivers.', '2026-06-20 14:05:22'),
(6, 'Fish Eggs', 'A specialized bait attractive to salmon and related fish.', '2026-06-20 14:05:22'),
(7, 'Squid', 'A saltwater bait used for deep-sea fishing.', '2026-06-20 14:05:22'),
(8, 'Golden Worm', 'A rare bait that slightly increases chances of rare fish.', '2026-06-20 14:05:22'),
(9, 'Mystery Bait', 'An unusual bait with unpredictable effects.', '2026-06-20 14:05:22'),
(10, 'Dragon Bait', 'A legendary bait rumored to attract mythical fish.', '2026-06-20 14:05:22');

-- --------------------------------------------------------

--
-- Table structure for table `t_catch_log`
--

CREATE TABLE `t_catch_log` (
  `catch_log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `fish_weight` decimal(5,2) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_catch_log`
--

INSERT INTO `t_catch_log` (`catch_log_id`, `user_id`, `fish_id`, `fish_weight`, `created_date`) VALUES
(1, 1234567890, 1, 1.90, '2026-06-20 14:49:21'),
(2, 1234567890, 1, 2.20, '2026-06-20 14:49:41'),
(3, 1234567890, 1, 2.80, '2026-06-20 14:49:46'),
(4, 1234567890, 4, 13.70, '2026-06-20 15:00:36'),
(5, 1234567890, 1, 3.50, '2026-06-20 15:00:58'),
(6, 1234567890, 1, 2.90, '2026-06-20 15:00:59'),
(7, 1234567890, 4, 6.10, '2026-06-20 16:44:29'),
(8, 1234567890, 4, 14.70, '2026-06-20 16:44:32'),
(9, 1234567890, 1, 1.10, '2026-06-20 16:44:33'),
(10, 1234567890, 1, 4.20, '2026-06-20 16:44:34'),
(11, 1234567890, 1, 5.00, '2026-06-20 16:44:34'),
(12, 1234567890, 1, 1.60, '2026-06-20 16:44:35'),
(13, 1234567890, 1, 3.40, '2026-06-20 16:44:36'),
(14, 1234567890, 1, 1.90, '2026-06-20 16:44:37'),
(15, 1234567890, 1, 2.60, '2026-06-20 16:44:37'),
(16, 1234567890, 1, 2.50, '2026-06-20 16:44:38');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish`
--

CREATE TABLE `t_fish` (
  `fish_id` int(11) NOT NULL,
  `fish_name` varchar(100) NOT NULL,
  `fish_type` tinyint(4) NOT NULL,
  `fish_rarity` tinyint(4) NOT NULL,
  `fish_base_weight` int(11) NOT NULL COMMENT 'ticket allocation',
  `fish_min_weight` int(11) NOT NULL DEFAULT 1,
  `fish_max_weight` int(11) NOT NULL,
  `fish_description` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish`
--

INSERT INTO `t_fish` (`fish_id`, `fish_name`, `fish_type`, `fish_rarity`, `fish_base_weight`, `fish_min_weight`, `fish_max_weight`, `fish_description`, `created_date`) VALUES
(1, 'Carp', 1, 1, 1000, 1, 5, 'A common freshwater fish.', '2026-06-20 13:57:14'),
(2, 'Catfish', 1, 1, 800, 2, 8, 'A whiskered fish often found near river bottoms.', '2026-06-20 13:57:14'),
(3, 'Salmon', 2, 2, 500, 3, 12, 'A strong fish known for swimming upstream.', '2026-06-20 13:57:14'),
(4, 'Golden Koi', 1, 3, 50, 5, 15, 'A rare ornamental fish prized by collectors.', '2026-06-20 13:57:14'),
(5, 'Dragonfish', 2, 4, 5, 10, 25, 'A legendary fish rarely seen by anglers.', '2026-06-20 13:57:14'),
(6, 'Tilapia', 1, 1, 900, 1, 4, 'A common freshwater fish.', '2026-06-20 14:23:26'),
(7, 'Trout', 2, 1, 700, 2, 7, 'A fast river fish.', '2026-06-20 14:23:26'),
(8, 'Tuna', 2, 2, 400, 5, 20, 'A large saltwater fish.', '2026-06-20 14:23:26'),
(9, 'Swordfish', 2, 3, 100, 10, 30, 'A powerful ocean predator.', '2026-06-20 14:23:26'),
(10, 'Pufferfish', 2, 2, 350, 1, 5, 'A defensive fish that inflates when threatened.', '2026-06-20 14:23:26'),
(11, 'Eel', 2, 2, 300, 2, 10, 'A long and slippery fish.', '2026-06-20 14:23:26'),
(12, 'King Carp', 1, 3, 75, 8, 20, 'A rare giant carp.', '2026-06-20 14:23:26'),
(13, 'Moon Koi', 1, 4, 15, 10, 25, 'A mystical koi seen during special nights.', '2026-06-20 14:23:26'),
(14, 'Ancient Catfish', 1, 4, 10, 15, 35, 'An old fish that has survived for centuries.', '2026-06-20 14:23:26'),
(15, 'Leviathan', 2, 4, 1, 30, 100, 'A mythical sea creature.', '2026-06-20 14:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_bait`
--

CREATE TABLE `t_fish_bait` (
  `fish_bait_id` int(11) NOT NULL,
  `bait_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `bait_modifier` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_bait`
--

INSERT INTO `t_fish_bait` (`fish_bait_id`, `bait_id`, `fish_id`, `bait_modifier`, `created_date`) VALUES
(1, 1, 1, 25, '2026-06-20 14:10:08'),
(2, 2, 1, 40, '2026-06-20 14:10:08'),
(3, 5, 1, 15, '2026-06-20 14:10:08'),
(4, 2, 2, 35, '2026-06-20 14:10:08'),
(5, 3, 4, 5, '2026-06-20 14:10:08'),
(6, 4, 2, 70, '2026-06-20 14:10:08'),
(7, 4, 3, 45, '2026-06-20 14:10:08'),
(8, 6, 3, 90, '2026-06-20 14:10:08'),
(9, 7, 3, 60, '2026-06-20 14:10:08'),
(10, 1, 4, 10, '2026-06-20 14:10:08'),
(11, 8, 4, 150, '2026-06-20 14:10:08'),
(12, 9, 4, 250, '2026-06-20 14:10:08'),
(13, 7, 5, 50, '2026-06-20 14:10:08'),
(14, 8, 5, 300, '2026-06-20 14:10:08'),
(15, 10, 5, 1000, '2026-06-20 14:10:08'),
(16, 3, 1, 15, '2026-06-20 14:10:08'),
(17, 10, 7, 1000, '2026-06-20 14:10:08');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_location`
--

CREATE TABLE `t_fish_location` (
  `fish_location_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `location_modifier` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_location`
--

INSERT INTO `t_fish_location` (`fish_location_id`, `location_id`, `fish_id`, `location_modifier`, `created_date`) VALUES
(1, 1, 1, 200, '2026-06-20 14:31:00'),
(2, 1, 4, 150, '2026-06-20 14:31:00'),
(3, 2, 1, 150, '2026-06-20 14:31:00'),
(4, 2, 2, 200, '2026-06-20 14:31:00'),
(5, 2, 7, 100, '2026-06-20 14:31:00'),
(6, 3, 7, 300, '2026-06-20 14:31:00'),
(7, 3, 3, 150, '2026-06-20 14:31:00'),
(8, 3, 12, 100, '2026-06-20 14:31:00'),
(9, 4, 7, 200, '2026-06-20 14:31:00'),
(10, 4, 11, 150, '2026-06-20 14:31:00'),
(11, 5, 4, 200, '2026-06-20 14:31:00'),
(12, 5, 12, 300, '2026-06-20 14:31:00'),
(13, 6, 8, 150, '2026-06-20 14:31:00'),
(14, 6, 10, 200, '2026-06-20 14:31:00'),
(15, 7, 8, 300, '2026-06-20 14:31:00'),
(16, 7, 9, 250, '2026-06-20 14:31:00'),
(17, 7, 10, 150, '2026-06-20 14:31:00'),
(18, 8, 8, 400, '2026-06-20 14:31:00'),
(19, 8, 9, 500, '2026-06-20 14:31:00'),
(20, 8, 15, 1000, '2026-06-20 14:31:00'),
(21, 9, 10, 300, '2026-06-20 14:31:00'),
(22, 9, 8, 150, '2026-06-20 14:31:00'),
(23, 10, 14, 750, '2026-06-20 14:31:00'),
(24, 10, 11, 200, '2026-06-20 14:31:00'),
(25, 11, 2, 300, '2026-06-20 14:31:00'),
(26, 11, 14, 500, '2026-06-20 14:31:00'),
(27, 12, 4, 300, '2026-06-20 14:31:00'),
(28, 12, 13, 500, '2026-06-20 14:31:00'),
(29, 13, 7, 400, '2026-06-20 14:31:00'),
(30, 13, 3, 300, '2026-06-20 14:31:00'),
(31, 14, 13, 1000, '2026-06-20 14:31:00'),
(32, 14, 4, 200, '2026-06-20 14:31:00'),
(33, 15, 5, 2000, '2026-06-20 14:31:00'),
(34, 15, 15, 1500, '2026-06-20 14:31:00');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_rarity`
--

CREATE TABLE `t_fish_rarity` (
  `fish_rarity_id` int(11) NOT NULL,
  `fish_rarity` varchar(100) NOT NULL,
  `fish_initial` varchar(5) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_rarity`
--

INSERT INTO `t_fish_rarity` (`fish_rarity_id`, `fish_rarity`, `fish_initial`, `created_date`) VALUES
(1, 'Common', 'C', '2026-06-20 13:58:22'),
(2, 'Uncommon', 'UC', '2026-06-20 13:58:22'),
(3, 'Rare', 'R', '2026-06-20 14:00:06'),
(4, 'Legendary', 'L', '2026-06-20 14:00:06'),
(5, 'Mythical', 'M', '2026-06-20 14:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_rod`
--

CREATE TABLE `t_fish_rod` (
  `fish_rod_id` int(11) NOT NULL,
  `rod_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `rod_modifier` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_rod`
--

INSERT INTO `t_fish_rod` (`fish_rod_id`, `rod_id`, `fish_id`, `rod_modifier`, `created_date`) VALUES
(1, 1, 1, 10, '2026-06-20 14:15:47'),
(2, 2, 1, 20, '2026-06-20 14:15:47'),
(3, 2, 2, 15, '2026-06-20 14:15:47'),
(4, 3, 1, 30, '2026-06-20 14:15:47'),
(5, 3, 2, 25, '2026-06-20 14:15:47'),
(6, 4, 1, 15, '2026-06-20 14:15:47'),
(7, 4, 2, 20, '2026-06-20 14:15:47'),
(8, 4, 3, 40, '2026-06-20 14:15:47'),
(9, 5, 1, 40, '2026-06-20 14:15:47'),
(10, 5, 2, 35, '2026-06-20 14:15:47'),
(11, 5, 3, 60, '2026-06-20 14:15:47'),
(12, 6, 1, 50, '2026-06-20 14:15:47'),
(13, 6, 2, 45, '2026-06-20 14:15:47'),
(14, 6, 3, 80, '2026-06-20 14:15:47'),
(15, 6, 4, 120, '2026-06-20 14:15:47'),
(16, 7, 1, 60, '2026-06-20 14:15:47'),
(17, 7, 2, 55, '2026-06-20 14:15:47'),
(18, 7, 3, 100, '2026-06-20 14:15:47'),
(19, 7, 4, 180, '2026-06-20 14:15:47'),
(20, 8, 1, 70, '2026-06-20 14:15:47'),
(21, 8, 2, 65, '2026-06-20 14:15:47'),
(22, 8, 3, 120, '2026-06-20 14:15:47'),
(23, 8, 4, 220, '2026-06-20 14:15:47'),
(24, 9, 1, 80, '2026-06-20 14:15:47'),
(25, 9, 2, 75, '2026-06-20 14:15:47'),
(26, 9, 3, 150, '2026-06-20 14:15:47'),
(27, 9, 4, 300, '2026-06-20 14:15:47'),
(28, 9, 5, 500, '2026-06-20 14:15:47'),
(29, 10, 1, 100, '2026-06-20 14:15:47'),
(30, 10, 2, 100, '2026-06-20 14:15:47'),
(31, 10, 3, 200, '2026-06-20 14:15:47'),
(32, 10, 4, 400, '2026-06-20 14:15:47'),
(33, 10, 5, 1000, '2026-06-20 14:15:47'),
(34, 2, 4, 50, '2026-06-20 14:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_season`
--

CREATE TABLE `t_fish_season` (
  `fish_season_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `season_modifier` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_season`
--

INSERT INTO `t_fish_season` (`fish_season_id`, `season_id`, `fish_id`, `season_modifier`, `created_date`) VALUES
(1, 1, 1, 100, '2026-06-20 14:28:26'),
(2, 1, 7, 150, '2026-06-20 14:28:26'),
(3, 1, 4, 100, '2026-06-20 14:28:26'),
(4, 1, 6, 75, '2026-06-20 14:28:26'),
(5, 2, 8, 150, '2026-06-20 14:28:26'),
(6, 2, 9, 250, '2026-06-20 14:28:26'),
(7, 2, 4, 300, '2026-06-20 14:28:26'),
(8, 2, 10, 100, '2026-06-20 14:28:26'),
(9, 3, 2, 150, '2026-06-20 14:28:26'),
(10, 3, 11, 100, '2026-06-20 14:28:26'),
(11, 3, 12, 250, '2026-06-20 14:28:26'),
(12, 3, 6, 75, '2026-06-20 14:28:26'),
(13, 4, 7, 200, '2026-06-20 14:28:26'),
(14, 4, 3, 250, '2026-06-20 14:28:26'),
(15, 4, 14, 500, '2026-06-20 14:28:26'),
(16, 4, 11, 100, '2026-06-20 14:28:26'),
(17, 5, 2, 250, '2026-06-20 14:28:26'),
(18, 5, 5, 1000, '2026-06-20 14:28:26'),
(19, 5, 15, 2000, '2026-06-20 14:28:26'),
(20, 5, 1, 100, '2026-06-20 14:28:26'),
(21, 6, 4, 300, '2026-06-20 14:28:26'),
(22, 6, 13, 1000, '2026-06-20 14:28:26'),
(23, 6, 12, 200, '2026-06-20 14:28:26'),
(24, 6, 8, 100, '2026-06-20 14:28:26');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_type`
--

CREATE TABLE `t_fish_type` (
  `fish_type_id` int(11) NOT NULL,
  `fish_type` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_type`
--

INSERT INTO `t_fish_type` (`fish_type_id`, `fish_type`, `created_date`) VALUES
(1, 'Carp Family', '2026-06-20 14:04:28'),
(2, 'Catfish Family', '2026-06-20 14:04:28'),
(3, 'Salmon Family', '2026-06-20 14:04:28'),
(4, 'Shark Family', '2026-06-20 14:04:28'),
(5, 'Eel Family', '2026-06-20 14:04:28');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_weather`
--

CREATE TABLE `t_fish_weather` (
  `fish_weather_id` int(11) NOT NULL,
  `weather_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `weather_modifier` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_weather`
--

INSERT INTO `t_fish_weather` (`fish_weather_id`, `weather_id`, `fish_id`, `weather_modifier`, `created_date`) VALUES
(1, 1, 1, 50, '2026-06-20 14:19:49'),
(2, 3, 1, 75, '2026-06-20 14:19:49'),
(3, 10, 1, 25, '2026-06-20 14:19:49'),
(4, 3, 2, 100, '2026-06-20 14:19:49'),
(5, 6, 2, 75, '2026-06-20 14:19:49'),
(6, 10, 2, 50, '2026-06-20 14:19:49'),
(7, 3, 3, 150, '2026-06-20 14:19:49'),
(8, 5, 3, 100, '2026-06-20 14:19:49'),
(9, 4, 3, 75, '2026-06-20 14:19:49'),
(10, 1, 4, 250, '2026-06-20 14:19:49'),
(11, 9, 4, 150, '2026-06-20 14:19:49'),
(12, 2, 4, 50, '2026-06-20 14:19:49'),
(13, 4, 5, 500, '2026-06-20 14:19:49'),
(14, 8, 5, 1000, '2026-06-20 14:19:49'),
(15, 6, 5, 300, '2026-06-20 14:19:49');

-- --------------------------------------------------------

--
-- Table structure for table `t_game_state`
--

CREATE TABLE `t_game_state` (
  `game_state_id` int(11) NOT NULL,
  `current_weather` int(11) NOT NULL,
  `current_location` int(11) NOT NULL,
  `current_season` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_game_state`
--

INSERT INTO `t_game_state` (`game_state_id`, `current_weather`, `current_location`, `current_season`, `created_date`, `updated_date`) VALUES
(1, 1, 1, 1, '2026-06-20 15:42:23', '2026-06-20 13:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `t_inventory`
--

CREATE TABLE `t_inventory` (
  `inventory_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_type` varchar(100) NOT NULL,
  `item_amount` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ;

--
-- Dumping data for table `t_inventory`
--

INSERT INTO `t_inventory` (`inventory_id`, `user_id`, `item_id`, `item_type`, `item_amount`, `created_date`, `updated_date`) VALUES
(3, 1234567890, 1, 'BAIT', 0, '2026-06-20 10:48:32', '2026-06-20 15:00:59'),
(4, 1234567890, 2, 'BAIT', 0, '2026-06-20 10:48:32', '2026-06-20 16:44:38'),
(5, 1234567890, 3, 'BAIT', 10, '2026-06-20 10:48:32', '2026-06-20 10:48:32'),
(6, 1234567890, 2, 'ROD', 1, '2026-06-20 10:48:32', '2026-06-20 10:48:32'),
(7, 1234567890, 1, 'ROD', 1, '2026-06-20 10:48:32', '2026-06-20 10:48:32'),
(10, 1234567890, 1, 'FISH', 13, '2026-06-20 14:49:21', '2026-06-20 16:44:38'),
(11, 1234567890, 4, 'FISH', 3, '2026-06-20 15:00:37', '2026-06-20 16:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `t_location`
--

CREATE TABLE `t_location` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_location`
--

INSERT INTO `t_location` (`location_id`, `location_name`, `created_date`) VALUES
(1, 'Village Pond', '2026-06-20 14:29:52'),
(2, 'Small River', '2026-06-20 14:29:52'),
(3, 'Mountain Lake', '2026-06-20 14:29:52'),
(4, 'Forest Stream', '2026-06-20 14:29:52'),
(5, 'Great Lake', '2026-06-20 14:29:52'),
(6, 'Coastal Beach', '2026-06-20 14:29:52'),
(7, 'Open Ocean', '2026-06-20 14:29:52'),
(8, 'Deep Sea', '2026-06-20 14:29:52'),
(9, 'Coral Reef', '2026-06-20 14:29:52'),
(10, 'Ancient Ruins', '2026-06-20 14:29:52'),
(11, 'Underground River', '2026-06-20 14:29:52'),
(12, 'Volcanic Lake', '2026-06-20 14:29:52'),
(13, 'Frozen Lake', '2026-06-20 14:29:52'),
(14, 'Moonlit Pond', '2026-06-20 14:29:52'),
(15, 'Dragon\'s Lair', '2026-06-20 14:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `t_rod`
--

CREATE TABLE `t_rod` (
  `rod_id` int(11) NOT NULL,
  `rod_name` varchar(100) NOT NULL,
  `rod_description` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_rod`
--

INSERT INTO `t_rod` (`rod_id`, `rod_name`, `rod_description`, `created_date`) VALUES
(1, 'Wooden Rod', 'A basic fishing rod given to new anglers.', '2026-06-20 14:11:27'),
(2, 'Bamboo Rod', 'A lightweight rod suitable for freshwater fishing.', '2026-06-20 14:11:27'),
(3, 'Iron Rod', 'A sturdy rod capable of handling larger fish.', '2026-06-20 14:11:27'),
(4, 'Ocean Rod', 'Designed for saltwater and deep-sea fishing.', '2026-06-20 14:11:27'),
(5, 'Carbon Rod', 'A high-quality rod that improves catch performance.', '2026-06-20 14:11:27'),
(6, 'Golden Rod', 'A rare rod favored by experienced anglers.', '2026-06-20 14:11:27'),
(7, 'Crystal Rod', 'A magical rod said to attract unusual fish.', '2026-06-20 14:11:27'),
(8, 'Ancient Rod', 'An old relic with mysterious fishing properties.', '2026-06-20 14:11:27'),
(9, 'Dragon Rod', 'A legendary rod capable of catching mythical fish.', '2026-06-20 14:11:27'),
(10, 'Void Rod', 'A mythical rod rumored to attract creatures from beyond the known waters.', '2026-06-20 14:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `t_season`
--

CREATE TABLE `t_season` (
  `season_id` int(11) NOT NULL,
  `season_name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_season`
--

INSERT INTO `t_season` (`season_id`, `season_name`, `created_date`) VALUES
(1, 'Spring', '2026-06-20 14:16:17'),
(2, 'Summer', '2026-06-20 14:16:17'),
(3, 'Autumn', '2026-06-20 14:16:27'),
(4, 'Winter', '2026-06-20 14:16:27'),
(5, 'Monsoon', '2026-06-20 14:16:50'),
(6, 'Dry', '2026-06-20 14:16:50');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `twitch_user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `user_rod` tinyint(4) NOT NULL DEFAULT 1,
  `user_bait` tinyint(4) NOT NULL DEFAULT 1,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`user_id`, `twitch_user_id`, `username`, `display_name`, `user_rod`, `user_bait`, `created_date`, `updated_date`) VALUES
(1, 1234567890, 'shurui21', 'Shurui21', 2, 2, '2026-06-20 09:30:31', '2026-06-20 15:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `t_weather`
--

CREATE TABLE `t_weather` (
  `weather_id` int(11) NOT NULL,
  `weather_name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_weather`
--

INSERT INTO `t_weather` (`weather_id`, `weather_name`, `created_date`) VALUES
(1, 'Sunny', '2026-06-20 14:17:57'),
(2, 'Cloudy', '2026-06-20 14:17:57'),
(3, 'Rainy', '2026-06-20 14:17:57'),
(4, 'Stormy', '2026-06-20 14:17:57'),
(5, 'Windy', '2026-06-20 14:17:57'),
(6, 'Foggy', '2026-06-20 14:17:57'),
(7, 'Snowy', '2026-06-20 14:17:57'),
(8, 'Thunderstorm', '2026-06-20 14:17:57'),
(9, 'Heatwave', '2026-06-20 14:17:57'),
(10, 'Overcast', '2026-06-20 14:17:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_bait`
--
ALTER TABLE `t_bait`
  ADD PRIMARY KEY (`bait_id`);

--
-- Indexes for table `t_catch_log`
--
ALTER TABLE `t_catch_log`
  ADD PRIMARY KEY (`catch_log_id`);

--
-- Indexes for table `t_fish`
--
ALTER TABLE `t_fish`
  ADD PRIMARY KEY (`fish_id`);

--
-- Indexes for table `t_fish_bait`
--
ALTER TABLE `t_fish_bait`
  ADD PRIMARY KEY (`fish_bait_id`),
  ADD UNIQUE KEY `uk_bait_fish` (`bait_id`,`fish_id`);

--
-- Indexes for table `t_fish_location`
--
ALTER TABLE `t_fish_location`
  ADD PRIMARY KEY (`fish_location_id`);

--
-- Indexes for table `t_fish_rarity`
--
ALTER TABLE `t_fish_rarity`
  ADD PRIMARY KEY (`fish_rarity_id`);

--
-- Indexes for table `t_fish_rod`
--
ALTER TABLE `t_fish_rod`
  ADD PRIMARY KEY (`fish_rod_id`),
  ADD UNIQUE KEY `uk_bait_fish` (`rod_id`,`fish_id`);

--
-- Indexes for table `t_fish_season`
--
ALTER TABLE `t_fish_season`
  ADD PRIMARY KEY (`fish_season_id`);

--
-- Indexes for table `t_fish_type`
--
ALTER TABLE `t_fish_type`
  ADD PRIMARY KEY (`fish_type_id`);

--
-- Indexes for table `t_fish_weather`
--
ALTER TABLE `t_fish_weather`
  ADD PRIMARY KEY (`fish_weather_id`),
  ADD UNIQUE KEY `uk_bait_fish` (`weather_id`,`fish_id`);

--
-- Indexes for table `t_game_state`
--
ALTER TABLE `t_game_state`
  ADD PRIMARY KEY (`game_state_id`);

--
-- Indexes for table `t_inventory`
--
ALTER TABLE `t_inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD UNIQUE KEY `uk_user_fish` (`user_id`,`item_id`,`item_type`) USING BTREE;

--
-- Indexes for table `t_location`
--
ALTER TABLE `t_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `t_rod`
--
ALTER TABLE `t_rod`
  ADD PRIMARY KEY (`rod_id`);

--
-- Indexes for table `t_season`
--
ALTER TABLE `t_season`
  ADD PRIMARY KEY (`season_id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `twitch_unique_id` (`twitch_user_id`);

--
-- Indexes for table `t_weather`
--
ALTER TABLE `t_weather`
  ADD PRIMARY KEY (`weather_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_bait`
--
ALTER TABLE `t_bait`
  MODIFY `bait_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_catch_log`
--
ALTER TABLE `t_catch_log`
  MODIFY `catch_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `t_fish`
--
ALTER TABLE `t_fish`
  MODIFY `fish_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t_fish_bait`
--
ALTER TABLE `t_fish_bait`
  MODIFY `fish_bait_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `t_fish_location`
--
ALTER TABLE `t_fish_location`
  MODIFY `fish_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `t_fish_rarity`
--
ALTER TABLE `t_fish_rarity`
  MODIFY `fish_rarity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_fish_rod`
--
ALTER TABLE `t_fish_rod`
  MODIFY `fish_rod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `t_fish_season`
--
ALTER TABLE `t_fish_season`
  MODIFY `fish_season_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `t_fish_type`
--
ALTER TABLE `t_fish_type`
  MODIFY `fish_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_fish_weather`
--
ALTER TABLE `t_fish_weather`
  MODIFY `fish_weather_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t_game_state`
--
ALTER TABLE `t_game_state`
  MODIFY `game_state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_inventory`
--
ALTER TABLE `t_inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_location`
--
ALTER TABLE `t_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t_rod`
--
ALTER TABLE `t_rod`
  MODIFY `rod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_season`
--
ALTER TABLE `t_season`
  MODIFY `season_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_weather`
--
ALTER TABLE `t_weather`
  MODIFY `weather_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
