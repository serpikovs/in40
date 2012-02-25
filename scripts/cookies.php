<?php
/*
 * Проект: Katrin
 * Функции для работы с куками
 */

if (!defined('Katrin'))
    die ('Access Error');

/**
 * Устанавливает в куки логин и пароль
 * @param type $login Логин
 * @param type $pass Пароль
 */
function set_cookies_login_pass($login, $pass) 
{
    session_set_cookie_params(10800);
    SetCookie("l", $login, time() + 360000000);
    SetCookie("p", $pass, time() + 360000000);
}

/**
 * Проверяет наличие логина и пароля в куках
 * @return boolean true - логин и пароль присутствует 
 */
function check_cookies_login_pass()
{
    return isset($_COOKIE['l']) && isset($_COOKIE['p']);
}

/**
 * Получает логин из куков, если он есть, иначе 'guest'
 * @return string Логин
 */
function get_cookies_login()
{
    if (isset($_COOKIE['l']))
	return $_COOKIE['l'];
    else
	
	return 'guest';
}

/**
 * Получает пароль из куков, если он есть
 * @return string Пароль
 */
function get_cookies_pass()
{
    if (isset($_COOKIE['p']))
	return $_COOKIE['p'];
    else
	return '';
}

/**
 * Удаляет логин и пароль из куков
 */
function delete_cookies_login_pass()
{
    SetCookie('l', '');
    SetCookie('p', '');
}

?>
