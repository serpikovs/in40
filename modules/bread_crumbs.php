<?php

/*
Создает меню навигации Форум>категория>тема
 */


/**
 *Возвращает заполненный шаблон хлебных крошек
 * @param type $a массив $_GET 
 */
function get_bread_crumbs($a)
{
    global $tpl_loader;
    
    include_once 'themes/core.php';
    include_once 'themes/core.php';
    include_once 'scripts/db/select.php';
    
    
    if (empty($_GET)==true)
        {
            $content=$tpl_loader->Load("bread_crumbs");
            return $content;
        }
        
     if (isset($_GET['category'])==true)
        {
            $bread_crumbs_content['category']="<a href='";
            $bread_crumbs_content['category'].=site."forum.php?category=".$_GET['category'];
            $bread_crumbs_content['category'].="'>".get_category_name_by_id($_GET['category'])."</a> > ";
            $content=$tpl_loader->Load("bread_crumbs",$bread_crumbs_content);
            return $content;
        }
     if (isset($_GET['topic'])==true)
        {
         
            $category_id=get_owning_category_id($_GET['topic']);
            $category_name=get_category_name_by_id($category_id);
            $bread_crumbs_content['category']="<a href='";
            $bread_crumbs_content['category'].=site."forum.php?category=".$category_id;
            $bread_crumbs_content['category'].="'>".$category_name."</a> > ";
         
            $bread_crumbs_content['category'].="<a href='";
            $bread_crumbs_content['category'].=site."forum.php?topic=".$_GET['topic'];
            $bread_crumbs_content['category'].="'>".get_topic_name_by_id($_GET['topic'])."</a>";
            $content=$tpl_loader->Load("bread_crumbs",$bread_crumbs_content);
            return $content;
        }
}

?>
