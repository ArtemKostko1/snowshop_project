-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               11.6.2-MariaDB-ubu2404 - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных snowShop
DROP DATABASE IF EXISTS `snowShop`;
CREATE DATABASE IF NOT EXISTS `snowShop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `snowShop`;

-- Дамп структуры для таблица snowShop.Brand
DROP TABLE IF EXISTS `Brand`;
CREATE TABLE IF NOT EXISTS `Brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.Brand: ~19 rows (приблизительно)
DELETE FROM `Brand`;
INSERT INTO `Brand` (`id`, `name`) VALUES
	(1, 'TERROR SNOW'),
	(2, 'PRIME'),
	(3, 'NIDECKER'),
	(4, 'JONES'),
	(5, 'CAPiTA'),
	(6, 'DRAKE'),
	(7, 'DOUBLEDECK'),
	(8, 'BATALEON'),
	(9, 'THIRTY TWO'),
	(10, 'NORTHWAVE'),
	(11, 'DEELUXE'),
	(12, 'Trans'),
	(13, 'Lib Tech'),
	(14, 'Fischer'),
	(15, 'Brados'),
	(16, 'Madshus'),
	(17, 'RED BULL'),
	(18, 'KYOTO'),
	(19, 'ProSURF'),
	(20, 'AMPLIFI');

