window.onload=function(){document.getElementById("reply_to_post").style.display = "none"}

function voite(post_id,value)
{
    ajax=getAjax();
    var param='post_id='+post_id+'&value='+value;
    //alert(param)
    if (ajax != null) 
        {   
            // метод POST, указываем просто имя файла
            ajax.open("POST","http://localhost/in40/scripts/ajax/voite.php",false);

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
            //alert(ajax.responseText);
        }
     if (value=='up')
         {
             if (document.getElementById("positive_"+post_id).innerHTML!='')
                 {
                    document.getElementById("positive_"+post_id).innerHTML=parseInt(document.getElementById("positive_"+post_id).innerHTML)+1;
                 }
                else
                 {
                    document.getElementById("negative_"+post_id).innerHTML=parseInt(document.getElementById("positive_"+post_id).innerHTML)-1;
                 }
         }
     if (value=='down')
         {
            if (document.getElementById("positive_"+post_id).innerHTML!='')
                 {
                    document.getElementById("positive_"+post_id).innerHTML=parseInt(document.getElementById("positive_"+post_id).innerHTML)-1;
                 }
                else
                 {
                    document.getElementById("negative_"+post_id).innerHTML=parseInt(document.getElementById("positive_"+post_id).innerHTML)+1;
                 }
         }
         
                        
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

function flip_reply()
    {
        if (document.getElementById("reply_to_post").style.display == "none")
            {
                document.getElementById("reply_to_post").style.display = ""
            }
            else
            {
                document.getElementById("reply_to_post").style.display = "none";
            }
    }

