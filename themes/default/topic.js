/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function active_topic(id)
    {
         document.getElementById('topic_'+id.toString()).style.borderLeft="4px solid lightgray";
        // alert(document.getElementById('category_1').style.border);
    }
    
function passive_topic(id)
    {
        document.getElementById('topic_'+id.toString()).style.borderLeft="1px solid lightgray";
    }
