<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<?php
        include '/constants.php';
        if (empty($_POST))
        {
//        if (mail("iam32five@gmail.com", "theme", "text", "blackandwhite_91@mail.ru")==false)
//        {
//            echo "dsd";
//
//        }
//        else
//            echo "1111111111111111";
           fff();
        }
          
?>
   <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="md5.js"></script>
        <title>Регистрация</title>
        <script>
            window.onkeyup=function()
            {
                is_all_correct();
            }
            
            function compare()
                {
                var a=document.getElementById('pwd_1').value;
                var b=document.getElementById('pwd_2').value;
                    if (a==b)
                        {
                           document.getElementById('pass_border').style.borderColor="green";
                           document.getElementById('pwd').value=hex_md5(a);
                        }
                    else
                        {
                            document.getElementById('pass_border').style.borderColor="red";
                        }
                }
             function check_email()
                {
                    var a=document.getElementById('email').value;
                    if (/^((([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+(\.([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+)*)@((((([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.))*([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.)[\w]{2,4}|(((([0-9]){1,3}\.){3}([0-9]){1,3}))|(\[((([0-9]){1,3}\.){3}([0-9]){1,3})\])))$/.test(a)==true)
                        {
                            document.getElementById('email_border').style.borderColor="green";
                        }
                        else
                        {
                            document.getElementById('email_border').style.borderColor="red";
                        }
                }
            function is_all_correct()
            {
                var pwd_1=document.getElementById('pwd_1').value;
                var pwd_2=document.getElementById('pwd_2').value;
                var email=document.getElementById('email').value;
                var login_length=document.getElementById('login').value.length;
                var is_email=/^((([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+(\.([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+)*)@((((([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.))*([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.)[\w]{2,4}|(((([0-9]){1,3}\.){3}([0-9]){1,3}))|(\[((([0-9]){1,3}\.){3}([0-9]){1,3})\])))$/.test(email);
                if (pwd_1==pwd_2 && pwd_1!="" && is_email==true && login_length<=40 && login_length>4)
                    {
                        document.getElementById('send_data').disabled="";
                        //alert('1');
                    }
                    else
                    {
                        document.getElementById('send_data').disabled="disabled";
                        //alert('2');
                    }
                        
            }
        </script>
    </head>
    <body>     
        <FORM ACTION="registration.php" METHOD=post>
        Будущий логин, он же никнейм:
        <input type="text" name="login" id="login" MAXLENGTH="40"><br>
        <div id="email_border" style="border: 1px solid red;">
            Почта:
            <input type="text" name="email" id="email" onKeyUp="check_email()"><br>
        </div>
        <div id="pass_border" style="border: 1px solid red;">    
            Пароль:
            <input type="text" name="password_1" MAXLENGTH="40" id="pwd_1" onKeyUp="compare()"><br>
            Пароль еще раз:
            <input type="text" name="password_2" MAXLENGTH="40" id="pwd_2" onKeyUp="compare()"><br>
        </div>
        <input type="hidden" name="pwd" id="pwd"><br>
        <input type=submit id="send_data" disabled="disabled" value="Отправить данные">
        </FORM>
        
    </body>
</html>
   

        



           

        
        

