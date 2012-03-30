<?php

define("Katrin", 1);

include_once 'scripts/db/insert.php';
include_once 'themes/core.php';	
include_once 'scripts/cookies.php';
include_once 'scripts/db/select.php';

include_once 'modules/notify.php';
include_once 'modules/menu.php';
include_once 'modules/bread_crumbs.php';

//выполнение действий
//выдача всех полей юзера
if (isset($_GET['id']))
    {
        $res = get_all_user_information($_GET['id']);
        $row = mysql_fetch_array($res);
    }
/* загрузка модулей */
$page_areas['header']=$tpl_loader->Load("header");
$page_areas['nav'] = construct_bread_crumbs();
$page_areas['menu'] = construct_menu();
$page_areas['content']=$tpl_loader->Load("user_info");

echo $tpl_loader->Load('main', $page_areas);
?>
