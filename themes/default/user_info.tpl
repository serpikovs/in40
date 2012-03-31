<div class="user_info">	
    <div class="user_inf-row">
        <div class="user-photo"></div>
        <div class="user-info-area">
            <a class="user-nickname" href="<?=$this->user_profile?>"><?=$this->login?></a>
            <br>
            <span class="user-group"><?=$this->group_name?></span>
        </div>
        <div class="user_info-parameters">
            <form action="user_info.php" method="post">
                <input type="hidden" name="id" value="<?=$this->id?>">
                Имя: <br><input type="text"  value="<?=$this->name?>" name="name"><br>
                Отчество: <br><input type="text"  value="<?=$this->father_name?>" name="father_name"><br>
                Фамилия: <br><input type="text"  value="<?=$this->family_name?>" name="family_name"><br>
                Пол:&nbsp<input type="radio" name="sex" value="мужской" <?=$this->male?>>мужской&nbsp&nbsp
                 <input type="radio" name="sex" value="женский" <?=$this->female?>>женский<br>
                Страна: <br><input type="text"  value="<?=$this->country?>" name="country"><br>
                Город: <br><input type="text"  value="<?=$this->city?>" name="city"><br>
                Аватар: <br><input type="text"  value="<?=$this->avatar?>" name="avatar"><br>
                Мобильный телефон: <br><input type="text"  value="<?=$this->mobile?>" name="mobile"><br>
                ICQ: <br><input type="text"  value="<?=$this->icq?>" name="icq"><br>
                Адрес ВКонтакте: <br><input type="text"  value="<?=$this->vk?>" name="vk"><br>
                Адрес facebook: <br><input type="text"  value="<?=$this->facebook?>" name="facebook"><br>
                О себе: <br><input type="text"  value="<?=$this->about?>" name="about"><br>
                Электронная почта: <br><input type="text"  value="<?=$this->email?>" name="email"><br>
                <input type="hidden" name="save_all" value="save">
                <input type="submit" value="Сохранить">
            </form>
        </div>
    </div>
</div>