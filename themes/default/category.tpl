<div class='category' id='category_<?=$this->id?>' onMouseOver='active_category(<?=$this->id?>);' onMouseOut='passive_category(<?=$this->id?>);'>
    <table border=0>
        <tr>
            
            <td width=700>
                <a href='<?=site?>forum?category=<?=$this->id?>'>
                    <div class='category-name'  >
                    <?=$this->name?>
                    </div>
                </a>
            </td>
            
            
            <td width=100>
                <div class='category-date'>
                    <?=$this->date?>
                </div>
            </td>
        </tr>
    </table>
</div>