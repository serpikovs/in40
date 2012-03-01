<?php
/*Тут описаны функции, осуществляющие проверки строк на наличие запрещенных символов
 */


function is_correct_login($login)
{
    include_once '/scripts/correct_strings.php';
    include_once("scripts/db/get_settings.php");
    
    //длина логина
    //settype($a, "string");
    if (strlen($login)<get_settings("min_login_length") || strlen($login)>get_settings("max_login_length"))
    {
        //echo "Логин должен быть 5-20 символов";
        return false;
    }
    
    if (preg_match("/[^а-яa-z0-9_]/iu", $login)) 
                {
                    //echo "недопустимый символ";
                    return false;
                }
    return true;
}


function is_correct_email($email)
{
    if (!preg_match("/^((([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+(\.([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+)*)@((((([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.))*([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.)[\w]{2,4}|(((([0-9]){1,3}\.){3}([0-9]){1,3}))|(\[((([0-9]){1,3}\.){3}([0-9]){1,3})\])))$/", $email)) 
                {
                    //echo "недопустимый символ";
                    return false;
                }
     return true;
}


function is_correct_pwd($pwd)
{
    
    if (!preg_match("/[0-9a-f]{32}/", $pwd)) 
                {
                    return false;
                }
    return true;
}
?>
