<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        echo $_GET["login"]."<br>";
        echo $_GET["email"]."<br>";
        echo $_GET["password"]."<br>";
        $hex1=md5("1");
        echo $hex1;
        
        ?>
    </body>
</html>
