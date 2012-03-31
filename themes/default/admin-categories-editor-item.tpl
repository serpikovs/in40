<tr>
    <td>
	<input type="button" value="x" class="add-btn"/>
    </td>
    <td>
	<input type="hidden" name="ordering<?=$this->ordering?>" value="<?=$this->ordering?>"/>
	<?=$this->ordering?>
    </td>
    <td>
	<input type="text" style="width: 100%;" value="<?=$this->name?>"/>
    </td>
    <td>
	<input type="button" value="Вниз" class="add-btn"/>
    </td>
    <td>
	<input type="button" value="Вверх" class="add-btn" onclick="addMenuItem()"/>
    </td>
</tr>