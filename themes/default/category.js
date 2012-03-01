/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function active_category(id)
    {
         document.getElementById('category_'+id.toString()).style.borderLeft="4px solid lightgray";
        // alert(document.getElementById('category_1').style.border);
    }
    
function passive_category(id)
    {
        document.getElementById('category_'+id.toString()).style.borderLeft="1px solid lightgray";
    }
