<div class="user_info">	
    <div class="user_inf-row">
        <div class="user-photo"><img src="<?=$this->user_photo?>" width=55></div>
        <div class="user-info-area">
            <a class="user-nickname" href="<?=$this->user_profile?>"><?=$this->login?></a>
            <br>
            <span class="user-group"><?=$this->group_name?></span>
        </div>
        <div class="user_info-parameters">
            <form action="user_info.php" method="post">
                Имя: <div class="user_info-parameters_wo_editing"><?=$this->name?></div>
                Отчество: <div class="user_info-parameters_wo_editing"><?=$this->father_name?></div>
                Фамилия: <div class="user_info-parameters_wo_editing"><?=$this->family_name?></div>
                Пол: <div class="user_info-parameters_wo_editing"><?=$this->sex?></div>
                Страна: <div class="user_info-parameters_wo_editing"><?=$this->country?></div>
                Город: <div class="user_info-parameters_wo_editing"><?=$this->city?></div>
                Аватар: <div class="user_info-parameters_wo_editing"><?=$this->avatar?></div>
                Мобильный телефон: <div class="user_info-parameters_wo_editing"><?=$this->mobile?></div>
                ICQ: <div class="user_info-parameters_wo_editing"><?=$this->icq?></div>
                Адрес ВКонтакте: <div class="user_info-parameters_wo_editing"><a href="<?=$this->vk?>"><?=$this->vk?></a></div>
                Адрес facebook: <div class="user_info-parameters_wo_editing"><a href="<?=$this->facebook?>"><?=$this->facebook?></a></div>
                О себе: <div class="user_info-parameters_wo_editing"><?=$this->about?></div>
                Электронная почта: <div class="user_info-parameters_wo_editing"><?=$this->email?></div>
            </form>
        </div>
    </div>
</div>