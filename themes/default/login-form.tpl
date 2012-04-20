<form method="post" action="<?=$_SERVER['PHP_SELF']?>?login">
    <li class="login-item">
	<input type="text" name="login" value="[логин]" onFocus="hidden_watermark_l(this)" onBlur="restore_watermark_l(this)"/>
    </li>
    <li class="login-item">
	<input type="text" id="original_pwd"  value="[пароль]" onFocus="hidden_watermark_p(this)" onBlur="restore_watermark_p(this)"/>
	<input type="hidden" name="pwd" id="pwd"/>
    </li>
    <li class="login-item">
	<input type="submit" id="send_data" value="Войти" onclick="pwdToMD5()" />
	<!--a href="" class="menu-link">Войти</a-->
    </li>
    <li class="login-item">
	|
    </li>
    <li class="login-item">
	<a href="registration.php" class="menu-link">Регистрация</a>
    </li>
    <script type="text/javascript">
	<!--
        function pwdToMD5()
	{
	    document.getElementById('pwd').value = hex_md5(document.getElementById('original_pwd').value);
	}
        
        function hidden_watermark_l(a)
        {
            if (a.value=="[логин]")
            a.value='';
        }
        
        function hidden_watermark_p(a)
        {
            if (a.value=="[пароль]")
            a.value='';
        }
        
        function restore_watermark_l(a)
        {
            if (a.value=="")
                {
                   a.value="[логин]";     
                }
        }
        
        function restore_watermark_p(a)
        {
            if (a.value=="")
                {
                   a.value="[пароль]";     
                }
        }
	-->
    </script>
</form>