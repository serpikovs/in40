<?php
/*
 * Проект: Katrin
 * Компоновщик модуля Главного меню
 */

if (!defined('Katrin'))
    die ('Access Error');

include_once 'scripts/db/select.php';

function construct_menu()
{
    global $tpl_loader;
    
    $buffer = '';
    $db_result = get_menu();

    while ($menu_vars = mysql_fetch_assoc($db_result)) 
    {
	$buffer .= $tpl_loader->Load("menu-item", $menu_vars);
    }
    unset($menu_vars);
    
    return $buffer;
}
?>
