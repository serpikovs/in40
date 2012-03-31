<?php
/*
 * Проект: Katrin
 * Компоновщик списка категорий
 * Готовность: 5%
 */

// добавляем шаблонизатор    
define('Katrin', 1);

include_once 'themes/core.php';
include_once 'modules/notify.php';
include_once 'scripts/forum_content.php';
include_once 'scripts/db/insert.php';
include_once 'scripts/cookies.php';
include_once 'scripts/db/delete.php';

// подключение модулей
include_once 'modules/log_reg.php';
include_once 'modules/bread_crumbs.php';
include_once 'modules/menu.php';

//выполнение действий
//создание темы
if (isset($_POST['action']) && $_POST['action']=="create_new_topic"  && isset($_POST['category_id']) && isset($_POST['post_message']) && isset($_POST['new_topic_name']) )
    {
         if (is_may_to_use_permission(get_cookies_login(),"create_topics"))
             {
                create_new_topic(get_user_id_by_login(get_cookies_login()),$_POST['category_id'],$_POST['new_topic_name'],$_POST['post_message']);
                $new_loc="forum.php?category=".$_POST['category_id'];
                header('Location: '.$new_loc); 
             }
    }
//запись нового сообщения в бд
if (isset($_POST['action']) && $_POST['action']=="post_message"  && isset($_POST['topic_id']) && isset($_POST['post_message']))
    {
        post_message(get_user_id_by_login(get_cookies_login()),$_POST['topic_id'],$_POST['post_message']);
        $new_loc="forum.php?topic=".$_POST['topic_id'];
        header('Location: '.$new_loc); 
    }
//удаление темы
if (isset($_GET['action'])==true && $_GET['action']=="delete_topic")
            {
                if (is_may_to_use_permission(get_cookies_login(),"delete_smbd_else_theme"))
                    {
                        delete_topic($_GET['topic_id']);
                        $new_loc="forum.php?category=".$_GET['category_id'];
                        header('Location: '.$new_loc); 
                    }
            }
//удаление сообщения
        if (isset($_GET['action'])==true && $_GET['action']=="delete_post")
            {
                if (is_may_to_use_permission(get_cookies_login(),"delete_posts"))
                    {
                        delete_post($_GET['post_id']);
                        $new_loc="forum.php?topic=".$_GET['topic_id'];
                        header('Location: '.$new_loc); 
                    }
            }
    
//$local_theme_scripts=array("topic.js");
//$tpl_loader->set_local_theme_scripts($local_theme_scripts);
$tpl_loader->set_local_theme_scripts_by_get($_GET);

// название текущей визуальной темы 
$current_theme = 'default';

/* загрузка модулей */
$page_areas['header'] = $tpl_loader->Load("header");
$page_areas['menu'] = construct_menu();
$page_areas['nav'] = construct_bread_crumbs();
$page_areas['login'] = construct_log_reg();
$page_areas['content'] = construct_forum_content();

/* загрузка всей страницы */
echo $tpl_loader->Load('main', $page_areas);

?>