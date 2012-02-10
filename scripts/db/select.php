<?php
/*Функции чтения данных из бд
 * 
 */
    
function is_unique_login($login)
{
    include_once("/scripts/correct_strings.php");
    include_once("/constants.php");
    
    if (is_correct_login($login)==true)
        {
            $db = mysql_connect($host,$user,$pass);
            mysql_select_db("in40",$db);
            mysql_query("SET NAMES utf8");
            $query = "SELECT login FROM users WHERE login='".$login."'";
            $res = mysql_query($query,$db);
            $num_of_rows  =  mysql_num_rows($res);  
            if ($num_of_rows==1)
                {
                    return true;
                }
            return false;
        }
    return false;
}
?>
