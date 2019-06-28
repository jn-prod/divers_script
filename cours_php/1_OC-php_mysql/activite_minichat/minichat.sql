-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 27 juin 2019 à 15:31
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `minichat`
--

DROP TABLE IF EXISTS `minichat`;
CREATE TABLE IF NOT EXISTS `minichat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_message` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='minichat';

--
-- Déchargement des données de la table `minichat`
--

INSERT INTO `minichat` (`ID`, `pseudo`, `message`, `date_message`) VALUES
(1, 'Mathieu', 'Bonjour !', '2019-06-27 16:20:34'),
(2, 'Tom', 'Salut toi !', '2019-06-27 16:23:34'),
(3, 'Mathieu', 'Ca va Tom ?', '2019-06-27 16:26:34'),
(4, 'Tom', 'Ben ouais, Ã§a fait un bail qu\'on s\'est pas vu !', '2019-06-27 16:30:34'),
(5, 'Mathieu', 'On devrait se revoir !', '2019-06-27 16:35:34'),
(9, 'nico', 'salut !', '2019-06-27 17:23:34'),
(10, 'nico', '&lt;strong&gt;hello !', '2019-06-27 17:23:51'),
(11, 'nico', 'test', '2019-06-27 17:27:05'),
(12, 'nico', 'nouveau test', '2019-06-27 17:30:44');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
