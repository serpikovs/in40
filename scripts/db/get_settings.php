<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function get_settings($setting)
{
    include_once '/settings/settings.php';
    
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "SELECT value FROM settings WHERE setting='".$setting."'";
    $res = mysql_query($query,$db);
    $num_of_rows  =  mysql_num_rows($res);  
            if ($num_of_rows==0)
                {
                    return false;
                }
            if ($num_of_rows==1)
                {
                    $row = mysql_fetch_array($res);
                    return $row[0];
                }
            return false;

}
?>
