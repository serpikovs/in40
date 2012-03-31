<?php

include_once 'themes/core.php';

function construct_forum_content()
{
    global $tpl_loader;
    
    //выдача всех полей юзера
    //просмотр и редактирование своего профиля
    if (isset($_GET['id']) && $_GET['id']==get_user_id_by_login(get_cookies_login()))
    {
        $res = get_all_user_information($_GET['id']);
        $row = mysql_fetch_array($res);
        $user_info_vars['id']= $_GET['id'];
        $user_info_vars['group_name']= get_user_group_name_by_user_id($row['user_group_id']);
        $user_info_vars['login']=$row['login'];
        $user_info_vars['name']=$row['name'];
        $user_info_vars['father_name']=$row['father_name'];
        $user_info_vars['family_name']=$row['family_name'];
        if ($row['sex']=='1')
            {
                $user_info_vars['male']="CHECKED";
                $user_info_vars['female']="";
            }
            else
            {
                $user_info_vars['male']="";
                $user_info_vars['female']="CHECKED";
            }
        $user_info_vars['country']=$row['country'];
        $user_info_vars['city']=$row['city'];
        $user_info_vars['avatar']=$row['avatar'];
        $user_info_vars['mobile']=$row['mobile'];
        $user_info_vars['icq']=$row['icq'];
        $user_info_vars['vk']=$row['vk'];
        $user_info_vars['facebook']=$row['facebook'];
        $user_info_vars['about']=$row['about'];
        $user_info_vars['registration_date']=$row['registration_date'];
        $user_info_vars['email']=$row['email'];
        return $tpl_loader->Load("user_info",$user_info_vars);
    }
    
    //просмотр чужого профиля
    if (isset($_GET['id']) && $_GET['id']!=get_user_id_by_login(get_cookies_login()))
    {
        $res = get_all_user_information($_GET['id']);
        $row = mysql_fetch_array($res);
        $user_info_vars['group_name']= get_user_group_name_by_user_id($row['user_group_id']);
        $user_info_vars['login']=$row['login'];
        $user_info_vars['name']=$row['name'];
        $user_info_vars['father_name']=$row['father_name'];
        $user_info_vars['family_name']=$row['family_name'];
        if ($row['sex']=='1')
            {
                $user_info_vars['sex']="мужской";
            }
            else
            {
                $user_info_vars['sex']="женский";
            }
        $user_info_vars['country']=$row['country'];
        $user_info_vars['city']=$row['city'];
        $user_info_vars['avatar']=$row['avatar'];
        $user_info_vars['mobile']=$row['mobile'];
        $user_info_vars['icq']=$row['icq'];
        $user_info_vars['vk']=$row['vk'];
        $user_info_vars['facebook']=$row['facebook'];
        $user_info_vars['about']=$row['about'];
        $user_info_vars['registration_date']=$row['registration_date'];
        $user_info_vars['email']=$row['email'];
        return $tpl_loader->Load("user_info_wo_editing",$user_info_vars);
    }
}
?>
