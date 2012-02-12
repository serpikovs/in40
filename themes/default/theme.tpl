<html>
    <head>
	<link rel="stylesheet" href="<?=$this->_full_tpl_path?>/style.css" type="text/css"/>
	<script type="text/javascript" src="main.js"></script>
	<meta http-equiv="CONTENT-TYPE" content="text/html; charset=UTF-8">
	<title>Новая страница</title>
    </head>
    <body>
	<div class="top-part">
	    <div class="header-area">
		<div class="wrapper">
		    Modern Forum Engine
		</div>
	    </div>
	    <div class="menu-area">
		<div class="wrapper">
		    <ul>
			<li class="menu-item">
			    <a href="#">Новости</a>
			</li>
			<li class="menu-item">
			    <a href="#">Обсуждения</a>
			</li>
			<li class="menu-item">
			    <a href="#">Статья 1</a>
			</li>
			<li class="menu-item">
			    <a href="#">Статья 2</a>
			</li>
		    </ul>
		</div>
	    </div>
	    <div class="submenu-area">
		<div class="wrapper">
		    <table class="twrapper">
			<tr>
			    <td>
				<ul>
				    <li class="nav-item">
					<a href="#">Название сайта</a>
				    </li>
				    <li class="nav-item">
					<span>»</span>
				    </li>
				    <li class="nav-item">
					<a href="#">Обсуждения</a>
				    </li>
				    <li class="nav-item">
					<span>»</span>
				    </li>
				    <li class="nav-item">
					<a href="#">Категория</a>
				    </li>
				    <li class="nav-item">
					<span>»</span>
				    </li>
				    <li class="nav-item">
					<a href="#">Тема</a>
				    </li>
				</ul>
			    </td>
			    <td style="text-align: right;">
				<ul>
				    <li class="login-item">
					<input type="text" value="[login]"/>
				    </li>
				    <li class="login-item">
					<input type="text" value="[password]"/>
				    </li>
				    <li class="login-item">
					<input type="checkbox" title="Запомнить"/>
				    </li>
				    <li class="login-item">
					<a href="#">Войти</a>
				    </li>
				</ul>
			    </td>
			</tr>
		    </table>
		</div>
	    </div>
	    <div id="content-area">
		<div class="wrapper">
		    <ul class="messages">
			<li>
			    <div class="msg-row">
				<div class="user-photo"></div>
				<div class="user-info-area">
				    <a class="user-nickname" href="#">Сергей Серпиков</a>
				    <br>
				    <span class="user-group">Администратор</span>
				    <br>
				    <a class="msg-date" href="#">12:00, 20.01.2012 #</a>
				</div>
				<div class="msg-body">
				    добрый вечер
				</div>
			    </div>
			    <div class="msg-row">
				<div class="reply-area">
				    <span class="positive">+13</span>
				    <span class="reply-plus">+</span>
				    <span class="reply-minus">&ndash;</span>
				    <a class="reply-ans" href="#">Ответить</a>
				</div>
			    </div>
			</li>
			
			
			
			
			<li>
			    <div class="msg-row">
				<div class="user-photo"></div>
				<div class="user-info-area">
				    <a class="user-nickname" href="#">Сергей Серпиков</a>
				    <br>
				    <span class="user-group">Администратор</span>
				    <br>
				    <a class="msg-date" href="#">12:00, 20.01.2012 #</a>
				</div>
				<div class="msg-body">
				    Общие особенности 
- Отсутствие очередей на закачку. Максимально быстрая скорость передачи данных.
- Файлы закачиваются небольшими сегментами; чем менее доступен сегмент, тем чаще он будет передаваться. Таким образом, присутствие в сети «сидера» с полным файлом для загрузки необязательно — система распределяет сегменты между «пирами», чтобы в последующем они могли обмениваться недостающими сегментами.
- Клиенты (peers) обмениваются сегментами непосредственно между собой, по принципу «ты — мне, я — тебе».
- Закачанные сегменты становятся немедленно доступны другим клиентам.
- Контролируется целостность каждого сегмента.
- В качестве объекта закач
				</div>
			    </div>
			    <div class="msg-row">
				<div class="reply-area">
				    <span class="positive">+13</span>
				    <span class="reply-plus">+</span>
				    <span class="reply-minus">&ndash;</span>
				    <a class="reply-ans" href="#">Ответить</a>
				</div>
			    </div>
			</li>
			
			
		    </ul>
		</div>
	    </div>
	    <div class="buffer-area"></div>
	</div>
	<div class="bottom-part">
	    <div class="footer-area">
		<div class="wrapper">
		    ПОДВАЛ
		</div>
	    </div>
	</div>
    </body>
</html>