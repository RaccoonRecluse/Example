-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 14 2022 г., 13:15
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kursach`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `text` varchar(2500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `img`, `text`) VALUES
(1, 'Тестовое название статьи', '/articles/image 52.png', 'Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. '),
(2, 'Тестовая статья', '/articles/image 52.png', 'Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. Текст для несуществующей статьи. Этот текст создан только в качестве проверки работоспособности web-приложения и не является советами по выращиванию каких-либо растений. ');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`) VALUES
(56, 5, 7),
(74, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `favorite_articles`
--

CREATE TABLE `favorite_articles` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `articles_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `favorite_articles`
--

INSERT INTO `favorite_articles` (`id`, `user_id`, `articles_id`) VALUES
(2, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `populars`
--

CREATE TABLE `populars` (
  `id` int NOT NULL,
  `id_product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `populars`
--

INSERT INTO `populars` (`id`, `id_product`) VALUES
(1, 1),
(3, 6),
(4, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `img` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `img`, `label`, `text`, `price`) VALUES
(1, '/products/image 50.png', 'Тестовый товар 1', 'Тестовое описание товара. Этот товар создан только для проверки функционала web-приложения и не является настоящим товаром.', '250.00₽'),
(6, '/products/image 50.png', 'Тестовый товар 4', 'Тестовое описание товара. Этот товар создан только для проверки функционала web-приложения и не является настоящим товаром. Тестовое описание товара. Этот товар создан только для проверки функционала web-приложения и не является настоящим товаром. ', '1500.00₽'),
(7, '/products/image 51.png', 'Тестовый товар 5', 'Тестовое описание. Данный товар не является ликвидным и создан для проверки работоспособности.', '200.00₽'),
(9, '/products/5IZAaVe2RR.png', 'Тестовое название55', 'описание', '505 ₽'),
(14, '/products/XkT5Ziw6YR.png', 'Товар', 'товар', '123 ₽'),
(15, '/products/hF7K9Fnptx.png', 'Product', 'test product', '576 ₽');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'testname1', '1test@gmail.com', 0, '$2y$10$fsrUtPysE2MG5zQkSzK8BecUwOJRhRaiezApcMhNbxpYARMMP8WkW', NULL, '2022-06-15 15:20:53', '2022-06-15 15:20:53'),
(2, 'testname1', '2test@gmail.com', 0, '$2y$10$AE4VOTSLroI6nIiko/rvbODWc8ShZQycx9TyiT3iZoTu7XyvuFhKq', NULL, '2022-06-15 16:40:40', '2022-06-15 16:40:40'),
(3, 'a@mail.com', 'a@mail.com', 0, '$2y$10$.gVScHbk0I61rH5A0haLROfHaZRLYl5iltH1AsuPJXr87XXmpX0/O', NULL, '2022-06-15 16:46:42', '2022-06-15 16:46:42'),
(4, 'test3', 'alex@mail.ru', 0, '$2y$10$ZVKRfiHiaKmkB2mL3R1hju4JxLtciHhYD1RhfHot7a3wqXDnab0Wq', NULL, '2022-06-15 16:48:27', '2022-06-15 16:48:27'),
(5, 'test4', 'w@d', 0, '$2y$10$2hGw.hBbhrsmCAm5xA28XO68FNY.eHSg39LXkwhpYZTQfQbENQyCK', NULL, '2022-06-15 17:05:38', '2022-06-15 17:05:38'),
(6, 'admin', 'ad@min', 2, '$2y$10$JSPjApnkLxJqmNZFz4eXNObi7kzGFtrjL0E0Beih5U9T.cb6quQ2W', NULL, '2022-06-16 17:22:45', '2022-06-16 17:22:45');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `favorite_articles`
--
ALTER TABLE `favorite_articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_id` (`articles_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `populars`
--
ALTER TABLE `populars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT для таблицы `favorite_articles`
--
ALTER TABLE `favorite_articles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `populars`
--
ALTER TABLE `populars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `favorite_articles`
--
ALTER TABLE `favorite_articles`
  ADD CONSTRAINT `favorite_articles_ibfk_1` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
