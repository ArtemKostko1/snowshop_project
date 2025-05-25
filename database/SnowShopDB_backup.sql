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
CREATE DATABASE IF NOT EXISTS `snowShop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `snowShop`;

-- Дамп структуры для таблица snowShop.Brand
CREATE TABLE IF NOT EXISTS `Brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.Brand: ~16 rows (приблизительно)
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
	(16, 'Madshus');

-- Дамп структуры для таблица snowShop.Category
CREATE TABLE IF NOT EXISTS `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.Category: ~14 rows (приблизительно)
DELETE FROM `Category`;
INSERT INTO `Category` (`id`, `name`) VALUES
	(1, 'Сноуборды'),
	(2, 'Крепления для сноуборда'),
	(3, 'Ботинки для сноуборда'),
	(4, 'Сноуборд комплекты'),
	(5, 'Шлемы'),
	(6, 'Защита'),
	(7, 'Маски'),
	(8, 'Чехлы для сноуборда и горных лыж'),
	(9, 'Лыжи'),
	(10, 'Лыжные ботинки'),
	(11, 'Лыжные палки'),
	(12, 'Лыжные крепления'),
	(13, 'Лыжные комплекты'),
	(14, 'Горнолыжная одежда');

-- Дамп структуры для таблица snowShop.Product
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
  PRIMARY KEY (`id`),
  KEY `Product_categoryId_fkey` (`categoryId`),
  KEY `Product_brandId_fkey` (`brandId`),
  CONSTRAINT `Product_brandId_fkey` FOREIGN KEY (`brandId`) REFERENCES `Brand` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.Product: ~9 rows (приблизительно)
DELETE FROM `Product`;
INSERT INTO `Product` (`id`, `name`, `price`, `categoryId`, `brandId`, `size`, `article`, `inStock`, `description`, `internalCode`, `createdAt`, `updatedAt`) VALUES
	(1, 'Сноуборд CAPITA MEGA MERCURY 2025', 3299, 1, 5, '159', 'CAPITA MEGA MERC 2025', 1, 'Сноуборд CAPITA MEGA MERC 2025. Вот он! Идеальное устройство для любых условий: в любое время, в любом месте, на любом рельефе и в любом снегу — MEGA MERC. Вдохновлённый универсальностью серии Mercury, MEGA MERC сохраняет проверенные технические линии дизайна, но теперь дополнен серьёзными улучшениями конструкции. Создан для максимальной мощности, когда она нужна, и лёгкости, когда это необходимо. MEGA MERC — это ультрапремиальный сноуборд для катания в любых условиях, на который можно положиться. Ультралёгкий и ультрауниверсальный, MEGA MERC оснащён сердцевиной 3D Thermopolymer Starship Core™, новой гибридной конфигурацией Holy-Sheet™ Tri/Tri MEGACARBON™ и базой MEGADRIVE™ XT, обеспечивающими беспрецедентную производительность на любом рельефе.', '000TREI001730', '2025-01-05 16:53:56.860', '2025-01-05 16:54:43.786'),
	(2, 'Сноуборд CAPITA MEGA MERCURY 2025', 3299, 1, 5, '161', 'CAPITA MEGA MERC 2025', 1, 'Сноуборд CAPITA MEGA MERC 2025. Вот он! Идеальное устройство для любых условий: в любое время, в любом месте, на любом рельефе и в любом снегу — MEGA MERC. Вдохновлённый универсальностью серии Mercury, MEGA MERC сохраняет проверенные технические линии дизайна, но теперь дополнен серьёзными улучшениями конструкции. Создан для максимальной мощности, когда она нужна, и лёгкости, когда это необходимо. MEGA MERC — это ультрапремиальный сноуборд для катания в любых условиях, на который можно положиться. Ультралёгкий и ультрауниверсальный, MEGA MERC оснащён сердцевиной 3D Thermopolymer Starship Core™, новой гибридной конфигурацией Holy-Sheet™ Tri/Tri MEGACARBON™ и базой MEGADRIVE™ XT, обеспечивающими беспрецедентную производительность на любом рельефе.', '000TREI001730', '2025-01-05 16:55:16.903', '2025-01-05 16:55:16.903'),
	(3, 'Ботинки для сноуборда NIDECKER ALTAI 2025 GRAY', 1399, 3, 1, '44.5', 'NIDECKER ALTAI 2025 GRAY', 1, 'Altai - это центральная часть коллекции ботинок Nidecker, предлагающая первоклассные характеристики и поддержку по непревзойденной цене. В асимметричном верхе устранены точки давления, а шнурки Dual-Dial BOA® позволяют затягивать верхнюю и нижнюю части независимо друг от друга. Термоформовка Silver Liner позволяет настроить ботинок под себя.', '000KTR00980', '2025-01-05 21:40:39.015', '2025-01-05 21:40:39.015'),
	(4, 'Ботинки для сноуборда NIDECKER ALTAI 2025 GRAY', 1399, 3, 3, '45', 'NIDECKER ALTAI 2025 GRAY', 1, 'Altai - это центральная часть коллекции ботинок Nidecker, предлагающая первоклассные характеристики и поддержку по непревзойденной цене. В асимметричном верхе устранены точки давления, а шнурки Dual-Dial BOA® позволяют затягивать верхнюю и нижнюю части независимо друг от друга. Термоформовка Silver Liner позволяет настроить ботинок под себя.', '000KTR00980', '2025-01-05 21:41:21.307', '2025-01-05 21:41:21.307'),
	(5, 'Ботинки для сноуборда NIDECKER ALTAI 2025 GRAY', 1399, 3, 3, '44', 'NIDECKER ALTAI 2025 GRAY', 1, 'Altai - это центральная часть коллекции ботинок Nidecker, предлагающая первоклассные характеристики и поддержку по непревзойденной цене. В асимметричном верхе устранены точки давления, а шнурки Dual-Dial BOA® позволяют затягивать верхнюю и нижнюю части независимо друг от друга. Термоформовка Silver Liner позволяет настроить ботинок под себя.', '000KTR00980', '2025-01-05 21:41:27.393', '2025-01-05 21:41:27.393'),
	(6, 'Ботинки для сноуборда NIDECKER ALTAI 2025 GRAY', 1399, 3, 3, '42', 'NIDECKER ALTAI 2025 GRAY', 1, 'Altai - это центральная часть коллекции ботинок Nidecker, предлагающая первоклассные характеристики и поддержку по непревзойденной цене. В асимметричном верхе устранены точки давления, а шнурки Dual-Dial BOA® позволяют затягивать верхнюю и нижнюю части независимо друг от друга. Термоформовка Silver Liner позволяет настроить ботинок под себя.', '000KTR00980', '2025-01-05 21:41:34.794', '2025-01-05 21:41:34.794'),
	(7, 'Крепления для сноуборда NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1599, 2, 3, 'M', 'NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1, 'Сноуборд крепления Nidecker Supermatic — это то, чего так ждали сноубордисты: первое универсальное автоматическое крепление с двойной системой встёгивания. Supermatic работает с помощью откидывающегося хайбека \'Drop In tech\'. Удобный рычаг разблокировки делает выход таким же быстрым. Чтобы каждый раз наслаждаться идеальной посадкой, просто один раз настройте их, а затем зафиксируйте стрепы с помощью алюминиевых фиксаторов. Прелесть этой системы в том, что она работает с ботинками любого производителя, и в ней нет сложного механизма, который может забиться. Вы так же можете встегнуться как в обычное крепление, если уклон или снежные условия этого требуют. Совершенно новая опорная пластина изготовлена из прочного усиленного нейлона с накладкой Slip-N-Grip, кото. Композитный хайбэк Asym Hadron разработан для идеальной посадки, с отзывчивым флексом и встроенной регулировкой наклона хайбека. Это крепления средней жесткости, которые команда Nidecker оценила, как наиболее удобное на сегодняшний день.', '00EWY0001336', '2025-01-05 21:44:15.666', '2025-01-05 21:44:15.666'),
	(8, 'Крепления для сноуборда NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1599, 2, 3, 'L', 'NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1, 'Сноуборд крепления Nidecker Supermatic — это то, чего так ждали сноубордисты: первое универсальное автоматическое крепление с двойной системой встёгивания. Supermatic работает с помощью откидывающегося хайбека \'Drop In tech\'. Удобный рычаг разблокировки делает выход таким же быстрым. Чтобы каждый раз наслаждаться идеальной посадкой, просто один раз настройте их, а затем зафиксируйте стрепы с помощью алюминиевых фиксаторов. Прелесть этой системы в том, что она работает с ботинками любого производителя, и в ней нет сложного механизма, который может забиться. Вы так же можете встегнуться как в обычное крепление, если уклон или снежные условия этого требуют. Совершенно новая опорная пластина изготовлена из прочного усиленного нейлона с накладкой Slip-N-Grip, кото. Композитный хайбэк Asym Hadron разработан для идеальной посадки, с отзывчивым флексом и встроенной регулировкой наклона хайбека. Это крепления средней жесткости, которые команда Nidecker оценила, как наиболее удобное на сегодняшний день.', '00EWY0001336', '2025-01-05 21:44:22.887', '2025-01-05 21:44:22.887'),
	(9, 'Крепления для сноуборда NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1599, 2, 3, 'XL', 'NIDECKER SUPERMATIC 2025 ESCAPECYAN', 1, 'Сноуборд крепления Nidecker Supermatic — это то, чего так ждали сноубордисты: первое универсальное автоматическое крепление с двойной системой встёгивания. Supermatic работает с помощью откидывающегося хайбека \'Drop In tech\'. Удобный рычаг разблокировки делает выход таким же быстрым. Чтобы каждый раз наслаждаться идеальной посадкой, просто один раз настройте их, а затем зафиксируйте стрепы с помощью алюминиевых фиксаторов. Прелесть этой системы в том, что она работает с ботинками любого производителя, и в ней нет сложного механизма, который может забиться. Вы так же можете встегнуться как в обычное крепление, если уклон или снежные условия этого требуют. Совершенно новая опорная пластина изготовлена из прочного усиленного нейлона с накладкой Slip-N-Grip, кото. Композитный хайбэк Asym Hadron разработан для идеальной посадки, с отзывчивым флексом и встроенной регулировкой наклона хайбека. Это крепления средней жесткости, которые команда Nidecker оценила, как наиболее удобное на сегодняшний день.', '00EWY0001336', '2025-01-05 21:44:31.992', '2025-01-05 21:44:31.992');

-- Дамп структуры для таблица snowShop.Role
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы snowShop.User: ~3 rows (приблизительно)
DELETE FROM `User`;
INSERT INTO `User` (`id`, `password`, `name`, `roleId`, `sexId`, `age`, `email`, `createdAt`, `updatedAt`) VALUES
	(15, '$2b$10$/ALArhaDdeHEoNdNoFuLbeDWLoajPdna1WBMNn9uIMZm3YZ6fv3Ni', 'Admin', 1, NULL, NULL, 'admin@gmail.com', '2025-04-07 21:11:22.914', '2025-04-07 21:11:22.914'),
	(17, '$2b$10$8ozPIK0MfObN310e7zMJh.Q51Av5ac6SEkvOf56xIKr32W1Z7dRNy', 'Artem', 2, NULL, NULL, 'artem.kostko@mail.ru', '2025-04-07 21:14:03.065', '2025-04-07 21:14:03.065'),
	(18, '$2b$10$yPVAK38lJJAV/KPaqEM6zuH3qea6gE7vKgBRwle.Sew2Tb3d8ygOG', 'Оля', 2, NULL, NULL, 'olya@gmail.com', '2025-04-08 20:40:34.889', '2025-04-08 20:40:34.889');

-- Дамп структуры для таблица snowShop._prisma_migrations
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

-- Дамп данных таблицы snowShop._prisma_migrations: ~5 rows (приблизительно)
DELETE FROM `_prisma_migrations`;
INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
	('2e748daa-361f-4999-b5a0-870b89cbeb7d', '9a7aa57c83ba31e2b7a9b9918d6bd5ca5ebcff8affb5f3ba69c52392e6802d1b', '2025-01-04 21:23:01.929', '20250104212301_added_product_brand_category_models', NULL, NULL, '2025-01-04 21:23:01.743', 1),
	('3a39c929-4d5b-4b86-90a3-de07c2d4ca31', '9ac64b88b37776b3ffefaec2a134ddb467f8df6a5019b569d9b850aaf688deb3', '2025-04-06 17:41:30.796', '20250406174130_changed_user_model', NULL, NULL, '2025-04-06 17:41:30.676', 1),
	('8cdfeb4f-e308-4f0f-b494-49e348caea1c', 'a110b8d30e0c3de5a4e9d71841e926de02868fcd32231bfdd76b1bd8c9643b63', '2024-12-25 19:41:30.386', '20241225194130_editing_user_model', NULL, NULL, '2024-12-25 19:41:30.268', 1),
	('9109f649-bf26-4c84-b10b-5f3a0b21d6f5', '839694791df1b65c21f5ca60024e641b33bb63d40781c279edbfd24cdea98187', '2025-01-05 16:43:05.784', '20250105164305_editing_product_model', NULL, NULL, '2025-01-05 16:43:05.694', 1),
	('ef6a94fe-475a-47f3-b368-4df7fafcd7a6', '23785395ac4942dc501e8eeb4b6a577c3aa20b65f7a38cf762c548e2aa711854', '2024-12-25 19:29:22.713', '20241222213545_add_user_role_sex_models', NULL, NULL, '2024-12-25 19:29:22.439', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
