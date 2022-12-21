-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 10/12 at 08:00 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `POSSEDER`;
DROP TABLE IF EXISTS `CREER`;
DROP TABLE IF EXISTS `APPARTIENT`;
DROP TABLE IF EXISTS `FRIENDS`;
DROP TABLE IF EXISTS `FAIRE PARTIE`;
DROP TABLE IF EXISTS `is`;
DROP TABLE IF EXISTS `GUILD`;
DROP TABLE IF EXISTS `personnage`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `category`;

--
-- Database: `charactersystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ida` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ida`, `username`, `password`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `contactno` varchar(11) DEFAULT NULL,
  `private` boolean,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `contactno`, `private`, `posting_date`) VALUES
(1, 'louis', 'Roussange', 'test@gmail.com', 'Test@123', '1234567890', 0, '2021-01-01 18:30:00'),
(2, 'Virgile', 'Broillet', 'tes@gmail.com', 'Test@123', '1234567891', 0, '2021-01-01 18:30:00'),
(3, 'Flying', 'Nuggets', 'Nugget@gmail.com', 'Test@123', '1234567899', 1, '2021-01-01 18:30:00');

-- --------------------------------------------------------
--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idu` int(11) NOT NULL,
  `NameU` varchar(255) DEFAULT NULL,
  `LnameU` varchar(255) DEFAULT NULL,
  `image` mediumtext DEFAULT NULL,
  PRIMARY KEY(`idu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `user` (`idu`, `NameU`, `LnameU`, `image`) VALUES (1, 'King Louis', ' ', 'test.png'),(2, 'Virgile', 'Mobile', 'mobile.png'),(3, 'Fly', 'Nugget', 'nugget.png');

-- --------------------------------------------------------
--
-- Table structure for table `IS`
--
CREATE TABLE `is` (
	`id` int(11) NOT NULL,
	`idu` int(11) NOT NULL,
	PRIMARY KEY(`idu`, `id` )
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `is` (`id`, `idu`) VALUES (1,1),(2,2),(3,3);

-- --------------------------------------------------------

--
-- Table structure for table `personnage`
--

CREATE TABLE `personnage`(
  `idp` int(11) NOT NULL,
  `FirstName` varchar(200) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Picture` varchar(200) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT current_timestamp(),
  `isPublic` int(1) DEFAULT NULL,
  PRIMARY KEY(`idp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `personnage` (`idp`, `FirstName`, `Name`, `Picture` ,`description`, `creation_date`, `isPublic` ) VALUES
(1, 'Gobelinet', NULL, 'goblinet.png', 'spooky Goblin', '2022-12-10', '1' );

-- --------------------------------------------------------
--
-- Table structure for table `category`
--
CREATE TABLE `category`(
  `idcat` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL, 
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
   PRIMARY KEY(`idcat`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `category` (`idcat`, `Name`, `description`, `CreationDate`) VALUES (1, 'Goblins', 'they are strange creatures...', '2022-12-10');

-- --------------------------------------------------------
CREATE TABLE `APPARTIENT` (
	`idp` int(11) NOT NULL,
	`idcat` int(11) NOT NULL,
	PRIMARY KEY(`idp`, `idcat`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `APPARTIENT` ( `idp`, `idcat` ) VALUES (1, 1);
-- --------------------------------------------------------
--
-- Table structure for table `posseder`
--
CREATE TABLE `POSSEDER` (
	`idp` int(11) NOT NULL,
	`idu` int(11) NOT NULL,
	PRIMARY KEY(`idp`, `idu`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `POSSEDER` ( `idp`, `idu` ) VALUES (1, 1);
-- --------------------------------------------------------
--
-- Table structure for table `CREER`
--
CREATE TABLE `CREER` (
	`idp` int(11) NOT NULL,
	`idu` int(11) NOT NULL,       
	`dateC` timestamp NULL DEFAULT current_timestamp(),
	PRIMARY KEY(`idp`, `idu`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `CREER` ( `idp`, `idu`, `dateC`) VALUES (1, 1, '2022-12-10');
-- --------------------------------------------------------
--
-- Table structure for table `FRIENDS`
--
CREATE TABLE `FRIENDS` (
	`idu` int(11) NOT NULL,
	`id2` int(11) NOT NULL,       
	PRIMARY KEY(`idu`, `id2`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `FRIENDS` ( `idu`, `id2`) VALUES (1, 2),(2,1),(1,3),(3,1);
-- --------------------------------------------------------
--
-- Table structure for table `GUILD`
--
CREATE TABLE `GUILD` (
	`idg` int(11) NOT NULL,
	`Picture_G` varchar(200) NOT NULL,
    `description_G` mediumtext DEFAULT NULL,
	`dateg` timestamp NULL DEFAULT current_timestamp(), 
	PRIMARY KEY(`idg`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `GUILD` (`idg`, `Picture_G`, `description_G`, `dateg`) VALUES (1, 'guild.png', 'description bla bla', '2022-12-10');
-- --------------------------------------------------------
--
-- Table structure for table `FAIRE PARTIE`
--
CREATE TABLE `FAIRE PARTIE` (
	`idg` int(11) NOT NULL,
	`idu` int(11) NOT NULL,  
	`datej` timestamp NULL DEFAULT current_timestamp(),  
	PRIMARY KEY(`idg`,`idu`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `FAIRE PARTIE` (`idg`,`idu`, `datej`) VALUES (1,1,'2022-12-10'),(1,2,'2022-12-10');
-- --------------------------------------------------------
--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ida`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;


ALTER TABLE `APPARTIENT` ADD FOREIGN KEY (`idp`) REFERENCES `personnage` (`idp`);
ALTER TABLE `APPARTIENT` ADD FOREIGN KEY (`idcat`) REFERENCES `category` (`idcat`);
ALTER TABLE `POSSEDER` ADD FOREIGN KEY (`idp`) REFERENCES `personnage` (`idp`);
ALTER TABLE `POSSEDER` ADD FOREIGN KEY (`idu`) REFERENCES `user` (`idu`);
ALTER TABLE `CREER` ADD FOREIGN KEY (`idp`) REFERENCES `personnage` (`idp`);
ALTER TABLE `CREER` ADD FOREIGN KEY (`idu`) REFERENCES `user` (`idu`);
ALTER TABLE `FAIRE PARTIE` ADD FOREIGN KEY (`idg`) REFERENCES `GUILD` (`idg`);
ALTER TABLE `FAIRE PARTIE` ADD FOREIGN KEY (`idu`) REFERENCES `user` (`idu`);
ALTER TABLE `FRIENDS` ADD FOREIGN KEY (`idu`) REFERENCES `user` (`idu`);
ALTER TABLE `FRIENDS` ADD FOREIGN KEY (`id2`) REFERENCES `user` (`idu`);
ALTER TABLE `is` ADD FOREIGN KEY (`idu`) REFERENCES `user` (`idu`);
ALTER TABLE `is` ADD FOREIGN KEY (`id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
