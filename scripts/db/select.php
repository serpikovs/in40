<?php
/*Функции чтения данных из бд
 * 
 */
    
function is_unique_login($login)
{
    include_once '/scripts/correct_strings.php';
    include_once '/settings/settings.php';
    
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
            return false;
        }
    return false;
}

function is_unique_email($email)
{
    include_once '/scripts/correct_strings.php';
    include_once '/settings/settings.php';
    
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

function autorize($login,$pwd)
{
    include_once '/scripts/correct_strings.php';
    include_once '/settings/settings.php';
    
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
?>
