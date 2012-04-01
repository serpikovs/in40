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
function construct_bread_crumbs()
{
    global $tpl_loader;
    
    $result = '';
    
    // корень 
    $bread_crumbs_vars['link'] = 'index.php';
    $bread_crumbs_vars['caption'] = site_name;
    $result .= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
    
    // 1 уровень
    $presenter = preg_replace('/(.+)\/(\w+?)(\.php.*)/', '\2', $_SERVER['REQUEST_URI']);
    switch ($presenter) 
    {
	// выбор caption
	case 'forum':
	    $bread_crumbs_vars['caption'] = 'Форум';
	    $tpl_loader->page_title .= ' // '.$bread_crumbs_vars['caption'];
	    break;
	case 'registration':
	    $bread_crumbs_vars['caption'] = 'Регистрация';
	    $tpl_loader->page_title .= ' // '.$bread_crumbs_vars['caption'];
	    break;
	case 'admin':
	    $bread_crumbs_vars['caption'] = 'Админ-панель';
	    $tpl_loader->page_title .= ' // '.$bread_crumbs_vars['caption'];
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
	    $tpl_loader->page_title .= ' // '.$bread_crumbs_vars['caption'];
            $result .= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
        }
	
	// вывод темы
	if (isset($_GET['topic']))
        {
            
            
          $bread_crumbs_vars['link'] = "forum.php?category=".get_owning_category_id($_GET['topic']);
	  $bread_crumbs_vars['caption'] = get_owning_category_name($_GET['topic']);
          $result.= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
            
            $bread_crumbs_vars['link'] = 'forum.php?topic='.$_GET['topic'];
	    $bread_crumbs_vars['caption'] = get_topic_name_by_id($_GET['topic']);
	    $tpl_loader->page_title .= ' // '.$bread_crumbs_vars['caption'];
            $result.= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
        }
	
	// вывод секции в админ-панели
	if (isset($_GET['section']))
        {
	    switch ($_GET['section']) 
	    {
		case 'categories':
		    $bread_crumbs_vars['caption'] = 'Редактор категорий';
		    $tpl_loader->page_title .= ' // '.$bread_crumbs_vars['caption'];
		    break;
		default:
		    $bread_crumbs_vars['caption'] = '';
		    break;
	    }
	    $bread_crumbs_vars['link'] = 'admin.php?section='.$_GET['section'];
            $result .= $tpl_loader->Load('nav-item', $bread_crumbs_vars);
        }
    }
    
    return $result;
}

?>