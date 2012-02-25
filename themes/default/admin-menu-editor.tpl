<FORM ACTION="" METHOD=post>
    <table>
        <thead>
	    <tr>
		<th>Тип</th>
		<th style="width: 100%;">Ссылка</th>
		<th></th>
		<th></th>
		<th></th>
	    </tr>
	</thead>
	<tbody id="menuItemsList">
	    <tr></tr>
	</tbody>
	<tfoot>
	    <tr>
		<td>
		    <select>
			<option>Форум</option>
			<option>Внешняя ссылка</option>
			<option>Статический файл</option>
		    </select>
		</td>
		<td>
		    <select disabled="true" style="width: 100%;">
			<option>Форум</option>
			<option>Внешняя ссылка</option>
			<option>Статический файл</option>
		    </select>
		</td>
		<td></td>
		<td></td>
		<td><input type="button" class="add-btn" value="+" onclick="addMenuItem()"/></td>
	    </tr>
	</tfoot>
	</table>
    <input type="hidden" name="pwd" id="pwd"><br>
    <input type=submit id="send_data" style="width: 150px; height: 40px;" value="Сохранить">
</FORM>