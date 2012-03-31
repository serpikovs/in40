<div class="post">	
    <div class="post-row">
        <div class="user-photo"></div>
        <div class="user-info-area">
            <a class="user-nickname" href="<?=$this->user_profile?>"><?=$this->login?></a>
            <br>
            <span class="user-group"><?=$this->user_group?></span>
            <br>
            <a class="post-date" href="#"><?=$this->date?></a>
        </div>
        <div class="post-body">
            <?=$this->body?>
        </div>
    </div>
    <div class="post-row">
        <div class="reply-area">
            
            <?=$this->delete_post_link?>
            <!--
            <span class="positive" id="positive_<?=$this->id?>"><?=$this->voite_y?></span>
            <span class="negative" id="negative_<?=$this->id?>"><?=$this->voite_n?></span>
            <span class="voite-plus"  onclick="voite(<?=$this->id?>,'up')" >+</span >
            <span class="voite-minus" onclick="voite(<?=$this->id?>,'down')">-</span >
            -->
        </div>
    </div>
</div>