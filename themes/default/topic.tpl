<div class='topic' id='topic_<?=$this->id?>' onMouseOver='active_topic(<?=$this->id?>);' onMouseOut='passive_topic(<?=$this->id?>);'>
    <table border=0>
        <tr>
            
            <td width=700>
                <a href='<?=site?>forum.php?topic=<?=$this->id?>'>
                    <div class='topic-name'  >
                    <?=$this->name?>
                    </div>
                </a>
            </td>
            
            
            <td width=100>
                <div class='topic-date'>
                    <?=$this->date?>
                </div>
            </td>
        </tr>
    </table>
</div>