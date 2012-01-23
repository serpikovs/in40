<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
$host="localhost";
$user="root";
$pass="";
$db=mysql_connect($host,$user,$pass);
mysql_select_db("in40",$db);
mysql_query("SET NAMES utf8");
$categories_t=mysql_query("SELECT * FROM categories");	

while($row = mysql_fetch_array($categories_t))
{
    echo $row['name']."<br>";
}
        ?>
    </body>
</html>
