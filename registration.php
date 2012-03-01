<!--
Регистрация
-->
<?php
        define("Katrin", 1);

	include_once 'scripts/db/insert.php';
        include_once 'themes/core.php';	

	include_once 'modules/notify.php';
	include_once 'modules/menu.php';

        $local_scripts='<script type="text/javascript" src="<?=$this->full_tpls_path?>/registration.js"></script><script type="text/javascript" src="scripts/js/md5.js"></script>';
        $tpl_loader->set_local_scripts($local_scripts);

        /* загрузка шапки */
        $page_areas['header']=$tpl_loader->Load("header");
        
	$page_areas['menu'] = construct_menu();
	
	notify('Регистрация нового пользователя');
	
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

   

        



           

        
        

