<?php

/*
Создает меню навигации Форум>категория>тема
 */

if (!defined('Katrin'))
    die ('Access Error');

include_once 'themes/core.php';
include_once 'scripts/db/select.php';

/**
 *Возвращает заполненный шаблон хлебных крошек
 * @param type $a массив $_GET 
 */
function get_bread_crumbs()
{

    global $tpl_loader;
    
    $result = '';
    
    // корень 
    $bread_crumbs_vars['link'] = 'index.php';
    $bread_crumbs_vars['caption'] = 'Название сайта';
    $result .= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
    
    // 1 уровень
    $presenter = preg_replace('/(.+)\/(\w+?)(\.php.*)/', '\2', $_SERVER['REQUEST_URI']);
    switch ($presenter) 
    {
	// выбор caption
	case 'forum':
	    $bread_crumbs_vars['caption'] = 'Форум';
	    break;
	case 'registration':
	    $bread_crumbs_vars['caption'] = 'Регистрация';
	    break;
	case 'admin':
	    $bread_crumbs_vars['caption'] = 'Админ-панель';
	    break;
	default:
	    $bread_crumbs_vars['caption'] = '';
	    break;
    }
    $bread_crumbs_vars['link'] = $presenter.'.php';
    $result .= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
    
    // если мы глубже первого уровня
    if (!empty($_GET))
    {
        // вывод категории
	if (isset($_GET['category']))
        {
            $bread_crumbs_vars['link'] = 'forum.php?category='.$_GET['category'];
	    $bread_crumbs_vars['caption'] = get_category_name_by_id($_GET['category']);
            $result .= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
        }
	
	// вывод темы
	if (isset($_GET['topic']))
        {
            $bread_crumbs_vars['link'] = 'forum.php?topic='.$_GET['topic'];
	    $bread_crumbs_vars['caption'] = get_topic_name_by_id($_GET['topic']);
            $result .= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
        }
	
	// вывод секции в админ-панели
	if (isset($_GET['section']))
        {
	    switch ($_GET['section']) 
	    {
		case 'menu':
		    $bread_crumbs_vars['caption'] = 'Редактор меню';
		    break;
		default:
		    break;
	    }
	    $bread_crumbs_vars['link'] = 'forum.php?section='.$_GET['section'];
            $result .= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
        }
    }
    
    return $result;
}

?>