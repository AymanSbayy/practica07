-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para practica07
DROP DATABASE IF EXISTS `practica07`;
CREATE DATABASE IF NOT EXISTS `practica07` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `practica07`;

-- Volcando estructura para tabla practica07.articles
DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `art` text COLLATE utf8mb4_general_ci NOT NULL,
  `Títol` text COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla practica07.articles: ~32 rows (aproximadamente)
INSERT IGNORE INTO `articles` (`ID`, `art`, `Títol`, `user_id`) VALUES
	(1, 'Descobreix com el ioga pot millorar la teva salut', 'Els Beneficis del Ioga', 0),
	(2, 'dkjjglkdjgkldsglksnfksklfsa', 'Hola', 0),
	(3, 'Pepe se esta cambiando', 'Pepe', 0),
	(4, 'hfgjfgjfgjgfjfgjf', 'gfjfghjfgj', 0),
	(5, 'PEPEPEPEEEEEEEEEEEEEEEEEEEEEEEEE', 'PEPEPEPEPEPEPE', 0),
	(6, ',fnajsfnasdnfsdfsadfasdfasfd', 'Els Beneficis del Ioga', 0),
	(7, 'Descobreix les joies culturals i culinàries d\'aquesta ciutat espanyola.', 'Guia de Barcelona: Cultura i Gastronomia', 0),
	(10, 'Un viatge a través del temps per conèixer aquests increïbles animals prehistòrics.', 'La Història dels Dinosaures', 0),
	(12, 'Cures de la pell i secrets per a una tez saludable.', 'Consells per a una Pell Radiant', 0),
	(15, 'Com explorar el món sense trencar la butxaca.', 'Viatjar Amb Pressupost: Consells i Trucs', 0),
	(17, 'Delicioses receptes i beneficis per a la salut de la dieta mediterrània.', 'L\'Art de la Cuina Mediterrània', 0),
	(18, 'Una mirada a la natura majestuosa d\'aquesta regió sud-americana.', 'La Màgia de la Patagònia Argentina', 0),
	(19, 'Com ser més eficient en la teva vida quotidiana.', 'Estratègies per la Productivitat Personal', 0),
	(20, 'Descobreix el procés de creació cinematogràfica.', 'L\'Univers del Cinema: Com Fer una Pel·lícula', 0),
	(21, 'Consells i trucs per crear i mantenir un jardí exuberant.', 'L\'Art de la Jardineria', 0),
	(22, 'Un recorregut per aquesta espectacular regió italiana a la vora del mar.\r\n', 'La Bellesa de la Costa Amalfitana', 0),
	(23, 'Reflexions sobre la presa de decisions morals i ètiques.\r\n', 'Com Prendre Decisions Ètiques', 0),
	(24, 'Les últimes notícies sobre la missió a Mart', 'La Ciència de l\'Espai: L\'Exploració de Mart', 0),
	(25, 'Probando si esto funcionaaaaa jejeje', 'Article De Prova', 0),
	(26, 'probandoprobandoprobandoprobandoprobandoprobandoprobandoprobandoprobandoprobandoprobandoprobandoprobando', 'Article De Proba3', 0),
	(27, 'rwfasdffsfsad', 'wrqwrqwer', 0),
	(28, 'dfsdfsfsf', 'Article De Prova', 0),
	(29, 'adasdadasd', 'adasdsa', 0),
	(30, 'PEPEPEPEPEPEPPEPEPEPEPEPEPEPE', 'PEPEPEPEP', 0),
	(31, 'mslñfsñlfmlsñdfmñlsd', 'lñsmflmsdfsdfm', 0),
	(61, 'Este artículo ofrece consejos prácticos para mejorar tus habilidades de programación, incluyendo la práctica regular, la participación en proyectos de código abierto y la búsqueda de retroalimentación', 'Cómo mejorar tus habilidades de programación', 1),
	(62, 'La meditación puede tener numerosos beneficios para la salud mental, incluyendo la reducción del estrés, la mejora del enfoque y la promoción de la claridad mental. Este artículo explora algunos de estos beneficios', 'Los beneficios de la meditación para la salud mental', 1),
	(63, 'Cultivar un jardín de hierbas en casa puede ser una forma gratificante de mejorar la cocina y disfrutar de productos frescos durante todo el año. Este artículo ofrece consejos sobre cómo comenzar y mantener un jardín de hierbas', 'Cómo cultivar un jardín de hierbas en casa', 1),
	(64, 'El trabajo remoto puede ofrecer flexibilidad y comodidad, pero también presenta desafíos únicos en términos de productividad. Este artículo proporciona consejos prácticos para maximizar la productividad mientras se trabaja desde casa', 'Consejos para mejorar la productividad en el trabajo remoto', 1),
	(65, 'América del Sur ofrece una amplia gama de destinos emocionantes para los viajeros con presupuesto limitado. Desde las selvas tropicales de la Amazonía hasta las playas vírgenes de la costa, este artículo destaca algunos de los mejores lugares para mochileros en la región', 'Los mejores destinos para mochileros en América del Sur', 1),
	(66, 'Elegir el equipo de camping adecuado es esencial para una experiencia al aire libre exitosa y cómoda. Este artículo ofrece consejos sobre cómo seleccionar las tiendas de campaña, sacos de dormir, mochilas y otros equipos necesarios para tu próxima aventura', 'Cómo elegir el mejor equipo de camping para tu próxima aventura al aire libre', 1),
	(67, 'Adoptar una dieta vegana puede tener beneficios significativos para la salud personal y el medio ambiente. Desde la reducción del riesgo de enfermedades crónicas hasta la disminución de la huella de carbono, este artículo explora los impactos positivos de una dieta basada en plantas', 'Los beneficios de una dieta vegana para la salud y el medio ambiente', 1),
	(77, 'asdfasdfads', 'safdsadf', 14);

