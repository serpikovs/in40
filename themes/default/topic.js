/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
window.onload=function(){
    document.getElementById("create_topic").style.display = "none";
    document.getElementById("create_topic_btn").disabled="disabled";
}

function active_topic(id)
    {
         document.getElementById('topic_'+id.toString()).style.borderLeft="4px solid lightgray";
        // alert(document.getElementById('category_1').style.border);
    }
    
function passive_topic(id)
    {
        document.getElementById('topic_'+id.toString()).style.borderLeft="1px solid lightgray";
    }
    
function flip_create_topic_area()
    {
        if (document.getElementById("create_topic").style.display == "none")
            {
                document.getElementById("create_topic").style.display = ""
            }
            else
            {
                document.getElementById("create_topic").style.display = "none";
            }
    }
    
function flip_create_button()
{
    if (document.getElementById("new_topic_name").value!="" && document.getElementById("post_message").value!="")
        {
            document.getElementById("create_topic_btn").disabled="";
        }
        else
        {
            document.getElementById("create_topic_btn").disabled="disabled";
        }
}
