<?php

/**
 * В зависимости от содержания строки get при запросе к forum.php
 * данный файл выдает содержимое контента (результат функии необходимо 
 * присвоить $page_areas['content']; и затем сунуть в шаблонизатор)
 *  */

function construct_forum_content()
{
    include_once 'themes/core.php';
    include_once 'scripts/db/select.php';
    include_once 'scripts/cookies.php';
    include_once 'modules/log_reg.php';
    
    global $tpl_loader;
    //global $is_logon;

 
    
    //просмотр категорий
    if (empty($_GET)==true)
        {
            $arr = get_categories();
            $content='';
            while ($row = mysql_fetch_assoc($arr)) 
            {
                if (is_may_to_use_permission_on_category(get_cookies_login(), $row['id'], "see_category") ||
                    is_may_to_use_permission_on_category(get_cookies_login(), $row['id'], "category_full_access"))
                    {
                        $category_vars['name']=$row['name'];
                        $category_vars['date']=$row['date'];
                        $category_vars['id']=$row['id'];
                        $content.=$tpl_loader->Load("category",$category_vars);
                    }
            }
            return $content;
        }
        
     if (isset($_GET['category'])==true)
        {
            $arr = get_topics($_GET['category']);
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
     
     
     if (isset($_GET['topic'])==true)
        {
            //выдача всех постов
            $arr = get_posts($_GET['topic']);
            $content='';
            while ($row = mysql_fetch_assoc($arr)) 
            {
                $post_vars['id']=$row['id'];
                $post_vars['date']=$row['date'];
                $post_vars['login']=get_user_name_by_id($row['user_id']);
                $post_vars['user_group']=get_user_group_name_by_user_id($row['user_id']);
                $post_vars['body']=$row['body'];
                if ($row['voite_y']!=$row['voite_n'])
                    {
                        if ($row['voite_y']>$row['voite_n'])
                            {
                                $post_vars['voite_y']=$row['voite_y'];
                            }
                            else
                            {
                                $post_vars['voite_n']=$row['voite_n'];
                            }
                    }
                $post_vars['user_profile']='user_info='.$row['user_id'];
                $content.=$tpl_loader->Load("post",$post_vars);
            }
            
            //выдача формы ответа
            $content.=$tpl_loader->Load("reply_to_post");
            return $content;
        }
        return "";
}

?>
