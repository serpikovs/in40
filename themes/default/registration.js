/*window.onkeyup=function()
{
    is_all_correct();
}*/

// проверка пароля - от 4х знаков
function check_pwd()
{
    var a=document.getElementById('pwd_1').value;
    if (a.length > 3)
    {
	document.getElementById('correct_pwd_text1').innerHTML="";
	return true;
    }
    document.getElementById('correct_pwd_text1').style.color="red";
    document.getElementById('correct_pwd_text1').innerHTML="&nbsp - слишком короткий пароль";
    return false
}

// проверка пароля2 - совпадение
function compare_pwds()
{
    var a=document.getElementById('pwd_1').value;
    var b=document.getElementById('pwd_2').value;
    if (check_pwd() & a==b)
    {
	document.getElementById('correct_pwd_text2').style.color="green";
	document.getElementById('correct_pwd_text2').innerHTML="&nbsp - пароли совпали";
	return true;
    }
    
    document.getElementById('correct_pwd_text2').style.color="red";
    document.getElementById('correct_pwd_text2').innerHTML="&nbsp - пароли не совпали";
    return false
}

// проверка e-mail - валидация+совпадение в БД
function check_email()
{
    var a=document.getElementById('email').value;
    if (!(/^((([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+(\.([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+)*)@((((([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.))*([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.)[\w]{2,4}|(((([0-9]){1,3}\.){3}([0-9]){1,3}))|(\[((([0-9]){1,3}\.){3}([0-9]){1,3})\])))$/i.test(a)))
    {
	document.getElementById('correct_email_text').style.color="red";
	document.getElementById('correct_email_text').innerHTML="&nbsp - e-mail введен некорректно";
	return false;
    }
    
    if (false) // проверка есть или нет в БД
    {
	document.getElementById('correct_email_text').style.color="red";
	document.getElementById('correct_email_text').innerHTML="&nbsp - пользователь уже существует";
	return false;
    }
    
    document.getElementById('correct_email_text').style.color="green";
    document.getElementById('correct_email_text').innerHTML="&nbsp - email верен";
    return true;
    
}

// проверка логина - валидация+совпадение в БД
function check_login()
{
    var a=document.getElementById('login').value;
    if (/[^а-яa-z0-9_]/i.test(a) || a.length<4 || a.length>20)
    {
	document.getElementById('correct_login_text').style.color="red";
	document.getElementById('correct_login_text').innerHTML="&nbsp - логин неверен";
	return false;
	
    }
    
    if (false) // проверка есть или нет в БД
    {
	document.getElementById('correct_email_text').style.color="red";
	document.getElementById('correct_email_text').innerHTML="&nbsp - пользователь уже существует";
	return false;
    }
    document.getElementById('correct_login_text').style.color="green";
    document.getElementById('correct_login_text').innerHTML="&nbsp - логин верен";
    return true;
}

function is_all_correct()
{
    if ((compare_pwds() & check_email() & check_login()))
    {
	document.getElementById('pwd').value=hex_md5(document.getElementById('pwd_1').value);
	return true;
    }
    alert('При заполнении формы были допущены ошибки');
    return false;
}
