<html>
    <head>
	<link rel="stylesheet" href="<?=$this->full_tpls_path?>/style.css" type="text/css"/>
        <link rel="stylesheet" href="<?=$this->full_tpls_path?>/reg/reg.css" type="text/css"/>
	<script type="text/javascript" src="<?=$this->full_tpls_path?>/main.js"></script>
	<script type="text/javascript" src="<?=$this->full_tpls_path?>/reg/registration.js"></script>
	<meta http-equiv="CONTENT-TYPE" content="text/html; charset=UTF-8">
	<title>Регистрация</title>
    </head>
    <body>
	<div class="top-part">
            
	    <div class="header-area">
		<div class="wrapper">
		    <?=$this->header?>
		</div>
	    </div>
             
            <div id="content-area">                
		<div class="wrapper">
                    <div class="reg-area">
                        <?=$this->registration?>
                    </div>
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