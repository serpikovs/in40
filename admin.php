<?php
/*
 * Проект: Katrin
 * Админ-панель
 */

define("Katrin", 1);

// добавляем библиотеки
include_once 'scripts/db/select.php';
include_once 'scripts/db/insert.php';
include_once 'scripts/cookies.php';
include_once 'themes/core.php';

// загружаем модули
include_once 'modules/log_reg.php';
include_once 'modules/notify.php';
include_once 'modules/menu.php';;
include_once 'modules/bread_crumbs.php';

// разборка get
if (isset($_GET['section']))
{
    $page = $_GET['section'];
}
else
{
    $page = "main";
}

// выполнение задач

/* загрузка модулей */
$page_areas['header']=$tpl_loader->Load("header");
$page_areas['menu'] = construct_menu();
$page_areas['nav'] = get_bread_crumbs();
$page_areas['login'] = construct_log_reg();

/* загрузка контента */
switch ($page) 
{
    case 'main':
	$page_areas['content']=$tpl_loader->Load("admin-main");
	break;
    case 'menu':
	$menu['items'] = get_menu();
	
	$page_areas['content']=$tpl_loader->Load("admin-menu-editor");
	break;
    default:
	break;
}

/* загрузка подвала */

/* загрузка всей страницы */
echo $tpl_loader->Load('main', $page_areas);

?>