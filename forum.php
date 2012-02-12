<?php
/*
 * Проект: Katrin
 * Компоновщик списка категорий
 * Готовность: 5%
 */

// добавляем шаблонизатор    
include_once 'themes/core.php';

include_once 'scripts/stopwatch.php';
$sw = new StopWatch();
$sw->Start();

// название текущей визуальной темы 
$current_theme = 'default';

// создаем шаблонизатор этой темы
$tpl_loader = new TemplateLoader($current_theme);

$page_areas = array();

/* загрузка шапки */

/* загрузка меню */

$page_areas['menu'] = '';

// цикл
$menu_vars['caption'] = 'Новости';
$menu_vars['link'] = '#';
$page_areas['menu'] = $page_areas['menu'].$tpl_loader->Load("menu-item", $menu_vars);

$menu_vars['caption'] = 'Обсуждения';
$menu_vars['link'] = '#';
$page_areas['menu'] = $page_areas['menu'].$tpl_loader->Load("menu-item", $menu_vars);

for ($i = 1; $i <= 10; $i++)
{
    $menu_vars['caption'] = 'Статья&nbsp;'.$i;
    $menu_vars['link'] = '#';
    $page_areas['menu'] = $page_areas['menu'].$tpl_loader->Load("menu-item", $menu_vars);
}

unset($menu_vars);

/* загрузка навигации */

/* загрузка панели авторизации */

/* загрузка контента */

/* загрузка подвала */

/* загрузка всей страницы */
echo $tpl_loader->Load('main', $page_areas);

echo $sw->End();

?>