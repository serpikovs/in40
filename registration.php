<?php

/*
 * Проект: Katrin
 * Регистрация
 */

define("Katrin", 1);

include_once 'scripts/db/insert.php';
include_once 'themes/core.php';	
include_once 'scripts/cookies.php';

include_once 'modules/notify.php';
include_once 'modules/menu.php';
include_once 'modules/bread_crumbs.php';

/* выполнение задач */
if (!empty($_POST['login']) && !empty($_POST['email']) && !empty($_POST['pwd']))
{
    if (create_new_user($_POST['login'],$_POST['email'],$_POST['pwd']))
    {
	set_cookies_login_pass($_POST['login'], $_POST['pwd']);
	header('Location: index.php?login');    
    }
}

$local_scripts='</script><script type="text/javascript" src="scripts/js/md5.js"></script>';
$tpl_loader->set_local_scripts($local_scripts);

$local_theme_scripts=array("registration.js");
$tpl_loader->set_local_theme_scripts($local_theme_scripts);

/* загрузка модулей */
$page_areas['header']=$tpl_loader->Load("header");
$page_areas['nav'] = construct_bread_crumbs();
$page_areas['menu'] = construct_menu();
notify('Регистрация нового пользователя:');
$page_areas['content']=$tpl_loader->Load("registration");

//create_new_user("1221211111","bl21aczxc@mail.ru","ed2321131826e7081e2514ffe4a48152");
echo $tpl_loader->Load('main', $page_areas);
?>

   

        



           

        
        

