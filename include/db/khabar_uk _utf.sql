-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2024 at 07:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `addNews` (IN `newsTitle` VARCHAR(200), IN `newsDate` VARCHAR(50), IN `fileName` VARCHAR(50), IN `newsDescription` TEXT, IN `newsCategory` INT(11))   INSERT INTO tbl_news SET
title = newsTitle,
date = newsDate,
description = newsDescription,
category = newsCategory,
small_image_url = fileName,
large_image_url = fileName,
is_active = '1'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkUserLogin` (IN `userName` INT(50))   SELECT * FROM users WHERE user_name = userName$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCategory` ()   SELECT * FROM `tbl_catagory` WHERE 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllNews` ()   SELECT * FROM tbl_news WHERE is_active = '1'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getLatestNews` (IN `categoryType` INT(11))   SELECT * FROM tbl_news WHERE category = categoryType AND is_active = '1'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getMenus` ()   SELECT * FROM tbl_menu WHERE url != 'log-out' AND is_active = '1'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getMenuTitle` (IN `tabId` INT(11))   SELECT id, title FROM tbl_menu WHERE id = tabId AND is_active = '1'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPostDetails` (IN `postId` INT(11))   SELECT * FROM tbl_news WHERE id = postId AND is_active = '1'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getRelatedPost` (IN `postId` INT(11))   SELECT * FROM tbl_news WHERE id != postId AND is_active = '1' LIMIT 3$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_catagory`
--

CREATE TABLE `tbl_catagory` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_catagory`
--

