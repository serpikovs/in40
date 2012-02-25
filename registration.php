<!--
Регистрация
-->
<?php
        include_once 'scripts/db/insert.php';
        
        // добавляем шаблонизатор    
        include_once 'themes/core.php';
        
        // название текущей визуальной темы 
        $current_theme = 'default';

        // создаем шаблонизатор этой темы
        $tpl_loader = new TemplateLoader($current_theme);
        
        
        $page_areas = array();
        
        /* загрузка шапки */
        $page_areas['header']=$tpl_loader->Load("header");
        
        /*загрузка области реги*/
        $page_areas['content']=$tpl_loader->Load("registration");
        
        //create_new_user("1221211111","bl21aczxc@mail.ru","ed2321131826e7081e2514ffe4a48152");
        if (!empty($_POST['login']) && !empty($_POST['email']) && !empty($_POST['pwd']))
        {
           if (create_new_user($_POST['login'],$_POST['email'],$_POST['pwd'])==true)
               {
                    include("/themes/default/end_registration.tpl");
               }
            else 
                {
                     echo "неудача реги";
                 }
               
        }
        else
        {
            echo $tpl_loader->Load('main', $page_areas);
            
            //include("/themes/default/registration.tpl");
            //include("/themes/default/1.tpl");
        }
?>

   

        



           

        
        

