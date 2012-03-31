<tr class="category_row" id="category_row_<?=$this->ordering?>">
    <td>
	<input type="button" id="remove_<?=$this->ordering?>" value="x" class="add-btn" onclick="RemoveItem(this.id);"/>
    </td>
    <input type="hidden" name="id_<?=$this->ordering?>" value="<?=$this->id?>"/>
    <input type="hidden" name="ordering_<?=$this->ordering?>" value="<?=$this->ordering?>"/>
    <td id="ordering_convert_<?=$this->ordering?>">
	<?=$this->ordering+1?>
    </td>
    <td>
	<input type="text" name="cat_<?=$this->ordering?>" style="width: 100%;" value="<?=$this->name?>" onkeyup="UpdateArray()" onblur="UpdateArray()"/>
    </td>
    <td>
	<input type="button" id="down_<?=$this->ordering?>"  value="Вниз" class="add-btn" onclick="DownItem(this.id)"/>
    </td>
    <td>
	<input type="button" id="up_<?=$this->ordering?>" value="Вверх" class="add-btn" onclick="UpItem(this.id)"/>
    </td>
</tr>