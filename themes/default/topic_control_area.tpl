<div class="create_topic_flipper">
    <a  class="create_topic_flipper-font" href="#create_new_topic" onclick='flip_create_topic_area()'>Создать тему</a>
</div>
<div class="create_topic" id="create_topic">	
<form ACTION="forum.php" METHOD="POST" onsubmit="">
    <input type="hidden" name="category_id" value="<?=$this->category_id?>">
    <input type="hidden" name="action" value="create_new_topic">
    <div class="create_topic_row">
        <div class="create_topic_textarea">
                Название темы:<br>
                <input type="text" name="new_topic_name" id="new_topic_name" class="new_topic_name" onkeyup="flip_create_button()"><br>
                Сообщение:<br>
                <textarea class="textarea" name="post_message" id="post_message" onkeyup="flip_create_button()"></textarea>
        </div>
    </div>
    <div class="create_topic_row">
            <input type="submit" value="Создать тему" class="create_topic_btn" id="create_topic_btn">
    </div>
</form>
</div>
<a href="create_new_topic"></a>