<?php
/*
 * Проект: Katrin
 * Компоновщик модуля Логина
 */

if (!defined('Katrin'))
    die ('Access Error');

include_once 'scripts/cookies.php';
include_once 'modules/notify.php';

// GET logout
if (isset($_GET['logout']))
{
    delete_cookies_login_pass();
    header('Location: '.$_SERVER['PHP_SELF']);
}

// GET login
if (isset($_GET['login']))
{
    if (!empty($_POST['login']) && !empty($_POST['pwd']))
    {
	if (autorize($_POST['login'], $_POST['pwd']))
	{
	    set_cookies_login_pass($_POST['login'], $_POST['pwd']);
	    header('Location: '.$_SERVER['PHP_SELF']);
	}
	else 
        {
	    notify("Логин и/или пароль введен неверно!");
        }
    }
}

// проверка логина
if (autorize(get_cookies_login(), get_cookies_pass()))
{
    $is_logon = true;
}


/**
 * Компоновка модуля Логина
 * @return string Код модуля 
 */
function construct_log_reg()
{
    global $tpl_loader;
    global $is_logon;

    if ($is_logon)
    {
	// вывод приветствия
	return $tpl_loader->Load('login-hello', array('username' => get_cookies_login()));
    }
    return $tpl_loader->Load('login-form');
}

?>