-- Volcando estructura para tabla practica07.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla practica07.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla practica07.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla practica07.migrations: ~0 rows (aproximadamente)
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_04_04_131548_update_users_table', 2),
	(6, '2024_04_04_142246_update_users_table', 3);

-- Volcando estructura para tabla practica07.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla practica07.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla practica07.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla practica07.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla practica07.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_auth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla practica07.users: ~0 rows (aproximadamente)
INSERT IGNORE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `avatar`, `external_id`, `external_auth`) VALUES
	(1, 'Aymannn', 'ayman.zekkari2@gmail.com', NULL, '$2y$12$cv4uVkjeV1gxCdC0POt6eOgM97KMeoRVqf45KgGeVZw/RmoXN4zWi', 'BepAucJd9jNMyBVNLHbvMauIOEKuzfFyjfZFd4XT7uaSVgkdFnN4fRcVZXR3', '2024-03-13 09:23:36', '2024-04-04 15:02:03', NULL, NULL, NULL),
	(2, 'Xavier', 'xavi@gmail.com', NULL, '$2y$12$ESdavaeHA3tnpVabtQors.KPRwSwXPXrsctrJFVTSGMwt8cE0dm7y', NULL, '2024-03-18 17:42:01', '2024-03-18 17:42:01', NULL, NULL, NULL),
	(13, '3223', 'as@a.com', NULL, '$2y$12$GdGvD/kbZDXPHB0B.XsKtumEo6ee0CvZu7eaSYFVZ6THkYDqvCsSe', NULL, '2024-04-04 12:56:26', '2024-04-04 12:56:26', NULL, NULL, NULL),
	(14, 'Ayman Sbay Zekkari', 'a.sbay@sapalomera.cat', NULL, NULL, NULL, '2024-04-04 13:27:58', '2024-04-04 13:27:58', NULL, '116584427614458642589', 'google');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
