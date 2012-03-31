
/*
 * Внутреннее правило: внутри индексация категорий идет от 0
 * при выводе на страницу индексация сохраняется для всех случаев, кроме
 * 
 * Примечание: для каждой категории используется объект.
 * Он здесь избыточен, можно переделать в строку
 */

var categories = [];

var buffer ={};

if(document.getElementsByClassName == undefined) 
{ 
   document.getElementsByClassName = function(cl) 
   { 
      var retnode = []; 
      var myclass = new RegExp('\\b'+cl+'\\b'); 
      var elem = this.getElementsByTagName('*'); 
      for (var i = 0; i < elem.length; i++) 
      { 
         var classes = elem[i].className; 
         if (myclass.test(classes)) 
            retnode.push(elem[i]); 
      } 
      return retnode; 
   } 
};

function AppendItem()
{
    // здесь хард-код новой строки, которая появляется при нажатии на клавишу "добавить новую категорию"
    document.getElementById('menuItemsList').innerHTML += '<tr class="category_row" id="category_row_new"><td><input type="button" id="remove_new" value="x" class="add-btn" onclick="RemoveItem(this.id);"/></td><input type="hidden" name="id_new" value=""/><input type="hidden" name="ordering_new" value="new"/><td id="ordering_convert_new"></td><td><input type="text" name="cat_new" style="width: 100%;" value="" onkeyup="UpdateArray()" onblur="UpdateArray()"/></td><td><input type="button" id="down_new"  value="Вниз" class="add-btn" onclick="DownItem(this.id)"/></td><td><input type="button" id="up_new" value="Вверх" class="add-btn" onclick="UpItem(this.id)"/></td></tr>';
    
    // заполнение нового элемента и добавление в массив
    var cur = categories.length;
    buffer = {};
    buffer.id = -1;
    buffer.name = '';
    categories[cur] = buffer;
    
    // переназначение id и name
    document.getElementsByName('id_new')[0].name = 'id_'+cur;
    document.getElementsByName('ordering_new')[0].name = 'ordering_'+cur;
    document.getElementsByName('cat_new')[0].name = 'cat_'+cur;
    
    document.getElementById('ordering_convert_new').id = 'ordering_convert_'+cur;
    document.getElementById('category_row_new').id = 'category_row_'+cur;
    
    document.getElementById('remove_new').id = 'remove_'+cur;
    document.getElementById('up_new').id = 'up_'+cur;
    document.getElementById('down_new').id = 'down_'+cur;
    
    Fill();
}

function UpdateArray()
{
    var categoriesCount = document.getElementsByClassName('category_row').length - 1;
    
    // выборка всех загруженных категорий во внутреннюю структуру
    for (var i=0; i < categoriesCount; i++)
    {
	var category = {};
	category.id = document.getElementsByName('id_'+i)[0].value;
	category.name = document.getElementsByName('cat_'+i)[0].value;
	categories[i] = category;
    }
    
    Fill();
}

function Fill()
{
    for (var i=0; i < categories.length; i++)
    {
	document.getElementsByName('id_'+i)[0].value = categories[i].id;
	document.getElementsByName('ordering_'+i)[0].value = i;
	document.getElementById('ordering_convert_'+i).innerHTML = i + 1;
	document.getElementsByName('cat_'+i)[0].value = categories[i].name;
	document.getElementById('up_'+i).style.visibility = i==0? 'hidden' : 'visible';
	document.getElementById('down_'+i).style.visibility = i==categories.length-1 ? 'hidden' : 'visible';
    }
}

function RemoveItem(str)
{
    // получаем id нажатой кнопки
    var ItemId = parseInt(str.replace(/remove_(.+)/,'$1'));
    
    // live huck
    var newcat = [];
    categories = newcat.concat(categories.slice(0,ItemId), categories.slice(ItemId+1,categories.length));
    
    var Item = document.getElementById('category_row_'+categories.length);
    
    Item.parentNode.removeChild(Item);
    Fill();
}

function UpItem(str)
{
    // получаем id нажатой кнопки
    var ItemId = parseInt(str.replace(/up_(.+)/,'$1'));
    
    // проверка на индекс
    if (ItemId==0) return;
    
    // перестановка и перерисовка
    var buffer = categories[ItemId];
    categories[ItemId] = categories[ItemId-1];
    categories[ItemId-1] = buffer;
    Fill();
}

function DownItem(str)
{
    // получаем id нажатой кнопки
    var ItemId = parseInt(str.replace(/down_(.+)/,'$1'));
    
    // проверка на индекс
    if (ItemId==categories.length-1) return;
    
    // перестановка и перерисовка
    var buffer = categories[ItemId];
    categories[ItemId] = categories[ItemId+1];
    categories[ItemId+1] = buffer;
    Fill();
}

function Validate()
{
    for (var i=0; i < categories.length; i++)
    {
	if (categories[i].name == "")
	{
	    alert("Одно или более полей не заполнено");
	    return false;
	}
    }
}