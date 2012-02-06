<?php
/*
 * 
 * Шаблонизатор
 */



function load_page($current_tpl)
{
    global $template_path;
    
    load_header();
    //load_menu();
    //load_body();
    //load_footer();
}


function load_header()
{
    
    include $template_path.'/'."cat.tpl";
    
}


?>
