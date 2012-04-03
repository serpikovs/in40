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
                //если юзер имеет права на удаление топика
                if (is_may_to_use_permission(get_cookies_login(),"delete_smbd_else_theme"))
                    {
                        $topic_vars['delete_topic_link']="forum.php?action=delete_topic&category_id=".$_GET['category'];
                        $topic_vars['delete_topic_link'].="&topic_id=".$row['id'];
                        $topic_vars['delete_topic_link'].="&user_id=".get_user_id_by_login(get_cookies_login());
                        $topic_vars['delete_topic_link']="<a href='".$topic_vars['delete_topic_link']."'>удалить</a>";
                    }
                //если тема закрыта, то выводим в списках тем в каждом элементе этого списка "тема закрыта"
                if ($row['is_closed']=="1")
                    {
                        $topic_vars['is_closed']="Тема закрыта";
                        $topic_vars['close_topic_link']="";
                    }
                    else
                    {
                        $topic_vars['is_closed']="";
                        //если есть право закрывать темы, то выводим линк на закрытие
                        if (is_may_to_use_permission(get_cookies_login(),"close_topics"))
                            {
                                $topic_vars['close_topic_link']="forum.php?action=close_topic&category_id=".$_GET['category'];
                                $topic_vars['close_topic_link'].="&topic_id=".$row['id'];
                                $topic_vars['close_topic_link'].="&user_id=".get_user_id_by_login(get_cookies_login());
                                $topic_vars['close_topic_link']="<a href='".$topic_vars['close_topic_link']."'>Закрыть тему</a>";
                            }
                    }
                
                
                $content.=$tpl_loader->Load("topic",$topic_vars);
            }
            
            if (is_may_to_use_permission(get_cookies_login(),"create_topics"))
                    {
                        $topic_control_area_vars['category_id']=$_GET['category'];
                        $content.=$tpl_loader->Load("topic_control_area",$topic_control_area_vars);
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
                $post_vars['login']=get_user_login_by_id($row['user_id']);
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
                if ($row['voite_y']==$row['voite_n'])
                    {
                        $post_vars['voite_y']='';
                        $post_vars['voite_n']='';
                    }
                $post_vars['user_profile']='user_info.php?id='.$row['user_id'];
                //если юзер имеет права на удаление
                if (is_may_to_use_permission(get_cookies_login(),"delete_posts"))
                    {
                        $post_vars['delete_post_link']="forum.php?action=delete_post&post_id=".$row['id'];
                        $post_vars['delete_post_link'].="&topic_id=".$_GET['topic'];
                        $post_vars['delete_post_link'].="&user_id=".get_user_id_by_login(get_cookies_login());
                        $post_vars['delete_post_link']="<a href='".$post_vars['delete_post_link']."'>удалить</a>";
                    }
                $content.=$tpl_loader->Load("post",$post_vars);
            }
            
            //выдача формы ответа
            if (!is_closed_topic($_GET['topic']))
                {
                    
                    $reply_to_post_vars['topic_id']=$_GET['topic'];
                    $content.=$tpl_loader->Load("reply_to_post",$reply_to_post_vars);
                }
            return $content;
        }
        
        
            
        return "";
}

?>
