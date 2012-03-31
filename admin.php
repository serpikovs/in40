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

// разборка get (тернарными операциями)
$page = isset($_GET['section']) ? $_GET['section'] : 'main';
$action = isset($_GET['action']) ? $_GET['action'] : '';

// выполнение задач
if (($action == 'save')&&($page == 'categories'))
{
    
    notify('Изменения сохранены!');
}


/* загрузка модулей */
$page_areas['header']=$tpl_loader->Load("header");
$page_areas['nav'] = construct_bread_crumbs();
$page_areas['login'] = construct_log_reg();

/* загрузка контента */
switch ($page) 
{
    case 'main':
	$page_areas['content']=$tpl_loader->Load("admin-main");
	break;
    case 'categories':
	if ($action != 'save') notify('Внимание! При удалении категории удаляются все связанные с ней темы и сообщения!');
	$arr = get_categories();
	$page_areas['items'] = '';
	while ($row = mysql_fetch_assoc($arr)) 
	{
	    $page_areas['items'].=$tpl_loader->Load('admin-categories-editor-item',$row);
	}
	$page_areas['content']=$tpl_loader->Load("admin-categories-editor", $page_areas);
	break;
    default:
	break;
}

/* загрузка подвала */

/* загрузка всей страницы */
echo $tpl_loader->Load('main', $page_areas);

?>