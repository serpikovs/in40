<form action="admin.php?section=categories&action=save" method="POST" onsubmit="return Validate();">
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
	<tfoot>
	    <tr class="category_row">
		<td>
		</td>
		<td>
		</td>
		<td>
		    <input type="button" value="Добавить новую категорию" style="width: 100%;" class="add-btn" onclick="AppendItem();"/>
		</td>
		<td>
		</td>
		<td>
		</td>
	    </tr>
	</tfoot>
    </table>
    <input type="hidden" name="action" value="save"/>
    <input type="hidden" name="remove_list" value=""/>
    <input type=submit id="send_data" style="width: 150px; height: 40px;" value="Сохранить">
    <script type="text/javascript" src="scripts/js/serialize.js"></script>
    <script type="text/javascript" src="<?=$this->full_tpls_path?>/admin.js"></script>
    <script type="text/javascript">UpdateArray();</script>
</FORM>