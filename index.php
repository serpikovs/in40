<?php

/*
 * ==================
 * 
 * Раскомментировать!
 * header("Location: forum.php");
 * 
 * ==================
 */

define("Katrin", 1);

// подключение библиотек
include_once("scripts/db/select.php");
include_once("scripts/db/insert.php");
include_once("scripts/db/get_settings.php");
include_once("settings/settings.php");
include_once 'scripts/cookies.php';
include_once 'themes/core.php';

// подключение модулей
include_once 'modules/log_reg.php';

/* загрузка панели авторизации */
$page_areas['login'] = construct_log_reg();

/* загрузка всего субменю */
$page_areas['submenu_area'] = $tpl_loader->Load('submenu_area', $page_areas);

$page_areas['content'] = '';
$arr = get_categories();
while ($row = mysql_fetch_assoc($arr)) 
{
    $page_areas['content'] .= $row['name'] . $row['id'] . $row['date'] . "<br>";
}

echo $tpl_loader->Load('main', $page_areas);
?>