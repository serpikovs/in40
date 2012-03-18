<?php

/**
 * В зависимости от содержания строки get при запросе к forum.php
 * данный файл выдает содержимое контента (результат функии необходимо 
 * присвоить $page_areas['content']; и затем сунуть в шаблонизатор)
 *  */

function construct_forum_content()
{
   global $tpl_loader;

    include_once 'themes/core.php';
    include_once("scripts/db/select.php");
    

if (empty($_GET)==true)
        {
            $arr = get_categories();
            $content='';
            while ($row = mysql_fetch_assoc($arr)) 
            {
                $category_vars['name']=$row['name'];
                $category_vars['date']=$row['date'];
                $category_vars['id']=$row['id'];
                $content.=$tpl_loader->Load("category",$category_vars);
            }
            return $content;
        }
        
     if (isset($_GET['category'])==true)
        {
            $arr = get_themes($_GET['category']);
            $content='';
            while ($row = mysql_fetch_assoc($arr)) 
            {
                $topic_vars['name']=$row['name'];
                $topic_vars['date']=$row['date'];
                $topic_vars['id']=$row['id'];
                $content.=$tpl_loader->Load("topic",$topic_vars);
            }
            return $content;
        }
        
        return "";
}

?>
