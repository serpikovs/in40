<?php

if (!defined('Katrin'))
    die ('Access Error');

include_once '/settings/settings.php';
include_once '/scripts/correct_strings.php';
include_once '/scripts/db/select.php';

function delete_post($post_id)
{
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "DELETE FROM posts WHERE id ='".$post_id."'";
    return mysql_query($query,$db);
}

function delete_topic($topic_id)
{
    $db = mysql_connect(host,user,pass);
    mysql_select_db("in40",$db);
    mysql_query("SET NAMES utf8");
    $query = "DELETE FROM topics WHERE id='".$topic_id."'";
    return mysql_query($query,$db);
}

function delete_category($category_id)
{
    $db = mysql_connect(host, user, pass);
    mysql_select_db("in40", $db);
    mysql_query("SET NAMES utf8");
    $query = "DELETE FROM categories WHERE id='".$category_id."'";
    return mysql_query($query, $db);
}
?>
