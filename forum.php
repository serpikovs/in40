<?php
/*
 * Проект: Katrin
 * Компоновщик списка категорий
 * Готовность: 5%
 */

// добавляем шаблонизатор    
define("Katrin", 1);

include_once 'themes/core.php';
include_once 'scripts/stopwatch.php';
include_once 'modules/notify.php';
include_once("scripts/db/select.php");

$sw = new StopWatch();
$sw->Start();

// название текущей визуальной темы 
$current_theme = 'default';



/* загрузка шапки */

$page_areas['header']=$tpl_loader->Load("header");


/* загрузка меню */
/*
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
*/
/* загрузка навигации */

$page_areas['submenu_area']=$tpl_loader->Load("submenu_area");

/* загрузка панели авторизации */

/* загрузка контента */

notify('Категории');

$arr = get_categories();
$page_areas['content']='';
while ($row = mysql_fetch_assoc($arr)) 
{
    $category_vars['name']=$row['name'];
    $category_vars['date']=$row['date'];
    $category_vars['id']=$row['id'];
    $page_areas['content'].=$tpl_loader->Load("category",$category_vars);
}

/* загрузка подвала */

/* загрузка всей страницы */


echo $tpl_loader->Load('main', $page_areas);

echo $sw->End();

?>