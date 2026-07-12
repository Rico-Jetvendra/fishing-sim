-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2026 at 04:07 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

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
  `bait_category` tinyint(4) NOT NULL,
  `bait_description` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_bait`
--

INSERT INTO `t_bait` (`bait_id`, `bait_name`, `bait_category`, `bait_description`, `created_date`) VALUES
(1, 'Earthworm', 1, 'The basic natural bait that attract wide range of bottom-feeding fish and omnivorous fish.', '2026-07-08 22:30:13'),
(2, 'Nightcrawler', 1, 'A large and lively worm that attracts bigger fish looking for an easy prey because of its movement.', '2026-07-08 22:30:13'),
(3, 'Ragworm', 1, 'A tough marine worm that attracts aggressive predators lives in brackish and seawater.', '2026-07-08 22:30:13'),
(4, 'Bloodworm', 1, 'Bright red larvae rich in nutrients, irresistible to many insect-eating and bottom-feeding fish.', '2026-07-08 22:30:13'),
(5, 'Sandworm', 1, 'A worm living inside a sandy bottom is targeted by fish that forage on the bottom of the water.', '2026-07-08 22:30:13'),
(6, 'River Shrimp', 2, 'A type of crustacean favored by freshwater and brackish predators.', '2026-07-08 22:30:13'),
(7, 'Small Crab', 2, 'A small crustacean, a highly sought-after fish not bothered by the shell.', '2026-07-08 22:30:13'),
(8, 'Prawn', 2, 'A large meaty crustacean, irresistible to omnivorous fish and predator alike.', '2026-07-08 22:30:13'),
(9, 'Shrimp', 2, 'A small freshwater crustacean that attracts fish that hunting aquatic prey.', '2026-07-08 22:30:13'),
(10, 'Crayfish', 2, 'A freshwater crustacean is highly effective in attracting large predatory fish lurking near the bottom.', '2026-07-08 22:30:13'),
(11, 'Beetle Grub', 3, 'A soft-bodied larva packed with protein necessary to attracts insect lover fish.', '2026-07-08 22:30:13'),
(12, 'Mealworm', 3, 'A wriggling larvae that appeals to fish hunting for food near the surface of the water.', '2026-07-08 22:30:13'),
(13, 'Dragonfly Nymph', 3, 'An aquatic insect larva is preyed upon by many freshwater fish.', '2026-07-08 22:30:13'),
(14, 'Water Beetle Larva', 3, 'A juicy aquatic larva that is hunted by fish searching for underwater insects.', '2026-07-08 22:30:13'),
(15, 'Superworm', 3, 'A larger worm that attracts bigger insectivorous fish.', '2026-07-08 22:30:13'),
(16, 'Grasshopper', 4, 'A surface insect that draws attention from fish that are waiting for an insect to fall into the water.', '2026-07-08 22:30:13'),
(17, 'Cricket', 4, 'A lively insect that moves constantly, attracting opportunistic fish.', '2026-07-08 22:30:13'),
(18, 'Locust', 4, 'A large insect offering a big meal for surface-feeding fish.', '2026-07-08 22:30:13'),
(19, 'Cicada', 4, 'A seasonal insect that fish loved, eagerly waiting for it to drop to water.', '2026-07-08 22:30:13'),
(20, 'Termite', 4, 'A small insect is often consumed by a swarm of fish or a school of fish.', '2026-07-08 22:30:13'),
(21, 'Mussel Meat', 5, 'Soft shellfish meat that has a strong scent that attracts bottom-feeding fish.', '2026-07-08 22:30:13'),
(22, 'Pond Snail', 5, 'A common freshwater mollusk that loves the taste of shelled animal.', '2026-07-08 22:30:13'),
(23, 'Clam Meat', 5, 'Tender clam meat that releases a scent, irresistible to bottom-feeding fish, even humans.', '2026-07-08 22:30:13'),
(24, 'Cockle Meat', 5, 'A salty shellfish popular among brackish and coastal fish.', '2026-07-08 22:30:13'),
(25, 'Oyster Meat', 5, 'Rich, oily meat that attracts fish relying on scent to locate their food.', '2026-07-08 22:30:13'),
(26, 'Minnow', 6, 'A live baitfish that attracts larger fish that are hunting small fish.', '2026-07-08 22:30:13'),
(27, 'Sardine', 6, 'An oily baitfish that produces a scent trail irresistible to marine predators.', '2026-07-08 22:30:13'),
(28, 'Anchovy', 6, 'A small baitfish is attractive to schooling predators.', '2026-07-08 22:30:13'),
(29, 'Juvenile Carp', 6, 'A small carp that attracts larger freshwater predators.', '2026-07-08 22:30:13'),
(30, 'Juvenile Perch', 6, 'A natural prey for some large carnivorous fish.', '2026-07-08 22:30:13'),
(31, 'Beef Meat', 7, 'A chunk of meat whose strong scent is really effective to attracts scavenger and opportunistic predator fish.', '2026-07-08 22:30:13'),
(32, 'Pork Meat', 7, 'Fatty meat for an unusual fish that is not afraid to try anything new.', '2026-07-08 22:30:13'),
(33, 'Chicken Meat', 7, 'Tender meat is used to attract omnivorous and predator fish alike.', '2026-07-08 22:30:13'),
(34, 'Chicken Heart', 7, 'Dense and durable bait that stays on the hook even after being peck by predators.', '2026-07-08 22:30:13'),
(35, 'Pork Intestine', 7, 'Tough, oily intestine that release strong scent to attract big predator.', '2026-07-08 22:30:13'),
(36, 'Bread', 8, 'A simple bait to catch herbivorous and omnivorous fish.', '2026-07-08 22:30:13'),
(37, 'Dough', 8, 'Soft and moldable bait commonly used for fish that feed on plants and grain matter.', '2026-07-08 22:30:13'),
(38, 'Sweet Corn', 8, 'Attract curious omnivorous fish with its color and sweet scent.', '2026-07-08 22:30:13'),
(39, 'Rice', 8, 'Small grain is occasionally eaten by fish lived near farm water.', '2026-07-08 22:30:13'),
(40, 'Cheese', 8, 'A pungent dairy bait whose rich aroma attracts omnivorous and scent-driven fish.', '2026-07-08 22:30:13'),
(41, 'Squid Strip', 9, 'Tough, chewy strip of flesh that stays on the hook attracting saltwater predators.', '2026-07-08 22:30:13'),
(42, 'Cuttlefish Strip', 9, 'Meaty strip of flesh with a rich scent, good for attracting marine predator.', '2026-07-08 22:30:13'),
(43, 'Octopus Strip', 9, 'Firm flesh that is good for attracting powerful predator on the ocean.', '2026-07-08 22:30:13');

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
  `rod_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `weather_id` int(11) DEFAULT NULL,
  `is_teras` tinyint(1) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_catch_log`
--

INSERT INTO `t_catch_log` (`catch_log_id`, `user_id`, `fish_id`, `fish_weight`, `fish_length`, `rod_id`, `location_id`, `season_id`, `weather_id`, `is_teras`, `created_date`) VALUES
(1, 1, 56, '12.00', '28.00', 1, 1, 1, 1, 0, '2026-07-10 20:58:33'),
(2, 1, 27, '33.00', '21.00', 2, 2, 2, 2, 1, '2026-07-10 10:58:33');

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

--
-- Dumping data for table `t_city`
--

INSERT INTO `t_city` (`city_id`, `city_name`, `city_capital`, `city_description`, `created_date`) VALUES
(1, 'Ourea', 0, '', '2026-07-08 09:50:14'),
(2, 'Rosegleam', 0, '', '2026-07-08 09:50:14'),
(3, 'Seran', 0, '', '2026-07-08 09:50:27'),
(4, 'Tidehaven', 0, '', '2026-07-08 09:50:27');

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

--
-- Dumping data for table `t_fish`
--

INSERT INTO `t_fish` (`fish_id`, `fish_name`, `fish_type`, `fish_rarity`, `fish_base_weight`, `fish_min_weight`, `fish_max_weight`, `fish_min_length`, `fish_max_length`, `fish_description`, `created_date`) VALUES
(1, 'Banded Archerfish', 2, 1, 875, '0.10', '1.00', '5.00', '30.00', 'Known for its extraordinary marksmanship, the archerfish can accurately spit streams of water several body lengths to dislodge unsuspecting prey.', '2026-07-08 20:40:01'),
(2, 'Northern Archerfish', 2, 2, 350, '0.10', '1.00', '6.00', '40.00', 'The largest of the archerfish, sporting a deeper body and irregular dark markings. Its powerful water jets and impressive size make it a formidable hunter of mangrove shores.', '2026-07-08 20:40:01'),
(3, 'Black Bream', 6, 2, 350, '0.50', '4.00', '23.00', '60.00', 'A dark bronze estuarine bream with a deep body, known for its adaptability and strong fighting ability despite its modest size.', '2026-07-08 20:40:01'),
(4, 'Tarwhine Bream', 6, 2, 450, '0.75', '4.50', '20.00', '58.00', 'A sleek silver bream with bright yellow fins, thriving in estuaries and coastal waters while feeding on small bottom-dwelling prey.', '2026-07-08 20:40:01'),
(5, 'Hardhead Catfish', 10, 2, 275, '0.45', '3.00', '15.00', '64.00', 'Hardhead catfish are generally regarded as an undesirable catch because of the risk associated with handling the venomous fish.', '2026-07-08 20:40:01'),
(6, 'Gafftopsail Catfish', 10, 2, 210, '1.20', '5.00', '12.00', '70.00', 'The gafftopsail catfish is blue-grey to dark brown with a light grey belly. Its appearance is typical for a catfish except for the deeply forked tail and the venomous, serrated spines.', '2026-07-08 20:40:01'),
(7, 'Green Chromide', 13, 1, 850, '0.10', '2.00', '7.50', '40.00', 'It eats mainly aquatic plants, including filamentous algae and diatoms, but it consumes the occasional mollusk and other animal matter.', '2026-07-08 20:40:01'),
(8, 'Orange Chromide', 13, 2, 300, '0.10', '0.30', '2.00', '10.00', 'A vivid orange cichlid that thrives in brackish lagoons and estuaries, where it grazes on algae and hunts tiny aquatic creatures among submerged vegetation.', '2026-07-08 20:40:01'),
(9, 'Blue Tilapia', 13, 1, 600, '0.50', '5.00', '9.00', '55.00', 'It grazes on algae and aquatic vegetation while readily adapting to new habitats, making it both abundant and highly resilient.', '2026-07-08 20:40:01'),
(10, 'Black Tilapia', 13, 1, 550, '0.70', '3.20', '7.00', '50.00', 'The most common tilapia in Endral, it has a long upper fins, the front part of which have spines.', '2026-07-08 20:40:01'),
(11, 'Hogchoker', 16, 1, 650, '0.10', '0.50', '5.00', '28.00', 'The overall body of this fish color is often broken by a series of spots and thin stripes, which can be lighter or darker than the main body color.', '2026-07-08 20:40:01'),
(12, 'Four-eyed Fish', 18, 2, 320, '0.10', '1.00', '5.00', '30.00', 'Four-eyed fish have only two eyes, but the eyes are specially adapted for their surface-dwelling lifestyle.', '2026-07-08 20:40:01'),
(13, 'Giant Mudskipper', 20, 1, 650, '0.10', '1.00', '5.00', '28.50', 'A giant amphibious goby that prowls muddy shores and mangrove forests, skillfully walking on land and leaping between tidal pools in search of prey', '2026-07-08 20:40:01'),
(14, 'Dragon Goby', 20, 3, 100, '0.10', '0.50', '8.00', '61.00', 'Dragon Goby is said to be a baby water dragon in its infancy. This fish has a long, slender, eel-like body.', '2026-07-08 20:40:01'),
(15, 'Knight Goby', 20, 2, 251, '0.10', '1.00', '1.00', '9.00', 'This goby has a speckled pattern and an armored look reminiscent of a chainmal worn by a knight.', '2026-07-08 20:40:01'),
(16, 'Bumblebee Goby', 20, 3, 111, '0.10', '1.00', '1.00', '4.00', 'A miniature goby known for its bold yellow-and-black stripes. Despite its small size, it is an active predator that patrols muddy bottoms and dense vegetation in search of tiny prey.', '2026-07-08 20:40:01'),
(17, 'Marble Goby', 20, 2, 300, '1.00', '7.50', '10.00', '65.00', 'It is a highly popular fish among rich families, said to be best eaten after a childbirth or Chirurgy.', '2026-07-08 20:40:01'),
(18, 'Wrestling Halfbeak', 22, 1, 630, '0.10', '0.30', '1.20', '8.00', 'Wrestling halfbeaks are surface-feeding fish and feed on a variety of small invertebrates, including crustaceans and insect larvae.', '2026-07-08 20:40:01'),
(19, 'Milkfish', 24, 1, 625, '1.20', '20.00', '90.00', '180.00', 'The milkfish is an important seafood in Seran and some Ourea places. This fish is infamous for being much bonier than other food fishes.', '2026-07-08 20:40:01'),
(20, 'Tidehaven Moony', 25, 1, 555, '0.10', '1.00', '7.00', '25.00', 'A silvery schooling fish with a diamond-shaped body and striking black markings native to Tidehaven water.', '2026-07-08 20:40:01'),
(21, 'Silver Moony', 25, 1, 800, '0.10', '1.00', '4.00', '27.00', 'This fish has a bright, shiny silver color with yellowish edges to the fins, and the upper and anal fins have black tips.', '2026-07-08 20:40:01'),
(22, 'Striped Mullet', 26, 1, 615, '1.10', '8.00', '30.00', '100.00', 'The back of the fish is olive-green, sides are silvery and shade to white towards the belly.', '2026-07-08 20:40:01'),
(23, 'Needlefish', 27, 1, 800, '0.10', '0.50', '3.00', '30.00', 'Needlefish are slender and have a single upper fin. Their most distinctive feature is their long, narrow beak, which bears multiple sharp teeth.', '2026-07-08 20:40:01'),
(24, 'Mangrove Jack', 32, 1, 585, '2.30', '13.50', '60.00', '150.00', 'Coloration of the Mangrove Jack ranges from burnt orange to copper, to bronze, and dark reddish-brown, depending on its age and environment.', '2026-07-08 20:40:01'),
(25, 'Common Bream', 7, 1, 950, '4.00', '11.00', '30.00', '86.00', 'Common bream have a black fins and silver color in young bream that turn bronze when its got older', '2026-07-08 20:40:01'),
(26, 'White Bream', 7, 1, 975, '0.25', '2.00', '5.00', '7.00', 'White Bream / Silver Bream generally inhabit the lower reaches of rivers as well as lakes and ponds with muddy bottoms and plenty of algae to feed on.', '2026-07-08 20:40:01'),
(27, 'Vimba Bream', 7, 1, 800, '1.00', '2.00', '20.00', '50.00', 'This fish is a deep bluish-green on the upper surface, and silvery along the flanks. The eyes are yellow, and the pectoral and pelvic fins have reddish-yellow bases.', '2026-07-08 20:40:01'),
(28, 'Blue Bream', 7, 2, 300, '1.00', '3.00', '25.00', '55.00', 'A sleek silver-blue fish that travels in large schools through deep rivers and lakes, feeding on drifting insects and tiny aquatic prey.', '2026-07-08 20:40:01'),
(29, 'Common Carp', 9, 1, 1000, '5.00', '40.00', '40.00', '110.00', 'A common carp is a widespread freshwater fish that can be found on almost every freshwater habitat.', '2026-07-08 20:40:01'),
(30, 'Grass Carp', 9, 1, 550, '5.00', '45.00', '20.00', '95.00', 'Grass Carp eggs require a long river to survive, and the eggs will be considered dead when they hit the bottom of the river.', '2026-07-08 20:40:01'),
(31, 'Mud Carp', 9, 1, 700, '2.00', '5.00', '20.00', '74.00', 'Mud Carp is considered to be inedible the first time people caught it, but after the great incident, this fish became popular.', '2026-07-08 20:40:01'),
(32, 'Mrigal Carp', 9, 3, 100, '2.00', '13.00', '15.00', '100.00', 'This fish live in a lower water level and feeds on small insects and decomposed organic element.', '2026-07-08 20:40:01'),
(33, 'Silver Carp', 9, 2, 350, '7.00', '50.00', '35.00', '105.00', 'A fast-growing filter feeder that cruises open freshwater, consuming microscopic plankton and occasionally leaping high above the surface when startled.', '2026-07-08 20:40:01'),
(34, 'Black Carp', 9, 2, 300, '6.00', '35.00', '60.00', '100.00', 'Black Carp are an elongated fish with a fusiform body. They have a dusky gray, brown, or even bluish black color on their body.', '2026-07-08 20:40:01'),
(35, 'Bighead Carp', 9, 2, 350, '9.00', '54.00', '60.00', '146.00', 'The Bighead Carp has a large, scaleless head, a large mouth, and eyes that located very low on their head.', '2026-07-08 20:40:01'),
(36, 'Giant River Carp', 9, 2, 325, '10.00', '105.00', '30.00', '180.00', 'This carp usually lives in a large pond or lake, but seasonally find its way into the canal, reservoir and flooded forest.', '2026-07-08 20:40:01'),
(37, 'Gibel Carp', 9, 2, 220, '2.00', '5.00', '10.00', '35.00', 'Gibel Carp reproduce and spread so rapidly that it is said that it can fill an entire medium-sized pond in its species alone.', '2026-07-08 20:40:01'),
(38, 'Crucian Carp', 9, 2, 210, '1.00', '3.00', '15.00', '64.00', 'This fish mainly lived in nutrient-rich water, but it can also lived in an extreme condition and harsh winter.', '2026-07-08 20:40:01'),
(39, 'Channel Catfish', 11, 1, 850, '4.00', '26.00', '30.00', '132.00', 'This cafish can be found all over Endral\'s river and stream.', '2026-07-08 20:40:01'),
(40, 'Bengawan Giant Catfish', 11, 3, 100, '40.00', '300.00', '30.00', '270.00', 'In Ourea, they call this fish Iremia Giant Catfish. Known for its enormous size, its main diet is algae and aquatic vegetation.', '2026-07-08 20:40:01'),
(41, 'Blue Catfish', 11, 2, 201, '9.00', '65.00', '31.00', '180.00', 'Blue Catfish are often misidentified as Channel Catfish, the difference are the heavy bodied, blueish gray in color, and a upper hump.', '2026-07-08 20:40:01'),
(42, 'Flathead Catfish', 11, 2, 400, '8.50', '56.00', '32.00', '175.00', 'An ambush predator lurking beneath logs and rocks until unsuspecting prey fish get close.', '2026-07-08 20:40:01'),
(43, 'Walking Catfish', 11, 2, 390, '7.20', '30.00', '25.00', '100.00', 'When the river dried out, this fish would \"walk\" around the river in wiggling motion to traverse the land.', '2026-07-08 20:40:01'),
(44, 'Redtail Catfish', 11, 2, 250, '20.00', '80.00', '23.00', '180.00', 'These colorful large catfishes have a brownish back, with yellow sides, and characteristic orange-red upper fin and caudal fin', '2026-07-08 20:40:01'),
(45, 'Alligator Gar', 19, 2, 300, '25.00', '150.00', '75.00', '250.00', 'The body of an alligator gar is torpedo-shaped, usually brown or olive colored, and occasionally black, fading to a lighter gray or yellow ventral surface.', '2026-07-08 20:40:01'),
(46, 'Walleye', 28, 1, 625, '1.20', '9.00', '12.50', '80.00', 'Walleyes are largely olive and gold in color. The upper side of a walleye is olive, grading into a golden hue on the flanks.', '2026-07-08 20:40:01'),
(47, 'Sauger', 28, 1, 660, '0.90', '4.00', '10.50', '56.00', 'Saugers generally move upstream to spawn during Autumn, depending on where they are. They move downstream to their home locations from Summer after their spawning period is over.', '2026-07-08 20:40:01'),
(48, 'Yellow Perch', 28, 1, 425, '0.50', '2.00', '10.20', '50.00', 'The yellow perch has an elongate, laterally compressed body with a subterminal mouth and a relatively long but blunt snout, which is surpassed in length by the lower jaw.', '2026-07-08 20:40:01'),
(49, 'Pikeperch', 28, 2, 275, '1.20', '15.00', '25.00', '100.00', 'The Pikeperch is the largest member of the perch family. The upper part of its body is green-brown in colour, and this extends onto the sides as dark vertical bars.', '2026-07-08 20:40:01'),
(50, 'Ruffe', 28, 2, 300, '0.10', '0.20', '5.20', '25.00', 'It is a very aggressive fish for its size. The ruffe also has a large, spiny upper fin which is likely distasteful to its predators', '2026-07-08 20:40:01'),
(51, 'Northern Pike', 29, 1, 825, '10.00', '30.00', '30.00', '150.00', 'Northern pike are most often olive green, shading from yellow to white along the belly. The flank is marked with short, light bar-like spots and a few to many dark spots on the fins.', '2026-07-08 20:40:01'),
(52, 'Southern Pike', 29, 1, 725, '1.20', '4.50', '40.00', '79.00', 'The southern pike has a distinctive, dark, chain-like pattern on its greenish sides. There is a vertical dark marking underneath the eye', '2026-07-08 20:40:01'),
(53, 'Muskie', 29, 1, 500, '5.00', '32.00', '45.00', '180.00', 'Muskies are the top predator in any body of water where they occur, and they will eat larger prey than most other freshwater fish.', '2026-07-08 20:40:01'),
(54, 'Redfin Pickerel', 29, 2, 250, '0.30', '1.50', '3.00', '31.00', 'The redfin pickerel is an ambush predator, lying in wait for unsuspecting prey animals to get within striking range.', '2026-07-08 20:40:01'),
(55, 'Bluegill', 34, 1, 650, '0.50', '2.00', '15.00', '39.00', 'This insect lover usually hide near a cover and ambush their prey.', '2026-07-08 20:40:01'),
(56, 'Pumpkinseed', 34, 1, 660, '0.40', '1.00', '10.00', '28.00', 'Pumpkinseeds have a body shaped much like a pumpkin seed with a vibrant orange, green, yellow, or blue body.', '2026-07-08 20:40:01'),
(57, 'Green Sunfish', 34, 1, 670, '0.20', '0.90', '7.00', '30.00', 'This fish is highly territorial and aggressive, local fishermen refered to its as a bullies of the water.', '2026-07-08 20:40:01'),
(58, 'Pocket Sunfish', 34, 3, 125, '0.10', '0.50', '5.00', '8.00', 'A tiny fish that can fit into a fisherman\'s pocket, it has ten vertical stripes visible along its dark body.', '2026-07-08 20:40:01'),
(59, 'Redear Sunfish', 34, 2, 300, '0.20', '1.50', '20.00', '44.00', 'Also widely known as the shellcracker, this fish\'s main diet is snails. These fish meander along lakebeds, seeking and cracking open snails and other shelled creatures.', '2026-07-08 20:40:01'),
(60, 'Warmouth', 34, 2, 375, '0.30', '1.10', '10.00', '30.00', 'The Warmouth is an aggressive and hardy fish that can survive in streams with low oxygen level.', '2026-07-08 20:40:01'),
(61, 'Redbreast Sunfish', 34, 2, 425, '0.20', '0.80', '10.00', '30.00', 'This fish becomes more aggressive when winter comes and striking almost anything that moving near them.', '2026-07-08 20:40:01'),
(62, 'Long-ear Sunfish', 34, 2, 450, '0.20', '0.80', '9.00', '24.00', 'Unlike any other sunfish, this fish feeds more near the surface of the water targeting insects, crustaceans and even young sunfish.', '2026-07-08 20:40:01'),
(63, 'Orangespotted Sunfish', 34, 2, 375, '0.10', '0.60', '8.00', '15.00', 'This fish prefers vegetated areas in sluggish backwaters or lakes, and can also be found in turbid rivers.', '2026-07-08 20:40:01'),
(64, 'Roundel Sunfish', 34, 2, 230, '0.10', '0.50', '8.00', '15.00', 'Its deep, rounded body is said to resemble the ancient roundel coins once traded across the continent before the dragons era.', '2026-07-08 20:40:01'),
(65, 'Rainbow Trout', 35, 1, 900, '3.00', '14.00', '20.00', '76.00', 'Fish with a silvery body, and purple, pink and bluish streak down its flank', '2026-07-08 20:40:01'),
(66, 'Hvitar Trout', 35, 1, 750, '1.00', '2.00', '17.00', '55.00', 'Hvitar Trout have a yellow body, and their upper body covered with a numerous small dark spot', '2026-07-08 20:40:01'),
(67, 'Lake Trout', 35, 1, 975, '10.00', '46.00', '25.00', '130.00', 'Lake trout covered in light beige or white spots all over its olive-grey body.', '2026-07-08 20:40:01'),
(68, 'Aurora Trout', 35, 3, 85, '1.50', '3.00', '10.00', '30.00', 'Aurora trout can be differentiated by its coloration, grading from magenta hue to nearly orange along the belly.', '2026-07-08 20:40:01'),
(69, 'Prasinos Cutthroat Trout', 35, 3, 75, '0.50', '1.10', '15.00', '46.00', 'This trout only live on the creek. Prasinos have a purple coloration and have some black spot along their body', '2026-07-08 20:40:01'),
(70, 'Golden Trout', 35, 3, 100, '1.00', '5.00', '15.00', '30.00', 'Every first Golden Trout that is caught that day needs to be given to the royal family.', '2026-07-08 20:40:01'),
(71, 'Brook Trout', 35, 2, 250, '2.00', '6.50', '20.00', '61.00', 'Brook trout also called Speckled trout has a green olive body with a yellow spot all over its body.', '2026-07-08 20:40:01'),
(72, 'Clearwater Cutthroat Trout', 35, 2, 305, '1.00', '2.00', '20.00', '45.00', 'Its neck has a bright red coloration, which makes it look like a slash wound; that\'s why it was called a Cutthroat Trout.', '2026-07-08 20:40:01'),
(73, 'Yakad Trout', 35, 2, 201, '1.00', '3.00', '15.00', '61.00', 'Yakad Trout can be identified by its distinctive yellowish-gold color, with a golden belly. The top of its head and back are a dark olive color.', '2026-07-08 20:40:01'),
(74, 'Marbled Trout', 35, 2, 375, '5.00', '30.00', '30.00', '120.00', 'The marble trout has a long, cylindrical body, slightly compressed laterally, with a large head. ', '2026-07-08 20:40:01'),
(75, 'Common Clownfish', 1, 1, 950, '0.30', '0.80', '1.00', '12.00', 'The Common Clownfish has a stocky appearance and oval shape. It is compressed laterally, with a round profile.', '2026-07-08 20:40:01'),
(76, 'Great Barracuda', 3, 2, 250, '10.00', '47.00', '50.00', '300.00', 'They are voracious predators and hunt by ambush. They rely on surprise and short bursts of speed to overrun their prey, sacrificing maneuverability.', '2026-07-08 20:40:01'),
(77, 'Striped Bass', 4, 1, 900, '5.00', '60.00', '40.00', '120.00', 'The Striped Bass has a streamlined, silvery body marked with longitudinal dark stripes running from behind the gills to the base of the tail.', '2026-07-08 20:40:01'),
(78, 'Swordfish', 5, 3, 150, '100.00', '700.00', '100.00', '455.00', 'Swordfish can swim extremely fast; it is said that Swordfish will jumped out of the water and then attack the fishermen when threatened.', '2026-07-08 20:40:01'),
(79, 'Sailfish', 5, 3, 60, '70.00', '350.00', '40.00', '100.00', 'Old sailors claim that they see Sailfish change colors when they get catch. Some people even said that was Sailfish way to communicate between them.', '2026-07-08 20:40:01'),
(80, 'Black Marlin', 5, 3, 51, '100.00', '720.00', '150.00', '450.00', 'One of the fastest fish known to sailors, this fish is said to be fast enough to leave a hole in a ship by swimming through it.', '2026-07-08 20:40:01'),
(81, 'Zebra Seabream', 8, 3, 150, '1.25', '3.00', '25.00', '55.00', 'This fish has an oval shaped body which is deep and compressed with a moderately sharp snout and a thick lipped slightly protrusible mouth.', '2026-07-08 20:40:01'),
(82, 'Two-bar Bream', 8, 2, 425, '1.00', '3.00', '10.00', '60.00', 'Two-bar Bream has an oval-shaped, deep, compressed body with a moderately fleshy-lipped, slightly protrusible mouth.', '2026-07-08 20:40:01'),
(83, 'Red Seabream', 8, 1, 850, '0.75', '10.00', '20.00', '120.00', 'The body is oblong and laterally flattened, with the jaws protruding slightly forward. The pectoral fins are long and slender, reaching nearly half of the total length.', '2026-07-08 20:40:01'),
(84, 'Gilthead Seabream', 8, 2, 201, '0.50', '18.00', '15.00', '70.00', 'The gilt-head bream has a deep body, with a large, deep head which has its relatively small eyes placed high on the head. The diameter of the eyes is shorter than the length of the snout.', '2026-07-08 20:40:01'),
(85, 'Swordhilt Sea Catfish', 12, 2, 205, '9.00', '25.00', '35.00', '100.00', 'A coastal catfish is recognized by the distinctive arrangement of bones beneath its head, forming a hilt of a sword structure.', '2026-07-08 20:40:01'),
(86, 'Silverwhisker Sea Catfish', 12, 2, 215, '3.00', '9.00', '12.00', '55.00', 'A medium-sized coastal catfish with a silvery-gray body, long sensitive barbels, and sharp defensive spines. ', '2026-07-08 20:40:01'),
(87, 'Common Dolphinfish', 14, 2, 201, '8.00', '40.00', '12.00', '180.00', ' Mature males have distinctive \"foreheads\"; it grows as the fish matures and often protrudes well above the body proper, which is streamlined by the musculature of the back', '2026-07-08 20:40:01'),
(88, 'Summer Flounder', 17, 2, 430, '0.50', '9.00', '20.00', '51.00', 'This fish is called the chameleon of the sea because their ability to change color to blend in with their surrounding.', '2026-07-08 20:40:01'),
(89, 'Redmouth Grouper', 21, 1, 825, '0.90', '15.00', '15.00', '60.00', 'The redmouth grouper is laterally compressed and oval-shaped with a relatively deep body, which is around half of the standard length, and a large head.', '2026-07-08 20:40:01'),
(90, 'Slender Grouper', 21, 1, 775, '0.50', '2.00', '12.50', '75.00', 'The slender grouper is a medium-sized fish with a head that occupies 40% of the total length, and the mouth is large.', '2026-07-08 20:40:01'),
(91, 'Masked Grouper', 21, 2, 230, '0.30', '2.00', '9.50', '45.00', 'The masked grouper has an oblong, rather compressed body, with the gill cover having a central spine which is located at one-third of the gap between the lower and upper spines.', '2026-07-08 20:40:01'),
(92, 'King Mackerel', 23, 2, 300, '5.00', '40.00', '11.00', '184.00', 'A swift ocean predator renowned for its speed and powerful runs. It patrols coastal waters in search of baitfish, making it a prized catch for fisherman.', '2026-07-08 20:40:01'),
(93, 'Common Lionfish', 30, 1, 875, '0.10', '1.30', '10.00', '35.00', 'The fin spines are highly venomous and have caused death to humans in some reported cases. Despite this, a sting from this species is rarely fatal to humans.', '2026-07-08 20:40:01'),
(94, 'Spiny Dogfish', 31, 2, 295, '2.00', '10.00', '90.00', '160.00', 'Spiny Dogfish is distinguished by two spines (one anterior to each upper fin) and no anal fin. It lives in shallow waters and further offshore in most parts of the world, especially in temperate waters.', '2026-07-08 20:40:01'),
(95, 'Northern Red Snapper', 33, 1, 900, '2.00', '23.00', '23.00', '88.00', 'They eat almost anything, but prefer small fish and crustaceans. They can be caught on both live and cut bait', '2026-07-08 20:40:01'),
(96, 'Grey Crossbowfish', 15, 1, 451, '0.40', '2.50', '20.00', '60.00', 'The small beak-like mouth at the tip of the snout has fleshy lips. The eyes are set far back near the top of the head.', '2026-07-08 20:40:01'),
(97, 'Bluefin Tuna', 36, 3, 90, '100.00', '700.00', '150.00', '400.00', 'Their color is dark blue above and gray below, with a gold coruscation covering the body and bright yellow caudal finlets.', '2026-07-08 20:40:01'),
(98, 'Yellowfin Tuna', 36, 3, 95, '90.00', '450.00', '120.00', '240.00', 'Their body shape is particularly adapted for speed, enabling them to pursue and capture fast-moving baitfish, such as flying fish, sauries, and mackerel.', '2026-07-08 20:40:01'),
(99, 'Longfin Tuna', 36, 2, 350, '15.00', '40.00', '90.00', '150.00', 'The longfin tuna has a streamlined, fusiform body with a conical snout, a large mouth, and big eyes. Its body is dark blue above, shades of silvery white ventrally, and covered by small scales.', '2026-07-08 20:40:01'),
(100, 'Bigeye Tuna', 36, 2, 275, '25.50', '180.00', '75.00', '250.00', 'The eyes of bigeye tuna are well developed and with a large spherical lens allowing their vision to function well in low light conditions.', '2026-07-08 20:40:01');

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

--
-- Dumping data for table `t_fish_bait`
--

INSERT INTO `t_fish_bait` (`fish_bait_id`, `bait_id`, `fish_id`, `bait_modifier`, `bait_bite`, `created_date`) VALUES
(18, 10, 68, 105, 0, '2026-07-11 00:46:54'),
(19, 2, 68, 200, 0, '2026-07-11 00:46:54'),
(20, 3, 68, 125, 0, '2026-07-11 00:46:54'),
(21, 4, 68, 125, 0, '2026-07-11 00:46:54'),
(22, 5, 68, 150, 0, '2026-07-11 00:46:54'),
(23, 13, 68, 175, 0, '2026-07-11 00:46:54'),
(24, 6, 68, 200, 0, '2026-07-11 00:46:54'),
(25, 9, 68, 100, 0, '2026-07-11 00:46:54'),
(26, 1, 68, 250, 0, '2026-07-11 00:46:54'),
(27, 11, 68, 110, 0, '2026-07-11 00:46:54'),
(28, 12, 68, 100, 0, '2026-07-11 00:46:54'),
(29, 16, 68, 100, 0, '2026-07-11 00:46:54'),
(30, 17, 68, 100, 0, '2026-07-11 00:46:54'),
(31, 19, 68, 100, 0, '2026-07-11 00:46:54'),
(58, 21, 100, 200, 0, '2026-07-11 01:38:16'),
(59, 24, 100, 200, 0, '2026-07-11 01:38:16'),
(60, 25, 100, 200, 0, '2026-07-11 01:38:16'),
(61, 27, 100, 175, 0, '2026-07-11 01:38:16'),
(62, 28, 100, 150, 0, '2026-07-11 01:38:16'),
(63, 41, 100, 150, 0, '2026-07-11 01:38:16'),
(64, 42, 100, 125, 0, '2026-07-11 01:38:16'),
(65, 43, 100, 150, 0, '2026-07-11 01:38:16'),
(66, 27, 45, 100, 0, '2026-07-11 01:38:58'),
(67, 32, 45, 75, 0, '2026-07-11 01:38:58'),
(68, 29, 45, 150, 0, '2026-07-11 01:38:58'),
(69, 33, 45, 200, 0, '2026-07-11 01:38:58'),
(70, 30, 45, 125, 0, '2026-07-11 01:38:58'),
(71, 34, 45, 225, 0, '2026-07-11 01:38:58'),
(72, 26, 45, 100, 0, '2026-07-11 01:38:58'),
(73, 31, 45, 175, 0, '2026-07-11 01:38:58'),
(74, 35, 45, 200, 0, '2026-07-11 01:38:58'),
(75, 13, 1, 200, 0, '2026-07-11 01:39:25'),
(76, 18, 1, 210, 0, '2026-07-11 01:39:25'),
(77, 14, 1, 175, 0, '2026-07-11 01:39:25'),
(78, 16, 1, 225, 0, '2026-07-11 01:39:25'),
(79, 11, 1, 210, 0, '2026-07-11 01:39:25'),
(80, 17, 1, 250, 0, '2026-07-11 01:39:25'),
(81, 2, 40, 250, 5, '2026-07-11 01:40:08'),
(82, 10, 40, 175, 5, '2026-07-11 01:40:08'),
(83, 4, 40, 225, 5, '2026-07-11 01:40:08'),
(84, 33, 40, 125, 5, '2026-07-11 01:40:08'),
(85, 6, 40, 175, 5, '2026-07-11 01:40:08'),
(86, 34, 40, 275, 5, '2026-07-11 01:40:08'),
(87, 1, 40, 250, 5, '2026-07-11 01:40:08'),
(88, 9, 40, 175, 5, '2026-07-11 01:40:08'),
(89, 35, 40, 190, 5, '2026-07-11 01:40:08'),
(90, 38, 35, 250, 0, '2026-07-11 01:52:54'),
(91, 36, 35, 250, 0, '2026-07-11 01:52:54'),
(92, 37, 35, 250, 0, '2026-07-11 01:52:54'),
(93, 1, 35, 225, 0, '2026-07-11 01:52:54'),
(94, 2, 35, 225, 0, '2026-07-11 01:52:54'),
(95, 4, 35, 175, 0, '2026-07-11 01:52:54'),
(96, 12, 35, 175, 0, '2026-07-11 01:52:54'),
(97, 11, 35, 150, 0, '2026-07-11 01:52:54'),
(98, 14, 35, 150, 0, '2026-07-11 01:52:54'),
(99, 13, 35, 150, 0, '2026-07-11 01:52:54'),
(100, 22, 35, 125, 0, '2026-07-11 01:52:54'),
(101, 6, 35, 125, 0, '2026-07-11 01:52:54'),
(102, 9, 3, 250, 0, '2026-07-11 01:55:47'),
(103, 8, 3, 250, 0, '2026-07-11 01:55:47'),
(104, 23, 3, 250, 0, '2026-07-11 01:55:47'),
(105, 21, 3, 225, 0, '2026-07-11 01:55:47'),
(106, 4, 3, 200, 0, '2026-07-11 01:55:47'),
(107, 6, 3, 175, 0, '2026-07-11 01:55:47'),
(108, 2, 3, 175, 0, '2026-07-11 01:55:47'),
(109, 22, 3, 175, 0, '2026-07-11 01:55:47'),
(110, 10, 3, 150, 0, '2026-07-11 01:55:47'),
(111, 38, 34, 200, 0, '2026-07-11 05:48:52'),
(112, 36, 34, 200, 0, '2026-07-11 05:48:52'),
(113, 37, 34, 175, 0, '2026-07-11 05:48:52'),
(114, 1, 34, 175, 0, '2026-07-11 05:48:52'),
(115, 2, 34, 150, 0, '2026-07-11 05:48:52'),
(116, 4, 34, 150, 0, '2026-07-11 05:48:52'),
(117, 11, 34, 125, 0, '2026-07-11 05:48:52'),
(118, 22, 34, 125, 0, '2026-07-11 05:48:52'),
(119, 6, 34, 100, 0, '2026-07-11 05:48:52'),
(120, 26, 80, 250, 5, '2026-07-11 05:52:09'),
(121, 30, 80, 225, 5, '2026-07-11 05:52:09'),
(122, 29, 80, 225, 5, '2026-07-11 05:52:09'),
(123, 8, 80, 200, 5, '2026-07-11 05:52:09'),
(124, 9, 80, 175, 5, '2026-07-11 05:52:09'),
(125, 23, 80, 150, 5, '2026-07-11 05:52:09'),
(126, 21, 80, 150, 5, '2026-07-11 05:52:09'),
(127, 41, 80, 250, 10, '2026-07-11 05:52:09'),
(128, 42, 80, 225, 10, '2026-07-11 05:52:09'),
(129, 43, 80, 200, 10, '2026-07-11 05:52:09'),
(130, 36, 10, 250, 0, '2026-07-11 05:53:50'),
(131, 37, 10, 225, 0, '2026-07-11 05:53:50'),
(132, 38, 10, 200, 0, '2026-07-11 05:53:50'),
(133, 1, 10, 175, 0, '2026-07-11 05:53:50'),
(134, 4, 10, 175, 0, '2026-07-11 05:53:50'),
(135, 12, 10, 175, 0, '2026-07-11 05:53:50'),
(136, 11, 10, 150, 0, '2026-07-11 05:53:50'),
(137, 22, 10, 150, 0, '2026-07-11 05:53:50'),
(138, 6, 10, 150, 0, '2026-07-11 05:53:50'),
(139, 9, 10, 125, 0, '2026-07-11 05:53:50'),
(140, 4, 28, 250, 0, '2026-07-11 05:55:16'),
(141, 1, 28, 225, 0, '2026-07-11 05:55:16'),
(142, 2, 28, 225, 0, '2026-07-11 05:55:16'),
(143, 12, 28, 225, 0, '2026-07-11 05:55:16'),
(144, 11, 28, 200, 0, '2026-07-11 05:55:16'),
(145, 13, 28, 175, 0, '2026-07-11 05:55:16'),
(146, 14, 28, 175, 0, '2026-07-11 05:55:16'),
(147, 36, 28, 150, 0, '2026-07-11 05:55:16'),
(148, 37, 28, 150, 0, '2026-07-11 05:55:16'),
(149, 38, 28, 125, 0, '2026-07-11 05:55:16'),
(150, 10, 41, 250, 0, '2026-07-11 07:23:36'),
(151, 34, 41, 250, 0, '2026-07-11 07:23:36'),
(152, 35, 41, 225, 0, '2026-07-11 07:23:36'),
(153, 33, 41, 225, 0, '2026-07-11 07:23:36'),
(154, 31, 41, 200, 0, '2026-07-11 07:23:36'),
(155, 9, 41, 200, 0, '2026-07-11 07:23:36'),
(156, 22, 41, 175, 0, '2026-07-11 07:23:36'),
(157, 26, 41, 150, 0, '2026-07-11 07:23:36'),
(158, 13, 9, 250, 0, '2026-07-11 07:25:33'),
(159, 14, 9, 250, 0, '2026-07-11 07:25:33'),
(160, 4, 9, 225, 0, '2026-07-11 07:25:33'),
(161, 12, 9, 225, 0, '2026-07-11 07:25:33'),
(162, 22, 9, 200, 0, '2026-07-11 07:25:33'),
(163, 6, 9, 200, 0, '2026-07-11 07:25:33'),
(164, 9, 9, 175, 0, '2026-07-11 07:25:33'),
(165, 38, 9, 150, 0, '2026-07-11 07:25:33'),
(166, 36, 9, 150, 0, '2026-07-11 07:25:33'),
(167, 37, 9, 125, 0, '2026-07-11 07:25:33'),
(168, 41, 97, 250, 10, '2026-07-11 07:27:13'),
(169, 42, 97, 225, 10, '2026-07-11 07:27:13'),
(170, 43, 97, 225, 10, '2026-07-11 07:27:13'),
(171, 26, 97, 200, 5, '2026-07-11 07:27:13'),
(172, 29, 97, 175, 5, '2026-07-11 07:27:13'),
(173, 30, 97, 175, 5, '2026-07-11 07:27:13'),
(174, 9, 97, 175, 5, '2026-07-11 07:27:13'),
(175, 6, 97, 175, 5, '2026-07-11 07:27:13'),
(176, 23, 97, 150, 5, '2026-07-11 07:27:13'),
(177, 21, 97, 150, 5, '2026-07-11 07:27:13'),
(178, 38, 55, 250, 0, '2026-07-11 07:29:00'),
(179, 37, 55, 250, 0, '2026-07-11 07:29:00'),
(180, 36, 55, 225, 0, '2026-07-11 07:29:00'),
(181, 11, 55, 200, 0, '2026-07-11 07:29:00'),
(182, 9, 55, 200, 0, '2026-07-11 07:29:00'),
(183, 6, 55, 200, 0, '2026-07-11 07:29:00'),
(184, 22, 55, 175, 0, '2026-07-11 07:29:00'),
(185, 14, 55, 175, 0, '2026-07-11 07:29:00'),
(186, 13, 55, 175, 0, '2026-07-11 07:29:00'),
(187, 2, 55, 150, 0, '2026-07-11 07:29:00'),
(188, 16, 71, 250, 0, '2026-07-11 07:31:36'),
(189, 17, 71, 250, 0, '2026-07-11 07:31:36'),
(190, 19, 71, 225, 0, '2026-07-11 07:31:36'),
(191, 15, 71, 200, 0, '2026-07-11 07:31:36'),
(192, 20, 71, 175, 0, '2026-07-11 07:31:36'),
(193, 26, 71, 175, 0, '2026-07-11 07:31:36'),
(194, 10, 71, 175, 0, '2026-07-11 07:31:36'),
(195, 13, 71, 150, 0, '2026-07-11 07:31:36'),
(196, 4, 71, 150, 0, '2026-07-11 07:31:36'),
(197, 6, 71, 150, 0, '2026-07-11 07:31:36'),
(198, 4, 16, 250, 10, '2026-07-11 07:33:39'),
(199, 6, 16, 250, 10, '2026-07-11 07:33:39'),
(200, 9, 16, 225, 10, '2026-07-11 07:33:39'),
(201, 1, 16, 200, 5, '2026-07-11 07:33:39'),
(202, 2, 16, 100, 15, '2026-07-11 07:33:39'),
(203, 13, 16, 150, 5, '2026-07-11 07:33:39'),
(204, 22, 16, 175, 5, '2026-07-11 07:33:39'),
(205, 23, 16, 175, 5, '2026-07-11 07:33:39'),
(206, 10, 16, 175, 5, '2026-07-11 07:33:39'),
(207, 16, 16, 175, 5, '2026-07-11 07:33:39'),
(208, 9, 39, 250, 0, '2026-07-11 07:37:24'),
(209, 10, 39, 250, 0, '2026-07-11 07:37:24'),
(210, 6, 39, 250, 0, '2026-07-11 07:37:24'),
(211, 34, 39, 225, 0, '2026-07-11 07:37:24'),
(212, 33, 39, 225, 0, '2026-07-11 07:37:24'),
(213, 31, 39, 200, 0, '2026-07-11 07:37:24'),
(214, 32, 39, 175, 0, '2026-07-11 07:37:24'),
(215, 22, 39, 175, 0, '2026-07-11 07:37:24'),
(216, 26, 39, 175, 0, '2026-07-11 07:37:24'),
(217, 16, 39, 150, 0, '2026-07-11 07:37:24'),
(218, 12, 72, 250, 0, '2026-07-11 07:43:02'),
(219, 15, 72, 250, 0, '2026-07-11 07:43:02'),
(220, 11, 72, 225, 0, '2026-07-11 07:43:02'),
(221, 16, 72, 200, 0, '2026-07-11 07:43:02'),
(222, 19, 72, 200, 0, '2026-07-11 07:43:02'),
(223, 18, 72, 175, 0, '2026-07-11 07:43:02'),
(224, 4, 72, 150, 0, '2026-07-11 07:43:02'),
(225, 13, 72, 175, 0, '2026-07-11 07:43:02'),
(226, 6, 72, 175, 0, '2026-07-11 07:43:02'),
(227, 17, 72, 150, 0, '2026-07-11 07:43:02'),
(228, 1, 25, 225, 0, '2026-07-11 07:46:40'),
(229, 4, 25, 250, 0, '2026-07-11 07:46:40'),
(230, 13, 25, 225, 0, '2026-07-11 07:46:40'),
(231, 14, 25, 225, 0, '2026-07-11 07:46:40'),
(232, 36, 25, 200, 0, '2026-07-11 07:46:40'),
(233, 37, 25, 200, 0, '2026-07-11 07:46:40'),
(234, 38, 25, 175, 0, '2026-07-11 07:46:40'),
(235, 11, 25, 175, 0, '2026-07-11 07:46:40'),
(236, 12, 25, 175, 0, '2026-07-11 07:46:40'),
(237, 6, 25, 150, 0, '2026-07-11 07:46:40'),
(238, 37, 29, 250, 0, '2026-07-11 07:49:32'),
(239, 36, 29, 250, 0, '2026-07-11 07:49:32'),
(240, 38, 29, 250, 0, '2026-07-11 07:49:32'),
(241, 1, 29, 225, 0, '2026-07-11 07:49:32'),
(242, 2, 29, 225, 0, '2026-07-11 07:49:32'),
(243, 4, 29, 225, 0, '2026-07-11 07:49:32'),
(244, 11, 29, 200, 0, '2026-07-11 07:49:32'),
(245, 13, 29, 200, 0, '2026-07-11 07:49:32'),
(246, 10, 29, 175, 0, '2026-07-11 07:49:32'),
(247, 9, 29, 175, 0, '2026-07-11 07:49:32'),
(248, 5, 75, 250, 0, '2026-07-11 07:54:02'),
(249, 3, 75, 250, 0, '2026-07-11 07:54:02'),
(250, 4, 75, 225, 0, '2026-07-11 07:54:02'),
(251, 23, 75, 225, 0, '2026-07-11 07:54:02'),
(252, 21, 75, 200, 0, '2026-07-11 07:54:02'),
(253, 24, 75, 200, 0, '2026-07-11 07:54:02'),
(254, 25, 75, 175, 0, '2026-07-11 07:54:02'),
(255, 9, 75, 175, 0, '2026-07-11 07:54:02'),
(256, 7, 75, 150, 0, '2026-07-11 07:54:02'),
(257, 41, 87, 250, 0, '2026-07-11 07:56:08'),
(258, 28, 87, 250, 0, '2026-07-11 07:56:08'),
(259, 27, 87, 225, 0, '2026-07-11 07:56:08'),
(260, 26, 87, 225, 0, '2026-07-11 07:56:08'),
(261, 8, 87, 175, 0, '2026-07-11 07:56:08'),
(262, 7, 87, 200, 0, '2026-07-11 07:56:08'),
(263, 9, 87, 175, 0, '2026-07-11 07:56:08'),
(264, 42, 87, 175, 0, '2026-07-11 07:56:08'),
(265, 43, 87, 150, 0, '2026-07-11 07:56:08'),
(266, 7, 93, 250, 0, '2026-07-11 07:58:02'),
(267, 8, 93, 250, 0, '2026-07-11 07:58:02'),
(268, 9, 93, 225, 0, '2026-07-11 07:58:02'),
(269, 26, 93, 225, 0, '2026-07-11 07:58:02'),
(270, 27, 93, 200, 0, '2026-07-11 07:58:02'),
(271, 28, 93, 200, 0, '2026-07-11 07:58:02'),
(272, 42, 93, 175, 0, '2026-07-11 07:58:02'),
(273, 2, 38, 250, 0, '2026-07-11 07:59:40'),
(274, 6, 38, 250, 0, '2026-07-11 07:59:40'),
(275, 11, 38, 225, 0, '2026-07-11 07:59:40'),
(276, 13, 38, 225, 0, '2026-07-11 07:59:40'),
(277, 4, 38, 200, 0, '2026-07-11 07:59:40'),
(278, 38, 38, 200, 0, '2026-07-11 07:59:40'),
(279, 22, 38, 175, 0, '2026-07-11 07:59:40'),
(281, 3, 14, 250, 10, '2026-07-11 08:03:00'),
(282, 4, 14, 250, 10, '2026-07-11 08:03:00'),
(283, 5, 14, 225, 5, '2026-07-11 08:03:00'),
(284, 7, 14, 150, 15, '2026-07-11 08:03:00'),
(285, 6, 14, 225, 5, '2026-07-11 08:03:00'),
(286, 9, 14, 200, 5, '2026-07-11 08:03:00'),
(287, 13, 14, 175, 5, '2026-07-11 08:03:00'),
(288, 14, 14, 175, 5, '2026-07-11 08:03:00'),
(289, 11, 14, 150, 5, '2026-07-11 08:03:00'),
(290, 22, 14, 200, 5, '2026-07-11 08:03:00'),
(291, 26, 42, 250, 0, '2026-07-11 08:05:00'),
(292, 10, 42, 250, 0, '2026-07-11 08:05:00'),
(293, 34, 42, 225, 0, '2026-07-11 08:05:00'),
(294, 35, 42, 225, 0, '2026-07-11 08:05:00'),
(295, 2, 42, 200, 0, '2026-07-11 08:05:00'),
(296, 9, 42, 200, 0, '2026-07-11 08:05:00'),
(297, 7, 42, 175, 0, '2026-07-11 08:05:00'),
(298, 22, 42, 175, 0, '2026-07-11 08:05:00'),
(299, 33, 42, 150, 0, '2026-07-11 08:05:00'),
(300, 11, 42, 150, 0, '2026-07-11 08:05:00'),
(301, 4, 12, 250, 0, '2026-07-11 08:06:43'),
(302, 16, 12, 250, 0, '2026-07-11 08:06:43'),
(303, 17, 12, 225, 0, '2026-07-11 08:06:43'),
(304, 19, 12, 225, 0, '2026-07-11 08:06:43'),
(305, 18, 12, 200, 0, '2026-07-11 08:06:43'),
(306, 1, 12, 200, 0, '2026-07-11 08:06:43'),
(307, 3, 12, 175, 0, '2026-07-11 08:06:43'),
(308, 5, 12, 175, 0, '2026-07-11 08:06:43'),
(309, 9, 12, 150, 0, '2026-07-11 08:06:43'),
(310, 11, 12, 150, 0, '2026-07-11 08:06:43'),
(311, 3, 6, 250, 0, '2026-07-11 08:11:19'),
(312, 7, 6, 250, 0, '2026-07-11 08:11:19'),
(313, 21, 6, 225, 0, '2026-07-11 08:11:19'),
(314, 23, 6, 225, 0, '2026-07-11 08:11:19'),
(315, 24, 6, 200, 0, '2026-07-11 08:11:19'),
(316, 25, 6, 200, 0, '2026-07-11 08:11:19'),
(317, 27, 6, 175, 0, '2026-07-11 08:11:19'),
(318, 28, 6, 175, 0, '2026-07-11 08:11:19'),
(319, 41, 6, 150, 0, '2026-07-11 08:11:19'),
(320, 43, 6, 150, 0, '2026-07-11 08:11:19'),
(321, 3, 13, 250, 0, '2026-07-11 08:12:58'),
(322, 7, 13, 250, 0, '2026-07-11 08:12:58'),
(323, 13, 13, 225, 0, '2026-07-11 08:12:58'),
(324, 14, 13, 225, 0, '2026-07-11 08:12:58'),
(325, 4, 13, 200, 0, '2026-07-11 08:12:58'),
(326, 5, 13, 200, 0, '2026-07-11 08:12:58'),
(327, 9, 13, 175, 0, '2026-07-11 08:12:58'),
(328, 6, 13, 175, 0, '2026-07-11 08:12:58'),
(329, 22, 36, 250, 0, '2026-07-11 08:14:27'),
(330, 11, 36, 250, 0, '2026-07-11 08:14:27'),
(331, 13, 36, 175, 0, '2026-07-11 08:14:27'),
(332, 38, 36, 175, 0, '2026-07-11 08:14:27'),
(333, 6, 36, 225, 0, '2026-07-11 08:14:27'),
(334, 4, 36, 225, 0, '2026-07-11 08:14:27'),
(335, 2, 36, 200, 0, '2026-07-11 08:14:27'),
(336, 36, 36, 200, 0, '2026-07-11 08:14:27'),
(337, 9, 37, 250, 0, '2026-07-11 08:15:50'),
(338, 37, 37, 250, 0, '2026-07-11 08:15:50'),
(339, 17, 37, 225, 0, '2026-07-11 08:15:50'),
(340, 18, 37, 225, 0, '2026-07-11 08:15:50'),
(341, 20, 37, 200, 0, '2026-07-11 08:15:50'),
(342, 39, 37, 200, 0, '2026-07-11 08:15:50'),
(343, 15, 37, 175, 0, '2026-07-11 08:15:50'),
(344, 19, 37, 175, 0, '2026-07-11 08:15:50'),
(345, 24, 84, 250, 0, '2026-07-11 08:20:59'),
(346, 25, 84, 250, 0, '2026-07-11 08:20:59'),
(347, 23, 84, 225, 0, '2026-07-11 08:20:59'),
(348, 7, 84, 225, 0, '2026-07-11 08:20:59'),
(349, 27, 84, 200, 0, '2026-07-11 08:20:59'),
(350, 28, 84, 200, 0, '2026-07-11 08:20:59'),
(352, 19, 70, 250, 10, '2026-07-11 09:18:13'),
(353, 30, 70, 250, 10, '2026-07-11 09:18:13'),
(354, 11, 70, 225, 5, '2026-07-11 09:18:13'),
(355, 26, 70, 225, 5, '2026-07-11 09:18:13'),
(356, 13, 70, 200, 5, '2026-07-11 09:18:13'),
(357, 6, 70, 200, 5, '2026-07-11 09:18:13'),
(358, 2, 70, 175, 5, '2026-07-11 09:18:13'),
(359, 16, 70, 175, 5, '2026-07-11 09:18:13'),
(360, 22, 70, 150, 0, '2026-07-11 09:18:13'),
(361, 20, 70, 150, 0, '2026-07-11 09:18:13'),
(362, 10, 30, 250, 0, '2026-07-11 09:20:20'),
(363, 22, 30, 250, 0, '2026-07-11 09:20:20'),
(364, 1, 30, 225, 0, '2026-07-11 09:20:20'),
(365, 36, 30, 225, 0, '2026-07-11 09:20:20'),
(366, 39, 30, 200, 0, '2026-07-11 09:20:20'),
(367, 20, 30, 200, 0, '2026-07-11 09:20:20'),
(368, 2, 30, 175, 0, '2026-07-11 09:20:20'),
(369, 37, 30, 175, 0, '2026-07-11 09:20:20'),
(370, 4, 30, 150, 0, '2026-07-11 09:20:20'),
(371, 14, 30, 150, 0, '2026-07-11 09:20:20'),
(372, 26, 76, 250, 0, '2026-07-11 09:21:49'),
(373, 27, 76, 250, 0, '2026-07-11 09:21:49'),
(374, 28, 76, 225, 0, '2026-07-11 09:21:49'),
(375, 41, 76, 225, 0, '2026-07-11 09:21:49'),
(376, 42, 76, 200, 0, '2026-07-11 09:21:49'),
(377, 43, 76, 200, 0, '2026-07-11 09:21:49'),
(378, 9, 76, 175, 0, '2026-07-11 09:21:49'),
(379, 8, 76, 175, 0, '2026-07-11 09:21:49'),
(380, 1, 7, 250, 0, '2026-07-11 09:24:06'),
(381, 4, 7, 250, 0, '2026-07-11 09:24:06'),
(382, 6, 7, 225, 0, '2026-07-11 09:24:06'),
(383, 2, 7, 225, 0, '2026-07-11 09:24:06'),
(384, 3, 7, 200, 0, '2026-07-11 09:24:06'),
(385, 5, 7, 200, 0, '2026-07-11 09:24:06'),
(386, 9, 7, 175, 0, '2026-07-11 09:24:06'),
(387, 11, 7, 175, 0, '2026-07-11 09:24:06'),
(388, 12, 7, 150, 0, '2026-07-11 09:24:06'),
(389, 22, 7, 150, 0, '2026-07-11 09:24:06'),
(390, 1, 57, 250, 0, '2026-07-11 09:26:08'),
(391, 4, 57, 250, 0, '2026-07-11 09:26:08'),
(392, 11, 57, 225, 0, '2026-07-11 09:26:08'),
(393, 12, 57, 225, 0, '2026-07-11 09:26:08'),
(394, 13, 57, 200, 0, '2026-07-11 09:26:08'),
(395, 14, 57, 200, 0, '2026-07-11 09:26:08'),
(396, 2, 57, 175, 0, '2026-07-11 09:26:08'),
(397, 6, 57, 175, 0, '2026-07-11 09:26:08'),
(398, 15, 57, 150, 0, '2026-07-11 09:26:08'),
(399, 16, 57, 150, 0, '2026-07-11 09:26:08'),
(400, 7, 96, 250, 0, '2026-07-11 09:28:04'),
(401, 8, 96, 250, 0, '2026-07-11 09:28:04'),
(402, 9, 96, 225, 0, '2026-07-11 09:28:04'),
(403, 21, 96, 225, 0, '2026-07-11 09:28:04'),
(404, 23, 96, 200, 0, '2026-07-11 09:28:04'),
(405, 24, 96, 200, 0, '2026-07-11 09:28:04'),
(406, 25, 96, 175, 0, '2026-07-11 09:28:04'),
(407, 3, 96, 175, 0, '2026-07-11 09:28:04'),
(408, 5, 96, 150, 0, '2026-07-11 09:28:04'),
(409, 41, 96, 150, 0, '2026-07-11 09:28:04'),
(410, 28, 5, 250, 0, '2026-07-11 09:29:32'),
(411, 27, 5, 250, 0, '2026-07-11 09:29:32'),
(412, 41, 5, 225, 0, '2026-07-11 09:29:32'),
(413, 7, 5, 225, 0, '2026-07-11 09:29:32'),
(414, 8, 5, 200, 0, '2026-07-11 09:29:32'),
(415, 26, 5, 200, 0, '2026-07-11 09:29:32'),
(416, 42, 5, 175, 0, '2026-07-11 09:29:32'),
(417, 43, 5, 175, 0, '2026-07-11 09:29:32'),
(418, 21, 5, 150, 0, '2026-07-11 09:29:32'),
(419, 25, 5, 150, 0, '2026-07-11 09:29:32'),
(420, 9, 11, 250, 0, '2026-07-11 09:41:53'),
(421, 4, 11, 250, 0, '2026-07-11 09:41:53'),
(422, 5, 11, 225, 0, '2026-07-11 09:41:53'),
(423, 3, 11, 225, 0, '2026-07-11 09:41:53'),
(424, 26, 11, 200, 0, '2026-07-11 09:41:53'),
(425, 6, 11, 200, 0, '2026-07-11 09:41:53'),
(426, 7, 11, 175, 0, '2026-07-11 09:41:53'),
(427, 8, 11, 175, 0, '2026-07-11 09:41:53'),
(428, 1, 11, 150, 0, '2026-07-11 09:41:53'),
(429, 2, 11, 150, 0, '2026-07-11 09:41:53'),
(430, 4, 66, 250, 0, '2026-07-11 09:43:11'),
(431, 13, 66, 250, 0, '2026-07-11 09:43:11'),
(432, 14, 66, 225, 0, '2026-07-11 09:43:11'),
(433, 6, 66, 225, 0, '2026-07-11 09:43:11'),
(434, 26, 66, 200, 0, '2026-07-11 09:43:11'),
(435, 2, 66, 200, 0, '2026-07-11 09:43:11'),
(436, 9, 66, 175, 0, '2026-07-11 09:43:11'),
(437, 10, 66, 175, 0, '2026-07-11 09:43:11'),
(438, 28, 92, 250, 0, '2026-07-11 09:44:22'),
(439, 27, 92, 250, 0, '2026-07-11 09:44:22'),
(440, 26, 92, 225, 0, '2026-07-11 09:44:22'),
(441, 9, 92, 225, 0, '2026-07-11 09:44:22'),
(442, 8, 92, 200, 0, '2026-07-11 09:44:22'),
(443, 41, 92, 200, 0, '2026-07-11 09:44:22'),
(444, 42, 92, 175, 0, '2026-07-11 09:44:22'),
(445, 43, 92, 175, 0, '2026-07-11 09:44:22'),
(446, 7, 15, 250, 0, '2026-07-11 09:45:59'),
(447, 25, 15, 250, 0, '2026-07-11 09:45:59'),
(448, 23, 15, 225, 0, '2026-07-11 09:45:59'),
(449, 4, 15, 225, 0, '2026-07-11 09:45:59'),
(450, 9, 15, 200, 0, '2026-07-11 09:45:59'),
(451, 3, 15, 200, 0, '2026-07-11 09:45:59'),
(452, 5, 15, 175, 0, '2026-07-11 09:45:59'),
(453, 8, 15, 175, 0, '2026-07-11 09:45:59'),
(454, 6, 67, 250, 0, '2026-07-11 09:47:26'),
(455, 26, 67, 250, 0, '2026-07-11 09:47:26'),
(456, 1, 67, 225, 0, '2026-07-11 09:47:26'),
(457, 4, 67, 225, 0, '2026-07-11 09:47:26'),
(458, 2, 67, 200, 0, '2026-07-11 09:47:26'),
(459, 13, 67, 200, 0, '2026-07-11 09:47:26'),
(460, 14, 67, 175, 0, '2026-07-11 09:47:26'),
(461, 10, 67, 175, 0, '2026-07-11 09:47:26'),
(462, 11, 62, 250, 0, '2026-07-11 09:49:53'),
(463, 12, 62, 250, 0, '2026-07-11 09:49:53'),
(464, 13, 62, 225, 0, '2026-07-11 09:49:53'),
(465, 14, 62, 225, 0, '2026-07-11 09:49:53'),
(466, 22, 62, 175, 0, '2026-07-11 09:49:53'),
(467, 17, 62, 175, 0, '2026-07-11 09:49:53'),
(468, 16, 62, 200, 0, '2026-07-11 09:49:53'),
(469, 15, 62, 200, 0, '2026-07-11 09:49:53'),
(470, 41, 99, 250, 0, '2026-07-11 09:51:07'),
(471, 27, 99, 250, 0, '2026-07-11 09:51:07'),
(472, 28, 99, 225, 0, '2026-07-11 09:51:07'),
(473, 26, 99, 225, 0, '2026-07-11 09:51:07'),
(474, 42, 99, 200, 0, '2026-07-11 09:51:07'),
(475, 8, 99, 200, 0, '2026-07-11 09:51:07'),
(476, 43, 99, 175, 0, '2026-07-11 09:51:07'),
(477, 9, 99, 175, 0, '2026-07-11 09:51:07'),
(478, 6, 24, 250, 0, '2026-07-11 09:52:55'),
(479, 7, 24, 250, 0, '2026-07-11 09:52:56'),
(480, 8, 24, 225, 0, '2026-07-11 09:52:56'),
(481, 9, 24, 225, 0, '2026-07-11 09:52:56'),
(482, 26, 24, 200, 0, '2026-07-11 09:52:56'),
(483, 27, 24, 200, 0, '2026-07-11 09:52:56'),
(484, 4, 24, 175, 0, '2026-07-11 09:52:56'),
(485, 5, 24, 175, 0, '2026-07-11 09:52:56'),
(486, 20, 17, 250, 0, '2026-07-11 09:55:29'),
(487, 15, 17, 250, 0, '2026-07-11 09:55:29'),
(488, 14, 17, 225, 0, '2026-07-11 09:55:29'),
(489, 13, 17, 225, 0, '2026-07-11 09:55:29'),
(490, 7, 17, 200, 0, '2026-07-11 09:55:29'),
(491, 8, 17, 200, 0, '2026-07-11 09:55:29'),
(492, 6, 17, 175, 0, '2026-07-11 09:55:29'),
(493, 4, 17, 175, 0, '2026-07-11 09:55:29'),
(494, 18, 74, 250, 0, '2026-07-11 09:57:11'),
(495, 19, 74, 250, 0, '2026-07-11 09:57:11'),
(496, 17, 74, 225, 0, '2026-07-11 09:57:11'),
(497, 16, 74, 225, 0, '2026-07-11 09:57:11'),
(498, 14, 74, 200, 0, '2026-07-11 09:57:11'),
(499, 13, 74, 200, 0, '2026-07-11 09:57:11'),
(500, 1, 74, 175, 0, '2026-07-11 09:57:11'),
(501, 2, 74, 175, 0, '2026-07-11 09:57:11'),
(502, 7, 91, 250, 0, '2026-07-11 09:59:05'),
(503, 8, 91, 250, 0, '2026-07-11 09:59:05'),
(504, 26, 91, 225, 0, '2026-07-11 09:59:05'),
(505, 27, 91, 225, 0, '2026-07-11 09:59:05'),
(506, 28, 91, 200, 0, '2026-07-11 09:59:05'),
(507, 23, 91, 200, 0, '2026-07-11 09:59:05'),
(508, 25, 91, 175, 0, '2026-07-11 09:59:05'),
(509, 41, 91, 175, 0, '2026-07-11 09:59:05'),
(510, 36, 19, 250, 0, '2026-07-11 10:00:43'),
(511, 37, 19, 250, 0, '2026-07-11 10:00:43'),
(512, 38, 19, 225, 0, '2026-07-11 10:00:43'),
(513, 39, 19, 225, 0, '2026-07-11 10:00:43'),
(514, 4, 19, 200, 0, '2026-07-11 10:00:43'),
(515, 1, 19, 200, 0, '2026-07-11 10:00:43'),
(516, 6, 19, 175, 0, '2026-07-11 10:00:43'),
(517, 9, 19, 175, 0, '2026-07-11 10:00:43'),
(518, 4, 32, 250, 10, '2026-07-11 10:02:31'),
(519, 38, 32, 250, 10, '2026-07-11 10:02:31'),
(520, 37, 32, 225, 5, '2026-07-11 10:02:31'),
(521, 36, 32, 225, 5, '2026-07-11 10:02:31'),
(522, 2, 32, 200, 5, '2026-07-11 10:02:31'),
(523, 22, 32, 200, 5, '2026-07-11 10:02:31'),
(524, 9, 32, 175, 0, '2026-07-11 10:02:31'),
(525, 10, 32, 175, 0, '2026-07-11 10:02:31'),
(526, 11, 31, 250, 0, '2026-07-11 10:04:46'),
(527, 36, 31, 250, 0, '2026-07-11 10:04:46'),
(528, 12, 31, 225, 0, '2026-07-11 10:04:46'),
(529, 22, 31, 225, 0, '2026-07-11 10:04:46'),
(530, 14, 31, 200, 0, '2026-07-11 10:04:46'),
(531, 13, 31, 200, 0, '2026-07-11 10:04:46'),
(532, 16, 31, 175, 0, '2026-07-11 10:04:46'),
(533, 17, 31, 175, 0, '2026-07-11 10:04:46'),
(534, 26, 53, 250, 0, '2026-07-11 10:06:32'),
(535, 10, 53, 250, 0, '2026-07-11 10:06:32'),
(536, 29, 53, 225, 0, '2026-07-11 10:06:32'),
(537, 30, 53, 225, 0, '2026-07-11 10:06:32'),
(538, 6, 53, 200, 0, '2026-07-11 10:06:32'),
(539, 9, 53, 200, 0, '2026-07-11 10:06:32'),
(540, 27, 53, 175, 0, '2026-07-11 10:06:32'),
(541, 28, 53, 175, 0, '2026-07-11 10:06:32'),
(542, 28, 23, 250, 0, '2026-07-11 10:08:02'),
(543, 27, 23, 250, 0, '2026-07-11 10:08:02'),
(544, 26, 23, 225, 0, '2026-07-11 10:08:02'),
(545, 9, 23, 225, 0, '2026-07-11 10:08:02'),
(546, 8, 23, 200, 0, '2026-07-11 10:08:02'),
(547, 41, 23, 200, 0, '2026-07-11 10:08:02'),
(548, 3, 23, 175, 0, '2026-07-11 10:08:02'),
(549, 5, 23, 175, 0, '2026-07-11 10:08:02'),
(550, 18, 2, 250, 0, '2026-07-11 10:09:50'),
(551, 17, 2, 250, 0, '2026-07-11 10:09:50'),
(552, 16, 2, 225, 0, '2026-07-11 10:09:50'),
(553, 19, 2, 225, 0, '2026-07-11 10:09:50'),
(554, 11, 2, 200, 0, '2026-07-11 10:09:50'),
(555, 14, 2, 200, 0, '2026-07-11 10:09:50'),
(556, 20, 2, 175, 0, '2026-07-11 10:09:50'),
(557, 1, 2, 175, 0, '2026-07-11 10:09:50'),
(558, 23, 51, 250, 0, '2026-07-11 10:11:28'),
(559, 41, 51, 250, 0, '2026-07-11 10:11:28'),
(560, 42, 51, 225, 0, '2026-07-11 10:11:28'),
(561, 8, 51, 225, 0, '2026-07-11 10:11:28'),
(562, 6, 51, 200, 0, '2026-07-11 10:11:28'),
(563, 9, 51, 200, 0, '2026-07-11 10:11:28'),
(564, 27, 51, 175, 0, '2026-07-11 10:11:28'),
(565, 28, 51, 175, 0, '2026-07-11 10:11:28'),
(566, 7, 95, 250, 0, '2026-07-11 10:13:27'),
(567, 8, 95, 250, 0, '2026-07-11 10:13:27'),
(568, 28, 95, 225, 0, '2026-07-11 10:13:27'),
(569, 3, 95, 225, 0, '2026-07-11 10:13:27'),
(570, 23, 95, 200, 0, '2026-07-11 10:13:27'),
(571, 25, 95, 200, 0, '2026-07-11 10:13:27'),
(572, 24, 95, 175, 0, '2026-07-11 10:13:27'),
(573, 41, 95, 175, 0, '2026-07-11 10:13:27'),
(574, 37, 8, 250, 0, '2026-07-11 10:14:54'),
(575, 36, 8, 250, 0, '2026-07-11 10:14:54'),
(576, 22, 8, 225, 0, '2026-07-11 10:14:54'),
(577, 38, 8, 225, 0, '2026-07-11 10:14:54'),
(578, 4, 8, 200, 0, '2026-07-11 10:14:54'),
(579, 6, 8, 200, 0, '2026-07-11 10:14:54'),
(580, 12, 8, 175, 0, '2026-07-11 10:14:54'),
(581, 9, 8, 175, 0, '2026-07-11 10:14:54'),
(582, 14, 63, 250, 0, '2026-07-11 10:16:03'),
(583, 11, 63, 250, 0, '2026-07-11 10:16:03'),
(584, 13, 63, 225, 0, '2026-07-11 10:16:03'),
(585, 1, 63, 225, 0, '2026-07-11 10:16:03'),
(586, 2, 63, 200, 0, '2026-07-11 10:16:03'),
(587, 15, 63, 200, 0, '2026-07-11 10:16:03'),
(588, 17, 63, 175, 0, '2026-07-11 10:16:03'),
(589, 16, 63, 175, 0, '2026-07-11 10:16:03'),
(590, 1, 49, 250, 0, '2026-07-11 10:17:35'),
(591, 2, 49, 250, 0, '2026-07-11 10:17:35'),
(592, 4, 49, 225, 0, '2026-07-11 10:17:35'),
(593, 6, 49, 225, 0, '2026-07-11 10:17:35'),
(594, 10, 49, 200, 0, '2026-07-11 10:17:35'),
(595, 13, 49, 200, 0, '2026-07-11 10:17:35'),
(596, 14, 49, 175, 0, '2026-07-11 10:17:35'),
(597, 19, 49, 175, 0, '2026-07-11 10:17:35'),
(598, 18, 58, 250, 10, '2026-07-11 10:18:55'),
(599, 10, 58, 250, 10, '2026-07-11 10:18:55'),
(600, 20, 58, 225, 5, '2026-07-11 10:18:55'),
(601, 2, 58, 225, 5, '2026-07-11 10:18:55'),
(602, 22, 58, 200, 5, '2026-07-11 10:18:55'),
(603, 19, 58, 200, 5, '2026-07-11 10:18:55'),
(605, 29, 69, 250, 10, '2026-07-11 10:20:45'),
(606, 10, 69, 250, 10, '2026-07-11 10:20:45'),
(607, 26, 69, 225, 5, '2026-07-11 10:20:45'),
(608, 11, 69, 225, 5, '2026-07-11 10:20:45'),
(609, 19, 69, 200, 5, '2026-07-11 10:20:45'),
(610, 16, 69, 200, 5, '2026-07-11 10:20:45'),
(611, 22, 69, 175, 0, '2026-07-11 10:20:45'),
(612, 20, 69, 175, 0, '2026-07-11 10:20:45'),
(613, 9, 56, 250, 0, '2026-07-11 10:22:12'),
(614, 15, 56, 250, 0, '2026-07-11 10:22:12'),
(615, 16, 56, 225, 0, '2026-07-11 10:22:12'),
(616, 17, 56, 225, 0, '2026-07-11 10:22:12'),
(617, 22, 56, 200, 0, '2026-07-11 10:22:12'),
(618, 36, 56, 200, 0, '2026-07-11 10:22:12'),
(619, 6, 56, 175, 0, '2026-07-11 10:22:12'),
(620, 2, 56, 175, 0, '2026-07-11 10:22:12'),
(621, 2, 65, 250, 0, '2026-07-11 10:24:22'),
(622, 1, 65, 250, 0, '2026-07-11 10:24:22'),
(623, 16, 65, 225, 0, '2026-07-11 10:24:22'),
(624, 18, 65, 225, 0, '2026-07-11 10:24:22'),
(625, 10, 65, 200, 0, '2026-07-11 10:24:22'),
(626, 11, 65, 200, 0, '2026-07-11 10:24:22'),
(627, 19, 65, 175, 0, '2026-07-11 10:24:22'),
(628, 17, 65, 175, 0, '2026-07-11 10:24:22'),
(629, 8, 83, 250, 0, '2026-07-11 10:25:30'),
(630, 9, 83, 250, 0, '2026-07-11 10:25:30'),
(631, 23, 83, 225, 0, '2026-07-11 10:25:30'),
(632, 21, 83, 225, 0, '2026-07-11 10:25:30'),
(633, 4, 83, 200, 0, '2026-07-11 10:25:30'),
(634, 1, 83, 200, 0, '2026-07-11 10:25:30'),
(635, 22, 83, 175, 0, '2026-07-11 10:25:30'),
(636, 6, 83, 175, 0, '2026-07-11 10:25:30'),
(637, 37, 61, 250, 0, '2026-07-11 10:26:45'),
(638, 36, 61, 250, 0, '2026-07-11 10:26:45'),
(639, 2, 61, 225, 0, '2026-07-11 10:26:45'),
(640, 6, 61, 225, 0, '2026-07-11 10:26:45'),
(641, 15, 61, 200, 0, '2026-07-11 10:26:45'),
(642, 16, 61, 200, 0, '2026-07-11 10:26:45'),
(643, 17, 61, 175, 0, '2026-07-11 10:26:45'),
(644, 22, 61, 175, 0, '2026-07-11 10:26:45'),
(645, 13, 59, 250, 0, '2026-07-11 10:28:32'),
(646, 14, 59, 250, 0, '2026-07-11 10:28:32'),
(647, 22, 59, 225, 0, '2026-07-11 10:28:32'),
(648, 19, 59, 225, 0, '2026-07-11 10:28:32'),
(649, 12, 59, 200, 0, '2026-07-11 10:28:32'),
(650, 4, 59, 200, 0, '2026-07-11 10:28:32'),
(651, 17, 59, 175, 0, '2026-07-11 10:28:32'),
(652, 16, 59, 175, 0, '2026-07-11 10:28:32'),
(653, 8, 54, 250, 0, '2026-07-11 10:29:43'),
(654, 23, 54, 250, 0, '2026-07-11 10:29:43'),
(655, 26, 54, 225, 0, '2026-07-11 10:29:43'),
(656, 10, 54, 225, 0, '2026-07-11 10:29:43'),
(657, 29, 54, 200, 0, '2026-07-11 10:29:43'),
(658, 30, 54, 200, 0, '2026-07-11 10:29:43'),
(659, 6, 54, 175, 0, '2026-07-11 10:29:43'),
(660, 9, 54, 175, 0, '2026-07-11 10:29:43'),
(661, 7, 89, 250, 0, '2026-07-11 10:31:39'),
(662, 8, 89, 250, 0, '2026-07-11 10:31:39'),
(663, 41, 89, 225, 0, '2026-07-11 10:31:39'),
(664, 42, 89, 225, 0, '2026-07-11 10:31:39'),
(665, 43, 89, 200, 0, '2026-07-11 10:31:39'),
(666, 28, 89, 200, 0, '2026-07-11 10:31:39'),
(667, 21, 89, 175, 0, '2026-07-11 10:31:39'),
(668, 23, 89, 175, 0, '2026-07-11 10:31:39'),
(669, 34, 44, 250, 0, '2026-07-11 10:34:39'),
(670, 35, 44, 250, 0, '2026-07-11 10:34:39'),
(671, 26, 44, 225, 0, '2026-07-11 10:34:39'),
(672, 10, 44, 225, 0, '2026-07-11 10:34:39'),
(673, 6, 44, 200, 0, '2026-07-11 10:34:39'),
(674, 9, 44, 200, 0, '2026-07-11 10:34:39'),
(675, 1, 44, 175, 0, '2026-07-11 10:34:39'),
(676, 7, 44, 175, 0, '2026-07-11 10:34:39'),
(677, 1, 64, 250, 0, '2026-07-11 10:36:00'),
(678, 4, 64, 250, 0, '2026-07-11 10:36:00'),
(679, 12, 64, 225, 0, '2026-07-11 10:36:00'),
(680, 2, 64, 225, 0, '2026-07-11 10:36:00'),
(681, 6, 64, 200, 0, '2026-07-11 10:36:00'),
(682, 19, 64, 200, 0, '2026-07-11 10:36:00'),
(683, 9, 64, 175, 0, '2026-07-11 10:36:00'),
(684, 10, 64, 175, 0, '2026-07-11 10:36:00'),
(685, 22, 50, 250, 0, '2026-07-11 10:37:15'),
(686, 27, 50, 250, 0, '2026-07-11 10:37:15'),
(687, 28, 50, 225, 0, '2026-07-11 10:37:15'),
(688, 17, 50, 225, 0, '2026-07-11 10:37:15'),
(689, 16, 50, 200, 0, '2026-07-11 10:37:15'),
(690, 14, 50, 200, 0, '2026-07-11 10:37:15'),
(691, 6, 50, 175, 0, '2026-07-11 10:37:15'),
(692, 4, 50, 175, 0, '2026-07-11 10:37:15'),
(693, 42, 79, 250, 10, '2026-07-11 10:38:56'),
(694, 43, 79, 250, 10, '2026-07-11 10:38:56'),
(695, 26, 79, 225, 5, '2026-07-11 10:38:56'),
(696, 41, 79, 225, 5, '2026-07-11 10:38:56'),
(697, 28, 79, 200, 5, '2026-07-11 10:38:56'),
(698, 27, 79, 200, 5, '2026-07-11 10:38:56'),
(699, 7, 79, 175, 0, '2026-07-11 10:38:56'),
(700, 3, 79, 175, 0, '2026-07-11 10:38:56'),
(701, 19, 47, 250, 0, '2026-07-11 10:40:18'),
(702, 17, 47, 250, 0, '2026-07-11 10:40:18'),
(703, 16, 47, 225, 0, '2026-07-11 10:40:18'),
(704, 18, 47, 225, 0, '2026-07-11 10:40:18'),
(705, 22, 47, 200, 0, '2026-07-11 10:40:18'),
(706, 2, 47, 200, 0, '2026-07-11 10:40:18'),
(707, 10, 47, 175, 0, '2026-07-11 10:40:18'),
(708, 13, 47, 175, 0, '2026-07-11 10:40:18'),
(709, 39, 33, 250, 0, '2026-07-11 10:42:22'),
(710, 36, 33, 250, 0, '2026-07-11 10:42:22'),
(711, 40, 33, 225, 0, '2026-07-11 10:42:22'),
(712, 38, 33, 225, 0, '2026-07-11 10:42:22'),
(713, 11, 33, 200, 0, '2026-07-11 10:42:22'),
(714, 13, 33, 200, 0, '2026-07-11 10:42:22'),
(715, 22, 33, 175, 0, '2026-07-11 10:42:22'),
(716, 14, 33, 175, 0, '2026-07-11 10:42:22'),
(717, 1, 21, 250, 0, '2026-07-11 10:43:45'),
(718, 3, 21, 250, 0, '2026-07-11 10:43:45'),
(719, 5, 21, 225, 0, '2026-07-11 10:43:45'),
(720, 4, 21, 225, 0, '2026-07-11 10:43:45'),
(721, 6, 21, 200, 0, '2026-07-11 10:43:45'),
(722, 9, 21, 200, 0, '2026-07-11 10:43:45'),
(723, 2, 21, 175, 0, '2026-07-11 10:43:45'),
(724, 11, 21, 175, 0, '2026-07-11 10:43:45'),
(725, 41, 86, 250, 0, '2026-07-11 10:45:07'),
(726, 24, 86, 250, 0, '2026-07-11 10:45:07'),
(727, 23, 86, 225, 0, '2026-07-11 10:45:07'),
(728, 25, 86, 225, 0, '2026-07-11 10:45:07'),
(729, 9, 86, 200, 0, '2026-07-11 10:45:07'),
(730, 21, 86, 200, 0, '2026-07-11 10:45:07'),
(731, 8, 86, 175, 0, '2026-07-11 10:45:07'),
(732, 43, 86, 175, 0, '2026-07-11 10:45:07'),
(733, 27, 90, 250, 0, '2026-07-11 10:46:48'),
(734, 28, 90, 250, 0, '2026-07-11 10:46:48'),
(735, 41, 90, 225, 0, '2026-07-11 10:46:48'),
(736, 43, 90, 225, 0, '2026-07-11 10:46:48'),
(737, 26, 90, 200, 0, '2026-07-11 10:46:48'),
(738, 7, 90, 200, 0, '2026-07-11 10:46:48'),
(739, 21, 90, 175, 0, '2026-07-11 10:46:48'),
(740, 24, 90, 175, 0, '2026-07-11 10:46:48'),
(741, 6, 52, 250, 0, '2026-07-11 10:48:01'),
(742, 8, 52, 250, 0, '2026-07-11 10:48:01'),
(743, 9, 52, 225, 0, '2026-07-11 10:48:01'),
(744, 22, 52, 225, 0, '2026-07-11 10:48:01'),
(745, 29, 52, 200, 0, '2026-07-11 10:48:01'),
(746, 30, 52, 200, 0, '2026-07-11 10:48:01'),
(747, 27, 52, 175, 0, '2026-07-11 10:48:01'),
(748, 28, 52, 175, 0, '2026-07-11 10:48:01'),
(749, 35, 94, 250, 0, '2026-07-11 10:49:34'),
(750, 33, 94, 250, 0, '2026-07-11 10:49:34'),
(751, 26, 94, 225, 0, '2026-07-11 10:49:34'),
(752, 43, 94, 200, 0, '2026-07-11 10:49:34'),
(753, 41, 94, 225, 0, '2026-07-11 10:49:34'),
(754, 7, 94, 200, 0, '2026-07-11 10:49:34'),
(755, 25, 94, 175, 0, '2026-07-11 10:49:34'),
(756, 21, 94, 175, 0, '2026-07-11 10:49:34'),
(757, 4, 77, 250, 0, '2026-07-11 10:50:54'),
(758, 3, 77, 250, 0, '2026-07-11 10:50:54'),
(759, 26, 77, 225, 0, '2026-07-11 10:50:54'),
(760, 41, 77, 225, 0, '2026-07-11 10:50:54'),
(761, 27, 77, 200, 0, '2026-07-11 10:50:54'),
(762, 28, 77, 200, 0, '2026-07-11 10:50:54'),
(763, 21, 77, 175, 0, '2026-07-11 10:50:54'),
(764, 24, 77, 175, 0, '2026-07-11 10:50:54'),
(765, 36, 22, 250, 0, '2026-07-11 10:52:02'),
(766, 37, 22, 250, 0, '2026-07-11 10:52:02'),
(767, 4, 22, 225, 0, '2026-07-11 10:52:02'),
(768, 1, 22, 225, 0, '2026-07-11 10:52:02'),
(769, 3, 22, 200, 0, '2026-07-11 10:52:02'),
(770, 5, 22, 175, 0, '2026-07-11 10:52:02'),
(771, 38, 22, 200, 0, '2026-07-11 10:52:02'),
(772, 20, 22, 175, 0, '2026-07-11 10:52:02'),
(773, 42, 88, 250, 0, '2026-07-11 10:53:24'),
(774, 24, 88, 250, 0, '2026-07-11 10:53:24'),
(775, 21, 88, 225, 0, '2026-07-11 10:53:24'),
(776, 23, 88, 225, 0, '2026-07-11 10:53:24'),
(777, 41, 88, 200, 0, '2026-07-11 10:53:24'),
(778, 43, 88, 200, 0, '2026-07-11 10:53:24'),
(779, 8, 88, 175, 0, '2026-07-11 10:53:24'),
(780, 9, 88, 175, 0, '2026-07-11 10:53:24'),
(781, 43, 78, 250, 10, '2026-07-11 10:55:07'),
(782, 41, 78, 250, 10, '2026-07-11 10:55:07'),
(783, 26, 78, 225, 5, '2026-07-11 10:55:07'),
(784, 8, 78, 225, 5, '2026-07-11 10:55:07'),
(785, 3, 78, 200, 5, '2026-07-11 10:55:07'),
(786, 5, 78, 200, 5, '2026-07-11 10:55:07'),
(787, 21, 78, 175, 0, '2026-07-11 10:55:07'),
(788, 23, 78, 175, 0, '2026-07-11 10:55:07'),
(789, 41, 85, 250, 0, '2026-07-11 10:58:22'),
(790, 32, 85, 250, 0, '2026-07-11 10:58:22'),
(791, 31, 85, 225, 0, '2026-07-11 10:58:22'),
(792, 15, 85, 225, 0, '2026-07-11 10:58:22'),
(793, 8, 85, 200, 0, '2026-07-11 10:58:22'),
(794, 34, 85, 200, 0, '2026-07-11 10:58:22'),
(795, 27, 85, 175, 0, '2026-07-11 10:58:22'),
(796, 28, 85, 175, 0, '2026-07-11 10:58:22'),
(797, 7, 4, 250, 0, '2026-07-11 11:00:23'),
(798, 25, 4, 250, 0, '2026-07-11 11:00:23'),
(799, 24, 4, 225, 0, '2026-07-11 11:00:23'),
(800, 21, 4, 225, 0, '2026-07-11 11:00:23'),
(801, 9, 4, 200, 0, '2026-07-11 11:00:23'),
(802, 6, 4, 200, 0, '2026-07-11 11:00:23'),
(803, 17, 4, 175, 0, '2026-07-11 11:00:23'),
(804, 16, 4, 175, 0, '2026-07-11 11:00:23'),
(805, 36, 20, 250, 0, '2026-07-11 11:01:49'),
(806, 37, 20, 250, 0, '2026-07-11 11:01:49'),
(807, 25, 20, 225, 0, '2026-07-11 11:01:49'),
(808, 23, 20, 225, 0, '2026-07-11 11:01:49'),
(809, 13, 20, 200, 0, '2026-07-11 11:01:49'),
(810, 7, 20, 200, 0, '2026-07-11 11:01:49'),
(811, 16, 20, 175, 0, '2026-07-11 11:01:49'),
(812, 15, 20, 175, 0, '2026-07-11 11:01:49'),
(813, 28, 82, 250, 0, '2026-07-11 11:03:53'),
(814, 26, 82, 250, 0, '2026-07-11 11:03:53'),
(815, 1, 82, 225, 0, '2026-07-11 11:03:53'),
(816, 41, 82, 225, 0, '2026-07-11 11:03:53'),
(817, 43, 82, 200, 0, '2026-07-11 11:03:53'),
(818, 42, 82, 200, 0, '2026-07-11 11:03:53'),
(819, 7, 82, 175, 0, '2026-07-11 11:03:53'),
(820, 21, 82, 175, 0, '2026-07-11 11:03:53'),
(821, 15, 27, 250, 0, '2026-07-11 11:05:03'),
(822, 17, 27, 250, 0, '2026-07-11 11:05:03'),
(823, 18, 27, 225, 0, '2026-07-11 11:05:03'),
(824, 16, 27, 225, 0, '2026-07-11 11:05:03'),
(825, 19, 27, 200, 0, '2026-07-11 11:05:03'),
(826, 2, 27, 200, 0, '2026-07-11 11:05:03'),
(827, 22, 27, 175, 0, '2026-07-11 11:05:03'),
(828, 38, 27, 175, 0, '2026-07-11 11:05:03'),
(829, 35, 43, 250, 0, '2026-07-11 11:06:12'),
(830, 26, 43, 250, 0, '2026-07-11 11:06:12'),
(831, 29, 43, 225, 0, '2026-07-11 11:06:12'),
(832, 30, 43, 225, 0, '2026-07-11 11:06:12'),
(833, 34, 43, 200, 0, '2026-07-11 11:06:12'),
(834, 7, 43, 200, 0, '2026-07-11 11:06:12'),
(835, 22, 43, 175, 0, '2026-07-11 11:06:12'),
(836, 23, 43, 175, 0, '2026-07-11 11:06:12'),
(837, 30, 46, 250, 0, '2026-07-11 11:07:29'),
(838, 18, 46, 250, 0, '2026-07-11 11:07:29'),
(839, 15, 46, 225, 0, '2026-07-11 11:07:30'),
(840, 20, 46, 225, 0, '2026-07-11 11:07:30'),
(841, 22, 46, 200, 0, '2026-07-11 11:07:30'),
(842, 27, 46, 200, 0, '2026-07-11 11:07:30'),
(843, 11, 46, 175, 0, '2026-07-11 11:07:30'),
(844, 13, 46, 175, 0, '2026-07-11 11:07:30'),
(845, 10, 60, 250, 0, '2026-07-11 11:08:35'),
(846, 36, 60, 250, 0, '2026-07-11 11:08:35'),
(847, 37, 60, 225, 0, '2026-07-11 11:08:35'),
(848, 9, 60, 225, 0, '2026-07-11 11:08:35'),
(849, 18, 60, 200, 0, '2026-07-11 11:08:35'),
(850, 17, 60, 200, 0, '2026-07-11 11:08:35'),
(851, 14, 60, 175, 0, '2026-07-11 11:08:35'),
(852, 13, 60, 175, 0, '2026-07-11 11:08:35'),
(853, 21, 26, 250, 0, '2026-07-11 11:09:43'),
(854, 9, 26, 250, 0, '2026-07-11 11:09:43'),
(855, 15, 26, 225, 0, '2026-07-11 11:09:43'),
(856, 16, 26, 225, 0, '2026-07-11 11:09:43'),
(857, 22, 26, 200, 0, '2026-07-11 11:09:43'),
(858, 36, 26, 200, 0, '2026-07-11 11:09:43'),
(859, 1, 26, 175, 0, '2026-07-11 11:09:43'),
(860, 4, 26, 175, 0, '2026-07-11 11:09:43'),
(861, 17, 18, 250, 0, '2026-07-11 11:11:13'),
(862, 20, 18, 250, 0, '2026-07-11 11:11:13'),
(863, 19, 18, 225, 0, '2026-07-11 11:11:13'),
(864, 16, 18, 225, 0, '2026-07-11 11:11:13'),
(865, 4, 18, 200, 0, '2026-07-11 11:11:13'),
(866, 11, 18, 200, 0, '2026-07-11 11:11:13'),
(867, 12, 18, 175, 0, '2026-07-11 11:11:13'),
(868, 1, 18, 175, 0, '2026-07-11 11:11:13'),
(869, 8, 73, 250, 0, '2026-07-11 11:13:01'),
(870, 38, 73, 250, 0, '2026-07-11 11:13:01'),
(871, 10, 73, 225, 0, '2026-07-11 11:13:01'),
(872, 9, 73, 225, 0, '2026-07-11 11:13:01'),
(873, 11, 73, 200, 0, '2026-07-11 11:13:01'),
(874, 16, 73, 200, 0, '2026-07-11 11:13:01'),
(875, 30, 73, 175, 0, '2026-07-11 11:13:01'),
(876, 19, 73, 175, 0, '2026-07-11 11:13:01'),
(877, 1, 48, 250, 0, '2026-07-11 11:14:22'),
(878, 10, 48, 250, 0, '2026-07-11 11:14:22'),
(879, 13, 48, 225, 0, '2026-07-11 11:14:22'),
(880, 14, 48, 225, 0, '2026-07-11 11:14:22'),
(881, 19, 48, 200, 0, '2026-07-11 11:14:22'),
(882, 17, 48, 200, 0, '2026-07-11 11:14:22'),
(883, 22, 48, 175, 0, '2026-07-11 11:14:22'),
(884, 20, 48, 175, 0, '2026-07-11 11:14:22'),
(885, 27, 98, 250, 10, '2026-07-11 11:15:44'),
(886, 41, 98, 250, 10, '2026-07-11 11:15:44'),
(887, 28, 98, 225, 5, '2026-07-11 11:15:44'),
(888, 26, 98, 100, 15, '2026-07-11 11:15:44'),
(889, 42, 98, 200, 5, '2026-07-11 11:15:44'),
(890, 43, 98, 225, 5, '2026-07-11 11:15:44'),
(891, 7, 98, 175, 0, '2026-07-11 11:15:44'),
(892, 43, 81, 250, 10, '2026-07-11 11:17:01'),
(893, 42, 81, 250, 10, '2026-07-11 11:17:01'),
(894, 41, 81, 225, 5, '2026-07-11 11:17:01'),
(895, 23, 81, 200, 5, '2026-07-11 11:17:01'),
(896, 21, 81, 225, 5, '2026-07-11 11:17:01'),
(897, 24, 81, 200, 5, '2026-07-11 11:17:01'),
(898, 25, 81, 175, 0, '2026-07-11 11:17:01'),
(899, 9, 81, 100, 15, '2026-07-11 11:17:01');

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

--
-- Dumping data for table `t_fish_location`
--

INSERT INTO `t_fish_location` (`fish_location_id`, `location_id`, `fish_id`, `location_modifier`, `location_mutation`, `created_date`) VALUES
(1, 4, 45, 250, 5, '2026-07-11 11:18:55'),
(2, 6, 45, 200, 4, '2026-07-11 11:18:55'),
(3, 12, 45, 175, 3, '2026-07-11 11:18:55'),
(4, 13, 45, 150, 2, '2026-07-11 11:18:55'),
(5, 2, 68, 250, 5, '2026-07-11 11:21:26'),
(6, 4, 68, 200, 4, '2026-07-11 11:21:26'),
(7, 5, 68, 175, 3, '2026-07-11 11:21:26'),
(8, 6, 68, 150, 2, '2026-07-11 11:21:26'),
(9, 15, 1, 250, 5, '2026-07-11 11:22:30'),
(10, 23, 1, 225, 4, '2026-07-11 11:22:30'),
(11, 6, 1, 200, 4, '2026-07-11 11:22:30'),
(12, 34, 1, 175, 3, '2026-07-11 11:22:30'),
(13, 7, 40, 250, 5, '2026-07-11 11:22:53'),
(14, 8, 40, 250, 5, '2026-07-11 11:22:53'),
(15, 22, 100, 250, 5, '2026-07-11 11:23:30'),
(16, 32, 100, 225, 4, '2026-07-11 11:23:30'),
(17, 35, 100, 200, 3, '2026-07-11 11:23:30'),
(18, 16, 35, 250, 5, '2026-07-11 11:24:10'),
(19, 19, 35, 225, 4, '2026-07-11 11:24:10'),
(20, 20, 35, 200, 3, '2026-07-11 11:24:10'),
(21, 21, 35, 200, 3, '2026-07-11 11:24:10'),
(22, 15, 3, 250, 5, '2026-07-11 11:25:01'),
(23, 23, 3, 225, 4, '2026-07-11 11:25:01'),
(24, 33, 3, 200, 4, '2026-07-11 11:25:01'),
(25, 34, 3, 175, 3, '2026-07-11 11:25:01'),
(26, 17, 34, 250, 5, '2026-07-11 11:25:29'),
(27, 18, 34, 225, 4, '2026-07-11 11:25:29'),
(28, 19, 34, 200, 4, '2026-07-11 11:25:29'),
(29, 22, 80, 250, 5, '2026-07-11 11:25:47'),
(30, 15, 10, 250, 5, '2026-07-11 11:26:06'),
(31, 33, 10, 225, 4, '2026-07-11 11:26:06'),
(32, 1, 28, 250, 5, '2026-07-11 11:27:06'),
(33, 3, 28, 225, 5, '2026-07-11 11:27:06'),
(34, 5, 28, 225, 4, '2026-07-11 11:27:06'),
(35, 9, 28, 200, 4, '2026-07-11 11:27:06'),
(36, 14, 28, 200, 4, '2026-07-11 11:27:06'),
(37, 3, 41, 250, 5, '2026-07-11 11:27:44'),
(38, 4, 41, 225, 5, '2026-07-11 11:27:44'),
(39, 6, 41, 225, 4, '2026-07-11 11:27:44'),
(40, 23, 9, 250, 5, '2026-07-11 11:27:58'),
(41, 30, 97, 250, 5, '2026-07-11 11:28:24'),
(42, 31, 97, 225, 5, '2026-07-11 11:28:24'),
(43, 2, 55, 250, 5, '2026-07-11 11:29:13'),
(44, 7, 55, 225, 5, '2026-07-11 11:29:13'),
(45, 8, 55, 225, 5, '2026-07-11 11:29:13'),
(46, 16, 55, 200, 4, '2026-07-11 11:29:13'),
(47, 17, 55, 225, 4, '2026-07-11 11:29:13'),
(48, 20, 55, 200, 3, '2026-07-11 11:29:13'),
(49, 21, 55, 200, 3, '2026-07-11 11:29:13'),
(50, 6, 71, 250, 5, '2026-07-11 11:29:48'),
(51, 7, 71, 225, 4, '2026-07-11 11:29:48'),
(52, 8, 71, 200, 3, '2026-07-11 11:29:48'),
(53, 17, 71, 200, 3, '2026-07-11 11:29:48'),
(54, 15, 16, 250, 5, '2026-07-11 11:30:11'),
(55, 23, 16, 225, 4, '2026-07-11 11:30:11'),
(56, 6, 39, 250, 5, '2026-07-11 11:31:15'),
(57, 7, 39, 225, 4, '2026-07-11 11:31:15'),
(58, 8, 39, 200, 5, '2026-07-11 11:31:15'),
(59, 13, 39, 200, 4, '2026-07-11 11:31:15'),
(60, 17, 39, 200, 4, '2026-07-11 11:31:15'),
(61, 25, 39, 225, 4, '2026-07-11 11:31:15'),
(62, 26, 39, 250, 3, '2026-07-11 11:31:15'),
(63, 16, 72, 250, 5, '2026-07-11 11:31:27'),
(64, 1, 25, 250, 5, '2026-07-11 11:33:43'),
(65, 2, 25, 250, 5, '2026-07-11 11:33:43'),
(66, 3, 25, 225, 4, '2026-07-11 11:33:43'),
(67, 4, 25, 225, 4, '2026-07-11 11:33:43'),
(68, 6, 25, 225, 4, '2026-07-11 11:33:43'),
(69, 7, 25, 200, 2, '2026-07-11 11:33:43'),
(70, 8, 25, 225, 0, '2026-07-11 11:33:43'),
(71, 9, 25, 250, 3, '2026-07-11 11:33:43'),
(72, 10, 25, 250, 2, '2026-07-11 11:33:43'),
(73, 11, 25, 225, 4, '2026-07-11 11:33:43'),
(74, 13, 25, 200, 2, '2026-07-11 11:33:43'),
(75, 16, 25, 250, 0, '2026-07-11 11:33:43'),
(76, 17, 25, 225, 2, '2026-07-11 11:33:43'),
(77, 18, 25, 200, 2, '2026-07-11 11:33:43'),
(78, 19, 25, 225, 1, '2026-07-11 11:33:43'),
(79, 24, 25, 200, 2, '2026-07-11 11:33:43'),
(80, 25, 25, 200, 4, '2026-07-11 11:33:43'),
(81, 26, 25, 225, 3, '2026-07-11 11:33:43'),
(82, 28, 25, 175, 5, '2026-07-11 11:33:43'),
(83, 1, 29, 250, 5, '2026-07-11 11:36:58'),
(84, 3, 29, 225, 4, '2026-07-11 11:36:58'),
(85, 4, 29, 225, 4, '2026-07-11 11:36:58'),
(86, 5, 29, 250, 3, '2026-07-11 11:36:58'),
(87, 6, 29, 200, 3, '2026-07-11 11:36:58'),
(88, 7, 29, 225, 5, '2026-07-11 11:36:58'),
(89, 8, 29, 250, 3, '2026-07-11 11:36:58'),
(90, 9, 29, 225, 4, '2026-07-11 11:36:58'),
(91, 10, 29, 250, 2, '2026-07-11 11:36:58'),
(92, 11, 29, 225, 4, '2026-07-11 11:36:58'),
(93, 12, 29, 225, 4, '2026-07-11 11:36:58'),
(94, 13, 29, 200, 4, '2026-07-11 11:36:58'),
(95, 16, 29, 200, 5, '2026-07-11 11:36:58'),
(96, 17, 29, 250, 2, '2026-07-11 11:36:58'),
(97, 18, 29, 250, 3, '2026-07-11 11:36:58'),
(98, 19, 29, 225, 4, '2026-07-11 11:36:58'),
(99, 20, 29, 225, 5, '2026-07-11 11:36:58'),
(100, 21, 29, 250, 1, '2026-07-11 11:36:58'),
(101, 24, 29, 225, 5, '2026-07-11 11:36:58'),
(102, 25, 29, 225, 4, '2026-07-11 11:36:58'),
(103, 26, 29, 200, 2, '2026-07-11 11:36:58'),
(104, 28, 29, 175, 5, '2026-07-11 11:36:58'),
(105, 29, 29, 200, 3, '2026-07-11 11:36:58'),
(106, 22, 75, 250, 5, '2026-07-11 11:37:46'),
(107, 30, 75, 250, 5, '2026-07-11 11:37:46'),
(108, 31, 75, 225, 4, '2026-07-11 11:37:46'),
(109, 32, 75, 225, 3, '2026-07-11 11:37:46'),
(110, 35, 75, 200, 4, '2026-07-11 11:37:46'),
(111, 30, 87, 250, 5, '2026-07-11 11:38:06'),
(112, 35, 87, 250, 4, '2026-07-11 11:38:06'),
(113, 22, 93, 250, 5, '2026-07-11 11:38:40'),
(114, 30, 93, 225, 5, '2026-07-11 11:38:40'),
(115, 32, 93, 200, 4, '2026-07-11 11:38:40'),
(116, 35, 93, 200, 5, '2026-07-11 11:38:40'),
(117, 27, 38, 250, 5, '2026-07-11 11:39:12'),
(118, 28, 38, 225, 4, '2026-07-11 11:39:12'),
(119, 29, 38, 225, 4, '2026-07-11 11:39:12'),
(120, 34, 14, 250, 5, '2026-07-11 11:39:31'),
(121, 11, 42, 250, 5, '2026-07-11 11:39:56'),
(122, 12, 42, 225, 4, '2026-07-11 11:39:56'),
(123, 17, 42, 250, 2, '2026-07-11 11:39:56'),
(124, 23, 12, 250, 5, '2026-07-11 11:40:16'),
(125, 34, 12, 225, 5, '2026-07-11 11:40:16'),
(126, 23, 6, 250, 5, '2026-07-11 11:40:32'),
(127, 15, 13, 250, 5, '2026-07-11 11:40:51'),
(128, 34, 13, 225, 5, '2026-07-11 11:40:51'),
(129, 13, 36, 250, 5, '2026-07-11 11:41:21'),
(130, 24, 37, 250, 5, '2026-07-11 11:41:53'),
(131, 25, 37, 225, 5, '2026-07-11 11:41:53'),
(132, 26, 37, 225, 4, '2026-07-11 11:41:53'),
(133, 22, 84, 250, 5, '2026-07-11 11:42:25'),
(134, 30, 84, 225, 5, '2026-07-11 11:42:25'),
(135, 32, 84, 225, 4, '2026-07-11 11:42:25'),
(136, 10, 70, 250, 5, '2026-07-11 11:42:51'),
(137, 11, 70, 225, 5, '2026-07-11 11:42:51'),
(138, 13, 70, 200, 4, '2026-07-11 11:42:51'),
(139, 16, 30, 250, 5, '2026-07-11 11:43:37'),
(140, 17, 30, 225, 5, '2026-07-11 11:43:37'),
(141, 18, 30, 225, 4, '2026-07-11 11:43:37'),
(142, 19, 30, 200, 4, '2026-07-11 11:43:37'),
(143, 21, 30, 200, 3, '2026-07-11 11:43:37'),
(144, 22, 76, 250, 5, '2026-07-11 11:44:01'),
(145, 30, 76, 225, 5, '2026-07-11 11:44:01'),
(146, 32, 76, 200, 4, '2026-07-11 11:44:01'),
(147, 23, 7, 250, 5, '2026-07-11 11:44:12'),
(148, 2, 57, 250, 5, '2026-07-11 11:44:55'),
(149, 6, 57, 225, 4, '2026-07-11 11:44:55'),
(150, 26, 57, 200, 5, '2026-07-11 11:44:55'),
(151, 27, 57, 250, 3, '2026-07-11 11:44:55'),
(152, 29, 57, 250, 1, '2026-07-11 11:44:55'),
(153, 22, 96, 250, 5, '2026-07-11 11:45:29'),
(154, 30, 96, 250, 5, '2026-07-11 11:45:29'),
(155, 31, 96, 225, 4, '2026-07-11 11:45:29'),
(156, 35, 96, 200, 5, '2026-07-11 11:45:29'),
(157, 15, 5, 250, 5, '2026-07-11 11:45:50'),
(158, 23, 5, 250, 5, '2026-07-11 11:45:50'),
(159, 34, 11, 225, 4, '2026-07-11 11:46:03'),
(160, 24, 66, 225, 4, '2026-07-11 11:46:17'),
(161, 30, 92, 250, 5, '2026-07-11 11:46:29'),
(162, 15, 15, 225, 4, '2026-07-11 11:46:56'),
(163, 23, 15, 250, 5, '2026-07-11 11:46:56'),
(164, 34, 15, 225, 5, '2026-07-11 11:46:56'),
(165, 2, 67, 225, 4, '2026-07-11 11:47:35'),
(166, 5, 67, 225, 3, '2026-07-11 11:47:35'),
(167, 10, 67, 250, 5, '2026-07-11 11:47:35'),
(168, 16, 67, 200, 4, '2026-07-11 11:47:35'),
(169, 24, 67, 200, 5, '2026-07-11 11:47:35'),
(170, 12, 62, 225, 3, '2026-07-11 11:48:32'),
(171, 13, 62, 225, 5, '2026-07-11 11:48:32'),
(172, 16, 62, 250, 4, '2026-07-11 11:48:32'),
(173, 17, 62, 250, 3, '2026-07-11 11:48:32'),
(174, 21, 62, 200, 3, '2026-07-11 11:48:32'),
(175, 32, 99, 250, 3, '2026-07-11 11:48:46'),
(176, 15, 24, 225, 4, '2026-07-11 11:49:06'),
(177, 33, 24, 250, 2, '2026-07-11 11:49:06'),
(178, 23, 17, 225, 5, '2026-07-11 11:49:17'),
(179, 11, 74, 225, 5, '2026-07-11 11:49:54'),
(180, 12, 74, 175, 4, '2026-07-11 11:49:54'),
(181, 28, 74, 225, 5, '2026-07-11 11:49:54'),
(182, 29, 74, 200, 4, '2026-07-11 11:49:54'),
(183, 22, 91, 225, 4, '2026-07-11 11:50:20'),
(184, 32, 91, 250, 4, '2026-07-11 11:50:20'),
(185, 33, 19, 225, 5, '2026-07-11 11:50:52'),
(186, 34, 19, 250, 4, '2026-07-11 11:50:52'),
(187, 16, 32, 250, 5, '2026-07-11 11:51:16'),
(188, 17, 32, 175, 3, '2026-07-11 11:51:16'),
(189, 18, 31, 250, 4, '2026-07-11 11:52:12'),
(190, 17, 31, 225, 4, '2026-07-11 11:52:12'),
(191, 9, 31, 250, 3, '2026-07-11 11:52:12'),
(192, 11, 31, 250, 2, '2026-07-11 11:52:12'),
(193, 12, 31, 200, 2, '2026-07-11 11:52:12'),
(194, 13, 31, 250, 3, '2026-07-11 11:52:12'),
(195, 10, 53, 225, 5, '2026-07-11 11:52:43'),
(196, 13, 53, 250, 3, '2026-07-11 11:52:43'),
(197, 29, 53, 175, 5, '2026-07-11 11:52:43'),
(198, 15, 23, 175, 5, '2026-07-11 11:53:22'),
(199, 23, 23, 200, 4, '2026-07-11 11:53:22'),
(200, 33, 23, 250, 2, '2026-07-11 11:53:22'),
(201, 34, 23, 200, 4, '2026-07-11 11:53:22'),
(202, 23, 2, 225, 5, '2026-07-11 11:53:49'),
(203, 34, 2, 250, 4, '2026-07-11 11:53:49'),
(204, 3, 51, 250, 4, '2026-07-11 11:54:35'),
(205, 5, 51, 225, 4, '2026-07-11 11:54:35'),
(206, 12, 51, 250, 5, '2026-07-11 11:54:35'),
(207, 17, 51, 200, 3, '2026-07-11 11:54:35'),
(208, 25, 51, 200, 4, '2026-07-11 11:54:35'),
(209, 26, 51, 250, 2, '2026-07-11 11:54:35'),
(210, 30, 95, 250, 2, '2026-07-11 11:55:09'),
(211, 31, 95, 225, 4, '2026-07-11 11:55:09'),
(212, 32, 95, 200, 2, '2026-07-11 11:55:09'),
(213, 35, 95, 250, 3, '2026-07-11 11:55:09'),
(214, 15, 8, 250, 2, '2026-07-11 11:55:48'),
(215, 23, 8, 225, 5, '2026-07-11 11:55:48'),
(216, 33, 8, 250, 2, '2026-07-11 11:55:48'),
(217, 34, 8, 200, 4, '2026-07-11 11:55:48'),
(218, 3, 63, 250, 3, '2026-07-11 11:56:39'),
(219, 5, 63, 250, 2, '2026-07-11 11:56:39'),
(220, 6, 63, 225, 3, '2026-07-11 11:56:39'),
(221, 10, 63, 200, 3, '2026-07-11 11:56:39'),
(222, 12, 63, 175, 5, '2026-07-11 11:56:39'),
(223, 14, 63, 250, 1, '2026-07-11 11:56:39'),
(224, 9, 49, 250, 4, '2026-07-11 11:57:24'),
(225, 10, 49, 225, 4, '2026-07-11 11:57:24'),
(226, 18, 49, 250, 2, '2026-07-11 11:57:24'),
(227, 20, 49, 175, 4, '2026-07-11 11:57:24'),
(228, 9, 58, 225, 4, '2026-07-11 11:58:01'),
(229, 10, 58, 150, 5, '2026-07-11 11:58:01'),
(230, 11, 58, 175, 4, '2026-07-11 11:58:01'),
(231, 3, 69, 100, 4, '2026-07-11 11:58:16'),
(232, 9, 56, 175, 4, '2026-07-11 11:59:24'),
(233, 10, 56, 200, 4, '2026-07-11 11:59:24'),
(234, 11, 56, 225, 4, '2026-07-11 11:59:24'),
(235, 12, 56, 250, 5, '2026-07-11 11:59:24'),
(236, 13, 56, 175, 4, '2026-07-11 11:59:24'),
(237, 14, 56, 250, 2, '2026-07-11 11:59:24'),
(238, 24, 56, 175, 4, '2026-07-11 11:59:24'),
(239, 25, 56, 150, 6, '2026-07-11 11:59:24'),
(240, 2, 65, 250, 3, '2026-07-11 12:00:45'),
(241, 6, 65, 175, 4, '2026-07-11 12:00:45'),
(242, 7, 65, 200, 3, '2026-07-11 12:00:45'),
(243, 8, 65, 200, 5, '2026-07-11 12:00:45'),
(244, 10, 65, 200, 4, '2026-07-11 12:00:45'),
(245, 13, 65, 175, 3, '2026-07-11 12:00:45'),
(246, 16, 65, 200, 4, '2026-07-11 12:00:45'),
(247, 17, 65, 250, 2, '2026-07-11 12:00:45'),
(248, 24, 65, 250, 3, '2026-07-11 12:00:45'),
(249, 25, 65, 225, 4, '2026-07-11 12:00:45'),
(250, 26, 65, 225, 4, '2026-07-11 12:00:45'),
(251, 22, 83, 225, 4, '2026-07-11 12:01:11'),
(252, 31, 83, 250, 5, '2026-07-11 12:01:11'),
(253, 32, 83, 250, 3, '2026-07-11 12:01:11'),
(254, 1, 61, 150, 6, '2026-07-11 12:02:25'),
(255, 2, 61, 250, 4, '2026-07-11 12:02:25'),
(256, 4, 61, 175, 5, '2026-07-11 12:02:25'),
(257, 7, 61, 200, 4, '2026-07-11 12:02:25'),
(258, 8, 61, 250, 4, '2026-07-11 12:02:25'),
(259, 16, 61, 175, 4, '2026-07-11 12:02:25'),
(260, 19, 61, 250, 2, '2026-07-11 12:02:25'),
(261, 20, 61, 225, 4, '2026-07-11 12:02:25'),
(262, 9, 59, 250, 4, '2026-07-11 12:03:00'),
(263, 10, 59, 225, 3, '2026-07-11 12:03:00'),
(264, 16, 59, 175, 4, '2026-07-11 12:03:00'),
(265, 18, 59, 200, 4, '2026-07-11 12:03:00'),
(266, 2, 54, 250, 4, '2026-07-11 12:03:48'),
(267, 5, 54, 225, 4, '2026-07-11 12:03:48'),
(268, 7, 54, 250, 4, '2026-07-11 12:03:48'),
(269, 8, 54, 200, 7, '2026-07-11 12:03:48'),
(270, 17, 54, 200, 2, '2026-07-11 12:03:48'),
(271, 20, 54, 250, 1, '2026-07-11 12:03:48'),
(272, 22, 89, 250, 2, '2026-07-11 12:04:36'),
(273, 30, 89, 225, 4, '2026-07-11 12:04:36'),
(274, 31, 89, 200, 4, '2026-07-11 12:04:36'),
(275, 32, 89, 200, 4, '2026-07-11 12:04:36'),
(276, 35, 89, 100, 6, '2026-07-11 12:04:36'),
(277, 11, 44, 250, 3, '2026-07-11 12:05:03'),
(278, 12, 44, 225, 5, '2026-07-11 12:05:03'),
(279, 13, 44, 200, 4, '2026-07-11 12:05:03'),
(280, 1, 64, 250, 2, '2026-07-11 12:05:54'),
(281, 4, 64, 225, 4, '2026-07-11 12:05:54'),
(282, 9, 64, 225, 4, '2026-07-11 12:05:54'),
(283, 14, 64, 175, 5, '2026-07-11 12:05:54'),
(284, 18, 64, 200, 4, '2026-07-11 12:05:54'),
(285, 24, 64, 200, 4, '2026-07-11 12:05:54'),
(286, 27, 64, 100, 8, '2026-07-11 12:05:54'),
(287, 10, 50, 200, 4, '2026-07-11 12:06:13'),
(288, 14, 50, 200, 5, '2026-07-11 12:06:13'),
(289, 31, 79, 200, 5, '2026-07-11 12:06:40'),
(290, 32, 79, 250, 2, '2026-07-11 12:06:40'),
(291, 9, 47, 200, 4, '2026-07-11 12:07:46'),
(292, 10, 47, 200, 4, '2026-07-11 12:07:46'),
(293, 13, 47, 250, 4, '2026-07-11 12:07:46'),
(294, 24, 47, 200, 3, '2026-07-11 12:07:46'),
(295, 26, 47, 225, 4, '2026-07-11 12:07:46'),
(296, 27, 47, 250, 5, '2026-07-11 12:07:46'),
(297, 29, 47, 175, 3, '2026-07-11 12:07:46'),
(298, 3, 33, 250, 4, '2026-07-11 12:08:14'),
(299, 4, 33, 225, 4, '2026-07-11 12:08:14'),
(300, 6, 33, 100, 7, '2026-07-11 12:08:14'),
(301, 15, 21, 250, 3, '2026-07-11 12:08:51'),
(302, 23, 21, 175, 5, '2026-07-11 12:08:51'),
(303, 33, 21, 200, 4, '2026-07-11 12:08:51'),
(304, 34, 21, 175, 5, '2026-07-11 12:08:51'),
(305, 22, 86, 250, 5, '2026-07-11 12:09:22'),
(306, 30, 86, 225, 4, '2026-07-11 12:09:22'),
(307, 31, 86, 250, 3, '2026-07-11 12:09:22'),
(308, 22, 90, 250, 2, '2026-07-11 12:10:07'),
(309, 30, 90, 175, 4, '2026-07-11 12:10:07'),
(310, 31, 90, 200, 4, '2026-07-11 12:10:07'),
(311, 32, 90, 250, 1, '2026-07-11 12:10:07'),
(312, 35, 90, 175, 4, '2026-07-11 12:10:07'),
(313, 2, 52, 250, 4, '2026-07-11 12:11:45'),
(314, 6, 52, 175, 4, '2026-07-11 12:11:45'),
(315, 7, 52, 250, 4, '2026-07-11 12:11:45'),
(316, 8, 52, 175, 8, '2026-07-11 12:11:45'),
(317, 14, 52, 200, 4, '2026-07-11 12:11:45'),
(318, 16, 52, 225, 3, '2026-07-11 12:11:45'),
(319, 17, 52, 250, 2, '2026-07-11 12:11:45'),
(320, 19, 52, 150, 4, '2026-07-11 12:11:45'),
(321, 21, 52, 200, 2, '2026-07-11 12:11:45'),
(322, 28, 52, 225, 1, '2026-07-11 12:11:45'),
(323, 30, 94, 225, 5, '2026-07-11 12:12:07'),
(324, 31, 94, 175, 2, '2026-07-11 12:12:07'),
(325, 22, 77, 175, 4, '2026-07-11 12:12:52'),
(326, 30, 77, 200, 4, '2026-07-11 12:12:52'),
(327, 31, 77, 225, 5, '2026-07-11 12:12:52'),
(328, 32, 77, 150, 7, '2026-07-11 12:12:52'),
(329, 35, 77, 150, 3, '2026-07-11 12:12:52'),
(330, 23, 22, 250, 2, '2026-07-11 12:13:11'),
(331, 30, 88, 225, 4, '2026-07-11 12:13:32'),
(332, 32, 88, 250, 2, '2026-07-11 12:13:32'),
(333, 22, 78, 100, 7, '2026-07-11 12:14:16'),
(334, 30, 78, 125, 5, '2026-07-11 12:14:16'),
(335, 31, 78, 175, 3, '2026-07-11 12:14:16'),
(336, 32, 78, 250, 1, '2026-07-11 12:14:16'),
(337, 35, 78, 200, 3, '2026-07-11 12:14:16'),
(338, 31, 85, 250, 1, '2026-07-11 12:14:46'),
(339, 32, 85, 200, 3, '2026-07-11 12:14:46'),
(340, 15, 4, 225, 4, '2026-07-11 12:15:08'),
(341, 33, 4, 175, 4, '2026-07-11 12:15:08'),
(342, 23, 20, 200, 3, '2026-07-11 12:15:22'),
(343, 22, 82, 225, 4, '2026-07-11 12:15:57'),
(344, 30, 82, 175, 4, '2026-07-11 12:15:57'),
(345, 31, 82, 100, 7, '2026-07-11 12:15:57'),
(346, 32, 82, 125, 6, '2026-07-11 12:15:57'),
(347, 10, 27, 175, 5, '2026-07-11 12:17:03'),
(348, 11, 27, 250, 2, '2026-07-11 12:17:03'),
(349, 12, 27, 200, 4, '2026-07-11 12:17:03'),
(350, 14, 27, 200, 4, '2026-07-11 12:17:03'),
(351, 25, 27, 200, 2, '2026-07-11 12:17:03'),
(352, 26, 27, 225, 4, '2026-07-11 12:17:03'),
(353, 27, 27, 100, 10, '2026-07-11 12:17:03'),
(354, 28, 27, 175, 1, '2026-07-11 12:17:03'),
(355, 29, 27, 250, 2, '2026-07-11 12:17:03'),
(356, 19, 43, 250, 2, '2026-07-11 12:17:27'),
(357, 21, 43, 175, 4, '2026-07-11 12:17:27'),
(358, 2, 46, 250, 2, '2026-07-11 12:18:03'),
(359, 10, 46, 175, 5, '2026-07-11 12:18:03'),
(360, 16, 46, 200, 2, '2026-07-11 12:18:03'),
(361, 20, 46, 225, 3, '2026-07-11 12:18:03'),
(362, 24, 46, 225, 4, '2026-07-11 12:18:03'),
(363, 11, 60, 250, 2, '2026-07-11 12:19:06'),
(364, 12, 60, 225, 4, '2026-07-11 12:19:06'),
(365, 27, 60, 250, 9, '2026-07-11 12:19:06'),
(366, 28, 60, 200, 2, '2026-07-11 12:19:06'),
(367, 29, 60, 225, 2, '2026-07-11 12:19:06'),
(368, 2, 26, 225, 5, '2026-07-11 12:21:00'),
(369, 4, 26, 250, 4, '2026-07-11 12:21:00'),
(370, 6, 26, 250, 1, '2026-07-11 12:21:00'),
(371, 7, 26, 175, 2, '2026-07-11 12:21:00'),
(372, 8, 26, 200, 5, '2026-07-11 12:21:00'),
(373, 10, 26, 200, 3, '2026-07-11 12:21:00'),
(374, 11, 26, 200, 3, '2026-07-11 12:21:00'),
(375, 12, 26, 200, 2, '2026-07-11 12:21:00'),
(376, 14, 26, 200, 1, '2026-07-11 12:21:00'),
(377, 17, 26, 225, 2, '2026-07-11 12:21:00'),
(378, 19, 26, 150, 7, '2026-07-11 12:21:00'),
(379, 20, 26, 150, 5, '2026-07-11 12:21:00'),
(380, 24, 26, 250, 2, '2026-07-11 12:21:00'),
(381, 29, 26, 200, 3, '2026-07-11 12:21:00'),
(382, 15, 18, 225, 4, '2026-07-11 12:21:37'),
(383, 23, 18, 175, 2, '2026-07-11 12:21:37'),
(384, 34, 18, 250, 2, '2026-07-11 12:21:37'),
(385, 16, 73, 175, 5, '2026-07-11 12:22:06'),
(386, 19, 73, 200, 3, '2026-07-11 12:22:06'),
(387, 20, 73, 250, 2, '2026-07-11 12:22:06'),
(388, 2, 48, 250, 2, '2026-07-11 12:23:00'),
(389, 4, 48, 175, 4, '2026-07-11 12:23:00'),
(390, 5, 48, 225, 4, '2026-07-11 12:23:00'),
(391, 25, 48, 200, 3, '2026-07-11 12:23:00'),
(392, 26, 48, 250, 2, '2026-07-11 12:23:00'),
(393, 28, 48, 150, 4, '2026-07-11 12:23:00'),
(394, 29, 48, 175, 1, '2026-07-11 12:23:00'),
(395, 22, 98, 250, 1, '2026-07-11 12:23:15'),
(396, 22, 81, 250, 5, '2026-07-11 12:23:30');

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
(3, 'Rare', 'R', 35, 65, 4, '2026-06-20 14:00:06'),
(4, 'Legendary', 'L', 25, 75, 3, '2026-06-20 14:00:06'),
(5, 'Mythical', 'M', 10, 90, 2, '2026-06-20 14:00:15'),
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

--
-- Dumping data for table `t_fish_rod`
--

INSERT INTO `t_fish_rod` (`fish_rod_id`, `rod_id`, `fish_id`, `rod_modifier`, `rod_escape`, `created_date`) VALUES
(12, 1, 31, 100, 0, '2026-07-11 13:07:50'),
(13, 1, 38, 100, 0, '2026-07-11 13:07:50'),
(14, 1, 35, 100, 0, '2026-07-11 13:07:50'),
(15, 1, 33, 100, 0, '2026-07-11 13:07:50'),
(16, 1, 32, 100, 5, '2026-07-11 13:07:50'),
(17, 1, 29, 100, 0, '2026-07-11 13:07:50'),
(18, 1, 30, 100, 0, '2026-07-11 13:07:50'),
(19, 1, 37, 100, 0, '2026-07-11 13:07:50'),
(20, 1, 34, 100, 0, '2026-07-11 13:07:50'),
(21, 1, 36, 100, 0, '2026-07-11 13:07:50'),
(22, 2, 67, 100, 0, '2026-07-11 13:12:46'),
(23, 2, 71, 100, 0, '2026-07-11 13:12:46'),
(24, 2, 73, 100, 0, '2026-07-11 13:12:46'),
(25, 2, 68, 100, 5, '2026-07-11 13:12:46'),
(26, 2, 70, 100, 5, '2026-07-11 13:12:46'),
(27, 2, 66, 100, 0, '2026-07-11 13:12:46'),
(28, 2, 74, 100, 0, '2026-07-11 13:12:46'),
(29, 2, 65, 100, 0, '2026-07-11 13:12:46'),
(30, 2, 69, 100, 5, '2026-07-11 13:12:46'),
(31, 2, 72, 100, 0, '2026-07-11 13:12:46'),
(32, 3, 28, 100, 0, '2026-07-11 13:14:16'),
(33, 3, 3, 100, 0, '2026-07-11 13:14:16'),
(34, 3, 27, 100, 0, '2026-07-11 13:14:16'),
(35, 3, 26, 100, 0, '2026-07-11 13:14:16'),
(36, 3, 25, 100, 0, '2026-07-11 13:14:16'),
(37, 3, 83, 100, 0, '2026-07-11 13:14:16'),
(38, 3, 82, 100, 0, '2026-07-11 13:14:16'),
(39, 3, 4, 100, 0, '2026-07-11 13:14:16'),
(40, 3, 81, 100, 5, '2026-07-11 13:14:16'),
(41, 3, 84, 100, 0, '2026-07-11 13:14:16'),
(42, 4, 41, 100, 0, '2026-07-11 13:17:35'),
(43, 4, 39, 100, 0, '2026-07-11 13:17:35'),
(44, 4, 44, 100, 0, '2026-07-11 13:17:35'),
(45, 4, 43, 100, 0, '2026-07-11 13:17:35'),
(46, 4, 42, 100, 0, '2026-07-11 13:17:35'),
(47, 4, 5, 100, 0, '2026-07-11 13:17:35'),
(48, 4, 6, 100, 0, '2026-07-11 13:17:35'),
(49, 4, 85, 100, 0, '2026-07-11 13:17:35'),
(50, 4, 40, 100, 5, '2026-07-11 13:17:35'),
(51, 4, 86, 100, 0, '2026-07-11 13:17:35'),
(52, 5, 55, 100, 0, '2026-07-11 13:19:19'),
(53, 5, 60, 100, 0, '2026-07-11 13:19:19'),
(54, 5, 56, 100, 0, '2026-07-11 13:19:19'),
(55, 5, 57, 100, 0, '2026-07-11 13:19:19'),
(56, 5, 58, 100, 5, '2026-07-11 13:19:19'),
(57, 5, 59, 100, 0, '2026-07-11 13:19:19'),
(58, 5, 64, 100, 0, '2026-07-11 13:19:19'),
(59, 5, 62, 100, 0, '2026-07-11 13:19:19'),
(60, 5, 61, 100, 0, '2026-07-11 13:19:19'),
(61, 5, 63, 100, 0, '2026-07-11 13:19:19'),
(62, 6, 1, 100, 0, '2026-07-11 13:20:03'),
(63, 6, 2, 100, 0, '2026-07-11 13:20:03'),
(64, 6, 18, 100, 0, '2026-07-11 13:20:03'),
(65, 7, 14, 200, 10, '2026-07-11 13:21:41'),
(66, 7, 15, 200, 0, '2026-07-11 13:21:41'),
(67, 7, 17, 200, 0, '2026-07-11 13:21:41'),
(68, 7, 16, 200, 10, '2026-07-11 13:21:41'),
(69, 7, 13, 200, 0, '2026-07-11 13:21:41'),
(70, 8, 50, 200, 0, '2026-07-11 13:26:44'),
(71, 8, 47, 200, 0, '2026-07-11 13:26:44'),
(72, 8, 46, 200, 0, '2026-07-11 13:26:44'),
(73, 8, 49, 200, 0, '2026-07-11 13:26:44'),
(74, 8, 48, 200, 0, '2026-07-11 13:26:44'),
(75, 9, 9, 200, 0, '2026-07-11 13:27:42'),
(76, 9, 10, 200, 0, '2026-07-11 13:27:42'),
(77, 9, 7, 200, 0, '2026-07-11 13:27:42'),
(78, 9, 8, 200, 0, '2026-07-11 13:27:42'),
(79, 10, 53, 200, 0, '2026-07-11 13:28:32'),
(80, 10, 51, 200, 0, '2026-07-11 13:28:32'),
(81, 10, 52, 200, 0, '2026-07-11 13:28:32'),
(82, 10, 54, 200, 0, '2026-07-11 13:28:32'),
(83, 11, 45, 200, 0, '2026-07-11 13:29:13'),
(84, 11, 22, 200, 0, '2026-07-11 13:29:13'),
(85, 12, 100, 300, 0, '2026-07-11 13:30:19'),
(86, 12, 97, 300, 15, '2026-07-11 13:30:19'),
(87, 12, 99, 300, 0, '2026-07-11 13:30:19'),
(88, 12, 98, 300, 15, '2026-07-11 13:30:19'),
(89, 13, 91, 300, 0, '2026-07-11 13:31:03'),
(90, 13, 90, 300, 0, '2026-07-11 13:31:03'),
(91, 13, 89, 300, 0, '2026-07-11 13:31:03'),
(92, 14, 24, 300, 0, '2026-07-11 13:31:40'),
(93, 14, 95, 300, 0, '2026-07-11 13:31:40'),
(94, 15, 96, 300, 0, '2026-07-11 13:32:21'),
(95, 15, 11, 300, 0, '2026-07-11 13:32:21'),
(96, 15, 88, 300, 0, '2026-07-11 13:32:21'),
(97, 16, 79, 400, 20, '2026-07-11 13:33:19'),
(98, 16, 78, 400, 20, '2026-07-11 13:33:19'),
(99, 16, 80, 400, 20, '2026-07-11 13:33:19'),
(100, 17, 94, 400, 0, '2026-07-11 13:33:50'),
(101, 17, 76, 400, 0, '2026-07-11 13:33:50'),
(102, 18, 75, 400, 0, '2026-07-11 13:36:18'),
(103, 18, 87, 400, 0, '2026-07-11 13:36:18'),
(104, 18, 93, 400, 0, '2026-07-11 13:36:18'),
(105, 18, 12, 400, 0, '2026-07-11 13:36:18'),
(106, 18, 92, 400, 0, '2026-07-11 13:36:18'),
(107, 18, 19, 400, 0, '2026-07-11 13:36:18'),
(108, 18, 23, 400, 0, '2026-07-11 13:36:18'),
(109, 18, 21, 400, 0, '2026-07-11 13:36:18'),
(110, 18, 20, 400, 0, '2026-07-11 13:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_season`
--

