<?php

include_once '/settings/settings.php';
include_once '/scripts/correct_strings.php';
include_once '/scripts/db/select.php';

function save_all_user_information($all_inf)
{
    $id=$all_inf['id'];
    $sex='';
    if ($all_inf['sex']=="мужской")
        {
            $sex=1;
        }
        else
        {
            $sex=0;
        }
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "UPDATE users SET 
            name='".$all_inf['name']."', 
            father_name='".$all_inf['father_name']."', 
            family_name='".$all_inf['family_name']."', 
            sex='".$sex."', 
            country='".$all_inf['country']."',
            city='".$all_inf['city']."', 
            avatar='".$all_inf['avatar']."', 
            mobile='".$all_inf['mobile']."', 
            icq='".$all_inf['icq']."', 
            vk='".$all_inf['vk']."', 
            facebook='".$all_inf['facebook']."', 
            about='".$all_inf['about']."', 
            email='".$all_inf['email']."'  
        WHERE id='".$id."'";
    return mysql_query($query,$db);
   
}
?>
