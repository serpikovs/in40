<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<?php

        include_once 'scripts/constants.php';
        include_once 'scripts/db/insert.php';
        
       
            {
                echo defined('FOO');
            }
        //create_new_user("11111","blaczxc@mail.ru","ed2321131826e7081e2514ffe4a48152");
        if (!empty($_POST['login']) && !empty($_POST['email']) && !empty($_POST['pwd']))
        {
           create_new_user($_POST['login'],$_POST['email'],$_POST['pwd']);
           include("/themes/end_registration.html");
        }
        else
        {
            include("/themes/registration.html");
        }
   

          
?>
   
   

        



           

        
        

