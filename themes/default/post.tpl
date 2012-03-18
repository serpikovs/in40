<div class="post">	
    <div class="post-row">
        <div class="user-photo"></div>
        <div class="user-info-area">
            <a class="user-nickname" href="#"><?=$this->login?></a>
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
            <span class="positive"><?=$this->voite_y?></span>
            <span class="negative"><?=$this->voite_n?></span>
            <span class="reply-plus">+</span>
            <span class="reply-minus">-</span>
            <a class="reply-ans" href="#">Ответить</a>
        </div>
    </div>
    	
</div>