<?php
/*Функции чтения данных из бд
 * 
 */




include_once '/scripts/correct_strings.php';
include_once '/settings/settings.php';

/**
 *Проверяет уникальность логина
 * @param type $login логин
 * @return boolean true если уникален
 */
function is_unique_login($login)
{
        if (is_correct_login($login)==true)
        {
            
            
            $db = mysql_connect(host,user,pass);
            mysql_select_db("in40",$db);
            mysql_query("SET NAMES utf8");
            $query = "SELECT login FROM users WHERE login='".$login."'";
            $res = mysql_query($query,$db);
            
            $num_of_rows  =  mysql_num_rows($res); 
            if ($num_of_rows==0)
                {
                    return true;
                }
                echo 2;
            return false;
        }
        
    return false;
}

/**
 *Проверяет уникальность ящика
 * @param type $email ящик
 * @return boolean true если уникален
 */
function is_unique_email($email)
{
    if (is_correct_email($email)==true)
        {
            $db = mysql_connect(host,user,pass);
            mysql_select_db("in40",$db);
            mysql_query("SET NAMES utf8");
            $query = "SELECT email FROM users WHERE email='".$email."'";
            $res = mysql_query($query,$db);
            $num_of_rows  =  mysql_num_rows($res);  
            if ($num_of_rows==0)
                {
                    return true;
                }
            return false;
        }
    return false;
}

/**
 * Поиск соответсвия пользователя и пароля
 * @param type $login
 * @param type $pwd
 * @return boolean true если авторизация осуществилась
 */
function autorize($login,$pwd)
{
    if (is_correct_login($login)==true && is_correct_pwd($pwd)==true)
            {
                $db = mysql_connect(host,user,pass);
                mysql_select_db("in40",$db);
                mysql_query("SET NAMES utf8");
                $query = "SELECT login,password FROM users WHERE login='".$login."'";
                $res = mysql_query($query,$db);
                $row =  mysql_fetch_array($res);
                if ($row[1]==$pwd)
                    {
                        return true;
                    }
            }
    return false;
}

/**
 *возвращает массив ассоциативных массивов с ключами id, name, date. Пример использования:
 * $arr=get_categories();   
        for ($i=0;$i<3;$i++)
        {
            echo $arr[$i]['id']." ".$arr[$i]['name']." ".$arr[$i]['date']."<br>";
        }
 * @return type array возвращает двумерный массив в виде arr[][<id>,<name>,<date>]
 */
function get_categories()
{
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "SELECT id,name,date FROM categories";
    $res = mysql_query($query,$db);
//    while($row = mysql_fetch_array($res))
//    {
//        $category_array[]=array('id'=>$row[0],'name'=>$row[1],'date'=>$row[2]);
//    }
    return $res;
    
    
}


function get_themes($category_id)
{
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "SELECT id,name,date FROM topics WHERE category_id='".$category_id."'";
    $res = mysql_query($query,$db);
//    while($row = mysql_fetch_array($res))
//    {
//        $category_array[]=array('id'=>$row[0],'name'=>$row[1],'date'=>$row[2]);
//    }
    return $res;
    
    
}

/**
 * Возвращает ассоциативный массив пунктов меню
 * @return array Ассоциативный массив пунктов меню
 */
function get_menu()
{
    $db = mysql_connect(host, user, pass);
    mysql_select_db('in40', $db);
    mysql_query('SET NAMES utf8');
    $query = "SELECT caption,link 
	FROM menu
	ORDER BY ordering"; // TODO добавить проверку доступа
    return mysql_query($query, $db);
}

/**
 *Определяет, какой категории принадлежит тема
 * @param type $topic_id номер темы
 * @return type номер категории
 */
function get_owning_category_id($topic_id)
{
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "SELECT category_id FROM topics WHERE id='".$topic_id."'";
    $res = mysql_query($query,$db);
    $row = mysql_fetch_array($res);
    return $row['category_id'];
}

function get_category_name_by_id($category_id)
{
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "SELECT name FROM categories WHERE id='".$category_id."'";
    $res = mysql_query($query,$db);
    $row = mysql_fetch_array($res);
    return $row['name'];
}

function get_owning_category_name($topic_id)
{
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "SELECT category_id FROM topics WHERE id='".$topic_id."'";
    $res = mysql_query($query,$db);
    $row = mysql_fetch_array($res);
    $query = "SELECT name FROM categories WHERE id='".$row['category_id']."'";
    $res = mysql_query($query,$db);
    $row = mysql_fetch_array($res);
    return $row['name'];
}

function get_topic_name_by_id($topic_id)
{
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "SELECT name FROM topics WHERE id='".$topic_id."'";
    $res = mysql_query($query,$db);
    $row = mysql_fetch_array($res);
    return $row['name'];
}

?>