INSERT INTO `tbl_catagory` (`id`, `type`) VALUES
(1, 'latest'),
(2, 'highlight'),
(3, 'ऋषिकेश'),
(4, 'धर्म'),
(5, 'उत्तराखण्ड'),
(6, 'वायरल-न्यूज'),
(7, 'देहरादून'),
(8, 'राजनीति'),
(9, 'ब्रेकिंग-न्यूज़'),
(10, 'राजनीति');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_submenu` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(10, 'राजनीति', '', '0', '1'),
(11, 'लोग आउट', 'log-out', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `date` date DEFAULT NULL,
  `small_image_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `large_image_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` enum('1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`id`, `title`, `description`, `date`, `small_image_url`, `large_image_url`, `category`, `is_active`, `is_delete`) VALUES
(1, 'नीलकंठ मार्ग पर में मिला महिला का शव, हत्या की आशंका', 'ऋषिकेश लक्ष्मणझूला क्षेत्र अंतर्गत नीलकंठ मार्ग पर एक युवती की लाश मिली है, प्रथम दृष्टया युवती की गला घोटकर हत्या किए जाने के बाद उसकी लाश को सड़क किनारे फेंक दिया गया लगता है। पुलिस द्वारा अज्ञात युवती की लाश का पचनामा भर पोस्टमार्टम के लिए एम्स अस्पताल भिजवा दिया गया है। तथा उक्त संबंध में अज्ञात के खिलाफ हत्या का मुकदमा दर्ज कर जांच प्रारंभ कर दी गई है।\n\nथाना लक्ष्मण झूला प्रभारी रवि सैनी ने बताया कि सोमवार को नीलकंठ पैदल मार्ग पर धांधला पानी से पुलिया खेत के लिए जाने वाले रास्ते पर एक युवती का शव मिलने की सूचना मिली थी, युवती की उम्र करीब 24 वर्ष की है, तथा युवती के गले में फंदा बंधा हुआ था, जिससे प्रथम दृष्टया यह लग रहा था कि युवती की गला घोटकर हत्या की गई है, पुलिस द्वारा युवती के शव को अपने कब्जे में लेकर पंचनामे की कार्रवाई कर पोस्टमॉर्टम के लिए एम्स अस्पताल भिजवा दिया गया है। तथा पुलिस की एक टीम ने जांच प्रारंभ कर दी गई है।', '2024-05-01', 'post_img1.jpg', 'slider_img1.jpg', '2', '1', '0'),
(2, ' टेक्नॉलजी की मदद से चारधाम यात्रा का सुव्यवस्थित प्रबन्धन तथा स्थायी समाधान-मुख्य सचिव श्रीमती राधा रतूड़ी ', 'देहरादून  28 मई, 2024\r\n           टेक्नॉलजी की मदद से चारधाम यात्रा का सुव्यवस्थित प्रबन्धन तथा स्थायी समाधान \r\nमुख्य सचिव श्रीमती राधा रतूड़ी ने आईटी कन्सलटेन्सी कम्पनी तथा चारधाम यात्रा से जुड़े सभी स्टेकहोल्डर्स की मदद से फूलप्रूफ ऑनलाइन रजिस्ट्रेशन व्यवस्था विकसित करने के निर्देश दिए।\r\n    चारधाम यात्रा में फील्ड पर काम कर रहे अधिकारियों को यात्रा प्रबन्धन में सबसे महत्वपूर्ण कड़ी मानते हुए सीएस ने फील्ड पर कार्य करने वाले कनिष्ठ अधिकारियों से यात्रा प्रबन्धन हेतु बनने वाली एसओपी के लिए सुझाव मांगे\r\nफील्ड अधिकारियों के कुशल प्रबन्धन से राज्य में चारधाम यात्रा का पुनः सुचारू, सुव्यवस्थित एवं सफलतापूर्वक संचालन जारी।\r\n    ‌‌     ठहराव स्थलों  में मौजूद श्रद्धालुओं को चार धाम भेजने की शुरुआत, धामों से वापस लौट रहे हैं श्रद्धालु  ।\r\n    नए ठहराव स्थलों व पार्किंग स्थलों के लिए जल्द धनराशि जारी की जाएगी।\r\n            हरिद्वार  से ऑनलाइन रजिस्ट्रेशन पुनः आरम्भ।\r\n            ट्रिप कार्ड व्यवस्था के  कड़ाई से पालन व नेशनल टूर ऑपरेटर्स का सहयोग लेने के निर्देश।\r\n       चारधाम यात्रा के साथ ही प्रदेश के सभी धार्मिक स्थलों पर आने वाले श्रद्धालुओं हेतु एक फूलप्रूफ ऑनलाइन रजिस्ट्रेशन  की स्थायी व्यवस्था विकसित करने हेतु मुख्य सचिव श्रीमती राधा रतूड़ी ने प्रतिष्ठित आईटी कन्सलटेन्सी कम्पनी की सहायता लेने के निर्देश चारधाम यात्रा प्रबन्धन से सम्बन्धित अधिकारियों को दिए हैं। सीएस ने यात्रा प्रबन्धन से जुड़े अधिकारियों को स्पष्ट किया है कि चारधाम यात्रा के सुव्यवस्थित प्रबन्धन तथा स्थायी समाधान में टेक्नॉलजी ही सबसे अधिक सहायता कर सकती है। उन्होंने जल्द से जल्द इस आईटी कन्सलटेन्सी कम्पनी के साथ ही चारधाम यात्रा से जुड़े सभी हितधारकों (Stakeholders  ) जिनमें होटल व्यवसायी, टूर ऑपरेटर्स, पर्यटन से जुड़े लोग तथा प्रशासनिक अधिकारियों की मदद से यह रजिस्ट्रेशन व्यवस्था विकसित करने के निर्देश दिए हैं।\r\nचारधाम यात्रा में फील्ड पर काम कर रहे अधिकारियों को यात्रा प्रबन्धन में सबसे महत्वपूर्ण कड़ी मानते हुए मुख्य सचिव श्रीमती राधा रतूड़ी ने आज स्वयं ऋषिकेश स्थित यात्रा रजिस्ट्रेशन ऑफिस तथा ट्रांजिट कैम्प पहुंचकर सभी अधिकारियों विशेषकर फील्ड पर कार्य करने वाले कनिष्ठ अधिकारियों से यात्रा प्रबन्धन हेतु बनने वाली एसओपी के लिए उनके सुझाव मांगे।\r\nसीएस श्रीमती राधा रतूड़ी ने कहा कि चारधाम यात्रा प्रबन्धन से जुड़े सभी अधिकारियों विशेषरूप से फील्ड अधिकारियों के कुशल प्रबन्धन से राज्य में चारधाम यात्रा आरम्भ में कुछ चुनौतियों के बाद पुनः सुचारू, सुव्यवस्थित एवं सफलतापूर्वक संचालित की जा रही है। वर्तमान में ऋषिकेश हरिद्वार के हॉलडिंग प्वाइंट में लगभग 3000 श्रद्धालु मौजूद हैं, जिन्हें धामों में भेजा जा रहा है। चारधाम से सभी श्रद्धालु यात्रा के पश्चात सकुशल वापस लौट रहे हैं। यात्रा मार्ग एवं धामों में सभी व्यवस्थाएं सफलतापूर्वक संचालित की जा रही हैं। इसलिए हरिद्वार  से ऑनलाइन रजिस्ट्रेशन पुनः आरम्भ किया जा रहा है।  \r\nभविष्य में श्रद्धालुओं की निरन्तर बढ़ती संख्या के समाधान हेतु मुख्य सचिव श्रीमती राधा रतूड़ी ने चारधाम यात्रा से सम्बन्धित जनपदों के जिलाधिकारियों को नए ठहराव स्थलों को चिहिन्त करने के साथ ही वहाँ पर पार्किंग स्थलों को विकसित करने के निर्देश दिए हैं। उन्होंने कहा कि इसके लिए जल्द ही धनराशि भी जारी कर दी जाएगी। सीएस ने यात्रा मार्ग पर वाहनों की कैरिंग कैपिसिटी व पार्किंग स्थलों का सही आकलन जल्द बनाने के भी निर्देश दिए हैं। उन्होंने कहा कि कैरिंग कैपिसिटी के अनुसार ही नियमों का सख्ती से पालन करवाना आवश्यक है। इसके साथ ही सीएस ने ट्रिप कार्ड व्यवस्था का भी कड़ाई से पालन के निर्देश दिए हैं। उन्होंने भविष्य में चारधाम यात्रा के सफल संचालन हेतु नेशनल टूर ऑपरेटर्स का भी सहयोग लेने के निर्देश दिए हैं। इसके साथ ही सीएस ने देश के अन्य राज्यों के ऐसे जिले जहां से सबसे अधिक यात्री चार धाम पर आते हैं, उनके जिलाधिकारियों एवं जिला प्रशासन से भी समन्वय एवं संवाद के निर्देश दिए हैं।  \r\nमुख्य सचिव श्रीमती राधा रतूड़ी ने मंगलवार को ऋषिकेश स्थित यात्रा रजिस्ट्रेशन ऑफिस एवं ट्रांजिट कैम्प पहुंचकर व्यवस्थाओं का निरीक्षण किया तथा सम्बन्धित अधिकारियों के साथ बैठक की। बैठक में आयुक्त गढ़वाल श्री विनय शंकर पाण्डेय, जिलाधिकारी देहरादून, टिहरी, वरिष्ठ पुलिस अधीक्षक टिहरी तथा चारधाम यात्रा से सम्बन्धित अधिकारी मौजूद रहे।', '2024-05-08', 'post_img2.jpg', 'post_img2-2.jpg', '2', '1', '0'),
(3, 'वीकेंड की भीड़ से हांफा स्वर्गाश्रम-जौंक शहर', '\r\nस्वर्गाश्रम-जौंक (रिपोर्टर) । नगर पंचायत स्वर्गाश्रम-जौंक में जहां तक नज़र डालिये वीकेंड पर जाम का झाम ही मिलेगा। हाल यह है कि पुलिस की लापरवाही के चलते पर्यटक जहां तहाँ गाड़ियाँ पार्क कर रहे है। जिससे लोकल लोगों का सड़क पर चलना दुशवार हो हो चला। बावजूद इसके पुलिस कोई ठोस करवाई नहीं कर रही है।\r\nपर्यटन की दृष्टि से काफ़ी महत्वपूर्ण क्षेत्र स्वर्गाश्रम-जौंक शहर जाम की जाम से हाँफ रहा है। जानकी झूला बागख़ला के आसपास की सड़के, आराधना स्थल वाली गली, गीता भवन संख्या-3  से सटी सड़क और पीछे गेट वाली सड़क,  वानप्रस्थ आश्रम वाली रोड, भूतनाथ, लक्ष्मणझूला रोड सहित अन्य जगहों पर अवैध पार्किंग करने से लोकल के साथ ही पर्यटकों को आवाजाही में दिक़्क़तों का सामना करना पड़ रहा है। यही नहीं गाड़ी में ही नशे का सेवन करने से लड़कियों का गुजरना मुश्किल हो गया है। नगर पंचायत स्वर्गाश्रम-जौंक वार्ड-04, निवासी वंदना राणा, अनुराधा राणा, रामू मुरमुका, वंदना अग्रवाल का कहना है कि गाड़ियों के सड़क पर खड़े रहने से आवाजाही में दिक़्क़तें आती है। बावजूद पुलिस या प्रशासन कोई करवाई नहीं कर रहा है । लक्ष्मण झूला थाना एसएचओ रवि कुमार सैनी का कहना है कि नो पार्किंग में खड़ी या मार्ग में बाधा पहुँचा रहीं गाड़ियों के ख़िलाफ़ करवाई करने के साथ ही रिकवरी वैन से उठाने की करवाई की जाएगी। किसी भी सूरत में जाम की समस्या उत्पन्न नहीं होने दिया जाएगा।', '2024-05-10', 'post3-2.jpg', 'post3-2.jpg', '2', '1', '0'),
(4, ' जून में इतने दिन बैंक रहेंगे बंद, यहां चेक करें छुट्टियों की पूरी लिस्ट     ', 'जून महीना शुरू होने के सिर्फ कुछ ही दिन बचा है। अगर आपका भी बैंकिग से जुड़ा कोई जरूरी काम है, तो उसे इस महीने की शुरुआत में ही निपटा लें। ऐसे हम इसलिए कह रहे हैं, क्योंकि हर महीने की तरह जून में भी बैंकों की छुट्टियों (Bank Holidays 2024 in India) काफी भरमार है। भारतीय रिजर्व बैंक (RBI) द्वारा जारी की गई छुट्टियों की लिस्ट (June Bank Holidays Full List) के मुताबिक, जून में कुल 12 दिन बैंक बंद रहेंगे। हम आपको इस खबर में बताने जा रहे हैं कि बैंक किस-किस दिन और कौन से राज्य में बंद रहेंगे, क्योंकि आपको इन छुट्टियों के बारे में पता होना चाहिए। अन्यथा आपको कई तरह की परशानियों का सामना करना पड़ सकता है। आइए आपको विस्तार से इस बारे में बताते हैं...         रिजर्व बैंक ऑफ इंडिया (RBI) ने अपनी आधिकारिक वेबसाइट पर इसकी जानकारी दी है। इसके मुताबिक, जून में कुल 12 दिन बैंक बंद रहेंगे। हालांकि, आरबीआई की तरफ से यह राष्ट्रीय स्तर पर बैंकों के छुट्टियों (Bank Holidays 2024) की लिस्च जारी की गई है। इनमें अलग-अलग राज्यों में पड़ने वाले कई त्योहारों के अलावा शनिवार और रविवार की साप्ताहिक छुट्टियां भी शामिल की गई हैं। ऐसे में आपको बैंक जाने से पहले एक बार छुट्टियों की लिस्ट (Bank Holiday List) जरूर देख लेनी चाहिए, जिससे आपको कोई कठिनाई न हो। ग्राहकों के लिए यह जानना जरूरी है कि जून में बैंक कब-कब बंद रहेंगे।                      आइए जून में बैंक की छुट्टियों की लिस्ट (Bank Holidays List for June 2024) पर एक नजर डालते हैं।\r\n\r\n1 जून 2024- इस दिन चुनाव वाली जगहों पर बैंक बंद रहेंगे। \r\n2 जून 2024- रविवार के चलते देश भर में बैंकों की साप्ताहिक छुट्टी रहेगी\r\n8 जून 2024- महीने के दूसरे शनिवार की वजह से पूरे देश में बैंक बंद रहेंगे।\r\n9 जून 2024- रविवार की वजह से बैंक बंद रहेंगे\r\n16 जून 2024- रविवार के चलते देश भर में बैंक बंद रहेंगे।\r\n22 जून 2024- महीने के चौथे शनिवार की वजह से देश भर में बैंक बंद रहेंगे।\r\n23 जून 2024- रविवार के कारण देश भर में बैंक बंद रहेंगे।\r\n30 जून 2024- रविवार के चलते देश भर में बैंक बंद रहेंगे।    10 जून सोमवार- श्री गुरु अर्जुन देव जी के शहीदी दिवस के मौके पर पंजाब में बैंक बंद रहेंगे। \r\n14 जून शुक्रवार- इस दिन पाहिली राजा की वजह से ओडिशा में बैंक बंद रहेंगे। \r\n15 जून शनिवार- उत्तर-पूर्वी राज्य मिजोरम में YMA दिवस और ओडिशा में राजा संक्रांति के कारण बैंक बंद रहेंगे। \r\n17 जून सोमवार- बकरीद के मौके पर कुछ राज्यों को छोड़कर पूरे देश में बैंक बंद रहेंगे।\r\n21 जून शुक्रवार- वट सावित्री व्रत के कारण कई राज्यों में बैंक बंद रहेंगे।', '2024-05-16', 'post_img2.jpg', 'post_img2.jpg', '2', '1', '0'),
(5, 'गंगा स्नान घाटों की शोभा बढ़ा रहा है मलबा\r\n', 'स्वर्गाश्रम-जौंक( रिपोर्टर) पोल लगाने के बाद ठेकेदार ने मलबा नगर पंचायत स्वर्गाश्रम-जौंक के गंगा घाटों की शोभा बढ़ा रहा है। मलबे में लोग मलमूत्र त्याग रहे है साथ ही गंगा स्नान को आने वाले यात्री परेशान हो रहे है। बावजूद इसके इस ओर कोई कारवाई जिमेदार विभाग करने के मूड में नहीं दिख रहे है।\r\nसरकारी तंत्र की हीलाहवाली से एक ठेकेदार के हौसले कितने बुलंद है कि लक्ष्मीनारायण घाट निवासी प्रमोद चौहान, सुरेश बिजलवान, राम बहादुर, रमन कश्यप का का कहना है कि ठेकेदार को कई बार मौखिक शिकायत की जा चुकी है लेकिन ठेकेदार मलबा हटवाना तो दूर झांकने तक नहीं आ रहा है। मलबा न हटने से लोग मलमूत्र उक्त मलबे में ही त्याग रहे है। जिससे गंगा प्रदूषित हो रही है मां गंगा की आस्था से ठेकेदार खिलवाड़ कर रहा है। लेकिन इसके बाद भी कोई करवाई करने को लेकर तैयार नहीं है। कहा मलबा तत्काल नहीं हटा तो आंदोलन को बाध्य होंगे और सीएम पोर्टल के माध्यम से शिकायत करेंगे।', '2024-05-17', 'post5-1.jpg', 'post5-1.jpg', '5', '1', '0'),
(6, 'गंगा स्नान घाटों की शोभा बढ़ा रहा है मलबा\r\n', 'स्वर्गाश्रम-जौंक( रिपोर्टर) पोल लगाने के बाद ठेकेदार ने मलबा नगर पंचायत स्वर्गाश्रम-जौंक के गंगा घाटों की शोभा बढ़ा रहा है। मलबे में लोग मलमूत्र त्याग रहे है साथ ही गंगा स्नान को आने वाले यात्री परेशान हो रहे है। बावजूद इसके इस ओर कोई कारवाई जिमेदार विभाग करने के मूड में नहीं दिख रहे है।\r\nसरकारी तंत्र की हीलाहवाली से एक ठेकेदार के हौसले कितने बुलंद है कि लक्ष्मीनारायण घाट निवासी प्रमोद चौहान, सुरेश बिजलवान, राम बहादुर, रमन कश्यप का का कहना है कि ठेकेदार को कई बार मौखिक शिकायत की जा चुकी है लेकिन ठेकेदार मलबा हटवाना तो दूर झांकने तक नहीं आ रहा है। मलबा न हटने से लोग मलमूत्र उक्त मलबे में ही त्याग रहे है। जिससे गंगा प्रदूषित हो रही है मां गंगा की आस्था से ठेकेदार खिलवाड़ कर रहा है। लेकिन इसके बाद भी कोई करवाई करने को लेकर तैयार नहीं है। कहा मलबा तत्काल नहीं हटा तो आंदोलन को बाध्य होंगे और सीएम पोर्टल के माध्यम से शिकायत करेंगे।', '2024-05-21', 'post_img2.jpg', 'slider_img2.jpg', '6', '1', '0'),
(7, ' टेक्नॉलजी की मदद से चारधाम यात्रा का सुव्यवस्थित प्रबन्धन तथा स्थायी समाधान-मुख्य सचिव श्रीमती राधा रतूड़ी ', 'देहरादून  28 मई, 2024\n           टेक्नॉलजी की मदद से चारधाम यात्रा का सुव्यवस्थित प्रबन्धन तथा स्थायी समाधान \nमुख्य सचिव श्रीमती राधा रतूड़ी ने आईटी कन्सलटेन्सी कम्पनी तथा चारधाम यात्रा से जुड़े सभी स्टेकहोल्डर्स की मदद से फूलप्रूफ ऑनलाइन रजिस्ट्रेशन व्यवस्था विकसित करने के निर्देश दिए।\n    चारधाम यात्रा में फील्ड पर काम कर रहे अधिकारियों को यात्रा प्रबन्धन में सबसे महत्वपूर्ण कड़ी मानते हुए सीएस ने फील्ड पर कार्य करने वाले कनिष्ठ अधिकारियों से यात्रा प्रबन्धन हेतु बनने वाली एसओपी के लिए सुझाव मांगे\nफील्ड अधिकारियों के कुशल प्रबन्धन से राज्य में चारधाम यात्रा का पुनः सुचारू, सुव्यवस्थित एवं सफलतापूर्वक संचालन जारी।\n    ‌‌     ठहराव स्थलों  में मौजूद श्रद्धालुओं को चार धाम भेजने की शुरुआत, धामों से वापस लौट रहे हैं श्रद्धालु  ।\n    नए ठहराव स्थलों व पार्किंग स्थलों के लिए जल्द धनराशि जारी की जाएगी।\n            हरिद्वार  से ऑनलाइन रजिस्ट्रेशन पुनः आरम्भ।\n            ट्रिप कार्ड व्यवस्था के  कड़ाई से पालन व नेशनल टूर ऑपरेटर्स का सहयोग लेने के निर्देश।\n       चारधाम यात्रा के साथ ही प्रदेश के सभी धार्मिक स्थलों पर आने वाले श्रद्धालुओं हेतु एक फूलप्रूफ ऑनलाइन रजिस्ट्रेशन  की स्थायी व्यवस्था विकसित करने हेतु मुख्य सचिव श्रीमती राधा रतूड़ी ने प्रतिष्ठित आईटी कन्सलटेन्सी कम्पनी की सहायता लेने के निर्देश चारधाम यात्रा प्रबन्धन से सम्बन्धित अधिकारियों को दिए हैं। सीएस ने यात्रा प्रबन्धन से जुड़े अधिकारियों को स्पष्ट किया है कि चारधाम यात्रा के सुव्यवस्थित प्रबन्धन तथा स्थायी समाधान में टेक्नॉलजी ही सबसे अधिक सहायता कर सकती है। उन्होंने जल्द से जल्द इस आईटी कन्सलटेन्सी कम्पनी के साथ ही चारधाम यात्रा से जुड़े सभी हितधारकों (Stakeholders  ) जिनमें होटल व्यवसायी, टूर ऑपरेटर्स, पर्यटन से जुड़े लोग तथा प्रशासनिक अधिकारियों की मदद से यह रजिस्ट्रेशन व्यवस्था विकसित करने के निर्देश दिए हैं।\nचारधाम यात्रा में फील्ड पर काम कर रहे अधिकारियों को यात्रा प्रबन्धन में सबसे महत्वपूर्ण कड़ी मानते हुए मुख्य सचिव श्रीमती राधा रतूड़ी ने आज स्वयं ऋषिकेश स्थित यात्रा रजिस्ट्रेशन ऑफिस तथा ट्रांजिट कैम्प पहुंचकर सभी अधिकारियों विशेषकर फील्ड पर कार्य करने वाले कनिष्ठ अधिकारियों से यात्रा प्रबन्धन हेतु बनने वाली एसओपी के लिए उनके सुझाव मांगे।\nसीएस श्रीमती राधा रतूड़ी ने कहा कि चारधाम यात्रा प्रबन्धन से जुड़े सभी अधिकारियों विशेषरूप से फील्ड अधिकारियों के कुशल प्रबन्धन से राज्य में चारधाम यात्रा आरम्भ में कुछ चुनौतियों के बाद पुनः सुचारू, सुव्यवस्थित एवं सफलतापूर्वक संचालित की जा रही है। वर्तमान में ऋषिकेश हरिद्वार के हॉलडिंग प्वाइंट में लगभग 3000 श्रद्धालु मौजूद हैं, जिन्हें धामों में भेजा जा रहा है। चारधाम से सभी श्रद्धालु यात्रा के पश्चात सकुशल वापस लौट रहे हैं। यात्रा मार्ग एवं धामों में सभी व्यवस्थाएं सफलतापूर्वक संचालित की जा रही हैं। इसलिए हरिद्वार  से ऑनलाइन रजिस्ट्रेशन पुनः आरम्भ किया जा रहा है।  \nभविष्य में श्रद्धालुओं की निरन्तर बढ़ती संख्या के समाधान हेतु मुख्य सचिव श्रीमती राधा रतूड़ी ने चारधाम यात्रा से सम्बन्धित जनपदों के जिलाधिकारियों को नए ठहराव स्थलों को चिहिन्त करने के साथ ही वहाँ पर पार्किंग स्थलों को विकसित करने के निर्देश दिए हैं। उन्होंने कहा कि इसके लिए जल्द ही धनराशि भी जारी कर दी जाएगी। सीएस ने यात्रा मार्ग पर वाहनों की कैरिंग कैपिसिटी व पार्किंग स्थलों का सही आकलन जल्द बनाने के भी निर्देश दिए हैं। उन्होंने कहा कि कैरिंग कैपिसिटी के अनुसार ही नियमों का सख्ती से पालन करवाना आवश्यक है। इसके साथ ही सीएस ने ट्रिप कार्ड व्यवस्था का भी कड़ाई से पालन के निर्देश दिए हैं। उन्होंने भविष्य में चारधाम यात्रा के सफल संचालन हेतु नेशनल टूर ऑपरेटर्स का भी सहयोग लेने के निर्देश दिए हैं। इसके साथ ही सीएस ने देश के अन्य राज्यों के ऐसे जिले जहां से सबसे अधिक यात्री चार धाम पर आते हैं, उनके जिलाधिकारियों एवं जिला प्रशासन से भी समन्वय एवं संवाद के निर्देश दिए हैं।  \nमुख्य सचिव श्रीमती राधा रतूड़ी ने मंगलवार को ऋषिकेश स्थित यात्रा रजिस्ट्रेशन ऑफिस एवं ट्रांजिट कैम्प पहुंचकर व्यवस्थाओं का निरीक्षण किया तथा सम्बन्धित अधिकारियों के साथ बैठक की। बैठक में आयुक्त गढ़वाल श्री विनय शंकर पाण्डेय, जिलाधिकारी देहरादून, टिहरी, वरिष्ठ पुलिस अधीक्षक टिहरी तथा चारधाम यात्रा से सम्बन्धित अधिकारी मौजूद रहे।', '2024-05-24', 'post_img2.jpg', 'post_img2-2.jpg', '2', '1', '0'),
(8, 'नीलकंठ मार्ग पर में मिला महिला का शव, हत्या की आशंका', 'ऋषिकेश लक्ष्मणझूला क्षेत्र अंतर्गत नीलकंठ मार्ग पर एक युवती की लाश मिली है, प्रथम दृष्टया युवती की गला घोटकर हत्या किए जाने के बाद उसकी लाश को सड़क किनारे फेंक दिया गया लगता है। पुलिस द्वारा अज्ञात युवती की लाश का पचनामा भर पोस्टमार्टम के लिए एम्स अस्पताल भिजवा दिया गया है। तथा उक्त संबंध में अज्ञात के खिलाफ हत्या का मुकदमा दर्ज कर जांच प्रारंभ कर दी गई है।\r\n\r\nथाना लक्ष्मण झूला प्रभारी रवि सैनी ने बताया कि सोमवार को नीलकंठ पैदल मार्ग पर धांधला पानी से पुलिया खेत के लिए जाने वाले रास्ते पर एक युवती का शव मिलने की सूचना मिली थी, युवती की उम्र करीब 24 वर्ष की है, तथा युवती के गले में फंदा बंधा हुआ था, जिससे प्रथम दृष्टया यह लग रहा था कि युवती की गला घोटकर हत्या की गई है, पुलिस द्वारा युवती के शव को अपने कब्जे में लेकर पंचनामे की कार्रवाई कर पोस्टमॉर्टम के लिए एम्स अस्पताल भिजवा दिया गया है। तथा पुलिस की एक टीम ने जांच प्रारंभ कर दी गई है।', '2024-05-27', 'post_img1.jpg', 'slider_img1.jpg', '3', '1', '0'),
(9, 'तेजी के साथ सुलग रहा है मानिकूट पर्वत ब्यूरो, ऋषिकेश', 'ऋषिकेश और आसपास क्षेत्र में आसमान आग उगल रहा है। तापमान 42 डिग्री सेल्सियस पहुंच गया है। अब जंगल की आग ने फिर से मौसम की तपिस और बढ़ानी शुरू कर दी है। लक्ष्मण झूला- स्वर्गाश्रम से सटे नीलकंठ महादेव मंदिर की पहाड़ियों पर गुरुवार की शाम जंगल में आग लग गई। पूरे इलाके में तेज हवाएं चल रही थी, जिसने यहां की आग को और आगे बढ़ने का काम किया।', '2024-05-29', 'post_img2.jpg', 'post_img2.jpg', '10', '1', '0'),
(10, 'test news', 'test description', '2024-06-02', 'f6b62b39edimg1a.jpg', 'f6b62b39edimg1a.jpg', '5', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `salt` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `profile_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_success_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_failed_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_success_login_ip` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_failed_login_ip` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `account_status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `fname`, `lname`, `email`, `salt`, `password`, `profile_picture`, `created_datetime`, `updated_datetime`, `last_success_login`, `last_failed_login`, `last_success_login_ip`, `last_failed_login_ip`, `role_id`, `account_status`) VALUES
(1, 'adminuser', 'ajay', 'kumar', 'ajay@gmail.com', '404be537d713b9db3ebc86f5aa90cb3c53f6a9d524082457d20f157a44b328dc', '6ecc9e2e9cfe6468061a610c076e088fc08be9a5feaf5e471ad82002539e5364', '2017_01_07_22_15_40_33_sharif-photo.jpg', '2024-06-01 21:47:36', '2024-06-02 12:47:00', '2024-06-02 13:14:04', '2024-03-21 18:49:12', '192.168.1.1', '202.103.58.20', '1', '1');

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_catagory`
--
ALTER TABLE `tbl_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
