-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Фев 10 2012 г., 19:43
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
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `date`) VALUES
(1, 'Категория 1', '2012-01-17 00:00:00'),
(2, 'Категория 2', '2012-01-17 00:00:00'),
(3, 'Категория 3', '2012-01-17 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `categories_permissions`
--

CREATE TABLE IF NOT EXISTS `categories_permissions` (
  `user_group_id` int(11) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`user_group_id`,`permission`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories_permissions`
--

INSERT INTO `categories_permissions` (`user_group_id`, `permission`, `category_id`) VALUES
(1, 'banning', 0),
(1, 'category_full_access', 0),
(2, 'banning', 0),
(2, 'category_full_access', 0);

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
('creating_theme', 'Право создавать темы'),
('deleting_own_theme', 'Право удалять свои темы'),
('deleting_smbd_else_theme', 'Право удалять чужие темы'),
('editing_name_of_own_theme', 'Право редактировать названия собственных тем'),
('editing_name_of_smbd_else__theme', 'Право редактировать названия чужих тем'),
('seeing_about', 'Видеть информацию пользователя'),
('seeing_country', 'Право видет страну'),
('seeing_email', 'Видеть электронную почту'),
('seeing_facebook', 'Видеть учетную запись "Facebook"'),
('seeing_full_name', 'Показ Ф.И.О.'),
('seeing_mobile', 'Видеть мобильный телефон'),
('seeing_registration_date', 'Видеть дату регистрации'),
('seeing_sex', 'Право видеть пол'),
('seeing_vk', 'Видеть учетную запись "ВКонтакте"'),
('seeng_icq', 'Видеть ICQ'),
('sending_private_message', 'Отправка личных сообщений'),
('visible_avatar', 'Видимость аватара'),
('visible_city', 'Просмотр города');

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
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `is_first` tinyint(1) NOT NULL,
  `date` datetime NOT NULL,
  `theme_id` int(11) NOT NULL,
  `voite_y` int(11) NOT NULL,
  `voite_n` int(11) NOT NULL,
  `header` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`,`theme_id`),
  KEY `theme_id` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Структура таблицы `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `is_news_theme` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `sex` text NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `user_group_id`, `name`, `father_name`, `family_name`, `sex`, `country`, `city`, `avatar`, `mobile`, `icq`, `vk`, `facebook`, `about`, `registration_date`, `email`, `password`) VALUES
(1, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:11', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(2, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:29', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(3, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:30', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(4, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:39', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(5, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:40', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(8, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:41', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(9, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:41', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(10, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:41', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(11, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:41', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(12, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:42', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(13, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:29:52', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(14, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 16:30:51', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(15, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 21:14:58', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(16, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 21:15:32', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(17, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 21:15:43', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(18, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 21:16:34', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(19, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 21:16:43', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(20, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 21:17:32', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(21, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 21:17:42', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(22, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 21:17:58', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(23, '11111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-10 21:18:38', 'blaczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152');

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
('Пользователь', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `user_groups_permissions`
--

CREATE TABLE IF NOT EXISTS `user_groups_permissions` (
  `user_group_id` int(11) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `value` tinyint(1) NOT NULL,
  UNIQUE KEY `group_id` (`user_group_id`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ban_list`
--
ALTER TABLE `ban_list`
  ADD CONSTRAINT `ban_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `poll_head`
--
ALTER TABLE `poll_head`
  ADD CONSTRAINT `poll_head_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `poll_variants`
--
ALTER TABLE `poll_variants`
  ADD CONSTRAINT `poll_variants_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `poll_head` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `themes`
--
ALTER TABLE `themes`
  ADD CONSTRAINT `themes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_groups_permissions`
--
ALTER TABLE `user_groups_permissions`
  ADD CONSTRAINT `user_groups_permissions_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
