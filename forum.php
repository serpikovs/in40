<?php
/*
 * Проект: Katrin
 * Компоновщик списка категорий
 * Готовность: 5%
 */

// добавляем шаблонизатор    
define('Katrin', 1);

include_once 'themes/core.php';
include_once 'modules/notify.php';
include_once 'scripts/forum_content.php';

// подключение модулей
include_once 'modules/log_reg.php';
include_once 'modules/bread_crumbs.php';
include_once 'modules/menu.php';

//$local_theme_scripts=array("topic.js");
//$tpl_loader->set_local_theme_scripts($local_theme_scripts);
$tpl_loader->set_local_theme_scripts_by_get($_GET);

// название текущей визуальной темы 
$current_theme = 'default';

/* загрузка модулей */
$page_areas['header'] = $tpl_loader->Load("header");
$page_areas['menu'] = construct_menu();
$page_areas['nav'] = construct_bread_crumbs();
$page_areas['login'] = construct_log_reg();
$page_areas['content'] = construct_forum_content();

/* загрузка всей страницы */
echo $tpl_loader->Load('main', $page_areas);

?>