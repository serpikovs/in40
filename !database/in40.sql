-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 18 2012 г., 11:00
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
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `is_news_theme` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`id`, `name`, `user_id`, `category_id`, `date`, `is_news_theme`) VALUES
(0, 'Тема 1 категории 1', 1, 1, '2012-03-06 00:00:00', 0),
(1, 'Тема 2 категории 1', 1, 1, '2012-03-21 00:00:00', 0),
(3, 'Тема 1 категории 2', 1, 2, '2012-03-06 00:00:00', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `user_group_id`, `name`, `father_name`, `family_name`, `sex`, `country`, `city`, `avatar`, `mobile`, `icq`, `vk`, `facebook`, `about`, `registration_date`, `email`, `password`) VALUES
(6, 'dem0n13', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-02-12 23:37:33', 'd@mail.ru', 'b59c67bf196a4758191e42f76670ceba'),
(10, '1221211111', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-03-01 22:00:22', 'bl21aczxc@mail.ru', 'ed2321131826e7081e2514ffe4a48152'),
(11, 'sfsdfsdf', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-03-01 22:01:49', 'blddackandwhite_91@mail.ru', '8277e0910d750195b448797616e091ad'),
(12, 'чонгч', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-03-01 22:13:49', 'blddawckandwhite_91@mail.ru', '8277e0910d750195b448797616e091ad'),
(13, 'чонгча', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-03-01 22:14:07', 'blddaw3ckandwhite_91@mail.ru', '8277e0910d750195b448797616e091ad'),
(14, 'чонгчак', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-03-01 22:14:33', 'blddaw3cka4ndwhite_91@mail.ru', '8277e0910d750195b448797616e091ad'),
(15, 'чонгчаке', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-03-01 22:14:52', 'bldda4w3cka4ndwhite_91@mail.ru', '8277e0910d750195b448797616e091ad'),
(16, 'серджио', 3, '', '', '', '', '', '', '', '', '', '', '', '', '2012-03-04 17:21:40', 'blackandwhite_91@mail.ru', 'c4ca4238a0b923820dcc509a6f75849b');

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
  ADD CONSTRAINT `user_groups_permissions_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
