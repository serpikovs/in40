<?php
/*
 * В данном файле опитываются ТОЛЬКО функции добавления данных к базе
 */



function create_new_user($login,$email,$pwd)
{
    include_once '/constants.php';
    include_once '/scripts/correct_strings.php';
    
    //проверка на корректность
    if (is_correct_login($login)==true && is_correct_email($email)==true && is_correct_pwd($pwd)==true)
    {
        $db=mysql_connect($host,$user,$pass);
        mysql_select_db("in40",$db);
        mysql_query("SET NAMES utf8");
        //считаем количество всех пользователей, чтобы задать уникаальный id
        $row = mysql_fetch_row(mysql_query('SELECT COUNT(*) FROM `users`'));
        $total = $row[0]; // всего записей
        //дата регистрации
        $date_today=date('Y:m:d G:i:s');

        $query ="INSERT INTO `users`  (`id`, `login`, `user_group_id`, `name`, `father_name`, `family_name`, `sex`, `country`, `city`, `avatar`, `mobile`, `icq`, `vk`, `facebook`, `about`, `registration_date`, `email`, `password`) VALUES ('".$total."','".$login."', '3', '', '', '', '', '', '', '', '', '', '', '', '',NOW(),'".$email."', '".$pwd."')";
        mysql_query($query,$db);// or die ("Ошибка создания");
        return true;
    }
    return false;
    
    
}
?>
