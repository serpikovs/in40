<html>
    
    <?php
        include_once("scripts/db/select.php");
        include_once("scripts/db/insert.php");
        include_once("scripts/db/get_settings.php");
        include_once("settings/settings.php");
        
        
        if (!empty($_POST['login']) && !empty($_POST['pwd']))
            {
                if (autorize($_POST['login'], $_POST['pwd'])==true)
                    {
                        echo "Вы зашли как ".$_POST['login'];
                        session_set_cookie_params(10800);
                        SetCookie("l",$_POST['login'],time()+360000000);
                        SetCookie("p",$_POST['pwd'],time()+360000000);
                    }
                    else 
                    {
                        echo "Логин не верен";
                    }
            }
            else
            {
                if (isset($_COOKIE['l']) && isset($_COOKIE['p']))
                    {
                        if (autorize($_COOKIE['l'],$_COOKIE['p'])==true)
                            {
                                echo "Вы зашли как ".$_COOKIE['l'];
                            }
                    }
            }
            
         
        $arr=get_categories();   
        while($row = mysql_fetch_assoc($arr))
        {
            echo $row['name'].$row['id'].$row['date']."<br>";
            //$category_array[]=array('id'=>$row[0],'name'=>$row[1],'date'=>$row[2]);
        }
        //is_correct_pwd("ed2321131826ef081e2514ffe4a48152");
//        if (is_unique_login("11111")==false)
//            {
//                echo "0";
//            }
//            else
//            {
//                echo "1";
//            }
        //echo is_unique_login("111ds211")."<br>";
        //echo is_unique_email("bl12ac1sd1zx1c@mail.ru")."<br>";
        
        //echo create_new_user("111ds2111","blacsd1zx1c@mail.ru","ed2321131826e7081e2514ffe4a48152");
        //echo get_settings("max_login_length");   
    ?>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <META HTTP-EQUIV="Refresh">
    <script src="scripts/js/md5.js"></script>
    <script>
        function to_md5(p_input)
            {
                document.getElementById('pwd').value=hex_md5(p_input.value);                
            }
    </script>
    <form method="post" action="index.php">
    Логин:
    <input type="text" id="login" name="login"><br>
    Пароль:
    <input type="text" id="original_pwd"  onKeyUp="to_md5(this)"><br>
    <input type="hidden" name="pwd" id="pwd"><br>
    <input type=submit id="send_data"  value="Войти">
    </form>
    <a href="<?php echo site ?>registration.php">Регистрация</a><br>
    
</html>