CREATE TABLE `t_fish_season` (
  `fish_season_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `season_modifier` int(11) NOT NULL DEFAULT 100,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_season`
--

INSERT INTO `t_fish_season` (`fish_season_id`, `season_id`, `fish_id`, `season_modifier`, `created_date`) VALUES
(1, 2, 45, 100, '2026-07-11 13:37:13'),
(2, 3, 45, 100, '2026-07-11 13:37:13'),
(3, 2, 68, 100, '2026-07-11 13:37:27'),
(4, 3, 68, 100, '2026-07-11 13:37:27'),
(5, 2, 1, 100, '2026-07-11 13:37:41'),
(6, 6, 1, 100, '2026-07-11 13:37:41'),
(7, 1, 40, 100, '2026-07-11 13:38:00'),
(8, 5, 40, 100, '2026-07-11 13:38:00'),
(9, 1, 100, 100, '2026-07-11 13:38:50'),
(10, 4, 100, 100, '2026-07-11 13:38:50'),
(11, 5, 100, 100, '2026-07-11 13:38:50'),
(12, 6, 35, 100, '2026-07-11 13:40:59'),
(13, 1, 3, 100, '2026-07-11 13:41:17'),
(14, 3, 3, 100, '2026-07-11 13:41:17'),
(15, 5, 34, 100, '2026-07-11 13:41:31'),
(16, 5, 80, 100, '2026-07-11 13:41:45'),
(17, 2, 10, 100, '2026-07-11 13:42:01'),
(18, 5, 10, 100, '2026-07-11 13:42:01'),
(19, 1, 28, 100, '2026-07-11 13:42:17'),
(20, 3, 28, 100, '2026-07-11 13:42:17'),
(21, 2, 41, 100, '2026-07-11 13:42:30'),
(22, 1, 9, 100, '2026-07-11 13:42:50'),
(23, 3, 9, 100, '2026-07-11 13:42:50'),
(24, 3, 97, 100, '2026-07-11 13:43:06'),
(25, 4, 97, 100, '2026-07-11 13:43:06'),
(26, 1, 55, 100, '2026-07-11 13:43:26'),
(27, 2, 55, 100, '2026-07-11 13:43:26'),
(28, 5, 55, 100, '2026-07-11 13:43:26'),
(29, 1, 71, 100, '2026-07-11 13:43:46'),
(30, 3, 71, 100, '2026-07-11 13:43:46'),
(31, 6, 16, 100, '2026-07-11 13:43:59'),
(32, 3, 16, 100, '2026-07-11 13:43:59'),
(33, 1, 39, 100, '2026-07-11 13:44:12'),
(34, 6, 39, 100, '2026-07-11 13:44:12'),
(35, 5, 72, 100, '2026-07-11 13:44:25'),
(36, 1, 25, 100, '2026-07-11 13:44:42'),
(37, 2, 25, 100, '2026-07-11 13:44:42'),
(38, 1, 29, 100, '2026-07-11 13:44:55'),
(39, 3, 29, 100, '2026-07-11 13:44:55'),
(40, 2, 75, 100, '2026-07-11 13:45:07'),
(41, 4, 75, 100, '2026-07-11 13:45:07'),
(42, 3, 87, 100, '2026-07-11 13:45:19'),
(43, 2, 93, 100, '2026-07-11 13:45:30'),
(44, 3, 38, 100, '2026-07-11 13:45:41'),
(45, 4, 38, 100, '2026-07-11 13:45:41'),
(46, 5, 14, 100, '2026-07-11 13:45:54'),
(47, 5, 42, 100, '2026-07-11 13:46:08'),
(48, 2, 42, 100, '2026-07-11 13:46:08'),
(49, 3, 42, 100, '2026-07-11 13:46:08'),
(50, 6, 12, 100, '2026-07-11 13:46:40'),
(51, 2, 12, 100, '2026-07-11 13:46:40'),
(52, 3, 12, 100, '2026-07-11 13:46:40'),
(53, 2, 6, 100, '2026-07-11 13:46:54'),
(54, 3, 6, 100, '2026-07-11 13:46:54'),
(55, 6, 13, 100, '2026-07-11 13:47:04'),
(56, 2, 36, 100, '2026-07-11 13:47:18'),
(57, 3, 36, 100, '2026-07-11 13:47:18'),
(58, 1, 37, 100, '2026-07-11 13:47:33'),
(59, 3, 37, 100, '2026-07-11 13:47:33'),
(60, 1, 84, 100, '2026-07-11 13:47:52'),
(61, 2, 84, 100, '2026-07-11 13:47:52'),
(62, 3, 84, 100, '2026-07-11 13:47:52'),
(63, 1, 70, 100, '2026-07-11 13:48:07'),
(64, 2, 70, 100, '2026-07-11 13:48:07'),
(65, 5, 30, 100, '2026-07-11 13:48:17'),
(66, 3, 76, 100, '2026-07-11 13:48:30'),
(67, 4, 76, 100, '2026-07-11 13:48:30'),
(68, 1, 7, 100, '2026-07-11 13:48:45'),
(69, 3, 7, 100, '2026-07-11 13:48:45'),
(70, 2, 57, 100, '2026-07-11 13:49:00'),
(71, 3, 57, 100, '2026-07-11 13:49:00'),
(72, 1, 96, 100, '2026-07-11 13:49:22'),
(73, 3, 96, 100, '2026-07-11 13:49:22'),
(74, 6, 5, 100, '2026-07-11 13:49:34'),
(75, 3, 5, 100, '2026-07-11 13:49:34'),
(76, 6, 11, 100, '2026-07-11 13:49:55'),
(77, 2, 11, 100, '2026-07-11 13:49:55'),
(78, 3, 11, 100, '2026-07-11 13:49:55'),
(79, 2, 66, 100, '2026-07-11 13:50:06'),
(80, 3, 66, 100, '2026-07-11 13:50:06'),
(81, 4, 92, 100, '2026-07-11 13:50:18'),
(82, 6, 15, 100, '2026-07-11 13:50:31'),
(83, 3, 15, 100, '2026-07-11 13:50:31'),
(84, 1, 67, 100, '2026-07-11 13:50:50'),
(85, 3, 67, 100, '2026-07-11 13:50:50'),
(86, 6, 67, 100, '2026-07-11 13:50:50'),
(87, 2, 62, 100, '2026-07-11 13:51:06'),
(88, 3, 62, 100, '2026-07-11 13:51:06'),
(89, 5, 99, 100, '2026-07-11 13:51:19'),
(90, 4, 99, 100, '2026-07-11 13:51:19'),
(91, 3, 24, 100, '2026-07-11 13:51:30'),
(92, 6, 24, 100, '2026-07-11 13:51:30'),
(93, 3, 17, 100, '2026-07-11 13:51:43'),
(94, 4, 17, 100, '2026-07-11 13:51:43'),
(95, 3, 74, 100, '2026-07-11 13:51:58'),
(96, 4, 74, 100, '2026-07-11 13:51:58'),
(97, 6, 91, 100, '2026-07-11 13:52:13'),
(98, 3, 91, 100, '2026-07-11 13:52:13'),
(99, 2, 19, 100, '2026-07-11 13:52:27'),
(100, 5, 19, 100, '2026-07-11 13:52:27'),
(101, 6, 32, 100, '2026-07-11 13:52:38'),
(102, 6, 31, 100, '2026-07-11 13:52:58'),
(103, 2, 31, 100, '2026-07-11 13:52:58'),
(104, 3, 31, 100, '2026-07-11 13:52:58'),
(105, 3, 53, 100, '2026-07-11 13:53:10'),
(106, 1, 23, 100, '2026-07-11 13:53:24'),
(107, 5, 23, 100, '2026-07-11 13:53:24'),
(108, 2, 2, 100, '2026-07-11 13:53:40'),
(109, 6, 2, 100, '2026-07-11 13:53:40'),
(110, 1, 51, 100, '2026-07-11 13:53:58'),
(111, 5, 51, 100, '2026-07-11 13:53:58'),
(112, 1, 95, 100, '2026-07-11 13:54:18'),
(113, 2, 95, 100, '2026-07-11 13:54:18'),
(114, 6, 95, 100, '2026-07-11 13:54:18'),
(115, 1, 8, 100, '2026-07-11 13:54:36'),
(116, 2, 8, 100, '2026-07-11 13:54:36'),
(117, 1, 63, 100, '2026-07-11 13:54:49'),
(118, 3, 63, 100, '2026-07-11 13:54:49'),
(119, 6, 49, 100, '2026-07-11 13:55:17'),
(120, 2, 49, 100, '2026-07-11 13:55:17'),
(121, 3, 49, 100, '2026-07-11 13:55:17'),
(122, 1, 58, 100, '2026-07-11 13:55:27'),
(123, 2, 69, 100, '2026-07-11 13:55:39'),
(124, 2, 56, 100, '2026-07-11 13:55:58'),
(125, 3, 56, 100, '2026-07-11 13:55:58'),
(126, 1, 65, 100, '2026-07-11 13:56:21'),
(127, 3, 65, 100, '2026-07-11 13:56:21'),
(128, 5, 65, 100, '2026-07-11 13:56:21'),
(129, 2, 83, 100, '2026-07-11 13:56:44'),
(130, 3, 83, 100, '2026-07-11 13:56:44'),
(131, 1, 61, 100, '2026-07-11 13:57:03'),
(132, 4, 61, 100, '2026-07-11 13:57:03'),
(133, 1, 59, 100, '2026-07-11 13:57:24'),
(134, 3, 59, 100, '2026-07-11 13:57:24'),
(135, 2, 54, 100, '2026-07-11 13:57:43'),
(136, 3, 54, 100, '2026-07-11 13:57:43'),
(137, 6, 54, 100, '2026-07-11 13:57:43'),
(138, 1, 89, 100, '2026-07-11 13:58:00'),
(139, 6, 89, 100, '2026-07-11 13:58:00'),
(140, 2, 44, 100, '2026-07-11 13:58:13'),
(141, 1, 64, 100, '2026-07-11 13:58:28'),
(142, 3, 64, 100, '2026-07-11 13:58:28'),
(143, 2, 50, 100, '2026-07-11 13:58:41'),
(144, 4, 50, 100, '2026-07-11 13:58:41'),
(145, 3, 79, 100, '2026-07-11 13:58:57'),
(146, 4, 79, 100, '2026-07-11 13:58:57'),
(147, 3, 47, 100, '2026-07-11 13:59:09'),
(148, 4, 47, 100, '2026-07-11 13:59:09'),
(149, 1, 33, 100, '2026-07-11 13:59:34'),
(150, 2, 33, 100, '2026-07-11 13:59:34'),
(151, 3, 33, 100, '2026-07-11 13:59:34'),
(152, 1, 21, 100, '2026-07-11 13:59:50'),
(153, 3, 21, 100, '2026-07-11 13:59:50'),
(154, 5, 86, 100, '2026-07-11 14:00:05'),
(155, 4, 86, 100, '2026-07-11 14:00:05'),
(156, 2, 90, 100, '2026-07-11 14:00:26'),
(157, 3, 90, 100, '2026-07-11 14:00:26'),
(158, 5, 90, 100, '2026-07-11 14:00:26'),
(159, 2, 52, 100, '2026-07-11 14:00:44'),
(160, 5, 52, 100, '2026-07-11 14:00:44'),
(161, 5, 94, 100, '2026-07-11 14:01:04'),
(162, 2, 94, 100, '2026-07-11 14:01:04'),
(163, 1, 77, 100, '2026-07-11 14:01:26'),
(164, 3, 77, 100, '2026-07-11 14:01:26'),
(165, 5, 77, 100, '2026-07-11 14:01:26'),
(166, 2, 22, 100, '2026-07-11 14:01:39'),
(167, 3, 22, 100, '2026-07-11 14:01:39'),
(168, 2, 88, 100, '2026-07-11 14:01:56'),
(169, 3, 88, 100, '2026-07-11 14:01:56'),
(170, 2, 78, 100, '2026-07-11 14:02:12'),
(171, 4, 78, 100, '2026-07-11 14:02:12'),
(172, 4, 85, 100, '2026-07-11 14:02:23'),
(173, 3, 4, 100, '2026-07-11 14:02:40'),
(174, 3, 20, 100, '2026-07-11 14:02:54'),
(175, 1, 82, 100, '2026-07-11 14:03:09'),
(176, 3, 82, 100, '2026-07-11 14:03:09'),
(177, 1, 27, 100, '2026-07-11 14:03:49'),
(178, 2, 27, 100, '2026-07-11 14:03:49'),
(179, 5, 43, 100, '2026-07-11 14:04:12'),
(180, 2, 46, 100, '2026-07-11 14:04:25'),
(181, 5, 46, 100, '2026-07-11 14:04:25'),
(182, 1, 60, 100, '2026-07-11 14:04:44'),
(183, 3, 60, 100, '2026-07-11 14:04:44'),
(184, 4, 60, 100, '2026-07-11 14:04:44'),
(185, 2, 26, 100, '2026-07-11 14:05:01'),
(186, 3, 26, 100, '2026-07-11 14:05:01'),
(187, 6, 18, 100, '2026-07-11 14:05:18'),
(188, 3, 18, 100, '2026-07-11 14:05:18'),
(189, 5, 73, 100, '2026-07-11 14:05:28'),
(190, 1, 48, 100, '2026-07-11 14:05:43'),
(191, 3, 48, 100, '2026-07-11 14:05:43'),
(192, 5, 98, 100, '2026-07-11 14:05:57'),
(193, 5, 81, 100, '2026-07-11 14:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `t_fish_type`
--

CREATE TABLE `t_fish_type` (
  `fish_type_id` int(11) NOT NULL,
  `fish_type` varchar(100) NOT NULL,
  `water_type` int(11) NOT NULL COMMENT '1=freshwater,2=brackish,3=seawater',
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_fish_type`
--

INSERT INTO `t_fish_type` (`fish_type_id`, `fish_type`, `water_type`, `created_date`) VALUES
(1, 'Anemone', 3, '2026-07-08 20:08:26'),
(2, 'Archer', 2, '2026-07-08 20:08:26'),
(3, 'Barracuda', 3, '2026-07-08 20:08:26'),
(4, 'Bass', 3, '2026-07-08 20:08:26'),
(5, 'Billfish', 3, '2026-07-08 20:08:26'),
(6, 'Bream', 2, '2026-07-08 20:08:26'),
(7, 'Bream', 1, '2026-07-08 20:08:26'),
(8, 'Bream', 3, '2026-07-08 20:08:26'),
(9, 'Carp', 1, '2026-07-08 20:08:26'),
(10, 'Catfish', 2, '2026-07-08 20:08:26'),
(11, 'Catfish', 1, '2026-07-08 20:08:26'),
(12, 'Catfish', 3, '2026-07-08 20:08:26'),
(13, 'Cichlid', 2, '2026-07-08 20:08:26'),
(14, 'Dolphinfish', 3, '2026-07-08 20:08:26'),
(15, 'Filefish', 3, '2026-07-08 20:08:26'),
(16, 'Flatfish', 2, '2026-07-08 20:08:26'),
(17, 'Flatfish', 3, '2026-07-08 20:08:26'),
(18, 'Four Eyed', 2, '2026-07-08 20:08:26'),
(19, 'Gar', 1, '2026-07-08 20:08:26'),
(20, 'Goby', 2, '2026-07-08 20:08:26'),
(21, 'Grouper', 3, '2026-07-08 20:08:26'),
(22, 'Halfbeak', 2, '2026-07-08 20:08:26'),
(23, 'Mackerel', 3, '2026-07-08 20:08:26'),
(24, 'Milkfish', 2, '2026-07-08 20:08:26'),
(25, 'Moony', 2, '2026-07-08 20:08:26'),
(26, 'Mullet', 2, '2026-07-08 20:08:26'),
(27, 'Needlefish', 2, '2026-07-08 20:08:26'),
(28, 'Perch', 1, '2026-07-08 20:08:26'),
(29, 'Pike', 1, '2026-07-08 20:08:26'),
(30, 'Scorpionfish', 3, '2026-07-08 20:08:26'),
(31, 'Shark', 3, '2026-07-08 20:08:26'),
(32, 'Snapper', 2, '2026-07-08 20:08:26'),
(33, 'Snapper', 3, '2026-07-08 20:08:26'),
(34, 'Sunfish', 1, '2026-07-08 20:08:26'),
(35, 'Trout', 1, '2026-07-08 20:08:26'),
(36, 'Tuna', 3, '2026-07-08 20:08:26');

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

--
-- Dumping data for table `t_fish_weather`
--

INSERT INTO `t_fish_weather` (`fish_weather_id`, `weather_id`, `fish_id`, `weather_modifier`, `weather_mutation`, `created_date`) VALUES
(1, 1, 45, 100, 5, '2026-07-11 21:14:28'),
(2, 2, 68, 100, 5, '2026-07-11 21:14:28'),
(3, 3, 1, 100, 5, '2026-07-11 21:14:28'),
(4, 4, 40, 100, 5, '2026-07-11 21:14:28'),
(5, 5, 100, 100, 5, '2026-07-11 21:14:28'),
(6, 6, 35, 100, 5, '2026-07-11 21:14:28'),
(7, 7, 3, 100, 5, '2026-07-11 21:14:28'),
(8, 8, 34, 100, 5, '2026-07-11 21:14:28'),
(9, 9, 80, 100, 5, '2026-07-11 21:14:28'),
(10, 10, 10, 100, 5, '2026-07-11 21:14:28'),
(11, 2, 28, 100, 5, '2026-07-11 21:14:28'),
(12, 3, 41, 100, 5, '2026-07-11 21:14:28'),
(13, 4, 9, 100, 5, '2026-07-11 21:14:28'),
(14, 5, 97, 100, 5, '2026-07-11 21:14:28'),
(15, 6, 55, 100, 5, '2026-07-11 21:14:28'),
(16, 7, 71, 100, 5, '2026-07-11 21:14:28'),
(17, 8, 16, 100, 5, '2026-07-11 21:14:28'),
(18, 9, 39, 100, 5, '2026-07-11 21:14:28'),
(19, 1, 72, 100, 5, '2026-07-11 21:14:28'),
(20, 2, 25, 100, 5, '2026-07-11 21:14:28'),
(21, 3, 29, 100, 5, '2026-07-11 21:14:28'),
(22, 4, 75, 100, 5, '2026-07-11 21:14:28'),
(23, 5, 87, 100, 5, '2026-07-11 21:14:28'),
(24, 6, 93, 100, 5, '2026-07-11 21:14:28'),
(25, 7, 38, 100, 5, '2026-07-11 21:14:28'),
(26, 8, 14, 100, 5, '2026-07-11 21:14:28'),
(27, 9, 42, 100, 5, '2026-07-11 21:14:28'),
(28, 1, 12, 100, 5, '2026-07-11 21:14:28'),
(29, 2, 6, 100, 5, '2026-07-11 21:14:28'),
(30, 3, 13, 100, 5, '2026-07-11 21:14:28'),
(31, 4, 36, 100, 5, '2026-07-11 21:14:28'),
(32, 5, 37, 100, 5, '2026-07-11 21:14:28'),
(33, 6, 84, 100, 5, '2026-07-11 21:14:28'),
(34, 7, 70, 100, 5, '2026-07-11 21:14:28'),
(35, 8, 30, 100, 5, '2026-07-11 21:14:28'),
(36, 9, 76, 100, 5, '2026-07-11 21:14:28'),
(37, 1, 7, 100, 5, '2026-07-11 21:14:28'),
(38, 2, 57, 100, 5, '2026-07-11 21:14:28'),
(39, 3, 96, 100, 5, '2026-07-11 21:14:28'),
(40, 4, 5, 100, 5, '2026-07-11 21:14:28'),
(41, 5, 11, 100, 5, '2026-07-11 21:14:28'),
(42, 6, 66, 100, 5, '2026-07-11 21:14:28'),
(43, 7, 92, 100, 5, '2026-07-11 21:14:28'),
(44, 8, 15, 100, 5, '2026-07-11 21:14:28'),
(45, 9, 67, 100, 5, '2026-07-11 21:14:28'),
(46, 1, 62, 100, 5, '2026-07-11 21:14:28'),
(47, 2, 99, 100, 5, '2026-07-11 21:14:28'),
(48, 3, 24, 100, 5, '2026-07-11 21:14:28'),
(49, 4, 17, 100, 5, '2026-07-11 21:14:28'),
(50, 5, 74, 100, 5, '2026-07-11 21:14:28'),
(51, 6, 91, 100, 5, '2026-07-11 21:14:28'),
(52, 7, 19, 100, 5, '2026-07-11 21:14:28'),
(53, 8, 32, 100, 5, '2026-07-11 21:14:28'),
(54, 9, 31, 100, 5, '2026-07-11 21:14:28'),
(55, 1, 53, 100, 5, '2026-07-11 21:14:28'),
(56, 2, 23, 100, 5, '2026-07-11 21:14:28'),
(57, 3, 2, 100, 5, '2026-07-11 21:14:28'),
(58, 4, 51, 100, 5, '2026-07-11 21:14:28'),
(59, 5, 95, 100, 5, '2026-07-11 21:14:28'),
(60, 6, 8, 100, 5, '2026-07-11 21:14:28'),
(61, 7, 63, 100, 5, '2026-07-11 21:14:28'),
(62, 8, 49, 100, 5, '2026-07-11 21:14:28'),
(63, 9, 58, 100, 5, '2026-07-11 21:14:28'),
(64, 1, 69, 100, 5, '2026-07-11 21:14:28'),
(65, 2, 56, 100, 5, '2026-07-11 21:14:28'),
(66, 3, 65, 100, 5, '2026-07-11 21:14:28'),
(67, 4, 83, 100, 5, '2026-07-11 21:14:28'),
(68, 5, 61, 100, 5, '2026-07-11 21:14:28'),
(69, 6, 59, 100, 5, '2026-07-11 21:14:28'),
(70, 7, 54, 100, 5, '2026-07-11 21:14:28'),
(71, 8, 89, 100, 5, '2026-07-11 21:14:28'),
(72, 9, 44, 100, 5, '2026-07-11 21:14:28'),
(73, 1, 64, 100, 5, '2026-07-11 21:14:28'),
(74, 2, 50, 100, 5, '2026-07-11 21:14:28'),
(75, 3, 79, 100, 5, '2026-07-11 21:14:28'),
(76, 4, 47, 100, 5, '2026-07-11 21:14:28'),
(77, 5, 33, 100, 5, '2026-07-11 21:14:28'),
(78, 6, 21, 100, 5, '2026-07-11 21:14:28'),
(79, 7, 86, 100, 5, '2026-07-11 21:14:28'),
(80, 8, 90, 100, 5, '2026-07-11 21:14:28'),
(81, 9, 52, 100, 5, '2026-07-11 21:14:28'),
(82, 1, 94, 100, 5, '2026-07-11 21:14:28'),
(83, 2, 77, 100, 5, '2026-07-11 21:14:28'),
(84, 3, 22, 100, 5, '2026-07-11 21:14:28'),
(85, 4, 88, 100, 5, '2026-07-11 21:14:28'),
(86, 5, 78, 100, 5, '2026-07-11 21:14:28'),
(87, 6, 85, 100, 5, '2026-07-11 21:14:28'),
(88, 7, 4, 100, 5, '2026-07-11 21:14:28'),
(89, 8, 20, 100, 5, '2026-07-11 21:14:28'),
(90, 9, 82, 100, 5, '2026-07-11 21:14:28'),
(91, 1, 27, 100, 5, '2026-07-11 21:14:28'),
(92, 2, 43, 100, 5, '2026-07-11 21:14:28'),
(93, 3, 46, 100, 5, '2026-07-11 21:14:28'),
(94, 4, 60, 100, 5, '2026-07-11 21:14:28'),
(95, 5, 26, 100, 5, '2026-07-11 21:14:28'),
(96, 6, 18, 100, 5, '2026-07-11 21:14:28'),
(97, 7, 73, 100, 5, '2026-07-11 21:14:28'),
(98, 8, 48, 100, 5, '2026-07-11 21:14:28'),
(99, 9, 98, 100, 5, '2026-07-11 21:14:28'),
(100, 1, 81, 100, 5, '2026-07-11 21:14:28');

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
(1, 1, 2, 1, '2026-06-22 12:22:44');

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

--
-- Dumping data for table `t_inventory`
--

INSERT INTO `t_inventory` (`inventory_id`, `user_id`, `item_id`, `item_type`, `item_amount`, `created_date`, `updated_date`) VALUES
(1, 1234567890, 1, 'BAIT', 10, '2026-07-08 04:41:24', '2026-07-08 04:41:24'),
(2, 1234567890, 1, 'ROD', 1, '2026-07-08 04:41:24', '2026-07-08 04:41:24');

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

--
-- Dumping data for table `t_location`
--

INSERT INTO `t_location` (`location_id`, `city_id`, `location_name`, `location_water`, `location_description`, `created_date`) VALUES
(1, 1, 'Vasikos Pond', 1, 'A small pond that has an abundance of fish, said to be blessed by Poseidon himself.', '2026-07-10 21:11:47'),
(2, 1, 'Astrafterí Lake', 1, 'Villagers near the lake claim that Naiads prevent the lake from drying even in the harshest summer time.', '2026-07-10 21:11:47'),
(3, 1, 'Prasinos Creek', 1, 'A small stream that runs along the Psila Hill, where the locals believe is the home of water fairies.', '2026-07-10 21:11:47'),
(4, 1, 'Telma Swamp', 1, 'The legend tells the story of a general who came to this swamp to slay a hydra and never came back.', '2026-07-10 21:11:47'),
(5, 1, 'Theikos Spring', 1, 'A lot of traders travelled to this place to take the water believed to be blessed by the Primordial Mountains God himself.', '2026-07-10 21:11:47'),
(6, 1, 'Evrys River', 1, 'Some villagers believe this river is the gateway to Styx and occasionally give offerings to the river gods.', '2026-07-10 21:11:47'),
(7, 1, 'Iremia River', 1, 'A long river stretches across Ourea and Seran, with plenty of fish to catch. The Seranese called this river Bengawan.', '2026-07-10 21:11:47'),
(8, 2, 'Bengawan River', 1, 'A long river stretches across Ourea and Seran, with plenty of fish to catch. The Ourean called this river Iremia.', '2026-07-10 21:11:47'),
(9, 2, 'Saint Luke Pond', 1, 'The pond that belongs to the church, the first fish that get capture by the fisherman has to be donated to the church.', '2026-07-10 21:11:47'),
(10, 2, 'Prince Kaiden Reservoir', 1, 'The late Prince Kaiden is said to have drowned in this lake at a young age, and his father, King Simon turn the lake into a reservoir.', '2026-07-10 21:11:47'),
(11, 2, 'Merman Marsh', 1, 'Local legend once claims a merman drowned a fisherman in the marsh. Others dismiss the tale, believing the sightings were caused by the soldiers secretly disposing of mages corpses.', '2026-07-10 21:11:47'),
(12, 2, 'Wisp Swamp', 1, 'Countless reports tell a story of a will-o\'-the-wisp appearing at night, trying to lure a fisherman to the depths of the swamp, where some people claim it was a den of mages.', '2026-07-10 21:11:47'),
(13, 2, 'Sofia River', 1, 'Named after the old Queen, who legend said was blessed by the god, and the mother of the first king of Rosegleam.', '2026-07-10 21:11:47'),
(14, 2, 'Becket Cross Canal', 1, 'A man-made canal that connects to the Prince Kaiden Reservoir to maintain water for the city. Fishing is strictly prohibited without permit', '2026-07-10 21:11:47'),
(15, 3, 'Purba Mangrove', 2, 'It is said that there was once a thriving civilization located in this mangrove forest.', '2026-07-10 21:11:47'),
(16, 3, 'Kaca Lake', 1, 'Kaca Lake earned its name from its crystal clear water that makes the surface appear like glass. Local legend claims that on a full moon, you can gaze upon it and see your future self.', '2026-07-10 21:11:47'),
(17, 3, 'Seribu Arus River', 1, 'An infamous river that has an unpredictable current that shifts without warning. The home of many exotic fish can only be found here.', '2026-07-10 21:11:47'),
(18, 3, 'Mentari Pond', 1, 'A pond inside Mentari Village is said to belong to an old general long before Mentari village establish.', '2026-07-10 21:11:47'),
(19, 3, 'Seroja Marsh', 1, 'A sprawling marshland renowned for its field of lotus covering the entire surface of water.', '2026-07-10 21:11:47'),
(20, 3, 'Batu Kawah Lake', 1, 'This lake forms from the erupted volcano near the town and is now home to many fish.', '2026-07-10 21:11:47'),
(21, 3, 'Seroja Darah Swamp', 1, 'Swamp water inside Seroja Marshes, home of many predatory fish and terrifying Teras, where blood lotus said to come from', '2026-07-10 21:11:47'),
(22, 3, 'Tanjung Seran Harbor', 3, 'The busiest harbor in Seran, where all the sea commodities are transported and distributed.', '2026-07-10 21:11:47'),
(23, 4, 'Ægir Fjord', 2, 'Old tales tell that the fjord was carved when Ægir struck down a great Draugr with a single blow.', '2026-07-10 21:11:47'),
(24, 4, 'Mikill Hvítar Lake', 1, 'At the dead of the night, fishermen can hear an enchanting music coming from the lake, luring them to swim deep into the water.', '2026-07-10 21:11:47'),
(25, 4, 'Ormr River', 1, 'Once upon a time, there was a giantess powerful enough to increase the Ormr River water to drown Thor.', '2026-07-10 21:11:47'),
(26, 4, 'Freyja River', 1, 'Old sailors claim the river was formed by the saliva of Fenrir when it was bound by the gods. During heavy rain, the river will turn white, indicating that the Fenrir may still be alive somewhere along the river.', '2026-07-10 21:11:47'),
(27, 4, 'Jötunn Cave', 1, 'The skalds tell an ancient tale of Ymir, the ancestor of all the giants. Some claim that the cave reaches deep into the roots of the World Tree.', '2026-07-10 21:11:47'),
(28, 4, 'Reyr Marsh', 1, 'During a foggy night, fishermen reported movement along the tall reed, but they never saw anything after that.', '2026-07-10 21:11:47'),
(29, 4, 'Yrviðr Swamp', 1, 'Sailors around Tidehaven convinced Yew Tree to grow deep inside the swamp, but, because of the high concentration of mana there, it became the home of Teras.', '2026-07-10 21:11:47'),
(30, 4, 'Gröfgarðr Shore', 3, 'Powerful waves carry the shipwreck of a sailor unfortunate enough to be caught in Rán net.', '2026-07-10 21:11:47'),
(31, 4, 'Sjókona Beach', 3, 'Sailor tells the tale of a women who is singing at the rock of Sjókona Beach to her lover, who abandons her in search of riches. ', '2026-07-10 21:11:47'),
(32, 4, 'Harma Ocean', 3, 'The tales of a grieving father surrounding this part of the ocean, sailors claim the father souls are still wandering the ocean, trying to find his son body.', '2026-07-10 21:11:47'),
(33, 1, 'Evrys Estuary', 2, 'Said to be the place where Naiads give offerings to the god of the sea himself, Poseidon. Some even say this is the place where Poseidon mated with a Naiad named Chione.', '2026-07-10 21:11:47'),
(34, 3, 'Seribu Arus Estuary', 2, 'It is said that a rich merchant\'s daughter drowned herself here and transformed into a white crocodile with the help of the lake spirit.', '2026-07-10 21:11:47'),
(35, 1, 'Roufíchtra Ocean', 3, 'The sea monster Charybdis is said to be living somewhere around this ocean, pulling the sea three times a day, creating a massive whirlpool.', '2026-07-10 21:11:47');

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

--
-- Dumping data for table `t_mutation`
--

INSERT INTO `t_mutation` (`mutation_id`, `fish_id`, `mutation_name`, `mutation_description`, `mutation_chance`, `mutation_min_weight`, `mutation_max_weight`, `mutation_min_length`, `mutation_max_length`, `created_date`) VALUES
(1, 1, 'Banded Scalefish', 'A mutated archerfish with scales as hard as a rock to prevent predators from eating them.', '0.50', '0.20', '1.50', '5.00', '15.00', '2026-07-08 10:44:28'),
(2, 1, 'Banded Flamefish', 'An archerfish that shoots hot water to hunt, mana allows it to superheat the water inside its mouth before shooting it.', '0.50', '0.50', '2.00', '8.00', '20.00', '2026-07-08 10:44:28'),
(3, 2, 'Horned Archerfish', 'Horned Archerfish uses its horn to defend itself and as a way to attract the female', '0.60', '0.10', '1.70', '4.00', '45.00', '2026-07-08 10:44:28'),
(4, 2, 'Northern Clawfish', 'Its fin mutated to have a razor-sharp claw to penetrate the mouth of a fish unfortunate enough to eat it.', '0.40', '0.30', '2.20', '4.50', '47.00', '2026-07-08 10:44:28'),
(5, 3, 'Black-Scale Bream', 'The scale of this fish mutated to have a scale similar to a dragon\'s, but not as hard.', '0.30', '0.70', '5.00', '17.00', '39.00', '2026-07-08 10:44:28'),
(6, 3, 'Moonlit Bream', 'Bream that hunt at night, using their faint glow to attract smaller fish to come closer.', '0.70', '0.60', '3.00', '10.00', '24.00', '2026-07-08 10:44:28'),
(7, 4, 'Mucus Bream', 'A mucus-covered bream makes its body sleek and slippery; it has a foul taste that discourage predators from eating it.', '0.40', '0.50', '5.00', '15.00', '38.00', '2026-07-08 10:44:28'),
(8, 4, 'Dagger Fang Bream', 'A large bream with a dagger-sharp fang, because of this mutation, it became so aggressive that it would attack anything that moved in the water.', '0.60', '1.00', '9.00', '20.00', '60.00', '2026-07-08 10:44:28'),
(9, 5, 'Helmet Catfish', 'A catfish that has a head as hard as a soldier\'s helmet, designed to ram into prey.', '0.90', '1.00', '4.00', '18.00', '52.00', '2026-07-08 10:44:28'),
(10, 5, 'Mana-Whiskered Catfish', 'Its whiskers can detect the slightest change in the water, making it extremely hard to catch.', '0.10', '0.70', '3.80', '12.00', '38.00', '2026-07-08 10:44:28'),
(11, 6, 'Bloodeye Catfish', 'This catfish has a red eye that enables it to see exceptionally well in a low-light area. Fishermen usually save its eyes for luck.', '0.30', '0.70', '3.00', '7.00', '26.00', '2026-07-08 10:44:28'),
(12, 6, 'Venomous Catfish', 'Its tail fin becomes so venomous that its venom has claimed many careless fishermen.', '0.70', '1.50', '4.50', '15.00', '45.00', '2026-07-08 10:44:28'),
(13, 7, 'Blinded Chromide', 'The eyes of this fish are cloudy, making it have terrible eyesight, but in return, the fish is incredible sensitive to mana fluctuation and changes in water.', '0.20', '0.10', '1.00', '3.00', '10.00', '2026-07-08 10:44:28'),
(14, 7, 'Frenzied Chromide', 'The mana made this fish go into a frenzy whenever it smelled blood from the water, attacking everthing near the blood.', '0.80', '0.20', '2.50', '8.00', '35.00', '2026-07-08 10:44:28'),
(15, 8, 'Giant Orange Chromide', 'This fish became so big because of mana circulating through its body; it has also become carnivorous.', '0.60', '1.00', '2.00', '5.00', '20.00', '2026-07-08 10:44:28'),
(16, 8, 'Loosejaw Chromide', 'Its jaw can open so wide, it can swallow fish bigger than its body weight.', '0.40', '0.10', '0.50', '1.00', '7.00', '2026-07-08 10:44:28'),
(17, 9, 'Frostblood Tilapia', 'This tilapia has a body temperature lower than the water around it; its body can cause frostbite if held too long.', '0.30', '0.60', '4.00', '8.00', '50.00', '2026-07-08 10:44:28'),
(18, 9, 'Scaly Tilapia', 'This fish evolves to have harder scales; its hardened scales protect it from larger predators while also reflecting sunlight with a metallic sheen.', '0.70', '0.70', '6.00', '10.00', '45.00', '2026-07-08 10:44:28'),
(19, 10, 'Bladed Spine Tilapia', 'Mana reinforced its upper fin until it hardened into a blade-like fin. This fish can sometimes be seen fighting with another species for territory.', '0.40', '0.60', '3.50', '7.00', '55.00', '2026-07-08 10:44:28'),
(20, 10, 'Hookfin Tilapia', 'With its hooked fin, this fish hunts its prey by chasing it and slashing the prey before devouring it.', '0.60', '1.00', '3.00', '8.00', '42.00', '2026-07-08 10:44:28'),
(21, 11, 'Sandy Hogchoker', 'This hogchoker can camouflage itself with the surrounding area, preferably sandy or muddy water.', '0.60', '0.30', '0.80', '3.00', '22.00', '2026-07-08 10:44:28'),
(22, 11, 'Venomous Hogchoker', 'Its skin have a tiny needles on its skin, whenever something or someone even touches it, it will inject a deadly toxin that clogs the blood.', '0.40', '0.20', '1.00', '6.00', '30.00', '2026-07-08 10:44:28'),
(23, 12, 'Lightning-eyes Fish', 'This fish swam so fast, its explosive burst of speed makes it nearly impossible to follow with the naked eye.', '0.30', '0.10', '1.00', '5.00', '30.00', '2026-07-08 10:44:28'),
(24, 12, 'Six-eyed Fish', 'The extra pair of eyes made this fish have 360° eyesight. Its expanded field of vision allows it to detect predators and prey from almost any direction.', '0.70', '0.20', '1.10', '6.00', '31.00', '2026-07-08 10:44:28'),
(25, 13, 'Sawtoothed Mudskipper', 'This mudskipper use it tooth to saw into the roots of a tree near the water, eating the root bit by bit.', '0.20', '0.20', '1.20', '7.00', '30.00', '2026-07-08 10:44:28'),
(26, 13, 'Raksasa Mudskipper', 'This giant fish evolves to be bigger because of continuous exposure to mana. It moved from a small crab to bigger and bigger prey.', '0.80', '1.00', '3.00', '15.00', '59.00', '2026-07-08 10:44:28'),
(27, 14, 'Poison-skin Goby', 'The skin of this goby is covered with a potent poison, one of the deadliest toxins among freshwater fish', '0.40', '0.10', '0.50', '7.00', '55.00', '2026-07-08 10:44:28'),
(28, 14, 'Flaming Goby', 'This goby can raise its body temperature enough to scald nearby predators that dare to bite it.', '0.60', '0.20', '0.80', '9.00', '65.00', '2026-07-08 10:44:28'),
(29, 15, 'Soldier Goby', 'The territorial behaviour of this fish became so intense that it will relentlessly patrol and defend their territory no matter how big the predators are.', '0.50', '0.10', '1.30', '1.20', '9.20', '2026-07-08 10:44:28'),
(30, 15, 'Stonehide Goby', 'Its scales become as hard as a rock, a hammer sometime need to be used to even descale it.', '0.50', '0.20', '1.20', '0.90', '8.50', '2026-07-08 10:44:28'),
(31, 16, 'Antler Goby', 'It has a large horn resembling a deer antler in front of its head, used to dig a hole and ram a predator that got too close.', '0.40', '0.30', '2.00', '2.00', '8.00', '2026-07-08 10:44:28'),
(32, 16, 'Poison-ring Goby', 'At first glance, this goby doesn\'t seem dangerous, but it has one of the deadliest poisons surrounding the body.', '0.60', '0.20', '1.50', '1.50', '6.00', '2026-07-08 10:44:28'),
(33, 17, 'Gleaming Goby', 'This white colored goby is an aggressive goby that will attack anything that it thinks would pose a threat to its territory.', '0.90', '1.20', '8.30', '12.30', '67.50', '2026-07-08 10:44:28'),
(34, 17, 'Mugwort Goby', 'A highly prized fish among the nobles of Rosegleam, this fish is believed to ease chronic pain and restore vitality. While some nobles reported positive changes in their body, the long-term effects remain poorly understood, as few people can even afford to eat it.', '0.10', '2.00', '15.00', '20.00', '100.00', '2026-07-08 10:44:28'),
(35, 18, 'Charred Halfbeak', 'Mana contamination is slowly making its body decay from within. The charred flesh began to peel from its body and detach; it instinctively fed on its own rotting flesh, delaying its inevitable death.', '0.40', '0.10', '0.20', '0.90', '6.00', '2026-07-08 10:44:28'),
(36, 18, 'Spear-jaw Halfbeak', 'Its lower jaw evolved to become as sharp as a spear. It kills its prey by swimming really fast and impaling them, then slowly eating the prey when it is stuck on its jaw.', '0.60', '0.30', '0.60', '1.30', '9.00', '2026-07-08 10:44:28'),
(37, 19, 'Cheesefish', 'The flesh of this fish emits a pungent odor resembling aged cheese. The smell attracts smaller school fish, providing it with an endless supply of prey, but the downside, it also draws a bigger predator to its location.', '0.60', '1.30', '23.00', '50.00', '130.00', '2026-07-08 10:44:28'),
(38, 19, 'Butterfish', 'The flesh of this fish has been altered by mana, making it unusually rich and buttery. Despite its tender meat, its behavior is nothing but aggressive; it will attack anything that even comes too close to its territory.', '0.40', '1.50', '25.00', '70.00', '200.00', '2026-07-08 10:44:28'),
(39, 20, 'Steamgill Moony', 'A schooling fish that releases a hot steam out of their gill to deter predators that come close to it. When the predator gets confused, it will bolt out and escape.', '0.20', '0.20', '1.10', '6.00', '20.00', '2026-07-08 10:44:28'),
(40, 20, 'Hog Moony', 'The mana inside this fish makes its scent sensory go into overdrive; it can no longer detect prey or predator, and they will attack anything that they can smell.', '0.80', '0.20', '1.20', '8.00', '27.00', '2026-07-08 10:44:28'),
(41, 21, 'Bladedfin Moony', 'Its fin evolves into a sharp blade like a knife. This fish surrounds its prey and slowly slashes them, and eats the chunks that fly out.', '0.40', '0.10', '1.20', '5.20', '29.00', '2026-07-08 10:44:28'),
(42, 21, 'Radiance Moony', 'This fish can generate light by manipulating mana inside of them when they feel threatened and hunting. They will surround their prey and then eat them when paralyzed.', '0.60', '0.20', '1.50', '6.00', '30.00', '2026-07-08 10:44:28'),
(43, 22, 'Paunch Mullet', 'Its brain has been manipulated so much by mana that it can\'t feel full anymore, it will keep eating until its belly bursts.', '0.50', '2.00', '10.00', '21.00', '97.00', '2026-07-08 10:44:28'),
(44, 22, 'Fireblood Mullet', 'The blood inside this fish is warmer than the surrounding water, which enables it to move even in a colder environment without any troubles.', '0.50', '1.60', '9.00', '25.00', '110.00', '2026-07-08 10:44:28'),
(45, 23, 'Leaping Needlefish', 'This fish has a behaviour of jumping into the air to hunt small birds that get too close to the surface of the water. Because of this, fishermen sometimes get hurt because of their sharp fin.', '0.40', '0.10', '1.00', '4.00', '32.00', '2026-07-08 10:44:28'),
(46, 23, 'Rapierfish', 'The jaw of this fish has evolved into a sharp point when their mouth closes, usually used by them to fight predators and their own kind for territory.', '0.60', '0.10', '0.70', '4.00', '35.00', '2026-07-08 10:44:28'),
(47, 24, 'Megamouth Jack', 'This fish evolved to eat almost nothing but plankton, but they occasionally eat smaller fish that got suck by their mouth too.', '0.60', '2.50', '18.00', '50.00', '175.00', '2026-07-08 10:44:28'),
(48, 24, 'Giant Mangrove Jack', 'Mana exposure causes this fish to grow bigger and bigger; the more condensed the mana around their habitat, the bigger it gets.', '0.40', '4.60', '27.00', '80.00', '200.00', '2026-07-08 10:44:28'),
(49, 25, 'Bronze-skin Bream', 'Its skin becomes hard as bronze; some smiths even use it as an alternative to real bronze. But, this fish skin is thinner than bronze, making the tools that use the skin easier to break.', '0.40', '5.00', '16.00', '32.00', '90.00', '2026-07-08 10:44:28'),
(50, 25, 'Whiptail Bream', 'The tail elongated into a whip-like appendage that provided excellent maneuverability, allowing it to make a sudden change in its trajectory while chasing prey or escaping from predators.', '0.60', '6.00', '15.00', '25.00', '95.00', '2026-07-08 10:44:28'),
(51, 26, 'Rock-body Bream', 'Mana inside its body makes this fish\'s body hard as a rock; not only that, their body also weighs as heavy as a rock, which makes the fish almost incapable of swimming for too long.', '0.80', '2.00', '5.00', '4.50', '7.50', '2026-07-08 10:44:28'),
(52, 26, 'Glass Bream', 'The mana circulating in its body makes the body of this bream nearly glass-like, making it hard for predators and even potential mates to see each other.', '0.20', '0.50', '2.50', '4.00', '8.00', '2026-07-08 10:44:28'),
(53, 27, 'Chirping Bream', 'Fishermen claim that at night, Nøkken will make a chirping sound to lure them into deeper water, until one day a scholar catches a fish that continues to chirp even when out of the water.', '0.10', '0.80', '2.30', '17.00', '52.00', '2026-07-08 10:44:28'),
(54, 27, 'Trance Bream', 'Exposure to mana makes this fish unable to swim sometimes, and the older it gets, the weirder its behavior. Some fishermen even claim that they saw some fish come to the surface and remain motionless for hours.', '0.90', '0.50', '2.50', '10.00', '40.00', '2026-07-08 10:44:28'),
(55, 28, 'Icy Blue Bream', 'This fish has a lower body temperature than other fish, making it sluggish in colder water; even in warmer water, it will move slowly.', '0.30', '1.70', '4.90', '19.00', '49.00', '2026-07-08 10:44:28'),
(56, 28, 'Sharkfin Bream', 'The upper fin of this bream becomes hard, almost like a shark fin, making it excel at sudden turn when swimming from predators.', '0.70', '2.00', '6.00', '28.00', '60.00', '2026-07-08 10:44:28'),
(57, 29, 'Glowing Heart Carp', 'Mana circulation made this carp\'s heart glow, it makes hunting at night easier and harder to escaping the predators.', '0.40', '7.00', '45.50', '42.50', '125.00', '2026-07-08 10:44:28'),
(58, 29, 'Widemouth Carp', 'This carp can open its mouth so wide that it almost eats almost all its prey whole. Because of this, its mouth sometimes gets ripped from overextension.', '0.60', '8.00', '50.00', '45.00', '120.00', '2026-07-08 10:44:28'),
(59, 30, 'Glassbone Carp', 'The bone in this carp is so brittle that even the lightest drop will break all of its bones. It makes this carp swim so slowly and become more passive.', '0.40', '6.00', '48.00', '22.00', '105.00', '2026-07-08 10:44:28'),
(60, 30, 'Hairy Grass Carp', 'Hair like thorns covered this carp\'s body, which helped the carp to camouflage itself between the grass or algae below the water.', '0.60', '7.00', '50.00', '25.00', '100.00', '2026-07-08 10:44:28'),
(61, 31, 'Jumping Mud Carp', 'The fins have been reinforced by mana, allowing this carp to support its entire body out of the water and move from one body of water to another.', '0.50', '4.00', '9.00', '22.00', '76.00', '2026-07-08 10:44:28'),
(62, 31, 'Stone Carp', 'Scholars are still unsure how the fish covers itself and rolls into a ball during droughts, and some even suggest that the carp uses mana to cover itself.', '0.50', '3.00', '7.00', '25.00', '80.00', '2026-07-08 10:44:28'),
(63, 32, 'Fanged Carp', 'Its mouth is covered with a lot of sharp teeth, and it can even chew through the wood of the boat that fishermen use.', '0.60', '3.00', '15.00', '12.00', '90.00', '2026-07-08 10:44:28'),
(64, 32, 'Arrow Carp', 'Its streamlined body has evolved into something akin to an arrow, allowing it to swim so fast, even against a strong current.', '0.40', '5.00', '25.00', '17.00', '125.00', '2026-07-08 10:44:28'),
(65, 33, 'Sailtail Carp', 'The upper fin grows until the end of its tail. This sail-like upper fin is used to make a barrier when it circles the fish.', '0.50', '8.00', '55.00', '37.00', '100.00', '2026-07-08 10:44:28'),
(66, 33, 'Twin Horned Carp', 'This carp leaps out of the water whenever it gets startled, the mana inside its body making it hyper aware.', '0.50', '8.00', '60.00', '40.00', '120.00', '2026-07-08 10:44:28'),
(67, 34, 'Overgrown Carp', 'Scholars speculate that this type of mana-evolve carp will not stop growing as long as it keeps eating. No specimen has ever shown signs of maturity.', '0.40', '7.00', '77.00', '77.00', '177.00', '2026-07-08 10:44:28'),
(68, 34, 'Obsidian Carp', 'Its skin glows magnificently under the moonlight, and when underwater, this fish is nearly invisible beneath the moonlit surface, making it a great predator.', '0.60', '8.00', '40.00', '65.00', '120.00', '2026-07-08 10:44:28'),
(69, 35, 'Insatiable Carp', 'This voracious fish will eat anything that they can, whether it is fish, shellfish, or even an insect that has drowned until its die.', '0.30', '10.00', '50.00', '55.00', '125.00', '2026-07-08 10:44:28'),
(70, 35, 'Humphead Carp', 'The head of this fish becomes so big that it will block its eyes, and the inside of the hump is filled with mucus and water.', '0.70', '12.00', '62.00', '42.00', '162.00', '2026-07-08 10:44:28'),
(71, 36, 'Dwarf Carp', 'The food that gets inside this fish becomes fuel for the mana reservoir rather than its body, making its body smaller over time.', '0.40', '2.00', '15.00', '10.00', '30.00', '2026-07-08 10:44:28'),
(72, 36, 'Monstrous Carp', 'A tale in a nearby village tells a story of boogeymen snatching and gobbling up children whenever they go to murky water. Some scholars suggested that maybe this fish is the one responsible for the missing children.', '0.60', '40.00', '200.00', '90.00', '300.00', '2026-07-08 10:44:28'),
(73, 37, 'Scarred Carp', 'The pattern on its body is a sign of mana constantly escape though its body; the excessive mana inside its body prevent its to swim.', '0.20', '1.50', '7.50', '12.50', '30.00', '2026-07-08 10:44:28'),
(74, 37, 'Rat Carp', 'This fish got its name for its reproductive capability; the mana circulation makes this fish have a high sexual reproductivity and keeps reproducing.', '0.80', '1.00', '4.00', '7.00', '20.00', '2026-07-08 10:44:28'),
(75, 38, 'Snow Carp', 'This carp gets really active when the temperature gets low enough to have snow; when the temperature gets high, it usually stops hunting and becomes almost dormant.', '0.30', '1.50', '4.50', '17.00', '57.00', '2026-07-08 10:44:28'),
(76, 38, 'Gillless Carp', 'Scholars can\'t seem to agree about how this fish even breathes; some suggest that maybe it breathes through its mouth, while others argue that maybe it uses their skin to breathe.', '0.70', '2.00', '6.00', '12.00', '41.00', '2026-07-08 10:44:28'),
(77, 39, 'Thunder Catfish', 'Scholars believe this catfish can shock their prey using a specialized organ that stores mana and releases that mana as a thunderbolt-like jolt. But, after dissection, no such organ has been identified to have that kind of function.', '0.40', '5.00', '28.00', '21.00', '110.00', '2026-07-08 10:44:28'),
(78, 39, 'Serpentine Catfish', 'Its serpentine-like body sometime get mistaken for a river serpent; It even behaves like one, swallowing its prey whole, even if the fish is big.', '0.60', '7.00', '36.00', '50.00', '160.00', '2026-07-08 10:44:28'),
(79, 40, 'Hunter Catfish', 'This catfish is infamous for its persistent of chasing its prey. Fishermen claim that this catfish will chase its prey even after its prey has already been brought to the boat.', '0.70', '20.00', '75.00', '15.00', '75.00', '2026-07-08 10:44:28'),
(80, 40, 'Bone Plate Catfish', 'Bone plates occasionally grow on its body, protecting it from predator attack. This bone can be fetched for a high price, mostly used for a shield by a smith.', '0.30', '45.00', '175.00', '40.00', '230.00', '2026-07-08 10:44:28'),
(81, 41, 'Swift Catfish', 'Fishermen around Ourea claim that this fish moves abnormally when they hunt; they claim that tiny bubbles will come out of its gill and suddenly lunge forward violently without any extra movement from their tail.', '0.80', '8.00', '70.00', '25.00', '165.00', '2026-07-08 10:44:28'),
(82, 41, 'Lapis Lazuli Catfish', 'Its brilliant blue color makes this catfish a symbol of wealth among the rich families in Ourea, but because of the aggressive behavior of this fish, whenever there are two at the same time, they will attack each other.', '0.20', '7.00', '60.00', '28.00', '150.00', '2026-07-08 10:44:28'),
(83, 42, 'Log Catfish', 'Its body evolved to resemble a dead log underwater, allowing it to camouflage itself better when hunting or hiding from larger predators.', '0.30', '7.50', '52.00', '34.00', '155.00', '2026-07-08 10:44:28'),
(84, 42, 'Shovelhead Catfish', 'Long exposure of mana makes the head of this fish resemble a shovel; many scholar confused about why the head of this fish evolved into that shape in the first place.', '0.70', '9.00', '50.00', '30.00', '125.00', '2026-07-08 10:44:28'),
(85, 43, 'Saw-teeth Catfish', 'Contrary to its appearance, this fish is a herbivore; its teeth are specialized in cutting tough roots underwater and some other underwater plants.', '0.40', '5.00', '15.00', '15.00', '65.00', '2026-07-08 10:44:28'),
(86, 43, 'Hopping Catfish', 'The catfish can be seen hopping around the mud-covered water when the drought arrived. Scholars alike theorize that maybe a mutation caused this catfish to be able to hop using mana stored inside its body.', '0.60', '6.00', '20.00', '10.00', '60.00', '2026-07-08 10:44:28'),
(87, 44, 'Tailless Catfish', 'Its tail has gradually been consumed by the mana inside of it, making this fish unable to swim altogether and slowly die of hunger and predation.', '0.30', '5.00', '30.00', '12.00', '35.00', '2026-07-08 10:44:28'),
(88, 44, 'Blazingtail Catfish', 'This catfish\'s tail will glow red, and it will use the tail as a hammer to attack its attacker. The tail can easily burn the attacker if not immediately swatted away.', '0.70', '15.00', '62.00', '19.00', '125.00', '2026-07-08 10:44:28'),
(89, 45, 'Shedding Gar', 'Scales from this gar will constantly shed due to mana leaking everywhere from its body, making it vulnerable to all parasites and infections.', '0.40', '15.00', '85.00', '25.00', '165.00', '2026-07-08 10:44:28'),
(90, 45, 'Double-jaw Gar', 'When this fish hunt their prey, it will chase it and bite it using the second set of jaws inside its throat. It will grab the prey and slowly swallow it using its main mouth.', '0.60', '30.00', '180.00', '65.00', '225.00', '2026-07-08 10:44:28'),
(91, 46, 'Frenzied Walleye', 'This fish usually avoids bright light because of their sensitive eyes, but because of the mana mutation, this fish will charge toward the light source and attack it relentlessly.', '0.70', '1.10', '8.50', '14.00', '85.00', '2026-07-08 10:44:28'),
(92, 46, 'Numerous Eyes', 'Eyes will continuously \"grow\" on its body aggressively, like a parasite; it will make this fish confused because of the numerous vision at once.', '0.30', '1.50', '10.00', '12.00', '70.00', '2026-07-08 10:44:28'),
(93, 47, 'Caniballistic Sauger', 'Fishermen claim that this fish is always searching for its own kind to prey on; it rarely eats other fish and only attack their own kind.', '0.30', '1.20', '4.20', '12.00', '60.00', '2026-07-08 10:44:28'),
(94, 47, 'Barkhide Sauger', 'The scales of this fish look like the bark of a tree; it uses this for camouflage when it was hunting underwater.', '0.70', '1.00', '3.70', '11.00', '53.00', '2026-07-08 10:44:28'),
(95, 48, 'Needle-spine Perch', 'Its upper fin grows some needle-like bones on it, making it extra sharp. It uses this new bone to find a mate and defend itself from predators trying to eat it.', '0.80', '0.60', '2.20', '11.20', '48.00', '2026-07-08 10:44:28'),
(96, 48, 'Rock-eating Perch', 'The older this fish gets, the more it will keep eating rock out of the bottom of the river. Scholars suggest that because of the mutation, this fish cannot differentiate between prey and rock anymore.', '0.20', '0.70', '4.00', '12.30', '62.00', '2026-07-08 10:44:28'),
(97, 49, 'Apple Perch', 'In Seran, this fish is extremely popular due to the meat tasting like a fresh apple; they love it so much, the rich are even ready to pay anyone handsomely for it.', '0.40', '1.50', '16.00', '21.00', '65.00', '2026-07-08 10:44:28'),
(98, 49, 'Scythe-tail Perch', 'The curved tail of this fish makes it look like a scythe; the tail is also hard like a rock, making it a main weapon for the fish to attack predators or prey.', '0.60', '1.40', '18.00', '23.00', '75.00', '2026-07-08 10:44:28'),
(99, 50, 'Pearl Ruffe', 'A large, round rock resembling a pearl is growing below its head; this pearl is considered among scholars as a disease, because the bigger the rock, the thinner the fish is.', '0.20', '0.30', '0.60', '4.70', '23.00', '2026-07-08 10:44:28'),
(100, 50, 'Frenzied Ruffe', 'This type of ruffe almost always attacks others because of its aggressive tendency to attack anything that is near it, making it never rest peacefully.', '0.80', '0.20', '0.40', '4.20', '12.00', '2026-07-08 10:44:28'),
(101, 51, 'Violet Pike', 'Scholars from Ourea noted that the Violet Pike became thinner the brighter their purple coloration is, suggesting that maybe the mana mutation makes this pike sick.', '0.30', '4.00', '23.00', '14.00', '64.00', '2026-07-08 10:44:28'),
(102, 51, 'Night Hunter Pike', 'This pike becomes more active at night than during the day; scholars theorize that the fish\'s perception of time is flipped by how they behave.', '0.70', '7.00', '27.00', '27.00', '127.00', '2026-07-08 10:44:28'),
(103, 52, 'Double-headed Pike', 'Records from Tidehaven mention that this type of pike is born when its male parent undergoes some kind of mutation when fertilization of eggs happens, making it mutate into having two heads in one body.', '0.20', '1.60', '5.70', '34.00', '78.00', '2026-07-08 10:44:28'),
(104, 52, 'Pickaxe Pike', 'A hard protruding bone grows on the base of this fish\'s lower jaw, making it look like a pick. Scholars suggest that this bone is used to pick on a mollusk\'s hard shell.', '0.80', '1.40', '5.00', '35.00', '73.00', '2026-07-08 10:44:28'),
(105, 53, 'Elusive Pike', 'Fishermen all around Tidehaven and Rosegleam tell a tale of this fish because of how hard it is to even see one in real life. Even if fishermen manage to hook this fish, very few have managed to land one.', '0.10', '7.00', '45.00', '60.00', '200.00', '2026-07-08 10:44:28'),
(106, 53, 'Saber Pike', 'A large fang-like tooth can be seen protruding from its mouth. This fang made any prey that had been captured by the pike die almost instantly.', '0.90', '6.00', '40.00', '50.00', '175.00', '2026-07-08 10:44:28'),
(107, 54, 'Skull-less Pickerel', 'The top of the head of this fish is gone, and little fish and small aquatic animals can be seen eating its brain when the pickerel is still alive. Scholars around Endral cannot seem to understand how the pickerel is even alive after the mutation made its top head disappear.', '0.20', '0.30', '1.50', '3.00', '31.00', '2026-07-08 10:44:28'),
(108, 54, 'Fiery Red Pickerel', 'The entire body of this pickerel has a bright red coloration, making it easy to be spotted by fishermen and predators alike. ', '0.80', '0.50', '1.80', '4.00', '35.00', '2026-07-08 10:44:28'),
(109, 55, 'Bulging Bluegill', 'A bulging mass can be found on its body; this mass contains a lot of flesh from the fish itself. Scholars think that this bulging mass \"eats\" all the nutrients that the fish consume and continously grow.', '0.20', '0.60', '2.50', '14.00', '40.00', '2026-07-08 10:44:28'),
(110, 55, 'Rabbit-ear Fish', 'The `ear` behind the gill of this fish mutates to become so long that it almost looks like a rabbit\'s ear. This ear is presumably used to detect slight changes in the water.', '0.80', '0.70', '2.30', '12.00', '37.00', '2026-07-08 10:44:28'),
(111, 56, 'Spear-tongue Fish', 'A spear-like tongue can be located in the fish\'s mouth; the fish uses this tongue to skewer its prey and eat it whole. This fish also uses its tongue to fight for its territory and scare off predators.', '0.30', '0.50', '1.30', '9.00', '26.00', '2026-07-08 10:44:28'),
(112, 56, 'Seed Scale Fish', 'A seed size scale grows irregulary through out is body. This \"seed\" can be eaten just like a pumpkin seed would when cooked properly.', '0.70', '0.60', '1.20', '12.00', '30.00', '2026-07-08 10:44:28'),
(113, 57, 'Bearded Sunfish', 'A reed-like plant grows from its gill, almost covering it entirely. This \"plant\" is used by the fish to attract plant-eating fish to be its prey.', '0.40', '0.30', '1.20', '7.00', '32.00', '2026-07-08 10:44:28'),
(114, 57, 'Moss Sunfish', 'A moss covered the entire body of this fish. Whenever prey comes close to eat the moss on its body, it will ambush it and eat it instead.', '0.60', '0.50', '1.30', '8.00', '35.00', '2026-07-08 10:44:28'),
(115, 58, 'The Sunfish', 'The glow from this small fish is considered to be a glow of the sun itself. This fish only glows when it feels threatened, but people from Rosegleam thought this a good premonition about the incoming weather.', '0.10', '0.10', '0.50', '4.00', '7.00', '2026-07-08 10:44:28'),
(116, 58, 'Schooling Sunfish', 'Mutations make this fish change its behavior and start to hunt in packs; they will surround its prey and started to eat them bit by bit.', '0.90', '0.10', '0.60', '3.00', '6.00', '2026-07-08 10:44:28'),
(117, 59, 'Fan-ear Sunfish', 'The \"ear\" from this fish grows so big that it almost covers its gill; this \"ear\" is used by the fish to create a water current that cleans the surrounding area for its home.', '0.30', '0.30', '1.30', '12.00', '45.00', '2026-07-08 10:44:28'),
(118, 59, 'Sailfin Sunfish', 'A fin grows from the top of its head until it\'s connected to the tail behind, making it look like the sail of a ship. This makes the fish able to maneuver around the water expertly.', '0.70', '0.40', '1.80', '13.00', '50.00', '2026-07-08 10:44:28'),
(119, 60, 'Strawberry Fish', 'A small bump can be felt around its body like the skin of a strawberry; the flesh is vivid crimson red and smells like a ripe strawberry. But, scholars said that the flesh of this fish is contaminated with a lot of parasites, making this fish\'s flesh inedible.', '0.40', '0.50', '1.50', '15.00', '35.00', '2026-07-08 10:44:28'),
(120, 60, 'Slit-Mouthed Fish', 'This aggressive fish can open its mouth so wide that it will break their cheek just to swallow their prey whole. This gesture will make the wound infected and make this fish sick and eventually die.', '0.60', '0.70', '1.70', '13.00', '33.00', '2026-07-08 10:44:28'),
(121, 61, 'Sting Sunfish', 'A tiny, rigid hair grows on its breast; this tiny hair can make whoever touches it breast area have an immediate burning sensation on their hand, followed by itching sensation.', '0.40', '0.30', '0.70', '11.00', '29.00', '2026-07-08 10:44:28'),
(122, 61, 'Frostbreast Sunfish', 'Its breast area is circulating with an intense mana that makes the temperature unnaturally cold to the touch; some fishermen even get a mild frostbite when they dare each other to hold the fish for a long time.', '0.60', '0.30', '0.90', '12.00', '32.00', '2026-07-08 10:44:28'),
(123, 62, 'Hooded Sunfish', 'Its ear evolves and connects to the other end of the ear, making it resemble a hood on top of its head. Nobody knows the uses of the hood; some speculate that it prevents mana leakage, and others claim that it was something to attract the female.', '0.40', '0.30', '0.90', '8.00', '22.00', '2026-07-08 10:44:28'),
(124, 62, 'Paddle-ear Sunfish', 'Mana evolving this fish\'s ear into a paddle-like shape, the ear is used to help the fish move faster.', '0.60', '0.30', '1.20', '11.00', '26.00', '2026-07-08 10:44:28'),
(125, 63, 'Rainbow Sunfish', 'The sunfish scales got their colors from the mana inside of them, making them have almost all the colors in the rainbow. Some merchants will make an accessory using their scales and sell it for a valuable price.', '0.30', '0.10', '0.80', '9.00', '17.00', '2026-07-08 10:44:28'),
(126, 63, 'Gleaming Sunfish', 'Its body reflects light and makes predators confused by its position. This ability to reflect light makes the scale of this fish very valuable, usually made into a mirror for the nobles.', '0.70', '0.20', '0.70', '7.00', '14.00', '2026-07-08 10:44:28'),
(127, 64, 'Crab-eyes Sunfish', 'This fish\'s eyes become protruding like a crab\'s eyes; it comes out of its socket and can rotate 360°. Some scholars think that it uses its eyes to check the surrounding area for food.', '0.40', '0.30', '0.90', '10.00', '19.00', '2026-07-08 10:44:28'),
(128, 64, 'Shield Sunfish', 'The shape of this fish closely resembles a heater shield, even though its body or even scale is not as hard as a shield.', '0.60', '0.20', '0.70', '9.00', '16.00', '2026-07-08 10:44:28'),
(129, 65, 'Fish-sack Trout', 'When this trout was in an alevin stage, it did not absorb the yolk and continued to grow with it, making it an emergency food source. Because of this, a lot of predators are attracted to the yolk and hunt them.', '0.30', '7.00', '20.00', '10.00', '85.00', '2026-07-08 10:44:28'),
(130, 65, 'Crystal Trout', 'The scale of this fish gleams under the sunlight, but because of this, the scale is really brittle and really easy to break; just a scrape of a knife will make the scale break and be removed.', '0.70', '5.00', '18.00', '24.00', '80.00', '2026-07-08 10:44:28'),
(131, 66, 'Ice Digger Trout', 'The tip of its mouth is hard like a bone. Scholars suggest that this tip is used by the fish to dig into the ice, and when inside the ice, it will make the surrounding ice melt using heat from mana.', '0.10', '1.50', '3.50', '14.00', '46.00', '2026-07-08 10:44:28'),
(132, 66, 'Spike Trout', 'A spike grows all over its body where the black spots are supposed to be; the spike protected the trout from all predators trying to eat it.', '0.90', '2.00', '4.00', '20.00', '60.00', '2026-07-08 10:44:28'),
(133, 67, 'Dried Trout', 'This trout lost almost all the water inside its body instantly when brought up from the water. Scholars thought that this phenomenon happens because its mana becomes dependent on water.', '0.40', '9.00', '38.00', '19.00', '102.00', '2026-07-08 10:44:28'),
(134, 67, 'Orchid Trout', 'The gill of this fish can be spread open and scare off predators that come too close, and this gill has been speculated to be a mating ritual.', '0.60', '12.00', '42.00', '21.00', '125.00', '2026-07-08 10:44:28'),
(135, 68, 'Paralysis Trout', 'Fishermen and scholars alike warn people from even touching this fish; its skin can paralyze people if held for too long, and the effect of the paralysis can last for one day or sometimes days.', '0.30', '1.30', '3.20', '12.00', '32.00', '2026-07-08 10:44:28'),
(136, 68, 'Bladefin Trout', 'The fins have evolved into a blade that they use to slice open their prey or predator. Its will swim in a circle of their prey and slice them repeatedly.', '0.70', '1.40', '2.80', '9.00', '28.00', '2026-07-08 10:44:28'),
(137, 69, 'Mead Trout', 'Its flesh has a nice, sweet taste when just grilling it on an open fire; some people even reported that they have a slight hangover the next day they eat this fish.', '0.20', '0.70', '1.40', '14.00', '41.00', '2026-07-08 10:44:28'),
(138, 69, 'Glass-skin Trout', 'The skin of this trout is so thin that you can see through the flesh of the fish; some people call this fish a skinless fish because of how thin the skin is.', '0.80', '0.60', '1.60', '16.00', '46.00', '2026-07-08 10:44:28'),
(139, 70, 'Pure Gold Trout', 'Noble from Rosegleam absolutely adores this fish for its golden coloration on its body. This fish is always an offering to the High Sovereign\'s birthday.', '0.30', '1.20', '5.40', '15.60', '33.40', '2026-07-08 10:44:28'),
(140, 70, 'Golden-vein Trout', 'Its pronounced white body makes the golden vein around its body can be seen with the naked eye, some people believe that its blood also contains gold.', '0.70', '2.00', '6.00', '13.00', '32.00', '2026-07-08 10:44:28'),
(141, 71, 'Void-eyes Trout', 'This trout eye lost all the luster that a living animal has; some fishermen think that this fish is blind the first time they saw it, but after the scholar checks it, the fish can swim normally without any problem.', '0.50', '2.30', '7.00', '21.00', '60.00', '2026-07-08 10:44:28'),
(142, 71, 'Hammer-tail Trout', 'The top of its tail has a rigid bone that it uses to fight other trout and predators. But, because of the extra weight of the tail, this fish has difficulty swimming normally.', '0.50', '3.00', '8.00', '22.00', '65.00', '2026-07-08 10:44:28'),
(143, 72, 'Fat Lump Trout', 'Scholars around Seran suggest that this is the older form of Purification Trout because of the similarity between them. They speculate that this fish is the result of excessive filtering of the water, causing the fish to grow fat lumps around its body.', '0.80', '1.20', '3.20', '21.00', '47.00', '2026-07-08 10:44:28'),
(144, 72, 'Purification Trout', 'Whenever this fish lives in the body of water, the water will always appear clean and clear. Scholars speculate that maybe the fish filter all the water around it and purify it.', '0.20', '1.40', '2.70', '18.00', '49.00', '2026-07-08 10:44:28'),
(145, 73, 'Vein-gill Trout', 'This fish\'s gills extend outward from its body, giving it a plant-like appearance, as if its gills are growing out of its body. Scholars have no idea why it was evolving like this.', '0.30', '1.20', '2.90', '12.00', '50.00', '2026-07-08 10:44:28'),
(146, 73, 'Bonehead Trout', 'A thick bone will form on top of its head; the older it gets, the more it will cover its entire head when the fish is old enough.', '0.70', '1.70', '3.40', '17.00', '53.00', '2026-07-08 10:44:28'),
(147, 74, 'Tar Trout', 'When this fish flesh and bone are cooked for a long time, it will produce a thick, viscous liquid that has a similar consistency to wood tar. Sailors on Tidehaven even used this liquid to coat their sails and ropes.', '0.20', '9.30', '32.10', '28.00', '112.00', '2026-07-08 10:44:28'),
(148, 74, 'Blackblood Trout', 'The entire flesh and blood of this fish is lacking any color whatsoever make it appear to be black. Scholars think the mana eats all the color out of this fish, making it almost colorless and appearing black.', '0.80', '6.00', '29.00', '27.00', '105.00', '2026-07-08 10:44:28'),
(149, 75, 'Fanged Clownfish', 'Its fang is protruding from its mouth, making it look menacing for a small fish. The behavior of this fish also become hyper aggressive when protecting its eggs; it will patrol around its eggs and attack anything that comes close to its eggs.', '0.40', '0.40', '0.90', '1.10', '13.00', '2026-07-08 10:44:28'),
(150, 75, 'Paralyzing Clownfish', 'Its scales contain a certain venom that you can find on sea anemone, the venom will make individual that touch it have severe pain, blistering, and then be paralyzed for a couple of hours or days.', '0.60', '0.50', '1.00', '1.20', '14.00', '2026-07-08 10:44:28'),
(151, 76, 'Crushing Jaw Barracuda', 'The jaw of this barracuda is so strong that it can bite through a bone almost effortlessly. This fish is seen by fishermen chasing and biting on a turtle shell out in the open, trying to eat it.', '0.40', '15.00', '43.00', '45.00', '230.00', '2026-07-08 10:44:28'),
(152, 76, 'Serpentine Barracuda', 'The body of this barracuda becomes so long that it will swim almost like a snake. Some fishermen even mistake this fish for a big snake when they first encounter it.', '0.60', '12.00', '50.00', '120.00', '350.00', '2026-07-08 10:44:28'),
(153, 77, 'Horn Bass', 'A single horn grows on top of its head, a weapon to defend itself, and a tool to attract the male of the species. The female is the only fish that have horn on top of the head, the male only have tiny bump on top of its head.', '0.30', '13.00', '53.00', '38.00', '103.00', '2026-07-08 10:44:28'),
(154, 77, 'Bone Ridge Bass', 'A bone grows out on their scale where the stripe is supposed to be; it will make the fish have a natural armor around its body, making predators have a hard time to eat it.', '0.70', '15.00', '50.00', '30.00', '115.00', '2026-07-08 10:44:28'),
(155, 78, 'Lightning Swordfish', 'Fishermen tell a tale of a fish that swims so fast they think they saw a thunder moving underwater. The fishermen also said that sometimes they heard a loud noise coming from underwater, making some of them believe that the god of thunder himself was making that noise.', '0.20', '125.00', '675.00', '115.00', '460.00', '2026-07-08 10:44:28'),
(156, 78, 'Spathafish', 'The long upper jaw of this fish has mutated and resembles the long sword of Ourean soldiers. Its upper jaw has sometimes been used by Smith to forge a sword for mercenaries and sellswords alike.', '0.80', '75.00', '550.00', '120.00', '425.00', '2026-07-08 10:44:28'),
(157, 79, 'Chameleon Sailfish', 'Sailors around Tidehaven called this fish a chameleon because of its ability to change colors. Some of the fish that they brought upshore will always change color rapidly. Scholars think that this ability makes the fish able to ambush their prey.', '0.30', '80.00', '375.00', '45.00', '125.00', '2026-07-08 10:44:28'),
(158, 79, 'Sun Sailfish', 'When this fish hunts its prey, sometime they will blind them with the light that it produces on their upper fin. Scholars assumed that this phenomenon occurred when they channel their mana to their upper fin.', '0.70', '65.00', '325.00', '50.00', '85.00', '2026-07-08 10:44:28'),
(159, 80, 'Saw-Jaw Marlin', 'Its long upper jaw has a growth inward, making it resemble a saw and also making it really hard to pull out whenever this fish stabs its prey or predators. This fish also swims really fast make it able to drag a small boat for a long distance.', '0.30', '90.00', '650.00', '125.00', '325.00', '2026-07-08 10:44:28'),
(160, 80, 'Killer Marlin', 'This marlin is one of the most dangerous fish in the ocean. Whenever this fish is in the vicinity of a fishing boat, it will almost always attack the boat, and even tries to attack the fishermen.', '0.70', '120.00', '750.00', '175.00', '500.00', '2026-07-08 10:44:28'),
(161, 81, 'Masked Seabream', 'The usual vertical pattern on this species becomes horizontal on this mutated seabream, making this fish look like it was wearing a mask around its face. This fish will patrol its home day and night, it will attack anything that comes close to its home.', '0.50', '1.00', '3.10', '21.00', '51.00', '2026-07-08 10:44:28'),
(162, 81, 'Bald Seabream', 'This fish got its name because of the pattern on its head, making it look almost bald. Even though this fish is aggressive and always attacks whatever is near it, sailors still love this fish and sometimes release it again into the ocean because of its funny pattern.', '0.50', '1.50', '3.50', '20.00', '50.00', '2026-07-08 10:44:28'),
(163, 82, 'Shellcracker Bream', 'Its jaw has small but powerful teeth that can break the shell small shellfish; sometimes, the hook of the fishing rod will be bent because of this fish\'s teeth.', '0.50', '1.30', '3.20', '18.00', '56.00', '2026-07-08 10:44:28'),
(164, 82, 'Two Horn Bream', 'Two small horns grow on each side of the head. These tiny horns, speculated by Scholars to be a tool to attract the female bream because of how small this horn is, have almost no attacking capabilities.', '0.50', '1.20', '2.80', '12.00', '52.00', '2026-07-08 10:44:28'),
(165, 83, 'Rotten Seabream', 'The flesh of this fish is decaying rapidly, making a hole around its body. Even when there is a hole around its body, this fish still swims and eats normally like nothing\'s wrong.', '0.40', '0.50', '7.00', '12.00', '93.00', '2026-07-08 10:44:28'),
(166, 83, 'Tusk Seabream', 'A long tusk grows from the bottom of its mouth, making it a great defensive weapon for when predators attack it or when it defending it\'s eggs in breeding season.', '0.60', '1.00', '9.70', '17.00', '105.00', '2026-07-08 10:44:28'),
(167, 84, 'Crested Seabream', 'A bone protruding between its eyes and into the top of its head, this feature is used to attract the opposite gender of the fish; female fish have a bigger crest than their counterpart.', '0.30', '0.65', '17.50', '15.50', '67.00', '2026-07-08 10:44:28'),
(168, 84, 'Heatfang Seabream', 'Their main prey is a shellfish, and they use their fang to bite into the shell and then heat their fangs to make a hole in the shell. Because of the sudden raise of the temperature, the mollusk will open its shell and be eaten by the fish.', '0.70', '0.75', '20.00', '12.00', '75.00', '2026-07-08 10:44:28'),
(169, 85, 'Seeping Sea Catfish', 'Mana inside its body is constantly leaking blood into the surrounding water to attract small fish, but due to the constant blood loss, this fish needs to keep eating to replenish all the blood and make it more voracious than ever.', '0.40', '4.00', '11.00', '27.00', '87.00', '2026-07-08 10:44:28'),
(170, 85, 'Crownhead Sea Catfish', 'A three-bone growth along its head, making it resemble a crown, this fish also enables it to swim a lot faster, scholars suspect.', '0.60', '5.00', '12.00', '25.00', '95.00', '2026-07-08 10:44:28'),
(171, 86, 'Potbelly Sea Catfish', 'This fish will eat a lot of fish for a whole day until its stomach nearly bursts before finally stopping all activity and sleeping for a long time. This fish becomes vulnerable to all predators when they enter the sleep state.', '0.30', '7.30', '20.00', '13.70', '56.30', '2026-07-08 10:44:28'),
(172, 86, 'Barbed Sea Catfish', 'Its whiskers have a lot of tiny spines that are venomous; this venom can paralyze its prey when got attached to its body.', '0.70', '7.00', '15.00', '15.00', '65.00', '2026-07-08 10:44:28'),
(173, 87, 'Stonehead Dolphinfish', 'A thick layer of scale grows in front of its head, covering it entirely, making it as hard as a rock. This thick headed fish compete with each other for a potential mate with their heads.', '0.80', '10.00', '41.00', '21.00', '175.00', '2026-07-08 10:44:28'),
(174, 87, 'Searing Dolphinfish', 'When this fish feels threatened, it will secrete a clear liquid covering its entire body. Fishermen reported that this liquid makes their hands feel like being directly burned on a bonfire, even when only being touched for a short time; some even lose their hands when touching the fish for longer than a few seconds.', '0.20', '12.00', '43.00', '25.00', '185.00', '2026-07-08 10:44:28'),
(175, 88, 'Crystal Scale Flounder', 'Its scale is really brittle and easily shattered. Scholars think that this type of scale will shatter whenever predators try to eat it, hurting the predator\'s mouth and causing it to swim away in pain.', '0.30', '0.80', '13.00', '22.00', '54.00', '2026-07-08 10:44:28'),
(176, 88, 'Glowing Flounder', 'The fin on the top and bottom of this fish glows whenever it goes hunting. The glow attracts small fish, which approach the flounder. When the fish is near enough, the flounder strikes with a swift gulp.', '0.70', '0.90', '12.00', '21.00', '55.00', '2026-07-08 10:44:28'),
(177, 89, 'Big Eyes Grouper', 'Its eyes are almost bigger than its head enable it to see better in the dark. But scholars realize that there is a chance that the older this fish is, the more likely its eyes will sometimes come out of its skull, making this fish blind.', '0.40', '0.90', '15.00', '15.00', '60.00', '2026-07-08 10:44:28'),
(178, 89, 'Gulper Grouper', 'This fish will hunt a smaller schooling fish and just swallow them whole. This fish is also so aggressive and sometimes will be seen fighting each other near their prey.', '0.60', '1.40', '18.00', '18.00', '62.00', '2026-07-08 10:44:28'),
(179, 90, 'Cracking Grouper', 'Its entire body is covered with a thin line that is slowly getting longer and deeper inside its body. This crack will keep getting deeper and deeper until it opens up the body of the fish.', '0.40', '0.70', '2.10', '11.70', '67.30', '2026-07-08 10:44:28'),
(180, 90, 'Bone-ring Grouper', 'A bone-like ring is growing around its body, covering it sporadically. This bone ring protects the grouper from large predators that want to eat the grouper, but smaller predator fish can still take a nibble out of its flesh.', '0.60', '0.80', '2.30', '13.20', '65.00', '2026-07-08 10:44:28'),
(181, 91, 'Insect Jaw Grouper', 'A pair of pincers that grow beside its mouth, these pincers can hold a small prey before the grouper eats its flesh bit by bit.', '0.50', '0.40', '2.10', '9.20', '46.00', '2026-07-08 10:44:28'),
(182, 91, 'Ribcage Grouper', 'The top body of this fish has no flesh at all, and this exposes the rib. Scholars suggest that the mana is keeping this fish alive, but they don\'t know how or why.', '0.50', '0.70', '2.30', '10.00', '47.00', '2026-07-08 10:44:28'),
(183, 92, 'Wolf-fang Mackerel', 'A sharp fang protrudes from its mouth, making it look really menacing. Its fang can easily penetrate into the flesh of its prey, and even some hard shelled mollusk can be cracked.', '0.40', '17.00', '52.00', '32.00', '192.00', '2026-07-08 10:44:28'),
(184, 92, 'Silver Scale Mackerel', 'Merchants will make accessories out of this fish\'s loose scales and sell them for a pretty high price. These accessories are very popular for middle and lower class noble because of their appearance and price that not too high.', '0.60', '15.00', '45.00', '35.00', '155.00', '2026-07-08 10:44:28'),
(185, 93, 'Bladespine Fish', 'The spine of this fish evolved into a blade that will not only slash you, but also will inject the natural venom that this fish possesses. The blade will open the flesh, and the tiny needles will inject venom into the attacker.', '0.30', '0.60', '1.20', '11.00', '34.00', '2026-07-08 10:44:28'),
(186, 93, 'Lion-mane Fish', 'A hair-like tentacle grows around the head of this fish; this hair has the same venom as the spine, making it more dangerous than a normal lionfish. When something touches this hair, it will not hurt as much until the venom works.', '0.70', '0.40', '1.50', '12.00', '38.00', '2026-07-08 10:44:28'),
(187, 94, 'Spiked Dogfish', 'The upper part of this fish is covered with spikes that grow from the top of its head until just before the tail. This sharp spike is speculated to be an indication of how old the shark is.', '0.70', '6.00', '12.00', '83.00', '123.00', '2026-07-08 10:44:28'),
(188, 94, 'Two-headed Shark', 'This fish has another head that works perfectly in tandem with its main head. Scholars argue about how this thing happens; some say that it happens because mana mutates and merges two eggs into one, while the other suggested that the strongest shark eats the eggs inside the parent, and the eggs still grow inside the stomach.', '0.30', '5.00', '15.00', '75.00', '145.00', '2026-07-08 10:44:28');
INSERT INTO `t_mutation` (`mutation_id`, `fish_id`, `mutation_name`, `mutation_description`, `mutation_chance`, `mutation_min_weight`, `mutation_max_weight`, `mutation_min_length`, `mutation_max_length`, `created_date`) VALUES
(189, 95, 'Bloodeye Snapper', 'Its eyes will leak a lot of blood whenever this fish is brought up to the boat. A lot of fishermen think that this fish is crying because it is being caught by the fishermen.', '0.40', '5.00', '24.00', '27.00', '86.00', '2026-07-08 10:44:28'),
(190, 95, 'Viper Snapper', 'A lot of fishermen died catching this seemingly docile fish, but because of their carelessness, this fish will bite their hand and inject venom that will kill you in days.', '0.60', '6.00', '27.00', '25.00', '77.00', '2026-07-08 10:44:28'),
(191, 96, 'Scarred Crossbowfish', 'A scar can be seen covering this fish all over its body. This happens because of the aggressive nature of the fish, which is being taken to overdrive by mana, and it will keep attacking anything that moves without discrimination, sometimes even predators that are bigger in size than it.', '0.40', '0.60', '2.60', '26.00', '66.00', '2026-07-08 10:44:28'),
(192, 96, 'Blinding Crossbowfish', 'Whenever this fish feels threatened by predators, it will erect its front upper fin and then use mana to create a blinding flash of light, and then swim away before the predators can recover.', '0.60', '0.70', '2.70', '17.00', '57.00', '2026-07-08 10:44:28'),
(193, 97, 'Frigid Tuna', 'Its flesh is ice cold whenever a fishermen cut it and stays cold even when they bring it to shore. This fish is really popular because it tastes fresh for a long time and has a nice texture to it because of the temperature.', '0.90', '112.00', '621.00', '102.00', '375.00', '2026-07-08 10:44:28'),
(194, 97, 'Stomach-less Tuna', 'Fishermen sometimes saw this fish floating on the ocean, lifeless. When they cut up the fish, they realize that this fish\'s stomach is gone, and they only have the flesh and no innards at all. Scholars think that long exposure to mana makes the stomach go away.', '0.10', '125.00', '725.00', '125.00', '325.00', '2026-07-08 10:44:28'),
(195, 98, 'Paralyzing Tuna', 'The long upper fin of this fish has venom that will paralyze you if you are sliced by it; the effect of the venom only lasts around an hour and will not kill anyone. ', '0.30', '95.00', '320.00', '112.00', '215.00', '2026-07-08 10:44:28'),
(196, 98, 'Bladefin Tuna', 'The long fin at the top and bottom of its body is sharp and can easily cut your hand. This fish will use this evolved fin to cut their prey when circling them.', '0.70', '125.00', '425.00', '105.00', '245.00', '2026-07-08 10:44:28'),
(197, 99, 'Winged Tuna', 'Its fin on each side of the fish is so long and so wide that it resembles a bird\'s wings. Scholars don\'t exactly know why the fin evolved to these sizes and just assume it will help the fish to swim better.', '0.40', '17.00', '38.00', '89.00', '140.00', '2026-07-08 10:44:28'),
(198, 99, 'Obsidian Scale Tuna', 'The dark part of the body is covered in hard scales that resemble obsidian in color; these hard scales are sometimes used by smiths to make a cheap shield for mercenaries and sellswords alike.', '0.60', '22.00', '43.00', '94.00', '155.00', '2026-07-08 10:44:28'),
(199, 100, 'Fat Blob Tuna', 'Its entire body is covered with a green lump that will burst if you even poke it with your finger. The green liquid inside the lump has a horrible stench and can be used as bait to attract small fish.', '0.30', '26.40', '185.30', '75.70', '264.20', '2026-07-08 10:44:28'),
(200, 100, 'Eyeless Tuna', 'Fishermen think that this fish\'s eyes are gone because of predation, but scholars suggest that this fish doesn\'t even have eyes to begin with because there is no scar anywhere near its head.', '0.70', '27.20', '172.40', '78.00', '274.00', '2026-07-08 10:44:28');

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

--
-- Dumping data for table `t_rod`
--

INSERT INTO `t_rod` (`rod_id`, `rod_name`, `rod_rarity`, `rod_description`, `created_date`) VALUES
(1, 'Bamboo Pole', 1, 'The most basic fishing pole, perfect for a beginner who is learning the art of fishing. Lightweight and surprisingly durable.', '2026-07-08 09:15:46'),
(2, 'Reed Pole', 1, 'Pole that was crafted by bundling a bunch of reeds together. Lightweight rod that is easy to carry, but lacks power.', '2026-07-08 09:15:46'),
(3, 'Willow Pole', 1, 'Made from a flexible willow wood, it bends easily under pressure, helping it from snapping.', '2026-07-08 09:15:46'),
(4, 'Hazel Pole', 1, 'A sturdy pole, valued for its balance of strength and flexibility, making it a good choice for everyday uses.', '2026-07-08 09:15:46'),
(5, 'Ash Pole', 1, 'Made from a resilient ash wood, this pole offers excellent durability and reliable performance in a variety of water.', '2026-07-08 09:15:46'),
(6, 'Hickory Pole', 1, 'Built from a dense hickory wood, this pole is favored by fishermen that trying to catch big predator fish.', '2026-07-08 09:15:46'),
(7, 'Birch Rod', 2, 'A lightweight rod with a smooth pole, offering improved handling during long periods of fishing trips.', '2026-07-08 09:15:46'),
(8, 'Maple Rod', 2, 'Carved from a hard maple wood, this well-balanced rod provides dependable control necessary to catch a big fish.', '2026-07-08 09:15:46'),
(9, 'Elm Rod', 2, 'Known for its durability and resistance to splitting, the elm rod can withstand repeated use even in more demanding conditions.', '2026-07-08 09:15:46'),
(10, 'Cedar Rod', 2, 'Crafted from an aromatic cedar wood, this lightweight rod naturally resist moisture and decay making it ideal for fishing at a damp environment', '2026-07-08 09:15:46'),
(11, 'Walnut Rod', 2, 'A finely crafted rod using walnut wood, this rod has an elegant appearance and dependable strength for catching larger fish.', '2026-07-08 09:15:46'),
(12, 'Juniper Rod', 3, 'Made from resilient juniper wood, making it a great rod naturally resistant to the elements.', '2026-07-08 09:15:46'),
(13, 'Ebony Rod', 3, 'Forged from a rare ebony wood, its dense wood structure provide remarkable strength while also showing a fancy dark finish.', '2026-07-08 09:15:46'),
(14, 'Rosewood Rod', 3, 'A beautifully crafted grained rod made from a premium rosewood found only on Rosegleam, with an exceptional craftmanship and reliable performance, its no wonder noble family prefer this type of rod.', '2026-07-08 09:15:46'),
(15, 'Ironwood Rod', 3, 'Constructed from a rare ironwood, native to the city of Ourea, this incredibly durable rod is built to withstand even the fiercest battle with a giant fish.', '2026-07-08 09:15:46'),
(16, 'Yew Wood Rod ', 4, 'Crafted from the legendary Yew tree, this rod is said to be able to catch even the Jormungard itself. With a beautiful finish and durable performance, this rod is a dream rod for Tidehaven fishermen.', '2026-07-08 09:15:46'),
(17, 'Dragonwood Rod', 4, 'This rod was crafted using the mutated tree known as Dragonwood, the characteristic of the wood transfer over to the rod. Warm to the touch and easy to handle, this rod able to catch the biggest fish there is.', '2026-07-08 09:15:46'),
(18, 'Crimson Wood Rod', 4, 'Native to the woods of Seran forest, this crimson rod can withstand the harshest battle among the biggest fish in Endral. ', '2026-07-08 09:15:46');

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
  `user_type` int(11) NOT NULL DEFAULT 1,
  `user_rod` tinyint(4) NOT NULL DEFAULT 1,
  `user_bait` tinyint(4) NOT NULL DEFAULT 1,
  `last_fish_at` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`user_id`, `twitch_user_id`, `username`, `display_name`, `user_type`, `user_rod`, `user_bait`, `last_fish_at`, `created_date`, `updated_date`) VALUES
(1, 1234567890, 'shurui21', 'Shurui21', 0, 1, 1, NULL, '2026-07-08 11:41:24', NULL);

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
  MODIFY `bait_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `t_catch_log`
--
ALTER TABLE `t_catch_log`
  MODIFY `catch_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_city`
--
ALTER TABLE `t_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_fish`
--
ALTER TABLE `t_fish`
  MODIFY `fish_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `t_fish_bait`
--
ALTER TABLE `t_fish_bait`
  MODIFY `fish_bait_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=900;

--
-- AUTO_INCREMENT for table `t_fish_location`
--
ALTER TABLE `t_fish_location`
  MODIFY `fish_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `t_fish_rarity`
--
ALTER TABLE `t_fish_rarity`
  MODIFY `fish_rarity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_fish_rod`
--
ALTER TABLE `t_fish_rod`
  MODIFY `fish_rod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `t_fish_season`
--
ALTER TABLE `t_fish_season`
  MODIFY `fish_season_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `t_fish_type`
--
ALTER TABLE `t_fish_type`
  MODIFY `fish_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `t_fish_weather`
--
ALTER TABLE `t_fish_weather`
  MODIFY `fish_weather_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `t_game_state`
--
ALTER TABLE `t_game_state`
  MODIFY `game_state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_inventory`
--
ALTER TABLE `t_inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_location`
--
ALTER TABLE `t_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `t_mutation`
--
ALTER TABLE `t_mutation`
  MODIFY `mutation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `t_rod`
--
ALTER TABLE `t_rod`
  MODIFY `rod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `weather_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
