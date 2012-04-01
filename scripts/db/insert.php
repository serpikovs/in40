<?php
/*
 * В данном файле опитываются ТОЛЬКО функции добавления данных к базе
 */

include_once '/settings/settings.php';
include_once '/scripts/correct_strings.php';
include_once '/scripts/db/select.php';

function create_new_user($login,$email,$pwd)
{
    
    //проверка на корректность
    if (is_correct_login($login)==true && is_correct_email($email)==true && is_correct_pwd($pwd)==true && is_unique_email($email)==true && is_unique_login($login)==true)
    {
        $db=mysql_connect(host,user,pass);
        mysql_select_db("in40",$db);
        mysql_query("SET NAMES utf8");
        /*
        //считаем количество всех пользователей, чтобы задать уникаальный id
        $row = mysql_fetch_row(mysql_query('SELECT COUNT(*) FROM `users`'));
        $total = $row[0]; // всего записей
         * 
         */
        
        //дата регистрации
        $date_today=date('Y:m:d G:i:s');

        $query ="INSERT INTO `users`  (`id`, `login`, `user_group_id`, `name`, `father_name`, `family_name`, `sex`, `country`, `city`, `avatar`, `mobile`, `icq`, `vk`, `facebook`, `about`, `registration_date`, `email`, `password`) VALUES ('LAST_INSERT_ID()','".$login."', '3', '', '', '', '', '', '', '', '', '', '', '', '',NOW(),'".$email."', '".$pwd."')";
        mysql_query($query,$db);// or die ("Ошибка создания");
        return true;
    }
    
    return false;
    
    
}

function post_message($user_id,$topic_id,$body)
{
    $db=mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query ="INSERT INTO `posts`  (`id`, `user_id`, `body`, `is_first`, `date`, `topic_id`, `voite_y`, `voite_n`, `header`) VALUES ('LAST_INSERT_ID()','".$user_id."', '".$body."', '0', NOW(), '".$topic_id."', '0', '0', '')";
    mysql_query($query,$db) or die ("Ошибка записи");
    return true;
}


function create_new_topic($user_id,$category_id,$new_topic_name,$body)
{
    $db=mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query ="INSERT INTO `topics`  
        (`id`, `name`, `user_id`, `category_id`, `date`, `is_news_theme`) VALUES 
        ('LAST_INSERT_ID()','".$new_topic_name."', '".$user_id."', '".$category_id."', NOW(), '0')";
    mysql_query($query,$db) or die ("Ошибка записи темы");
    $query ="INSERT INTO `posts`    (`id`, `user_id`, `body`, `is_first`, `date`, `topic_id`, `voite_y`, `voite_n`, `header`) VALUES 
                                    ('LAST_INSERT_ID()','".$user_id."', '".$body."', '0', NOW(), (select id from topics where id=LAST_INSERT_ID()), '0', '0', '')";
    mysql_query($query,$db) or die ("Ошибка записи поста");
    return true;
}

function create_category($category)
{
    $db = mysql_connect(host, user, pass);
    mysql_select_db("in40", $db);
    mysql_query("SET NAMES utf8");
    $query = "INSERT INTO categories (name, ordering) ".
		    "VALUES ('".$category['name']."', '".$category['ordering']."')";
    return mysql_query($query, $db);
}

?>
