<?php
$db = mysql_connect("localhost","root","");
mysql_select_db("in40",$db);
mysql_query("SET NAMES utf8");
if (isset($_POST['login']))
        {
            $query = "SELECT login FROM users WHERE login='".$_POST['login']."'";
        }
if (isset($_POST['email']))
        {
            $query = "SELECT email FROM users WHERE email='".$_POST['email']."'";
        }
$res = mysql_query($query,$db);

$num_of_rows  =  mysql_num_rows($res); 
if ($num_of_rows==0)
    {
        echo "false";
    }
    else
    {
        echo "true"; 
    }

?>
