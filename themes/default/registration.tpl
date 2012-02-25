<div class="reg-header">
    Регистрация нового пользователя
</div>



<FORM ACTION="registration.php" METHOD=post>
    <table>
        <tr>
            <td width=170>
                Логин:
            </td>
            <td width=200>
                <input type="text" name="login" id="login" MAXLENGTH="40" class="reg-input" onkeyup="check_login()">
            </td>
            <td width=120>
                <div id="correct_login_text" style="color: red">
                </div>
            </td>
        </tr>
        
        <tr>
            <td>
                Почта:
            </td>
            <td>
                <input type="text" name="email" id="email" onKeyUp="check_email()" onchange="check_email()" class="reg-input" >
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
                <input type="text" name="password_1" MAXLENGTH="40" id="pwd_1" onKeyUp="compare_pwds()" class="reg-input">
            </td>
        </tr>
        
        <tr>
            <td>
                 Пароль еще раз:
            </td>
            <td>
                <input type="text" name="password_2" MAXLENGTH="40" id="pwd_2" onKeyUp="compare_pwds()" class="reg-input">
            </td>
            <td>
                <div id="correct_pwd_text" style="color: red">
                </div>
            </td>
        </tr>
        
    </table>
    <input type="hidden" name="pwd" id="pwd"><br>
    <input type=submit id="send_data" style="width: 150px; height: 40px;" disabled="disabled" value="Отправить данные">
</FORM>

