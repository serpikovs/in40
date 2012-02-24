
            window.onkeyup=function()
            {
                is_all_correct();
            }
            
            function compare_pwds()
                {
                var a=document.getElementById('pwd_1').value;
                var b=document.getElementById('pwd_2').value;
                    if (a.length!=0)
                        {
                            if (a==b)
                                {
                                    document.getElementById('correct_pwd_text').style.color="green";
                                    document.getElementById('correct_pwd_text').innerHTML="&nbsp - пароли совпали";
                                }
                                else
                                {
                                            document.getElementById('correct_pwd_text').style.color="red";
                                            document.getElementById('correct_pwd_text').innerHTML="&nbsp - пароли не совпали";
                                }
                            }
                        }
             function check_email()
                {
                    var a=document.getElementById('email').value;
                    if (/^((([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+(\.([a-z]|[0-9]|!|#|$|%|&|'|\*|\+|\-|\/|=|\?|\^|_|`|\{|\||\}|~)+)*)@((((([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.))*([a-z]|[0-9])([a-z]|[0-9]|\-){0,61}([a-z]|[0-9])\.)[\w]{2,4}|(((([0-9]){1,3}\.){3}([0-9]){1,3}))|(\[((([0-9]){1,3}\.){3}([0-9]){1,3})\])))$/.test(a)==true)
                        {
                            document.getElementById('correct_email_text').style.color="green";
                            document.getElementById('correct_email_text').innerHTML="&nbsp - email верен";
                        }
                        else
                        {
                            if (a.length!=0)
                                {
                                    document.getElementById('correct_email_text').style.color="red";
                                    document.getElementById('correct_email_text').innerHTML="&nbsp - email неверен";
                                }
                        }
                }
                
            function check_login()
                {
                    var a=document.getElementById('login').value;
                    if (/[^а-яa-z0-9_]/i.test(a)==false && a.length>4 && a.length<21)
                        {
                            document.getElementById('correct_login_text').style.color="green";
                            document.getElementById('correct_login_text').innerHTML="&nbsp - логин верен";
                        }
                        else
                        {
                            if (a.length!=0)
                                {
                                    document.getElementById('correct_login_text').style.color="red";
                                    document.getElementById('correct_login_text').innerHTML="&nbsp - логин неверен";
                                }
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
                    }
                    else
                    {
                        document.getElementById('send_data').disabled="disabled";
                    }
                        
            }
            
            function check_per_second()
            {
                setInterval("check_login();check_email();compare_pwds();", 1000)
            }
      


