-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 19. Sep 2023 um 20:45
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `qrcode_generator`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `qrcode_links`
--

CREATE TABLE `qrcode_links` (
  `qrcode_index` int(11) NOT NULL,
  `qrcode_link` varchar(200) NOT NULL,
  `qrcode_desc` text NOT NULL,
  `qrcode_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `qrcode_links`
--

INSERT INTO `qrcode_links` (`qrcode_index`, `qrcode_link`, `qrcode_desc`, `qrcode_type`) VALUES
(1, 'https://google.com', 'Google', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `qrcode_types`
--

CREATE TABLE `qrcode_types` (
  `type_index` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `qrcode_types`
--

INSERT INTO `qrcode_types` (`type_index`, `type_name`) VALUES
(1, 'Antworten'),
(2, 'Zeitschrift');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `qrcode_links`
--
ALTER TABLE `qrcode_links`
  ADD PRIMARY KEY (`qrcode_index`);

--
-- Indizes für die Tabelle `qrcode_types`
--
ALTER TABLE `qrcode_types`
  ADD PRIMARY KEY (`type_index`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `qrcode_links`
--
ALTER TABLE `qrcode_links`
  MODIFY `qrcode_index` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `qrcode_types`
--
ALTER TABLE `qrcode_types`
  MODIFY `type_index` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
