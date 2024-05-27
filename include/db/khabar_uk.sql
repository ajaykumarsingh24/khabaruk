-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2024 at 08:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khabar_uk`
--

DELIMITER $$
--
-- Procedures
--
CREATE PROCEDURE `getAllNews` ()   SELECT * FROM tbl_news WHERE is_active = '1'$$

CREATE PROCEDURE `getLatestNews` (IN `categoryType` INT(11))   SELECT * FROM tbl_news WHERE category = categoryType AND is_active = '1'$$

CREATE PROCEDURE `getMenus` ()   SELECT * FROM tbl_menu WHERE is_active = '1'$$

CREATE PROCEDURE `getMenuTitle` (IN `tabId` INT(11))   SELECT id, title FROM tbl_menu WHERE id = tabId AND is_active = '1'$$

CREATE PROCEDURE `getPostDetails` (IN `postId` INT(11))   SELECT * FROM tbl_news WHERE id = postId AND is_active = '1'$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_catagory`
--

CREATE TABLE `tbl_catagory` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_catagory`
--

INSERT INTO `tbl_catagory` (`id`, `type`) VALUES
(1, 'latest'),
(2, 'highlight');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `is_submenu` enum('0','1') NOT NULL,
  `is_active` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `title`, `url`, `is_submenu`, `is_active`) VALUES
(1, 'राष्ट्रीय', '', '0', '1'),
(2, 'क्राइम', '', '0', '1'),
(3, 'वायरल-न्यूज', '', '0', '1'),
(4, 'उत्तराखण्ड', '', '0', '1'),
(5, 'ऋषिकेश', '', '0', '1'),
(6, 'एक्सीडेंट', '', '0', '1'),
(7, 'देहरादून', '', '0', '1'),
(8, 'धर्म', '', '0', '1'),
(9, 'ब्रेकिंग-न्यूज़', '', '0', '1'),
(10, 'राजनीति', '', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `small_image_url` varchar(50) NOT NULL,
  `large_image_url` varchar(50) NOT NULL,
  `category` enum('1','2','3','4') NOT NULL,
  `is_active` enum('0','1') NOT NULL,
  `is_delete` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`id`, `title`, `description`, `small_image_url`, `large_image_url`, `category`, `is_active`, `is_delete`) VALUES
(1, 'नीलकंठ मार्ग पर में मिला महिला का शव, हत्या की आशंका', 'ऋषिकेश लक्ष्मणझूला क्षेत्र अंतर्गत नीलकंठ मार्ग पर एक युवती की लाश मिली है, प्रथम दृष्टया युवती की गला घोटकर हत्या किए जाने के बाद उसकी लाश को सड़क किनारे फेंक दिया गया लगता है। पुलिस द्वारा अज्ञात युवती की लाश का पचनामा भर पोस्टमार्टम के लिए एम्स अस्पताल भिजवा दिया गया है। तथा उक्त संबंध में अज्ञात के खिलाफ हत्या का मुकदमा दर्ज कर जांच प्रारंभ कर दी गई है।\n\nथाना लक्ष्मण झूला प्रभारी रवि सैनी ने बताया कि सोमवार को नीलकंठ पैदल मार्ग पर धांधला पानी से पुलिया खेत के लिए जाने वाले रास्ते पर एक युवती का शव मिलने की सूचना मिली थी, युवती की उम्र करीब 24 वर्ष की है, तथा युवती के गले में फंदा बंधा हुआ था, जिससे प्रथम दृष्टया यह लग रहा था कि युवती की गला घोटकर हत्या की गई है, पुलिस द्वारा युवती के शव को अपने कब्जे में लेकर पंचनामे की कार्रवाई कर पोस्टमॉर्टम के लिए एम्स अस्पताल भिजवा दिया गया है। तथा पुलिस की एक टीम ने जांच प्रारंभ कर दी गई है।', 'post_img1.jpg', 'slider_img1.jpg', '2', '1', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_catagory`
--
ALTER TABLE `tbl_catagory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_catagory`
--
ALTER TABLE `tbl_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
