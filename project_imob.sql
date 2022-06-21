-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 17-Jun-2022 às 02:46
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `project_imob`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` int(10) UNSIGNED NOT NULL,
  `social_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_company` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_company_secondary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_user_foreign` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `companies`
--

INSERT INTO `companies` (`id`, `user`, `social_name`, `alias_name`, `document_company`, `document_company_secondary`, `zipcode`, `street`, `number`, `complement`, `neighborhood`, `state`, `city`, `created_at`, `updated_at`) VALUES
(1, 1, 'UpInside Teste', 'teste de cadastro de emprsa', '98415641984189', '165154151', '73807-260', 'Rua 13', '165', NULL, 'Setor Nordeste', 'GO', 'Formosa', '2022-06-02 19:23:57', '2022-06-02 19:23:57'),
(2, 2, 'UpInside Teste', 'teste de cadastro de emprsa', '98415641984189', '165154151', '73807-260', 'Rua 13', '165', NULL, 'Setor Nordeste', 'GO', 'Formosa', '2022-06-02 19:24:48', '2022-06-14 16:27:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contracts`
--

DROP TABLE IF EXISTS `contracts`;
CREATE TABLE IF NOT EXISTS `contracts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `owner_spouse` tinyint(1) DEFAULT NULL,
  `owner_company` int(10) UNSIGNED DEFAULT NULL,
  `acquirer` int(10) UNSIGNED NOT NULL,
  `acquirer_spouse` tinyint(1) DEFAULT NULL,
  `acquirer_company` int(10) UNSIGNED DEFAULT NULL,
  `property` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `tribute` double NOT NULL,
  `condominium` double NOT NULL,
  `due_date` int(10) UNSIGNED NOT NULL,
  `deadline` int(10) UNSIGNED NOT NULL,
  `start_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_owner_foreign` (`owner`),
  KEY `contracts_owner_company_foreign` (`owner_company`),
  KEY `contracts_acquirer_foreign` (`acquirer`),
  KEY `contracts_acquirer_company_foreign` (`acquirer_company`),
  KEY `contracts_property_foreign` (`property`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(28, '2014_10_12_000000_create_users_table', 2),
(29, '2014_10_12_100000_create_password_resets_table', 2),
(15, '2022_04_08_155627_alter_users_table_add_control_login', 1),
(16, '2022_04_11_222414_alter_users_table', 1),
(30, '2019_04_30_101605_alter_users_table_add_control_login', 2),
(31, '2019_04_30_141959_alter_users_table', 2),
(32, '2019_05_02_143411_create_companies_table', 2),
(33, '2019_05_03_110714_create_properties_table', 2),
(34, '2019_05_17_143211_create_property_images_table', 2),
(35, '2019_05_22_112138_create_contracts_table', 2),
(36, '2019_05_23_163552_alter_properties_table_add_status', 2),
(37, '2019_05_23_163733_alter_contracts_table_add_status', 2),
(38, '2022_05_30_161309_alter_properties_table_add_title_slug_headline_experience', 2),
(39, '2022_06_14_003750_add_properties_table_add_count_views', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `properties`
--

DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale` tinyint(1) DEFAULT NULL,
  `rent` tinyint(1) DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `rent_price` decimal(10,2) DEFAULT NULL,
  `tribute` decimal(10,2) DEFAULT NULL,
  `condominium` decimal(10,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `bedrooms` int(11) NOT NULL DEFAULT '0',
  `suites` int(11) NOT NULL DEFAULT '0',
  `bathrooms` int(11) NOT NULL DEFAULT '0',
  `rooms` int(11) NOT NULL DEFAULT '0',
  `garage` int(11) NOT NULL DEFAULT '0',
  `garage_covered` int(11) NOT NULL DEFAULT '0',
  `area_total` int(11) NOT NULL DEFAULT '0',
  `area_util` int(11) NOT NULL DEFAULT '0',
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `air_conditioning` tinyint(1) DEFAULT NULL,
  `bar` tinyint(1) DEFAULT NULL,
  `library` tinyint(1) DEFAULT NULL,
  `barbecue_grill` tinyint(1) DEFAULT NULL,
  `american_kitchen` tinyint(1) DEFAULT NULL,
  `fitted_kitchen` tinyint(1) DEFAULT NULL,
  `pantry` tinyint(1) DEFAULT NULL,
  `edicule` tinyint(1) DEFAULT NULL,
  `office` tinyint(1) DEFAULT NULL,
  `bathtub` tinyint(1) DEFAULT NULL,
  `fireplace` tinyint(1) DEFAULT NULL,
  `lavatory` tinyint(1) DEFAULT NULL,
  `furnished` tinyint(1) DEFAULT NULL,
  `pool` tinyint(1) DEFAULT NULL,
  `steam_room` tinyint(1) DEFAULT NULL,
  `view_of_the_sea` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `properties_user_foreign` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `properties`
--

INSERT INTO `properties` (`id`, `sale`, `rent`, `category`, `type`, `user`, `sale_price`, `rent_price`, `tribute`, `condominium`, `description`, `bedrooms`, `suites`, `bathrooms`, `rooms`, `garage`, `garage_covered`, `area_total`, `area_util`, `zipcode`, `street`, `number`, `complement`, `neighborhood`, `state`, `city`, `air_conditioning`, `bar`, `library`, `barbecue_grill`, `american_kitchen`, `fitted_kitchen`, `pantry`, `edicule`, `office`, `bathtub`, `fireplace`, `lavatory`, `furnished`, `pool`, `steam_room`, `view_of_the_sea`, `created_at`, `updated_at`, `status`, `title`, `slug`, `headline`, `experience`, `views`) VALUES
(1, 0, 1, 'Terreno', 'Sala Comercial', 2, '1500000.00', '4300.00', '100.00', '150.00', '<p>Linda casa de veraneio no lago</p>', 2, 1, 2, 1, 1, 1, 300, 150, '73802-405', 'Rua 26A', '55B', 'Setor Sul', 'Setor de Chácaras Sul', 'GO', 'Formosa', 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, '2022-06-02 19:26:02', '2022-06-14 15:23:46', 1, 'Linda casa de veraneio na beira do lago', 'linda-casa-de-veraneio-na-beira-do-lago-1', 'teste', 'De Frente para o Mar', 1),
(2, 1, 1, 'Imóvel Residencial', 'Apartamento', 2, '950000.00', '2500.00', '100.00', '350.00', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto cumque distinctio doloribus fugiat perspiciatis quae quaerat quod sint? Alias amet dolorum illum ipsa itaque laborum, porro praesentium quam. A atque in ut.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto cumque distinctio doloribus fugiat perspiciatis quae quaerat quod sint? Alias amet dolorum illum ipsa itaque laborum, porro praesentium quam. A atque in ut.</p>', 1, 1, 1, 1, 1, 0, 45, 35, '73807-065', 'Avenida Ivone Saad', '142', NULL, 'Vila Bela', 'GO', 'Formosa', 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, '2022-06-03 00:56:16', '2022-06-14 04:07:05', 1, 'Apartamento funcional a venda', 'apartamento-funcional-a-venda-2', 'Apartamento funcional a venda localizado próximo do Posto Ipiranga', 'Condomínio Fechado', 2),
(3, 1, 0, 'Imóvel Residencial', 'Apartamento', 2, '800000.00', '5000.00', '600.00', '200.00', '<p>Galpão para venda</p>', 0, 0, 3, 5, 2, 1, 600, 500, '73801120', 'Rua Senador Borba', '142A', 'Centro', 'Centro', 'GO', 'Formosa', 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, '2022-06-04 01:25:22', '2022-06-14 04:05:57', 1, 'Ótimo studio para morar ou para depósito', 'otimo-studio-para-morar-ou-para-deposito-3', 'Ótimo studio para morar ou para depósito numa ótima localização perto de supermercado,posto de combustivel e farmácia.', 'Alto Padrão', 3),
(4, 0, 1, 'Imóvel Residencial', 'Studio', 2, '0.00', '5000.00', '150.00', '280.00', '<p>Terreno de macumba para você realizar seus ritos</p>', 0, 0, 1, 1, 1, 0, 90, 85, '88058-500', 'Rua das Gaivotas', '13', NULL, 'Ingleses do Rio Vermelho', 'SC', 'Florianópolis', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, '2022-06-10 19:17:37', '2022-06-14 20:48:53', 1, 'Sua casa mobiliado tudo novo e confortavel', 'sua-casa-mobiliado-tudo-novo-e-confortavel-4', 'apartamento mobiliado tudo novo e confortavel venha conhecer', 'Alto Padrão', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `property_images`
--

DROP TABLE IF EXISTS `property_images`;
CREATE TABLE IF NOT EXISTS `property_images` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `property` int(10) UNSIGNED NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property_images_property_foreign` (`property`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `property_images`
--

INSERT INTO `property_images` (`id`, `property`, `path`, `cover`, `created_at`, `updated_at`) VALUES
(21, 3, 'properties/3/AbfhLWlVrx72Px35JYKZaRWpMavRGQi5R9LaceCW.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(20, 3, 'properties/3/hsysLBsyBNHvHkFet0rxRqYCxTphsGzHZIlTFVUd.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(19, 3, 'properties/3/56AqkMY8QDK5aX39BU3JHFAtPvRR2tU86pPtJeUr.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(18, 3, 'properties/3/HVOx4F9sFq2jNIT0wRsjkkzlJY6XfXD9Rf1PahZ2.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(17, 3, 'properties/3/tTGWsmwbnlQSIpu06vhXijWDXUzPnViyelMwXZ78.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(16, 3, 'properties/3/QyHcCaXrr4sVtztqvwoEluENj9VW1Eqbg57QOdlv.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(15, 3, 'properties/3/btp4Sc3X0xuE7UoT9sKK3IG4EPmfajBbBSlpFgEy.jpg', 1, '2022-06-10 19:12:04', '2022-06-10 19:12:17'),
(42, 1, 'properties/1/G0pQAbooHgdmm4so9QTaPFXltZ0djIt8YmRqwEjM.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(26, 2, 'properties/2/Kd6Zwuyw6sXRtUztrWU7zWos67XBSiPtYVx07Kxk.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(41, 1, 'properties/1/vFeMlXdZybmjIYkPfGbgYESA3V28no8RCm1YpSrX.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(22, 3, 'properties/3/LHpiMoXGmSm1VPnNzKXANfdEreiP2vreLHThxGZi.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(23, 3, 'properties/3/ZSafy8d0UVSvqTwWmTMW2RhWY1sT7xLGhBg5i3xp.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(24, 3, 'properties/3/ytAiJO1Ur9jBRVHGzODlVE8xZ5xd6RbkRD57YSAg.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(25, 3, 'properties/3/ELEshm3DIUUu3oLfmqlOXYhrxou6ZjkQwz7OLuBo.jpg', NULL, '2022-06-10 19:12:04', '2022-06-10 19:12:04'),
(27, 2, 'properties/2/Alr3muniwUuOhKZlepsQzpiftWfufSuQvm126yro.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(28, 2, 'properties/2/MNBDHyAK96yTZLCOu4tQlGBrsi6NGLZ0exRUCbHf.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(29, 2, 'properties/2/EBoSuRdlHV1UaJ6e2XJUVbFp8yCE0c97RCXu1Sg2.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(30, 2, 'properties/2/Q6qOETfdD8grJ52LJi2PeWyMAUcb5WevUSQCbIeM.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(31, 2, 'properties/2/av6uaY7jds2ucyetXOzVKdFxvqAouJlRDPkyyuif.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(32, 2, 'properties/2/GpTRF1D0jcsbi6t7FG0eVpYgr2qk5sqiW25TH8js.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(33, 2, 'properties/2/bX0DbviiGvWQfINsqTADFlVLFz1RoQSwbj36XFQe.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(34, 2, 'properties/2/mvP4h8gL4wmYOQDTm0nx586cFQyN5gbDwP0zg78I.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(35, 2, 'properties/2/VVxL8ED5XzuWWpdcc5rp4fwHU8PfWyBdrjjN4DI1.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(36, 2, 'properties/2/S9yevJWKjFU9eQc7Ocv55RWfwoldGhgIwiN8y1OP.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(37, 2, 'properties/2/5uvKdw8SfJkn7uQpk3YOOJOoOip85jivGbauKmZ8.jpg', 1, '2022-06-10 19:13:11', '2022-06-10 19:13:18'),
(38, 2, 'properties/2/PPUo8bVjy633O5lrna2iwztIUTpjC3b19WVRAgK7.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(39, 2, 'properties/2/lLxx10Px225eurL9GM9ppdLOdw8dbpiXMu7Od61D.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(40, 2, 'properties/2/13HTPwzQ1I6p5czobrOttMfGDtlHXD3L0uUsFM5P.jpg', NULL, '2022-06-10 19:13:11', '2022-06-10 19:13:11'),
(43, 1, 'properties/1/hoX5Llk9MtGcPW3Y3CWEsEHUHm5S07e6eDWCDUA4.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(44, 1, 'properties/1/ZswSregE4hIh4439Xf6TxaH2dTJgqDtt97aPSJt1.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(45, 1, 'properties/1/aVmfjkYYshOwQJgEAJ6pwR4hOhGukguaY1MCwUIm.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(46, 1, 'properties/1/tcOlxKvOxO6QE8EgYEi1OIN0RCgg5wjKHtXunGjB.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(47, 1, 'properties/1/Oqan6adE2Nuljn8Y7gqKk4hWfyBQgHTkju3Wcz6J.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(48, 1, 'properties/1/GGw4fYrmbPYlD3R1o7FaIlGoV4uiMaVsmQ9Pldh9.jpg', 1, '2022-06-10 19:14:51', '2022-06-10 19:14:56'),
(49, 1, 'properties/1/RXC6rwoycIFo7PqHS1S9jEZ3FlM40TLL5CdeYAp7.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(50, 1, 'properties/1/nQrkSGIGewOLvEeWzAjevzdmDbqWaiIJyqR0t5T0.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(51, 1, 'properties/1/wdm6Ldbo9Wjg4uHPnLCBMXlldpMJRDSyhylgLMin.jpg', NULL, '2022-06-10 19:14:51', '2022-06-10 19:14:51'),
(52, 4, 'properties/4/aSMs9GBpDPVVf1WAky3GYQ4RmaZtxqY5jG3GxOJD.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(53, 4, 'properties/4/zkvNRKUoRSY6qVGjDAqK4c7y0pMzC3XAscjSButg.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(54, 4, 'properties/4/EF6K8hI4CBiktHcHD1KaQSpv69J5JwUbHdrBpXHM.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(55, 4, 'properties/4/vDN38gYk6uy2Qj3Yn0ldamEIrshnKusy5xzDigRk.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(56, 4, 'properties/4/HainUPjyHvMM5O52DTtgDq9dJTANRev97DLFGgqs.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(57, 4, 'properties/4/aiE9KRzuwAGFFqibkQIkUexVesjHuoQYoVC8N9GE.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(58, 4, 'properties/4/YCmhj45Oap6fZQpRWki3osVTRCKUBYNZAB3A44iB.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(59, 4, 'properties/4/sN3MIIjVKXb2aMVTlh0MQG1niLScptjPl8j5FlWs.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(60, 4, 'properties/4/oFjCpWj4wQ6BHvab56yShmmxtzcb5hp0gtdCl3eg.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(61, 4, 'properties/4/rq1vf43smuPAQ6mqstZaGPYiZxtNhpmwz95IuIjr.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(62, 4, 'properties/4/db6dq6ByHBUov8lbL1o0C1y8avOqRo9Guasj3a77.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(63, 4, 'properties/4/F8UMXTcUYERc3HfPSj2BgwVWwdhWi5AsnXqqlN17.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(64, 4, 'properties/4/IK9Smd3abu7bPNDu8NCwBdXcD9Pivdmv8jiuH5pf.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(65, 4, 'properties/4/hzUYjFgM021CCjxo8hyXUnECpcNB5ALvdv4G6Cvc.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(66, 4, 'properties/4/wFufK916EzieQBAGFCeVYY0qOssKz8y4PG6nlaGm.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(67, 4, 'properties/4/B0unGt57d7TNtCULvNOLdDJSnqkoIZ9ocKA5HujD.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(68, 4, 'properties/4/y2q5BJ1TsQgSvOv7GdrtURcsVfq3Pbkfl1o6uPcg.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(69, 4, 'properties/4/l13kUgZJVBn2KKYMWOiWZu8h8Y3dZhXoK4iD9Pfi.jpg', 1, '2022-06-10 19:18:59', '2022-06-10 19:19:11'),
(70, 4, 'properties/4/ADKC9VC0hVmEx5Q7gxv8j3cRj5fEax9mWdn7E49p.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59'),
(71, 4, 'properties/4/hJdPqY1OAW2dDOt6kyRLFUfTpZZYpvybBxPLOWBp.jpg', NULL, '2022-06-10 19:18:59', '2022-06-10 19:18:59');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lessor` tinyint(1) DEFAULT NULL,
  `lessee` tinyint(1) DEFAULT NULL,
  `genre` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_secondary` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_secondary_complement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civil_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income` double(10,2) DEFAULT NULL,
  `company_work` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cell` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_communion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_genre` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_document` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spouse_document_secondary` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_document_secondary_complement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_date_of_birth` date DEFAULT NULL,
  `spouse_place_of_birth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_income` double(10,2) DEFAULT NULL,
  `spouse_company_work` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `client` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_document_unique` (`document`),
  UNIQUE KEY `users_spouse_document_unique` (`spouse_document`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `last_login_at`, `last_login_ip`, `lessor`, `lessee`, `genre`, `document`, `document_secondary`, `document_secondary_complement`, `date_of_birth`, `place_of_birth`, `civil_status`, `cover`, `occupation`, `income`, `company_work`, `zipcode`, `street`, `number`, `complement`, `neighborhood`, `state`, `city`, `telephone`, `cell`, `type_of_communion`, `spouse_name`, `spouse_genre`, `spouse_document`, `spouse_document_secondary`, `spouse_document_secondary_complement`, `spouse_date_of_birth`, `spouse_place_of_birth`, `spouse_occupation`, `spouse_income`, `spouse_company_work`, `admin`, `client`) VALUES
(2, 'Administrador', 'olauritoneto@gmail.com', '2022-06-14 02:49:30', '$2y$10$ZM2eFa.BctV6A1rG4wSXGeoBuuBFJS6d2LCHtpSKJG3B9sIskQbRC', 'oWOydWQ9o516BbzBGdkVnt5vW8bxaYEwhp1MkG5saAAB3GAI5pGQDfUHAZAU', NULL, '2022-06-17 02:03:58', '2022-06-16 23:03:58', '::1', 1, 1, 'male', '15665516665', '65664156', 'DGCP/GO', '1969-12-31', 'Brasilia/DF', 'single', NULL, 'Programador', 5200.00, 'Marketing Ndigital', '73807260', 'Rua 13', '165', 'Setor Sul', 'Setor Nordeste', 'GO', 'Formosa', '6199619274', '61996192741', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
