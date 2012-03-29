<?php

define('Katrin', 1);

include_once 'scripts/db/insert.php';
include_once 'themes/core.php';	
include_once 'scripts/cookies.php';
include_once 'scripts/db/select.php';
include_once 'settings/settings.php';


echo post_message(get_user_id_by_login(get_cookies_login()),$_POST['topic_id'],$_POST['post_message']);
$new_loc="forum.php?topic=".$_POST['topic_id'];
header('Location: '.$new_loc); 
?>