-- Дамп структуры для таблица snowShop.Category
DROP TABLE IF EXISTS `Category`;
CREATE TABLE IF NOT EXISTS `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.Category: ~13 rows (приблизительно)
DELETE FROM `Category`;
INSERT INTO `Category` (`id`, `name`, `value`) VALUES
	(1, 'Сноуборды', 'snowboards'),
	(2, 'Крепления для сноуборда', 'snowboard-bindings'),
	(3, 'Ботинки для сноуборда', 'snowboard-boots'),
	(4, 'Шлемы', 'helmets'),
	(5, 'Защита', 'protection'),
	(6, 'Маски', 'masks'),
	(7, 'Чехлы для сноуборда и горных лыж', 'bags'),
	(8, 'Лыжи', 'skis'),
	(9, 'Лыжные ботинки', 'ski-boots'),
	(10, 'Лыжные палки', 'ski-poles'),
	(11, 'Лыжные крепления', 'ski-bindings'),
	(12, 'Горнолыжная одежда', 'ski-clothing');

-- Дамп структуры для таблица snowShop.Product
DROP TABLE IF EXISTS `Product`;
CREATE TABLE IF NOT EXISTS `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `categoryId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `size` varchar(100) DEFAULT NULL,
  `article` varchar(100) NOT NULL,
  `inStock` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `internalCode` varchar(100) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`images`)),
  `articleRoute` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `Product_categoryId_fkey` (`categoryId`),
  KEY `Product_brandId_fkey` (`brandId`),
  CONSTRAINT `Product_brandId_fkey` FOREIGN KEY (`brandId`) REFERENCES `Brand` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.Product: ~26 rows (приблизительно)
DELETE FROM `Product`;
INSERT INTO `Product` (`id`, `name`, `price`, `categoryId`, `brandId`, `size`, `article`, `inStock`, `description`, `internalCode`, `createdAt`, `updatedAt`, `images`, `articleRoute`) VALUES
	(1, 'Сноуборд CAPITA MEGA MERCURY 2025', 2299, 1, 5, '153', 'CAPITA MEGA MERC 2025', 1, 'Сноуборд CAPITA MEGA MERC 2025. Вот он! Идеальное устройство для любых условий: в любое время, в любом месте, на любом рельефе и в любом снегу — MEGA MERC. Вдохновлённый универсальностью серии Mercury, MEGA MERC сохраняет проверенные технические линии дизайна, но теперь дополнен серьёзными улучшениями конструкции. Создан для максимальной мощности, когда она нужна, и лёгкости, когда это необходимо. MEGA MERC — это ультрапремиальный сноуборд для катания в любых условиях, на который можно положиться. Ультралёгкий и ультрауниверсальный, MEGA MERC оснащён сердцевиной 3D Thermopolymer Starship Core™, новой гибридной конфигурацией Holy-Sheet™ Tri/Tri MEGACARBON™ и базой MEGADRIVE™ XT, обеспечивающими беспрецедентную производительность на любом рельефе.', '000TREI001730', '2025-01-05 16:53:56.860', '2025-01-05 16:54:43.786', '[{"url":"https://shop.wakepark.by/image/cache/catalog/25jones25/right/jones25/d_2425_productimage_megamerc_153-800x800.png"}]', 'capitamegamerc2025'),
	(3, 'Ботинки для сноуборда NIDECKER ALTAI 2025 GRAY', 1399, 3, 1, '44.5', 'NIDECKER ALTAI 2025 GRAY', 0, 'Altai - это центральная часть коллекции ботинок Nidecker, предлагающая первоклассные характеристики и поддержку по непревзойденной цене. В асимметричном верхе устранены точки давления, а шнурки Dual-Dial BOA® позволяют затягивать верхнюю и нижнюю части независимо друг от друга. Термоформовка Silver Liner позволяет настроить ботинок под себя.', '000KTR00980', '2025-01-05 21:40:39.015', '2025-01-05 21:40:39.015', '[{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.02.42-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.11-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.00-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.02.51-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.20-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.29-800x800.png"}]', 'nideckeraltai2025gray'),
	(4, 'Ботинки для сноуборда NIDECKER ALTAI 2025 GRAY', 1399, 3, 3, '45', 'NIDECKER ALTAI 2025 GRAY', 0, 'Altai - это центральная часть коллекции ботинок Nidecker, предлагающая первоклассные характеристики и поддержку по непревзойденной цене. В асимметричном верхе устранены точки давления, а шнурки Dual-Dial BOA® позволяют затягивать верхнюю и нижнюю части независимо друг от друга. Термоформовка Silver Liner позволяет настроить ботинок под себя.', '000KTR00980', '2025-01-05 21:41:21.307', '2025-01-05 21:41:21.307', '[{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.02.42-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.11-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.00-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.02.51-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.20-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.29-800x800.png"}]', 'nideckeraltai2025gray'),
	(5, 'Ботинки для сноуборда NIDECKER ALTAI 2025 GRAY', 1399, 3, 3, '44', 'NIDECKER ALTAI 2025 GRAY', 1, 'Altai - это центральная часть коллекции ботинок Nidecker, предлагающая первоклассные характеристики и поддержку по непревзойденной цене. В асимметричном верхе устранены точки давления, а шнурки Dual-Dial BOA® позволяют затягивать верхнюю и нижнюю части независимо друг от друга. Термоформовка Silver Liner позволяет настроить ботинок под себя.', '000KTR00980', '2025-01-05 21:41:27.393', '2025-01-05 21:41:27.393', '[{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.02.42-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.11-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.00-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.02.51-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.20-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.03.29-800x800.png"}]', 'nideckeraltai2025gray'),
	(9, 'Крепления для сноуборда NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1319, 2, 3, 'XL', 'NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1, 'Сноуборд крепления Nidecker Supermatic — это то, чего так ждали сноубордисты: первое универсальное автоматическое крепление с двойной системой встёгивания. Supermatic работает с помощью откидывающегося хайбека \'Drop In tech\'. Удобный рычаг разблокировки делает выход таким же быстрым. Чтобы каждый раз наслаждаться идеальной посадкой, просто один раз настройте их, а затем зафиксируйте стрепы с помощью алюминиевых фиксаторов. Прелесть этой системы в том, что она работает с ботинками любого производителя, и в ней нет сложного механизма, который может забиться. Вы так же можете встегнуться как в обычное крепление, если уклон или снежные условия этого требуют. Совершенно новая опорная пластина изготовлена из прочного усиленного нейлона с накладкой Slip-N-Grip, кото. Композитный хайбэк Asym Hadron разработан для идеальной посадки, с отзывчивым флексом и встроенной регулировкой наклона хайбека. Это крепления средней жесткости, которые команда Nidecker оценила, как наиболее удобное на сегодняшний день.', '00EWY0001336', '2025-01-05 21:44:31.992', '2025-01-05 21:44:31.992', '[{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.47-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.19-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.37-800x800.png"}]', 'nideckersupermatic2025escapecyan'),
	(11, 'Детский сноуборд DRAKE DF JUNIOR 2024', 499, 1, 6, '120', 'DRAKE DF JUNIOR 2024', 1, 'Отличный сноуборд для детей и подростков! Мягкий, отзывчивый и послушный снаряд для тренировок. Юные сноубордисты оценят новую модель DFJ с симметричной формой True Twin и скользящей базой Extruded 2000, которая неприхотливая в обслуживании и легко чинится. Ваш ребёнок с такой доской очень быстро уйдёт из детского сноубординга во взрослый!', '00EWY00600484', '2025-05-26 17:14:41.023', '2025-05-26 17:14:41.023', '[{"url":"https://shop.wakepark.by/image/cache/catalog/1%2B1%3D3/1444172-drake-df-junior-board-jr-snowboard-800x800.jpeg"}]', 'drakedfjunior2024'),
	(12, 'Детский сноуборд DRAKE DF JUNIOR 2024', 499, 1, 6, '130', 'DRAKE DF JUNIOR 2024', 1, 'Отличный сноуборд для детей и подростков! Мягкий, отзывчивый и послушный снаряд для тренировок. Юные сноубордисты оценят новую модель DFJ с симметричной формой True Twin и скользящей базой Extruded 2000, которая неприхотливая в обслуживании и легко чинится. Ваш ребёнок с такой доской очень быстро уйдёт из детского сноубординга во взрослый!', '00EWY00600484', '2025-05-26 17:15:33.270', '2025-05-26 17:15:33.270', '[{"url":"https://shop.wakepark.by/image/cache/catalog/1%2B1%3D3/1444172-drake-df-junior-board-jr-snowboard-800x800.jpeg"}]', 'drakedfjunior2024'),
	(13, 'Детский сноуборд DRAKE DF JUNIOR 2024', 499, 1, 6, '135', 'DRAKE DF JUNIOR 2024', 1, 'Отличный сноуборд для детей и подростков! Мягкий, отзывчивый и послушный снаряд для тренировок. Юные сноубордисты оценят новую модель DFJ с симметричной формой True Twin и скользящей базой Extruded 2000, которая неприхотливая в обслуживании и легко чинится. Ваш ребёнок с такой доской очень быстро уйдёт из детского сноубординга во взрослый!', '00EWY00600484', '2025-05-26 17:16:10.742', '2025-05-26 17:16:10.742', '[{"url":"https://shop.wakepark.by/image/cache/catalog/1%2B1%3D3/1444172-drake-df-junior-board-jr-snowboard-800x800.jpeg"}]', 'drakedfjunior2024'),
	(14, 'Крепления для сноуборда NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1319, 2, 3, 'L', 'NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1, 'Сноуборд крепления Nidecker Supermatic — это то, чего так ждали сноубордисты: первое универсальное автоматическое крепление с двойной системой встёгивания. Supermatic работает с помощью откидывающегося хайбека \'Drop In tech\'. Удобный рычаг разблокировки делает выход таким же быстрым. Чтобы каждый раз наслаждаться идеальной посадкой, просто один раз настройте их, а затем зафиксируйте стрепы с помощью алюминиевых фиксаторов. Прелесть этой системы в том, что она работает с ботинками любого производителя, и в ней нет сложного механизма, который может забиться. Вы так же можете встегнуться как в обычное крепление, если уклон или снежные условия этого требуют. Совершенно новая опорная пластина изготовлена из прочного усиленного нейлона с накладкой Slip-N-Grip, кото. Композитный хайбэк Asym Hadron разработан для идеальной посадки, с отзывчивым флексом и встроенной регулировкой наклона хайбека. Это крепления средней жесткости, которые команда Nidecker оценила, как наиболее удобное на сегодняшний день.', '00EWY0001336', '2025-05-26 17:17:51.717', '2025-05-26 17:17:51.717', '[{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.47-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.19-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.37-800x800.png"}]', 'nideckersupermatic2025escapecyan'),
	(15, 'Крепления для сноуборда NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1319, 2, 3, 'M', 'NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1, 'Сноуборд крепления Nidecker Supermatic — это то, чего так ждали сноубордисты: первое универсальное автоматическое крепление с двойной системой встёгивания. Supermatic работает с помощью откидывающегося хайбека \'Drop In tech\'. Удобный рычаг разблокировки делает выход таким же быстрым. Чтобы каждый раз наслаждаться идеальной посадкой, просто один раз настройте их, а затем зафиксируйте стрепы с помощью алюминиевых фиксаторов. Прелесть этой системы в том, что она работает с ботинками любого производителя, и в ней нет сложного механизма, который может забиться. Вы так же можете встегнуться как в обычное крепление, если уклон или снежные условия этого требуют. Совершенно новая опорная пластина изготовлена из прочного усиленного нейлона с накладкой Slip-N-Grip, кото. Композитный хайбэк Asym Hadron разработан для идеальной посадки, с отзывчивым флексом и встроенной регулировкой наклона хайбека. Это крепления средней жесткости, которые команда Nidecker оценила, как наиболее удобное на сегодняшний день.', '00EWY0001336', '2025-05-26 17:18:30.017', '2025-05-26 17:18:30.017', '[{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.47-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.19-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.37-800x800.png"}]', 'nideckersupermatic2025escapecyan'),
	(16, 'Крепления для сноуборда NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1319, 2, 3, 'S', 'NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1, 'Сноуборд крепления Nidecker Supermatic — это то, чего так ждали сноубордисты: первое универсальное автоматическое крепление с двойной системой встёгивания. Supermatic работает с помощью откидывающегося хайбека \'Drop In tech\'. Удобный рычаг разблокировки делает выход таким же быстрым. Чтобы каждый раз наслаждаться идеальной посадкой, просто один раз настройте их, а затем зафиксируйте стрепы с помощью алюминиевых фиксаторов. Прелесть этой системы в том, что она работает с ботинками любого производителя, и в ней нет сложного механизма, который может забиться. Вы так же можете встегнуться как в обычное крепление, если уклон или снежные условия этого требуют. Совершенно новая опорная пластина изготовлена из прочного усиленного нейлона с накладкой Slip-N-Grip, кото. Композитный хайбэк Asym Hadron разработан для идеальной посадки, с отзывчивым флексом и встроенной регулировкой наклона хайбека. Это крепления средней жесткости, которые команда Nidecker оценила, как наиболее удобное на сегодняшний день.', '00EWY0001336', '2025-05-26 17:19:01.337', '2025-05-26 17:19:01.337', '[{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.47-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.19-800x800.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/nidecker25/boots/snimokekrana2024-09-27v20.32.37-800x800.png"}]', 'nideckersupermatic2025escapecyan'),
	(17, 'Сноуборд CAPITA MEGA MERCURY 2025', 2299, 1, 5, '155', 'CAPITA MEGA MERC 2025', 1, 'Сноуборд CAPITA MEGA MERC 2025. Вот он! Идеальное устройство для любых условий: в любое время, в любом месте, на любом рельефе и в любом снегу — MEGA MERC. Вдохновлённый универсальностью серии Mercury, MEGA MERC сохраняет проверенные технические линии дизайна, но теперь дополнен серьёзными улучшениями конструкции. Создан для максимальной мощности, когда она нужна, и лёгкости, когда это необходимо. MEGA MERC — это ультрапремиальный сноуборд для катания в любых условиях, на который можно положиться. Ультралёгкий и ультрауниверсальный, MEGA MERC оснащён сердцевиной 3D Thermopolymer Starship Core™, новой гибридной конфигурацией Holy-Sheet™ Tri/Tri MEGACARBON™ и базой MEGADRIVE™ XT, обеспечивающими беспрецедентную производительность на любом рельефе.', '000TREI001730', '2025-05-26 17:20:38.302', '2025-05-26 17:20:38.302', '[{"url":"https://shop.wakepark.by/image/cache/catalog/25jones25/right/jones25/d_2425_productimage_megamerc_153-800x800.png"}]', 'capitamegamerc2025'),
	(18, 'Сноуборд CAPITA MEGA MERCURY 2025', 2299, 1, 5, '159', 'CAPITA MEGA MERC 2025', 0, 'Сноуборд CAPITA MEGA MERC 2025. Вот он! Идеальное устройство для любых условий: в любое время, в любом месте, на любом рельефе и в любом снегу — MEGA MERC. Вдохновлённый универсальностью серии Mercury, MEGA MERC сохраняет проверенные технические линии дизайна, но теперь дополнен серьёзными улучшениями конструкции. Создан для максимальной мощности, когда она нужна, и лёгкости, когда это необходимо. MEGA MERC — это ультрапремиальный сноуборд для катания в любых условиях, на который можно положиться. Ультралёгкий и ультрауниверсальный, MEGA MERC оснащён сердцевиной 3D Thermopolymer Starship Core™, новой гибридной конфигурацией Holy-Sheet™ Tri/Tri MEGACARBON™ и базой MEGADRIVE™ XT, обеспечивающими беспрецедентную производительность на любом рельефе.', '000TREI001730', '2025-05-26 17:21:27.492', '2025-05-26 17:21:27.492', '[{"url":"https://shop.wakepark.by/image/cache/catalog/25jones25/right/jones25/d_2425_productimage_megamerc_153-800x800.png"}]', 'capitamegamerc2025'),
	(19, 'Сноуборд CAPITA D.O.A 2025 WIDE', 1649, 1, 5, '151W', ' CAPITA D.O.A 2025 W', 0, 'Сноуборды CAPITA D.O.A настолько удостоены ошеломляющих наград, что, если бы эта модель приняла участие в межгалактических Олимпийских играх по сноуборду, она бы без особых усилий завоевали бы золото во всех параллельных измерениях.  Характеристики:  Назначение: ALL MOUNTAIN  Жёсткость: 5.5 из 10  Симметричная геометрия TWIN  Прогиб Кэмбер: Resort V1  P2 SUPERLIGHT CORE™ - чрезвычайно легкий сердечник выдерживает сильные удары и обеспечивает максимальный щелчок  Вставки CARBON FIBER BOOSTERS 2 х 3 мм в средней части доски для прочности и мощного щелчка  HYBRID HOLYSHEET™ BI/BI CARBON - оплетка стекловолокном, в состав которого добавлен карбон. Такая комбинация снизила вес доски и повысила точность при укладке слоев. BI/BI Holysheet™: укладывается в двух направлениях под углом 90° градусов для лучшей гибкости и отзывчивости сноуборда  MAGIC BEAN™ RESIN - пропитка высокоэффективной смолой, в составе которой находятся бобы, имеет самый высокий коэффициент прочности к весу  Стальной кант расположен по всей длине доски, в том числе в хвостовой и носовой частях  PLT Topsheet Technology ™ - технология PLT™ является эксклюзивной для CAPiTA MFG и волшебным образом приклеивает верхний лист к уже спрессованному сноуборду. Машина производит легкое, гладкое, глянцевое покрытие без клея  Скользяк Quantum Drive™ Base, являясь эволюцией UltraDrive™, отличается повышенной плотностью для максимальной износостойкости, впитывает больше воска для более быстрого катания  Закладные из нержавеющей стали 4х2  Интеллектуальный чип Near Field Communication (NFC) - встроен в нос доски', '000TREI001038', '2025-05-26 17:22:54.266', '2025-05-26 17:22:54.266', '[{"url":"https://shop.wakepark.by/image/cache/catalog/25union/strata/slingshot25/d_2425_productimage_doa_148-520x520.png"}]', 'capitadoa2025w'),
	(20, 'Сноуборд CAPITA D.O.A 2025 WIDE', 1649, 1, 5, '155W', ' CAPITA D.O.A 2025 W', 0, 'Сноуборды CAPITA D.O.A настолько удостоены ошеломляющих наград, что, если бы эта модель приняла участие в межгалактических Олимпийских играх по сноуборду, она бы без особых усилий завоевали бы золото во всех параллельных измерениях.  Характеристики:  Назначение: ALL MOUNTAIN  Жёсткость: 5.5 из 10  Симметричная геометрия TWIN  Прогиб Кэмбер: Resort V1  P2 SUPERLIGHT CORE™ - чрезвычайно легкий сердечник выдерживает сильные удары и обеспечивает максимальный щелчок  Вставки CARBON FIBER BOOSTERS 2 х 3 мм в средней части доски для прочности и мощного щелчка  HYBRID HOLYSHEET™ BI/BI CARBON - оплетка стекловолокном, в состав которого добавлен карбон. Такая комбинация снизила вес доски и повысила точность при укладке слоев. BI/BI Holysheet™: укладывается в двух направлениях под углом 90° градусов для лучшей гибкости и отзывчивости сноуборда  MAGIC BEAN™ RESIN - пропитка высокоэффективной смолой, в составе которой находятся бобы, имеет самый высокий коэффициент прочности к весу  Стальной кант расположен по всей длине доски, в том числе в хвостовой и носовой частях  PLT Topsheet Technology ™ - технология PLT™ является эксклюзивной для CAPiTA MFG и волшебным образом приклеивает верхний лист к уже спрессованному сноуборду. Машина производит легкое, гладкое, глянцевое покрытие без клея  Скользяк Quantum Drive™ Base, являясь эволюцией UltraDrive™, отличается повышенной плотностью для максимальной износостойкости, впитывает больше воска для более быстрого катания  Закладные из нержавеющей стали 4х2  Интеллектуальный чип Near Field Communication (NFC) - встроен в нос доски', '000TREI001038', '2025-05-26 17:23:41.982', '2025-05-26 17:23:41.982', '[{"url":"https://shop.wakepark.by/image/cache/catalog/25union/strata/slingshot25/d_2425_productimage_doa_148-520x520.png"}]', 'capitadoa2025w'),
	(21, 'Маска SPECT RED BULL FINK-01RE2 2025', 239, 6, 17, '', 'RED BULL FINK-01RE2 2025', 1, 'Очки Red Bull SPECT FINK имеют торическую линзу, которая имитирует кривизну человеческого глаза для оптимального зрения без искажений, а также технологию защиты от запотевания FSCAPE и коррекцию светопреломления FREE D, что делает их вашим идеальным партнером по команде на склонах.', '00EWY00600234', '2025-05-26 17:26:35.458', '2025-05-26 17:26:35.458', '[{"url":"https://shop.wakepark.by/image/cache/catalog/redbull/goggles/fink/snimokekrana2025-02-05v18.09.25-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/redbull/goggles/fink/snimokekrana2025-02-05v18.09.17-520x520.png"}]', 'redbullfink01re22025'),
	(22, 'Маска SPECT RED BULL PARK 016 2024', 199, 6, 17, '', 'PARK 016 2024', 1, 'Маска для сноуборда и горных лыж от Ред Булл и Спект с линзой CAT2. Крепкая оправа с универсальной линзой для любой погоды! RED BULL PARK - станет отличным дополнением для катания не только в парке, но и в любой части снежного склона ;)', '00EWY00600194', '2025-05-26 17:27:48.378', '2025-05-26 17:27:48.378', '[{"url":"https://shop.wakepark.by/image/cache/catalog/redbull23/park0166-520x520.png"}]', 'park0162024'),
	(23, 'Маска OUT OF Electra 2 Black IRID Green', 1219, 6, 17, '', 'OUT OF Electra 2 Black IRID Green', 1, 'Второе поколение горнолыжных очков с технологией IRID®: линза адаптируется к окружающему свету менее чем за 1 секунду! Жидкокристаллическая линза работает на солнечной энергии, никаких батареек. В сравнении с первым поколением Electra 2 охватывает больше световых ситуаций, она темнее на солнце и светлее в тени. Зеркальное покрытие специально разработанное для использования с инновационным фильтром IRID® обеспечивает четкую видимость, благодаря быстрой, но плавной смене цветов вы можете расслабиться и наслаждаться катанием.', '0000001218', '2025-05-26 17:28:57.968', '2025-05-26 17:28:57.968', '[{"url":"https://shop.wakepark.by/image/cache/catalog/outof/electra/xg200287-1000x1000-520x520.jpg"},{"url":"https://shop.wakepark.by/image/cache/catalog/outof/electra/snimokekrana2025-01-27v14.48.06-520x520.png"}]', 'outofelectra2blackiridgreen'),
	(24, 'Шлем KYOTO BAIZA BLACK', 159, 4, 18, 'L/XL', 'Шлем KYOTO BAIZA BLACK', 1, 'ехнические характеристики шлема:  Шлем для зимних видов спорта (унисекс) Регулируемая система вентиляции Внешний материал: сочетание пластиков ABS/EPS Внутренний материал: полистирол Съемные мягкие ушные накладки Надежная система крепления маски Интегрированная система активной вентиляции 14 вентиляционных отсеков Роторная система подгона размера Сертификация: Стандарт CPSC и EN', '00KRT00158', '2025-05-26 17:31:29.822', '2025-05-26 17:31:29.822', '[{"url":"https://shop.wakepark.by/image/cache/catalog/26capita/traekt/kyotoshlem/46372736-520x520.jpg"}]', 'kyotobaizablack'),
	(25, 'Шлем KYOTO SUBA II 2024 HELMET WARM GREY/BLACK', 299, 4, 18, 'S', 'KYOTO SUBA II 2024 HELMET WARM GREY/BLACK', 1, 'Технические характеристики шлема:  Шлем для зимних видов спорта Регулируемая активная фронтальная и верхняя вентиляция для оптимального воздухообмена Подкладка из сетки и флиса для максимального комфорта и тепла Мягкие термоформованные съемные накладки на уши Стреп для подбородка из мягкой шерпы Регулируемый ремешок с магнитной пряжкой Fidlock Magnetick Buckle Система регулировки размера скрыта внутри утеплителя для шеи Система крепления маски Сертификация: Стандарт EN1077 B', '00KRT00295', '2025-05-26 17:33:55.545', '2025-05-26 17:33:55.545', '[{"url":"https://shop.wakepark.by/image/cache/catalog/kyyoto/z40-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/kyyoto/z41-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/kyyoto/z42-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/kyyoto/z43-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/kyyoto/z44-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/kyyoto/z45-520x520.png"}]', 'kyotosubaii2024helmetwarmgreyblack'),
	(26, 'Шлем KYOTO TOSHI HELMET PINK', 189, 4, 18, 'L', 'Шлем KYOTO TOSHI HELMET PINK', 1, 'Технические характеристики шлема:  Шлем для зимних видов спорта (унисекс) Материал: поликарбонат, пластик EPS Регулируемый ремешок с пряжкой фаст-текс Съемная подкладка (можно стирать) Мягкие ушные накладки с технологией улучшенной слышимости (OSS) Надежная система крепления маски Интегрированная система вентиляции Роторная система подгона размера Небольшой вес: 410 г Сертификация: Стандарт CE - EN 1077:12/2007 Class B', '00KRT00188', '2025-05-26 17:36:17.393', '2025-05-26 17:36:17.393', '[{"url":"https://shop.wakepark.by/image/cache/catalog/crabgrabgloves/gruvhogaisj8wz32tzjte4yvbp0of409-520x520.jpeg"},{"url":"https://shop.wakepark.by/image/cache/catalog/crabgrabgloves/bd4p6z43exjibq1hdl4uh3wyg4p4ovjo-520x520.jpeg"},{"url":"https://shop.wakepark.by/image/cache/catalog/crabgrabgloves/8clkn2wtp4n84s88euvbjrya592x4182-520x520.jpeg"},{"url":"https://shop.wakepark.by/image/cache/catalog/crabgrabgloves/z8swyg4iy0si04vqe0g390t0cy0r5gb6-520x520.jpeg"},{"url":"https://shop.wakepark.by/image/cache/catalog/crabgrabgloves/srtarukuc5c689mbp194vuhs2ox0immi-520x520.jpeg"},{"url":"https://shop.wakepark.by/image/cache/catalog/crabgrabgloves/32l0bkkcatzzazvrp29vkmh4sub0jgjm-520x520.jpeg"},{"url":"https://shop.wakepark.by/image/cache/catalog/crabgrabgloves/nv4klw4qkdojfwwplhuaetk5rdppv3xs-520x520.jpeg"},{"url":"https://shop.wakepark.by/image/cache/catalog/crabgrabgloves/mjj5v1iuisdu82f4cz0ok3nlzg6afdy7-520x520.jpeg"}]', 'kyototoshihelmetpink'),
	(27, 'Детская защита спины (жилет) PROSURF BACK PROTECTOR VEST D3O 2021', 179, 5, 19, 'XXS', 'PROSURF BACK PROTECTOR VEST D3O 2021 kids', 1, 'Детский защитный жилет для сноуборда и горных лыж PROSURF BACK PROTECTION D3O  Защиты спины от PROSURF для сноуборда и горных лыж отлично спасёт Вас в любой неловкой ситуации. Благодаря инновационному материалу D3O Ваша спина и копчик будет защищён от падений и ударов на максимальном уровне!', '000KT00174', '2025-05-26 17:38:18.699', '2025-05-26 17:38:18.699', '[{"url":"https://shop.wakepark.by/image/cache/catalog/goggleprime/ps07-prosurf-zaschita-pozvonochnika-back-protector-vest-520x520.jpg"},{"url":"https://shop.wakepark.by/image/cache/catalog/prosurf/protec/30f10cf3081559c762dc737df895cefe-520x520.jpeg"}]', 'prosurfbackprotectorvestd3o2021kids'),
	(28, 'Чехол для сноуборда AMPLIFI CART BAG 2023', 279, 7, 20, '158', 'AMPLIFI CART BAG 2023', 1, 'Cart Bag — это высококачественная сумка для досок с мягкой подкладкой, которая безопасно и стильно доставит вашу доску в горы. Есть место для ботинок, внутренний ремешок для фиксации вашего снаряжения и потайной карман для инструментов и пропусков.', '00TR2K000262', '2025-05-26 17:40:20.722', '2025-05-26 17:40:20.722', '[{"url":"https://shop.wakepark.by/image/cache/catalog/deeluxe23/amp1-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/deeluxe23/amp2-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/deeluxe23/amp3-520x520.png"}]', 'amplificartbag2023'),
	(29, 'Чехол для сноуборда AMPLIFI CART BAG 2023', 279, 7, 20, '163', 'AMPLIFI CART BAG 2023', 1, 'Cart Bag — это высококачественная сумка для досок с мягкой подкладкой, которая безопасно и стильно доставит вашу доску в горы. Есть место для ботинок, внутренний ремешок для фиксации вашего снаряжения и потайной карман для инструментов и пропусков.', '00TR2K000262', '2025-05-26 17:40:53.106', '2025-05-26 17:40:53.106', '[{"url":"https://shop.wakepark.by/image/cache/catalog/deeluxe23/amp1-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/deeluxe23/amp2-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/deeluxe23/amp3-520x520.png"}]', 'amplificartbag2023'),
	(30, 'Куртка THIRTY TWO LIGHT ANORAK 2023 BLACK/TAN', 1019, 12, 9, 'L', 'THIRTY TWO LIGHT ANORAK 2023 BLACK/TAN', 0, 'Создав новый легкий анорак 2023 Light, райдер команды JP использовал свой более чем десятилетний опыт ношения верхней одежды Thirtytwo и сосредоточил всю свою мудрость и страсть на создании идеального вездеходного анорака.', '0034K09000429', '2025-05-26 17:44:08.811', '2025-05-26 17:44:08.811', '[{"url":"https://shop.wakepark.by/image/cache/catalog/32n/jacket/snimokekrana2025-01-04v14.00.06-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/32n/jacket/snimokekrana2025-01-04v14.00.39-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/32n/jacket/snimokekrana2025-01-04v14.00.27-520x520.png"}]', 'thirtytwolightanorak2023blacktan'),
	(31, 'Сноуборд JONES FLAGSHIP 2025', 2000, 1, 4, '164', 'JONES FLAGSHIP 2025', 1, 'Flagship — одна из самых внушающих уверенность фрирайд-досок в мире, которая превосходно проявляет себя на пухляке и сложном техническом рельефе. Эта доска обеспечивает невероятную точность при всплытии, карвинге, прыжках и прямолинейных спусках благодаря проверенной сужающейся направленной форме. Это сноуборд, который выведет ваш уровень катания на новый уровень и поможет вам стать одним из самых уверенных и агрессивных райдеров на горе.', '00E7WY0001945', '2025-05-27 19:38:13.248', '2025-05-27 19:38:13.248', '[{"url":"https://shop.wakepark.by/image/cache/catalog/25jones25/71asurpem1l._ac_uf10001000_ql80_-520x520.jpg"},{"url":"https://shop.wakepark.by/image/cache/catalog/25jones25/mens-flagship-snowboard%281%29-520x520.png"},{"url":"https://shop.wakepark.by/image/cache/catalog/25jones25/mens-flagship-snowboard-520x520.png"}]', 'jonesflagship2025');

-- Дамп структуры для таблица snowShop.Role
DROP TABLE IF EXISTS `Role`;
CREATE TABLE IF NOT EXISTS `Role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.Role: ~2 rows (приблизительно)
DELETE FROM `Role`;
INSERT INTO `Role` (`id`, `name`, `value`) VALUES
	(1, 'Администратор', 'ADMIN'),
	(2, 'Пользователь', 'USER');

