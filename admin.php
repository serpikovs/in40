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
$current_theme = 'default';
$tpl_loader = new TemplateLoader($current_theme);
$page_areas = array();

/* загрузка шапки */
$page_areas['header']=$tpl_loader->Load("header");

/* загрузка меню */
$page_areas['menu'] = '';
$db_result = get_menu();

while ($menu_vars = mysql_fetch_assoc($db_result)) 
{
    $page_areas['menu'] = $page_areas['menu'] . $tpl_loader->Load("menu-item", $menu_vars);
}
unset($menu_vars);

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

$page_areas['submenu_area'] = $tpl_loader->Load('submenu_area', $page_areas);

/* загрузка оповещения */
$page_areas['notify']=$tpl_loader->Load("notify", array('notify' => 'current'));

/* загрузка контента */
switch ($page) 
{
    case 'main':
	$page_areas['content']=$tpl_loader->Load("admin-main");
	break;
    case 'menu':
	$page_areas['content']=$tpl_loader->Load("admin-menu-editor");
	break;
    default:
	break;
}


/* загрузка подвала */

/* загрузка всей страницы */

echo $tpl_loader->Load('main', $page_areas);

?>
