/*window.onkeyup=function()
{
    is_all_correct();
}*/

            
 window.onload=check_per_second();

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
    if (a.length!=0 && b.length!=0)
        {
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
}

// проверка e-mail - валидация+совпадение в БД
function check_email()
{
    var a=document.getElementById('email').value;
    if (a.length!=0)
        {
            if (!(/^((([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+(\.([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+)*)@((((([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.))*([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.)[\w]{2,4}|(((([0-9]){1,3}\.){3}([0-9]){1,3}))|(\[((([0-9]){1,3}\.){3}([0-9]){1,3})\])))$/i.test(a)))
            {
                document.getElementById('correct_email_text').style.color="red";
                document.getElementById('correct_email_text').innerHTML="&nbsp - e-mail введен некорректно";
                return false;
            }

            if (is_exist(a,"email")=="true") // проверка есть или нет в БД
            {
                document.getElementById('correct_email_text').style.color="red";
                document.getElementById('correct_email_text').innerHTML="&nbsp - такой почтовый ящик уже зарегистрирован";
                return false;
            }

            document.getElementById('correct_email_text').style.color="green";
            document.getElementById('correct_email_text').innerHTML="&nbsp - email верен";
            return true;
        }
        return false;
}

// проверка логина - валидация+совпадение в БД
function check_login()
{
    var a=document.getElementById('login').value;
    if (a.length!=0)
        {
            if (/[^а-яa-z0-9_]/i.test(a) || a.length<4 || a.length>20)
            {
                document.getElementById('correct_login_text').style.color="red";
                document.getElementById('correct_login_text').innerHTML="&nbsp - логин неверен";
                return false;

            }
            
            if (is_exist(a,"login")=="true") // проверка есть или нет в БД
            {
                document.getElementById('correct_login_text').style.color="red";
                document.getElementById('correct_login_text').innerHTML="&nbsp - пользователь уже существует";
                return false;
            }
            
            document.getElementById('correct_login_text').style.color="green";
            document.getElementById('correct_login_text').innerHTML="&nbsp - логин верен";
            return true;
        }
        return false;
}



function is_all_correct()
{
    if ((compare_pwds() && check_email() && check_login()) )
    {
	document.getElementById('pwd').value=hex_md5(document.getElementById('pwd_1').value);
	return true;
    }
    else
        {
            document.getElementById('send_data').disabled="disabled";
        }

    alert('При заполнении формы были допущены ошибки');
    return false;
}

function check_per_second()
            {
                //setInterval("check_login();check_email();compare_pwds();", 1000);
                
            }
            
            

function getAjax()
	{
		if (window.ActiveXObject) // для IE
		return new ActiveXObject("Microsoft.XMLHTTP");
else if (window.XMLHttpRequest) 
   return new XMLHttpRequest();
else {
   alert("Browser does not support AJAX.");
   return null;
  }
}

function is_exist(a,obj)
	{
		ajax=getAjax();
		var param=obj+"="+a;
		if (ajax != null) 
			{   
				// метод POST, указываем просто имя файла
				ajax.open("POST","http://localhost/in40/scripts/ajax/is_exist.php",false);
   
				// если параметров несколько, то они разделяются &
				//param="in="+document.getElementById('in').value;

				// добавляем стандартный заголовок http
				// посылаемый через ajax
				ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   
				// вроде эти могут тормозить  
				ajax.setRequestHeader("Connection", "close"); 
   
				// посылаем наши данные или пустую строку (param="")
				// главное не null
				ajax.send(param);
                                return ajax.responseText;
			}
			
	}
        
