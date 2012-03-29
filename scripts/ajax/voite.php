<?php
$db = mysql_connect("localhost","root","");
mysql_select_db("in40",$db);
mysql_query("SET NAMES utf8");
$p_id=$_POST['post_id'];
print_r($_POST);
if ($_POST['value']=="up")
        {
            $query = "UPDATE posts SET voite_y=voite_y+1 WHERE id='.$p_id.'";
        }
if ($_POST['value']=="down")
        {
            $query = "UPDATE posts SET voite_n=voite_n+1 WHERE id='.$p_id.'";
        }
echo mysql_query($query,$db);

?>