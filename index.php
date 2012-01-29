<html>
    
    <?php
        include '/constants.php';
        $host="localhost";
        $user="root";
        $pass="";
        $db=mysql_connect($host,$user,$pass);
        mysql_select_db("in40",$db);
        mysql_query("SET NAMES utf8");
        $categories_t=mysql_query("CALL new_proc()");
        while($row = mysql_fetch_array($categories_t))
{
    echo $row['name']."<br>";
}
    ?>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />    
    Логин:
    <input type="text" id="login"><br>
    Пароль:
    <input type="text" id="password"><br>
    <a href="<?php echo $site ?>registration.php">Регистрация</a><br>
</html>