<?php

define("Katrin", 1);

include_once 'scripts/db/insert.php';
include_once 'themes/core.php';	
include_once 'scripts/cookies.php';
include_once 'scripts/db/select.php';
include_once 'scripts/db/update.php';
include_once 'scripts/user_info_content.php';

include_once 'modules/notify.php';
include_once 'modules/menu.php';
include_once 'modules/bread_crumbs.php';

//выполнение действий
if (isset($_POST['save_all']))
    {
        save_all_user_information($_POST);
        $new_loc="user_info.php?id=".$_POST['id'];
        header('Location: '.$new_loc); 
    }
    
/* загрузка модулей */
$page_areas['header']=$tpl_loader->Load("header");
$page_areas['nav'] = construct_bread_crumbs();
$page_areas['menu'] = construct_menu();
$page_areas['content']=construct_user_info_content();

echo $tpl_loader->Load('main', $page_areas);
?>
