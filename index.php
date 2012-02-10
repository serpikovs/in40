<html>
    
    <?php
        include("scripts/constants.php");
        //include("/scripts/correct_strings.php");
        include_once("scripts/db/select.php");
        include_once("scripts/db/insert.php");
        
        define("FOO",     "something");
        
        //is_correct_pwd("ed2321131826ef081e2514ffe4a48152");
        //if (is_unique_login("11111")==false)
            {
          //      echo "0";
            }
        //echo is_unique_login("11111");
        echo create_new_user("11111","blaczxc@mail.ru","ed2321131826e7081e2514ffe4a48152");
    ?>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />    
    Логин:
    <input type="text" id="login"><br>
    Пароль:
    <input type="text" id="password"><br>
    <a href="<?php echo $site ?>registration.php">Регистрация</a><br>
    
</html>