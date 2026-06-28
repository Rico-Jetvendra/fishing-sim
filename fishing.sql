-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2026 at 01:23 PM
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
  `bait_category` varchar(100) NOT NULL,
  `bait_description` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_catch_log`
--

CREATE TABLE `t_catch_log` (
  `catch_log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `fish_weight` decimal(5,2) NOT NULL,
  `fish_length` decimal(5,2) NOT NULL,
  `Is_teras` tinyint(1) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_city`
--

CREATE TABLE `t_city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `city_capital` int(11) NOT NULL DEFAULT 0,
  `city_description` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `fish_min_weight` decimal(5,2) NOT NULL DEFAULT 0.10,
  `fish_max_weight` decimal(5,2) NOT NULL,
  `fish_min_length` decimal(5,2) NOT NULL DEFAULT 0.10,
  `fish_max_length` decimal(5,2) NOT NULL,
  `fish_description` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_bait`
--

CREATE TABLE `t_fish_bait` (
  `fish_bait_id` int(11) NOT NULL,
  `bait_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `bait_modifier` int(11) NOT NULL,
  `bait_bite` int(11) NOT NULL DEFAULT 100,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_location`
--

CREATE TABLE `t_fish_location` (
  `fish_location_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `location_modifier` int(11) NOT NULL,
  `location_mutation` int(11) NOT NULL DEFAULT 5,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_rarity`
--

CREATE TABLE `t_fish_rarity` (
  `fish_rarity_id` int(11) NOT NULL,
  `fish_rarity` varchar(100) NOT NULL,
  `fish_initial` varchar(5) DEFAULT NULL,
  `base_bite` int(11) NOT NULL,
  `base_escape` int(11) NOT NULL,
  `base_mutation` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_rarity`
--

INSERT INTO `t_fish_rarity` (`fish_rarity_id`, `fish_rarity`, `fish_initial`, `base_bite`, `base_escape`, `base_mutation`, `created_date`) VALUES
(1, 'Common', 'C', 100, 0, 5, '2026-06-20 13:58:22'),
(2, 'Uncommon', 'UC', 100, 0, 5, '2026-06-20 13:58:22'),
(3, 'Rare', 'R', 60, 15, 4, '2026-06-20 14:00:06'),
(4, 'Legendary', 'L', 20, 25, 3, '2026-06-20 14:00:06'),
(5, 'Mythical', 'M', 10, 40, 2, '2026-06-20 14:00:15'),
(6, 'Event', 'E', 100, 30, 0, '2026-06-22 13:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_rod`
--

CREATE TABLE `t_fish_rod` (
  `fish_rod_id` int(11) NOT NULL,
  `rod_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `rod_modifier` int(11) NOT NULL,
  `rod_escape` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_type`
--

CREATE TABLE `t_fish_type` (
  `fish_type_id` int(11) NOT NULL,
  `fish_type` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_weather`
--

CREATE TABLE `t_fish_weather` (
  `fish_weather_id` int(11) NOT NULL,
  `weather_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `weather_modifier` int(11) NOT NULL,
  `weather_mutation` int(11) NOT NULL DEFAULT 5,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_game_state`
--

CREATE TABLE `t_game_state` (
  `game_state_id` int(11) NOT NULL,
  `current_weather` int(11) NOT NULL,
  `current_location` int(11) NOT NULL,
  `current_season` int(11) NOT NULL,
  `last_change_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_game_state`
--

INSERT INTO `t_game_state` (`game_state_id`, `current_weather`, `current_location`, `current_season`, `last_change_at`) VALUES
(1, 1, 1, 1, '2026-06-22 12:22:44');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_location`
--

CREATE TABLE `t_location` (
  `location_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `location_name` varchar(100) NOT NULL,
  `location_water` tinyint(4) NOT NULL COMMENT 'freshwater,seawater,brackish\r\n',
  `location_description` text DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_mutation`
--

CREATE TABLE `t_mutation` (
  `mutation_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `mutation_name` varchar(100) NOT NULL,
  `mutation_description` text NOT NULL,
  `mutation_chance` decimal(5,2) NOT NULL DEFAULT 0.00,
  `mutation_min_weight` decimal(5,2) NOT NULL DEFAULT 0.00,
  `mutation_max_weight` decimal(5,2) DEFAULT NULL,
  `mutation_min_length` decimal(5,2) NOT NULL DEFAULT 0.00,
  `mutation_max_length` decimal(5,2) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_rod`
--

CREATE TABLE `t_rod` (
  `rod_id` int(11) NOT NULL,
  `rod_name` varchar(100) NOT NULL,
  `rod_rarity` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'basic, intermediate, advanced, legendary',
  `rod_description` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `last_fish_at` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`user_id`, `twitch_user_id`, `username`, `display_name`, `user_rod`, `user_bait`, `last_fish_at`, `created_date`, `updated_date`) VALUES
(1, 1234567890, 'shurui21', 'Shurui21', 2, 2, NULL, '2026-06-20 09:30:31', '2026-06-20 15:05:54');

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
-- Indexes for table `t_city`
--
ALTER TABLE `t_city`
  ADD PRIMARY KEY (`city_id`);

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
-- Indexes for table `t_mutation`
--
ALTER TABLE `t_mutation`
  ADD PRIMARY KEY (`mutation_id`);

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
  MODIFY `bait_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_catch_log`
--
ALTER TABLE `t_catch_log`
  MODIFY `catch_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_city`
--
ALTER TABLE `t_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_fish`
--
ALTER TABLE `t_fish`
  MODIFY `fish_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_fish_bait`
--
ALTER TABLE `t_fish_bait`
  MODIFY `fish_bait_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_fish_location`
--
ALTER TABLE `t_fish_location`
  MODIFY `fish_location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_fish_rarity`
--
ALTER TABLE `t_fish_rarity`
  MODIFY `fish_rarity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_fish_rod`
--
ALTER TABLE `t_fish_rod`
  MODIFY `fish_rod_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_fish_season`
--
ALTER TABLE `t_fish_season`
  MODIFY `fish_season_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_fish_type`
--
ALTER TABLE `t_fish_type`
  MODIFY `fish_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_fish_weather`
--
ALTER TABLE `t_fish_weather`
  MODIFY `fish_weather_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_mutation`
--
ALTER TABLE `t_mutation`
  MODIFY `mutation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_rod`
--
ALTER TABLE `t_rod`
  MODIFY `rod_id` int(11) NOT NULL AUTO_INCREMENT;

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
