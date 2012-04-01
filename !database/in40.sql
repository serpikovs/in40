-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 01 2012 г., 09:17
-- Версия сервера: 5.5.16
-- Версия PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `in40`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_proc`()
BEGIN
	select * from categories where id>=2;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `ban_list`
--

CREATE TABLE IF NOT EXISTS `ban_list` (
  `user_id` int(11) NOT NULL,
  `up_to` datetime NOT NULL,
  `reason` text NOT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `date`, `ordering`) VALUES
(1, 'Категория 1', '2012-01-17 00:00:00', 1),
(2, 'Категория 2', '2012-01-17 00:00:00', 2),
(3, 'Категория 3', '2012-01-17 00:00:00', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `categories_permissions`
--

CREATE TABLE IF NOT EXISTS `categories_permissions` (
  `user_group_id` int(11) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`user_group_id`,`permission`,`category_id`),
  KEY `permission` (`permission`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories_permissions`
--

INSERT INTO `categories_permissions` (`user_group_id`, `permission`, `category_id`) VALUES
(0, 'category_full_access', 1),
(0, 'category_full_access', 2),
(3, 'see_category', 2),
(0, 'category_full_access', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `general_permissions`
--

CREATE TABLE IF NOT EXISTS `general_permissions` (
  `permission_names` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  UNIQUE KEY `permission_name` (`permission_names`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `general_permissions`
--

INSERT INTO `general_permissions` (`permission_names`, `description`) VALUES
('banning', 'Право банить'),
('category_full_access', 'Доступ ко всем операциям с категориями'),
('create_topics', 'Право создавать темы'),
('delete_own_theme', 'Право удалять свои темы'),
('delete_posts', 'Право удалять посты'),
('delete_smbd_else_theme', 'Право удалять чужие темы'),
('edit_name_of_own_theme', 'Право редактировать названия собственных тем'),
('edit_name_of_smbd_else__theme', 'Право редактировать названия чужих тем'),
('see_about', 'Видеть информацию пользователя'),
('see_category', 'Видит ли пользователь категорию'),
('see_country', 'Право видет страну'),
('see_email', 'Видеть электронную почту'),
('see_facebook', 'Видеть учетную запись "Facebook"'),
('see_full_name', 'Показ Ф.И.О.'),
('see_icq', 'Видеть ICQ'),
('see_mobile', 'Видеть мобильный телефон'),
('see_registration_date', 'Видеть дату регистрации'),
('see_sex', 'Право видеть пол'),
('see_vk', 'Видеть учетную запись "ВКонтакте"'),
('send_private_message', 'Отправка личных сообщений'),
('visible_avatar', 'Видимость аватара'),
('visible_city', 'Просмотр города');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `caption` text NOT NULL,
  `link` text NOT NULL,
  `short_url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `ordering`, `caption`, `link`, `short_url`) VALUES
(1, 0, 'Главная', 'forum.php', 'forum');

-- --------------------------------------------------------

--
-- Структура таблицы `poll_head`
--

CREATE TABLE IF NOT EXISTS `poll_head` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `head` text NOT NULL,
  UNIQUE KEY `id` (`id`,`post_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `poll_variants`
--

CREATE TABLE IF NOT EXISTS `poll_variants` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `value` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`,`poll_id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `is_first` tinyint(1) NOT NULL,
  `date` datetime NOT NULL,
  `topic_id` int(11) NOT NULL,
  `voite_y` int(11) NOT NULL,
  `voite_n` int(11) NOT NULL,
  `header` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`,`topic_id`),
  KEY `theme_id` (`topic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `body`, `is_first`, `date`, `topic_id`, `voite_y`, `voite_n`, `header`) VALUES
(1, 6, '1', 0, '2012-03-31 23:10:43', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `private_messages`
--

CREATE TABLE IF NOT EXISTS `private_messages` (
  `to_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `id` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `setting` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  KEY `setting` (`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`setting`, `value`) VALUES
('min_login_length', '5'),
('max_login_length', '20');

-- --------------------------------------------------------

--
-- Структура таблицы `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `is_news_theme` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`id`, `name`, `user_id`, `category_id`, `date`, `is_news_theme`) VALUES
(1, '1', 6, 1, '2012-03-31 23:10:43', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` text NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `father_name` text NOT NULL,
  `family_name` text NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `country` text NOT NULL,
  `city` text NOT NULL,
  `avatar` text NOT NULL,
  `mobile` text NOT NULL,
  `icq` text NOT NULL,
  `vk` text NOT NULL,
  `facebook` text NOT NULL,
  `about` text NOT NULL,
  `registration_date` datetime NOT NULL,
  `email` text NOT NULL,
  `password` varchar(32) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `user_group_id`, `name`, `father_name`, `family_name`, `sex`, `country`, `city`, `avatar`, `mobile`, `icq`, `vk`, `facebook`, `about`, `registration_date`, `email`, `password`) VALUES
(1, 'guest', 3, 'Гость', '', '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '', ''),
(6, 'dem0n13', 0, 'Дмитрий', 'Олегович', 'Стаценко', 1, 'Россия', 'Козельск', 'ава', '33333333', '333333', 'ва', 'ав', 'corepartners', '2012-02-12 23:37:33', 'd@mail.ru', 'b59c67bf196a4758191e42f76670ceba'),
(16, 'серджио', 0, 'Сергей', 'Валерьевич', 'Серпиков', 1, 'Россия', 'Воротынск', '', '8 800 2000 600', '777777', 'http://vk.com/id9214565', 'http://www.facebook.com/?ref=logo', 'Я обычный студент', '2012-03-04 17:21:40', 'blackandwhite_91@mail.ru', 'c4ca4238a0b923820dcc509a6f75849b');

-- --------------------------------------------------------

--
-- Структура таблицы `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
  `name` text NOT NULL,
  `id` int(11) NOT NULL,
  UNIQUE KEY `code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_groups`
--

INSERT INTO `user_groups` (`name`, `id`) VALUES
('Администратор', 0),
('Модератор', 1),
('Пользователь', 2),
('Гость', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user_groups_permissions`
--

CREATE TABLE IF NOT EXISTS `user_groups_permissions` (
  `user_group_id` int(11) NOT NULL,
  `permission` varchar(255) NOT NULL,
  UNIQUE KEY `group_id` (`user_group_id`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_groups_permissions`
--

INSERT INTO `user_groups_permissions` (`user_group_id`, `permission`) VALUES
(0, 'category_full_access'),
(0, 'create_topics'),
(0, 'delete_posts'),
(0, 'delete_smbd_else_theme');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ban_list`
--
ALTER TABLE `ban_list`
  ADD CONSTRAINT `ban_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `categories_permissions`
--
ALTER TABLE `categories_permissions`
  ADD CONSTRAINT `categories_permissions_ibfk_6` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_permissions_ibfk_4` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`),
  ADD CONSTRAINT `categories_permissions_ibfk_5` FOREIGN KEY (`permission`) REFERENCES `general_permissions` (`permission_names`);

--
-- Ограничения внешнего ключа таблицы `poll_variants`
--
ALTER TABLE `poll_variants`
  ADD CONSTRAINT `poll_variants_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `poll_head` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_groups_permissions`
--
ALTER TABLE `user_groups_permissions`
  ADD CONSTRAINT `user_groups_permissions_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_groups_permissions_ibfk_2` FOREIGN KEY (`permission`) REFERENCES `general_permissions` (`permission_names`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
