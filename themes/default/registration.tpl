<FORM ACTION="registration.php" METHOD="POST" onsubmit="return is_all_correct()">
    <table style="border-spacing: 20px 2px;">
        <tr>
            <td>
                Логин:
            </td>
            <td>
                <input type="text" name="login" id="login" MAXLENGTH="40" class="reg-input" onkeyup="check_login()" onblur="check_login()" />
            </td>
            <td>
                <div id="correct_login_text" style="color: red">
                </div>
            </td>
        </tr>
        
        <tr>
            <td>
                Почта:
            </td>
            <td>
                <input type="text" name="email" id="email" class="reg-input" onKeyUp="check_email()" onblur="check_email()" />
            </td>
            <td>
                <div id="correct_email_text" style="color: red">
                </div>
            </td>
        </tr>
        
        <tr>
            <td>
               Пароль:
            </td>
            <td>
                <input type="password" name="password_1" MAXLENGTH="40" id="pwd_1" onKeyUp="check_pwd()" onblur="check_pwd()" class="reg-input">
            </td>
	    <td>
                <div id="correct_pwd_text1" style="color: red">
                </div>
            </td>
        </tr>
        
        <tr>
            <td>
                 Пароль еще раз:
            </td>
            <td>
                <input type="password" name="password_2" MAXLENGTH="40" id="pwd_2" onKeyUp="compare_pwds()" onblur="compare_pwds()" class="reg-input">
            </td>
            <td>
                <div id="correct_pwd_text2" style="color: red">
                </div>
            </td>
        </tr>
        
    </table>
    <input type="hidden" name="pwd" id="pwd"><br>
    <input type=submit id="send_data" style="width: 150px; height: 40px;" value="Регистрация">
    <script
</FORM>

