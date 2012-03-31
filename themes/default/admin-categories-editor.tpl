<FORM ACTION="admin.php?section=categories&action=save" METHOD=post>
    <table>
        <thead>
	    <tr>
		<th></th>
		<th>№</th>
		<th style="width: 100%;">Имя категории</th>
		<th colspan="2">Изменить порядок</th>
		<th></th>
	    </tr>
	</thead>
	<tbody id="menuItemsList">
	    <tr>
		<?=$this->items?>
	    </tr>
	</tbody>
    </table>
    <input type="hidden" name="pwd" id="pwd"><br>
    <input type=submit id="send_data" style="width: 150px; height: 40px;" value="Сохранить">
    <script type="text/javascript" src="<?=$this->full_tpls_path?>/admin.js"></script>
    <script type="text/javascript">InitEditor();</script>
</FORM>