-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2023 at 02:30 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delpilarnotes`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `body` varchar(8000) DEFAULT NULL,
  `author` char(36) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` char(10) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `title`, `body`, `author`, `created`, `deleted`) VALUES
(1, 'First post ', 'This is a mock post', '4eb53cd6-3b91-4c46-83de-3b49e8b0df31', '2023-04-03 15:09:13', 'false'),
(2, 'Second post - test', 'This Post was created with rest client', '4eb53cd6-3b91-4c46-83de-3b49e8b0df31', '2023-04-04 08:52:55', 'false'),
(3, 'Joels första inlägg', 'Grävlingar är en vanlig syn i de flesta delar av Europa, Asien och Nordamerika. Dessa små djur tillhör familjen mårddjur och kännetecknas av sin gråsvarta päls och den karakteristiska vita ränderna runt ögonen. Grävlingar är främst nattaktiva och lever i underjordiska bon, där de äter en kost som huvudsakligen består av maskar, insekter och smådjur. De är kända för sin förmåga att gräva stora hål och tunnlar, vilket gör dem till en oönskad gäst i trädgårdar och på åkrar. Trots detta anses grävlingar vara viktiga för ekosystemet då de hjälper till att hålla marken luftig och göra den mer lämplig för växtlighet.', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-11 07:14:14', 'false'),
(4, 'Angående höftledsoperationer', '<p>Hej! Om någon behöver operera sin höftled betyder det att läkarna kommer att öppna upp höften och titta inuti för att se vad som är fel. Sedan kommer de att fixa problemet, som kan vara att ersätta en trasig höftled med en ny, eller att reparera något som är skadat. Under operationen kommer patienten att sova så att de inte känner någon smärta. Efter operationen kommer patienten att behöva vila och låta höften läka. Läkarna kommer också att ge medicin för att hantera smärta och för att undvika infektioner. Efter en tid kommer patienten att börja känna sig bättre och kunna använda höften igen.</p><p><br data-mce-bogus=\"1\"></p><p>Detta dokument har redigerats!<br data-mce-bogus=\"1\"></p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-11 07:14:14', 'false'),
(5, 'Hittepå generisk title', '<p>Andra f&ouml;rs&ouml;ket att spara i databasen!</p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-11 15:54:53', 'false'),
(6, 'titel från input här', '<p>content i tinyMCE Editor</p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-12 06:10:15', 'false'),
(7, 'Nytt dokument', '<p>ny content i tinyMCE</p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-12 06:26:48', 'false'),
(8, 'En till titel', '<p>mera conetent i tinyMCE</p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-12 06:30:24', 'false'),
(9, 'Advance', '<h2><strong>Heading</strong></h2><p>Body content here! hej nu ändrar vi lite<br></p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-12 06:39:36', 'false'),
(10, 'Color testing', '<p>Vi testar att ändra lite färger, tex denna h1 blir nu grön!<br></p><h1><span id=\"_mce_caret\" data-mce-bogus=\"1\" data-mce-type=\"format-caret\"><span style=\"color: rgb(45, 194, 107);\" data-mce-style=\"color: rgb(45, 194, 107);\">Grön h1:A</span></span><br data-mce-bogus=\"1\"></h1>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-12 08:20:52', 'false'),
(11, 'bla bla ', '<h1><span style=\"color: rgb(132, 63, 161); background-color: rgb(194, 224, 244);\">Min rubik!!!</span></h1>\n<p><span style=\"color: rgb(132, 63, 161); background-color: rgb(194, 224, 244);\">en h&auml;rlig text med massa<span style=\"color: rgb(22, 145, 121);\"><em><strong> f&auml;rg</strong></em></span> och <span style=\"color: rgb(230, 126, 35); background-color: rgb(45, 194, 107);\"><strong>fl&auml;rd!!</strong></span></span></p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-12 08:37:59', 'false'),
(12, 'test', '<p><span style=\"color: rgb(241, 196, 15);\">Hej detta &auml;r en GulText&nbsp;</span></p>\n<p><span style=\"color: rgb(52, 73, 94);\">Nu kommer en gr&aring; text och den syns knappt :(</span></p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-12 11:50:46', 'false'),
(13, 'test2', '<p>Detta dokument görs nu helt om!&nbsp;<br></p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-13 11:44:52', 'false'),
(14, 'Ett nytt dokument här!', '<p>En massa bra text!</p><h2>En H2:a</h2><h1><span style=\"color: rgb(230, 126, 35);\" data-mce-style=\"color: rgb(230, 126, 35);\">En orange h1:A!</span></h1><p><span style=\"color: rgb(230, 126, 35);\" data-mce-style=\"color: rgb(230, 126, 35);\"><br data-mce-bogus=\"1\"></span></p><p><span style=\"color: rgb(230, 126, 35);\" data-mce-style=\"color: rgb(230, 126, 35);\">Nu har vi redigerats\"!<br data-mce-bogus=\"1\"></span></p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-15 09:27:32', 'false'),
(15, 'Hej Lisa!', '<p>Hej Lisa! Välkommen till min version av Notes! Hoppas det blir en kul upplevelse :) mvh Joel</p>', 'd84c5426-61b8-4af2-8002-88d65e925315', '2023-04-15 09:35:01', 'false'),
(16, 'Hej Janne!', '<p>Hej Janne! Välkommen till min version av Notes! Hoppas det blir en trevlig upplevelse &amp; att allt är tydligt! mvh Joel</p>', '0aca96e6-8683-4b13-b094-d491030b4d67', '2023-04-15 09:35:59', 'false'),
(17, 'gå ut och lek', '<p>Sl&auml;ng ut barnen!</p>', '195022e1-a8bd-4d39-a628-5dd2435000e4', '2023-04-15 11:36:11', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `userName` varchar(128) DEFAULT NULL,
  `userEmail` varchar(128) DEFAULT NULL,
  `deleted` char(10) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `userName`, `userEmail`, `deleted`) VALUES
(2, '9893645f-778f-466a-8dd4-d9c29877c6ad', 'joeldelpilar', 'joel.delpilar@medieinstitutet.se', 'false'),
(3, '195022e1-a8bd-4d39-a628-5dd2435000e4', 'Joel del Pilarz', 'joel.delpilar@gmail.com', 'false'),
(4, '0aca96e6-8683-4b13-b094-d491030b4d67', 'Janne Kemi', 'janne@hiveandfive.se', 'false'),
(5, 'd84c5426-61b8-4af2-8002-88d65e925315', 'Lisa Pääjärvi', 'lisa.paajarvi@hiveandfive.se', 'false');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
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
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
