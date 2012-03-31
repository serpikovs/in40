<div class="reply-ans">
    <a  class="reply-ans-font" href="#reply" onclick='flip_reply()'>Ответить</a>
</div>
<div class="reply_to_post" id="reply_to_post">	
<form ACTION="forum.php" METHOD="POST" onsubmit="">
    <input type="hidden" name="topic_id" value="<?=$this->topic_id?>">
    <input type="hidden" name="action" value="post_message">
    <div class="reply_to_post_row">
        <div class="reply_to_post_options">
            
        </div>
        <div class="reply_to_post_textarea">
                <textarea class="textarea" name="post_message"></textarea>
        </div>
    </div>
    <div class="reply_to_post_row">
        <div class="reply_to_post_submit_btn">
            <input type="submit" value="Отправить" class="reply_submit_btn">
        </div>
    </div>
</form>
</div>
<a href="reply"></a>






