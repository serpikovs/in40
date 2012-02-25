<html lang="ru">
    <head>
	<link rel="stylesheet" href="<?=$this->full_tpls_path?>/style.css" type="text/css"/>
	<script type="text/javascript" src="<?=$this->full_tpls_path?>/main.js"></script>
        <script type="text/javascript" src="<?=$this->full_tpls_path?>/registration.js"></script>
	<script type="text/javascript" src="scripts/js/md5.js"></script>
	<script type="text/javascript" src="<?=$this->full_tpls_path?>/admin.js"></script>
	<script type="text/javascript" src="scripts/js/md5.js"></script>
	<!-- Можно сделать динамическую загрузку скриптов -->
	<meta http-equiv="CONTENT-TYPE" content="text/html; charset=UTF-8">
	<title>Новая страница</title>
    </head>
    <body>
	<div class="top-part">
	    
	    <div class="header-area">
		<div class="wrapper">
		    <?=$this->header?>
		</div>
	    </div>
             
	    <div class="menu-area">
		<div class="wrapper">
		    <ul>
			<?=$this->menu?>
		    </ul>
		</div>
	    </div>
            
	    <div class="submenu-area">
                <div class="wrapper">
                    <?=$this->submenu_area?>
                </div>
            </div>

	    <div class="notify-area">
		<div class="wrapper">
		    <?=$this->notify?>
		</div>
	    </div>
	    
	    <div id="content-area">                
		<div class="wrapper">
		    <?=$this->content?>
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