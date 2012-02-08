<?php
/*
 * Проект: Katrin
 * Шаблонизатор
 */

function tpl_load($current_tpl, $vars)
{
    /* 
     * получаем имя текущей темы.
     * потом это будет в настройках
     */
    global $tpl_name;
    
    /* 
     * получаем полный путь до темы
     * пока так
     */
    $full_tpl_path = 'templates/'.$tpl_name;
    
    // проверяем на наличие шаблона:
    if (!file_exists($full_tpl_path.'/'.$current_tpl)) 
	    die('Шаблона '.$full_tpl_path.'/'.$current_tpl.' не существует!');
    
    // загружаем шаблон
    ob_start();
    include($full_tpl_path."/".$current_tpl);
    return ob_get_clean();
}

?>
