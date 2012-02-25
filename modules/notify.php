<?php
/*
 * Проект: Katrin
 * Компоновщик модуля Уведомлений
 */

if (!defined('Katrin'))
    die ('Access Error');

/**
 * Выводит сообщение в область уведомлений
 * @global object $tpl_loader Доступ к шаблонизатору
 * @global array $page_areas Доступ к областям
 * @param string $msg Сообщение для вывода
 */
function notify($msg)
{
    global $tpl_loader;
    global $page_areas;
    
    if (!isset($page_areas['notify']))
    {
	$page_areas['notify'] = '';
    }
    
    $page_areas['notify'] = $tpl_loader->Load("notify", array('notify' => $msg));
}
?>