-- Дамп структуры для таблица snowShop.Sex
DROP TABLE IF EXISTS `Sex`;
CREATE TABLE IF NOT EXISTS `Sex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.Sex: ~2 rows (приблизительно)
DELETE FROM `Sex`;
INSERT INTO `Sex` (`id`, `name`, `value`) VALUES
	(1, 'Мужской', 'MALE'),
	(2, 'Женский', 'FEMALE');

-- Дамп структуры для таблица snowShop.User
DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `roleId` int(11) NOT NULL,
  `sexId` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`),
  KEY `User_roleId_fkey` (`roleId`),
  KEY `User_sexId_fkey` (`sexId`),
  CONSTRAINT `User_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `User_sexId_fkey` FOREIGN KEY (`sexId`) REFERENCES `Sex` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.User: ~1 rows (приблизительно)
DELETE FROM `User`;
INSERT INTO `User` (`id`, `password`, `name`, `roleId`, `sexId`, `age`, `email`, `createdAt`, `updatedAt`) VALUES
	(15, '$2b$10$/ALArhaDdeHEoNdNoFuLbeDWLoajPdna1WBMNn9uIMZm3YZ6fv3Ni', 'Admin', 1, NULL, NULL, 'admin@gmail.com', '2025-04-07 21:11:22.914', '2025-04-07 21:11:22.914'),
	(17, '$2b$10$8ozPIK0MfObN310e7zMJh.Q51Av5ac6SEkvOf56xIKr32W1Z7dRNy', 'Artem', 2, NULL, NULL, 'artem.kostko@mail.ru', '2025-04-07 21:14:03.065', '2025-04-07 21:14:03.065'),
	(18, '$2b$10$yPVAK38lJJAV/KPaqEM6zuH3qea6gE7vKgBRwle.Sew2Tb3d8ygOG', 'Оля', 2, NULL, NULL, 'olya@gmail.com', '2025-04-08 20:40:34.889', '2025-04-08 20:40:34.889'),
	(19, '$2b$10$Tus0d73PZVH1KnofxLMKQOj1ZHOJqLfHaWetjo4vVYf/2twrEdxLq', 'Танюша', 2, NULL, NULL, 'tanysha@gmail.com', '2025-05-28 13:50:16.555', '2025-05-28 13:50:16.555');

-- Дамп структуры для таблица snowShop._prisma_migrations
DROP TABLE IF EXISTS `_prisma_migrations`;
CREATE TABLE IF NOT EXISTS `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop._prisma_migrations: ~4 rows (приблизительно)
DELETE FROM `_prisma_migrations`;
INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
	('2e748daa-361f-4999-b5a0-870b89cbeb7d', '9a7aa57c83ba31e2b7a9b9918d6bd5ca5ebcff8affb5f3ba69c52392e6802d1b', '2025-01-04 21:23:01.929', '20250104212301_added_product_brand_category_models', NULL, NULL, '2025-01-04 21:23:01.743', 1),
	('325e1a55-454a-4427-af59-5f9f8b8e3acb', 'cc284c058054fe0f042c5b8a872e07be6edf52d27d887090330844ae6f32e1da', '2025-05-29 11:31:48.251', '20250529113147_refactor_product_model', NULL, NULL, '2025-05-29 11:31:48.222', 1),
	('3a39c929-4d5b-4b86-90a3-de07c2d4ca31', '9ac64b88b37776b3ffefaec2a134ddb467f8df6a5019b569d9b850aaf688deb3', '2025-04-06 17:41:30.796', '20250406174130_changed_user_model', NULL, NULL, '2025-04-06 17:41:30.676', 1),
	('45d86c11-455c-46d6-9f16-d94ab5082b39', '561a59d4db602868a2dc973aa9193db6b51f8df85ebc0c023e805524dbaf7e06', '2025-05-25 11:45:35.086', '20250525114535_refactor_product_model', NULL, NULL, '2025-05-25 11:45:35.057', 1),
	('8cdfeb4f-e308-4f0f-b494-49e348caea1c', 'a110b8d30e0c3de5a4e9d71841e926de02868fcd32231bfdd76b1bd8c9643b63', '2024-12-25 19:41:30.386', '20241225194130_editing_user_model', NULL, NULL, '2024-12-25 19:41:30.268', 1),
	('9109f649-bf26-4c84-b10b-5f3a0b21d6f5', '839694791df1b65c21f5ca60024e641b33bb63d40781c279edbfd24cdea98187', '2025-01-05 16:43:05.784', '20250105164305_editing_product_model', NULL, NULL, '2025-01-05 16:43:05.694', 1),
	('ef6a94fe-475a-47f3-b368-4df7fafcd7a6', '23785395ac4942dc501e8eeb4b6a577c3aa20b65f7a38cf762c548e2aa711854', '2024-12-25 19:29:22.713', '20241222213545_add_user_role_sex_models', NULL, NULL, '2024-12-25 19:29:22.439', 1),
	('fc44b069-e1cd-48fc-8892-a185743550b4', '4ecc47de44be56fb15d0dccce3b4c064e8021f263bfc75da85a51efe9dff3325', '2025-05-28 18:38:16.748', '20250528183815_refactor_category_model', NULL, NULL, '2025-05-28 18:38:16.690', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
