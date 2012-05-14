-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 14 2012 г., 19:35
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
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `date`, `ordering`) VALUES
(1, 'Обнинск', '2012-04-04 00:00:00', 1),
(6, 'Калуга', '2012-04-20 00:00:00', 0),
(7, 'Администраторам', '2012-04-11 00:00:00', 2);

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
(3, 'see_category', 1),
(0, 'category_full_access', 6),
(3, 'see_category', 6),
(0, 'category_full_access', 7);

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
('close_topics', 'Право закрывать топики'),
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
  `caption` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `short_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `ordering`, `caption`, `link`, `short_url`) VALUES
(1, 0, 'Главная', 'forum.php', 'forum');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `body`, `is_first`, `date`, `topic_id`, `voite_y`, `voite_n`, `header`) VALUES
(1, 6, 'Где лучше заправлять свою машину?', 0, '2012-04-03 23:26:08', 1, 0, 0, ''),
(2, 6, 'Предлагаю услуги плиточника. телефон 7777777777', 0, '2012-04-03 23:26:35', 2, 0, 0, ''),
(3, 6, 'Кто за кого голосовал?', 0, '2012-04-03 23:26:59', 3, 0, 0, ''),
(4, 6, 'Потерял ключи в районе первого корпуса. Телефон 77777777777', 0, '2012-04-03 23:27:34', 4, 0, 0, ''),
(5, 6, 'Звоните, низкие цены', 0, '2012-04-03 23:27:55', 5, 0, 0, ''),
(6, 6, 'Низкие цены', 0, '2012-04-03 23:28:08', 6, 0, 0, ''),
(7, 6, 'Низкие цены', 0, '2012-04-03 23:32:36', 7, 0, 0, ''),
(8, 6, 'Где есть?', 0, '2012-04-03 23:33:15', 8, 0, 0, ''),
(9, 6, 'Известный по инциденту с Github российский веб-разработчик Егор Хомяков (Chikey) отличился ещё раз. На этот раз он решил не мелочиться и ударил сразу по десятку известных сервисов, в том числе Moneybookers, Formspring, SlideShare, YFrog, Bitbucket, Lockerz, Github, KinoPoisk, Badoo, Odesk, Dailymotion, Vimeo, About.me, Posterous, Hulu, Booking.com, Heroku.\r\n\r\n Феерический пост с подборкой хаков для вышеперечисленных сайтов можно посмотреть здесь. Отметим только, что самый главный баг с переводом денег через Moneybookers он предварительно зарепортил разработчикам и дождался, пока те закроют уязвимость, прежде чем публиковать информацию.\r\n\r\n Егор говорит, что это лишь крошечная часть уязвимостей в самых популярных сервисах, не говоря уже о сайтах среднего и малого размера. Егор принципиально не публикует критические уязвимости, потому что «тюрьма не подходит для уютной жизни», по его мнению.\r\n\r\n На этой неделе Хомяков планирует опубликовать уязвимость в Webkit, позже — советы по безопасности JSONP, фреймам, обходу правила ограничения домена, CSRF, а также ещё один лёгкий хак Rails (и PHP), сейчас подбираются сайты для демонстрации уязвимости.', 0, '2012-04-03 23:33:39', 9, 0, 0, ''),
(12, 6, 'Тут пишет только руководство сайта', 0, '2012-04-03 23:37:05', 11, 0, 0, ''),
(13, 17, 'На ТНК', 0, '2012-04-03 23:38:58', 1, 0, 0, ''),
(14, 16, 'Я считаю что на БП', 0, '2012-04-03 23:39:57', 1, 0, 0, ''),
(15, 16, 'Позвоню', 0, '2012-04-03 23:40:21', 2, 0, 0, ''),
(16, 16, 'Спустя месяц после старта продаж кроссовера Peugeot 4008 на рынок выйдет его родственник Citroen C4 Aircross — у дилеров машины появятся в середине мая.  \r\n\r\nОтличия от Peugeot — не только во внешности и нюансах комплектаций. Как и ожидалось, гамма моторов у Ситроена шире, но дизелей в ней по прежнему нет. Зато есть базовый двигатель 1.6 (117 л.с.) — такой Aircross предлагается только в самой простой комплектации Dynamique с передним приводом, двумя подушками безопасности, АБС, кондиционером, электропакетом и CD-проигрывателем за 799 тысяч рублей — на 20 тысяч дороже аналогичного Mitsubishi ASX, у которого вдобавок есть подогрев передних сидений.', 0, '2012-04-03 23:40:56', 12, 0, 0, ''),
(17, 16, 'Mitsubishi ASX с двухлитровым мотором (150 л.с.) может оснащаться только полным приводом и клиноременным вариатором, Peugeot 4008 предлагается еще и с механической коробкой передач, а Citroen C4 Aircross 2.0 позволяет выбрать как коробку передач, так и тип привода. \r\n\r\nПереднеприводный 150-сильный кроссовер с «механикой» будет стоить 909 тысяч рублей, а с вариатором — 949 тысяч рублей — на 14 тысяч дороже, чем аналогичный Nissan Qashqai 2.0 (141 л.с.).\r\n\r\n Наконец, полноприводный Citroen C4 Aircross с «механикой» предлагается минимум за 1 млн 89 тысяч рублей, а с вариатором — за 1 млн 129 тысяч рублей. Это больше, чем просят за Peugeot 4008, зато у Ситроена уже в начальной комплектации Tendance имеются семь подушек безопасности, система стабилизации, подогрев передних сидений, задний парктроник, легкосплавные колеса и Bluetooth. ', 0, '2012-04-03 23:41:16', 12, 0, 0, ''),
(18, 17, '1', 0, '2012-04-03 23:41:55', 12, 0, 0, '');

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
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `is_closed` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`id`, `name`, `user_id`, `category_id`, `date`, `is_closed`) VALUES
(1, 'Автозаправки', 6, 6, '2012-04-03 23:26:08', 0),
(2, 'Услуги плиточника', 6, 6, '2012-04-03 23:26:35', 0),
(3, 'Выборы 2012', 6, 6, '2012-04-03 23:26:59', 0),
(4, 'Потеряны ключи', 6, 6, '2012-04-03 23:27:34', 0),
(5, 'Перебор двигателей', 6, 6, '2012-04-03 23:27:55', 0),
(6, 'Кузовщина, покраска', 6, 6, '2012-04-03 23:28:08', 0),
(7, 'Перегон авто из Германии', 6, 6, '2012-04-03 23:32:36', 0),
(8, 'Где есть приличные рестораны', 6, 1, '2012-04-03 23:33:15', 0),
(9, 'Кино', 6, 1, '2012-04-03 23:33:39', 0),
(11, 'Руководство сайта', 6, 7, '2012-04-03 23:37:05', 0),
(12, 'Автопредпочтения', 16, 6, '2012-04-03 23:40:56', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `icq` varchar(255) NOT NULL,
  `vk` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `about` varchar(1000) NOT NULL,
  `registration_date` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `user_group_id`, `name`, `father_name`, `family_name`, `sex`, `country`, `city`, `avatar`, `mobile`, `icq`, `vk`, `facebook`, `about`, `registration_date`, `email`, `password`) VALUES
(1, 'guest', 3, 'Гость', '', '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '', ''),
(6, 'dem0n13', 0, 'Дмитрий', 'Олегович', 'Стаценко', 1, 'Россия', 'Козельск', '', '33333333', '333333', 'ва', 'ав', 'corepartners', '2012-02-12 23:37:33', 'd@mail.ru', 'b59c67bf196a4758191e42f76670ceba'),
(16, 'серджио', 0, 'Сергей', 'Валерьевич', 'Серпиков', 1, 'Россия', 'Воротынск', 'http://www.gravatar.com/avatar/9e55a0adf51d785b2c8b6969fa43d3c8?s=304&d=http%3A%2F%2Fbattlelog-cdn.battlefield.com%2Fpublic%2Fbase%2Fshared%2Fdefault-avatar-304.png%3Fv%3D7909', '8 800 2000 600', '777777', 'http://vk.com/id9214565', 'http://www.facebook.com/?ref=logo', 'Я обычный студент', '2012-03-04 17:21:40', 'blackandwhite_91@mail.ru', 'c4ca4238a0b923820dcc509a6f75849b'),
(17, 'прохожий', 3, '', '', '', 0, '', '', '', '', '', '', '', '', '2012-04-03 23:38:43', 'blacka1ndwhite_91@mail.ru', 'b59c67bf196a4758191e42f76670ceba'),
(18, 'Genry', 3, '', '', '', 0, '', '', '', '', '', '', '', '', '2012-05-06 14:19:17', 'blacka44ndwhite_91@mail.ru', 'b59c67bf196a4758191e42f76670ceba');

-- --------------------------------------------------------

--
-- Структура таблицы `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
  `name` varchar(255) NOT NULL,
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
(0, 'close_topics'),
(0, 'create_topics'),
(0, 'delete_posts'),
(0, 'delete_smbd_else_theme');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories_permissions`
--
ALTER TABLE `categories_permissions`
  ADD CONSTRAINT `categories_permissions_ibfk_6` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_permissions_ibfk_7` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`),
  ADD CONSTRAINT `categories_permissions_ibfk_8` FOREIGN KEY (`permission`) REFERENCES `general_permissions` (`permission_names`);

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
