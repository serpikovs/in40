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
include_once 'modules/menu.php';

// разборка get
if (isset($_GET['page']))
{
    $page = $_GET['page'];
}
else
{
    $page = "main";
}

// выполнение задач

// заполнение страницы
/* загрузка шапки */
$page_areas['header']=$tpl_loader->Load("header");

/* загрузка меню */
$page_areas['menu'] = construct_menu();

/* загрузка навигации */
$page_areas['nav'] = '';

$nav_vars['caption'] = 'Название сайта';
$nav_vars['link'] = 'index.php';
$page_areas['nav'] .= $tpl_loader->Load("nav-item", $nav_vars);

$nav_vars['caption'] = 'Админ-панель';
$nav_vars['link'] = 'admin.php';
$page_areas['nav'] .= $tpl_loader->Load("nav-item", $nav_vars);

switch ($page) 
{
    case 'menu':
	$nav_vars['caption'] = 'Редактор главного меню';
	$nav_vars['link'] = 'admin.php?page=menu';
	$page_areas['nav'] .= $tpl_loader->Load("nav-item", $nav_vars);
	break;
    default:
	break;
}

unset($nav_vars);

/* загрузка панели авторизации */
$page_areas['login'] = construct_log_reg();

/* загрузка всего субменю */
$page_areas['submenu_area'] = $tpl_loader->Load('submenu_area', $page_areas);

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
