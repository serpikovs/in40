<?php
/*
 * Проект: Katrin
 * Компоновщик списка категорий
 * Готовность: 5%
 */

// добавляем шаблонизатор    
include_once 'templates/core.php';

include_once 'scripts/stopwatch.php';

$sw = new StopWatch();
$sw->Start();

// название текущей визуальной темы 
$tpl_name = 'default';

$page_areas = array();

/* загрузка шапки */

/* загрузка меню */

$page_areas['menu'] = '';

// цикл
$menu_vars['caption'] = 'Новости';
$menu_vars['link'] = '#';
$page_areas['menu'] = $page_areas['menu'].tpl_load("menu-item.tpl", $menu_vars);

$menu_vars['caption'] = 'Обсуждения';
$menu_vars['link'] = '#';
$page_areas['menu'] = $page_areas['menu'].tpl_load("menu-item.tpl", $menu_vars);

$menu_vars['caption'] = 'Статья 1';
$menu_vars['link'] = '#';
$page_areas['menu'] = $page_areas['menu'].tpl_load("menu-item.tpl", $menu_vars);

unset($menu_vars);

/* загрузка навигации */

/* загрузка панели авторизации */

/* загрузка контента */

/* загрузка подвала */

/* загрузка всей страницы */
echo tpl_load('main.tpl', $page_areas);

echo $sw->End();

?>