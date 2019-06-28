<!DOCTYPE html>
<html>
  <head>
    <title>Ceci est une page de test avec des balises PHP</title>
    <meta charset="utf-8" />
  </head>
  <body>
    
    <!-- les variables -->
    <?php
    $ageDuVistuer = 20;
    echo 'Le visiteur à ' . $ageDuVistuer . 'ans'; // concaténation
    ?>


    <!-- les conditions -->
    <?php 
    $age = 10;
    if ($age >= 12)
    {
      echo 'salut gamin';
    }
    elseif ($age ==14)
    {
      echo 'tu a 14 ans';
    }
    else
    {
      echo 'salut cher adult';
    }
    ?>

    <?php 
    $age = 15;

    switch ($age) {
      case 4:
        echo "Tu as 4 ans";
        break;
      case 16:
        echo "Tu es un peu plus âgé, tu as 16 ans";
        break;  
      case 18:
        echo "Tu es majeur !";
        break;    
      default:
        echo "Je ne connais pas ton age";
        break;
    }
    ?>

    <!-- les boucles -->
    <?php 

    $repetition = 0;

    while ($repetition <= 10)
    {
      echo '<p>Répétion avec while N°: ' . $repetition . '</p>';
      $repetition++;
    }

    for ($i=10; $i < 20; $i++) { 
      echo '<p>Répétion avec for N°: ' . $repetition . '</p>';
      $repetition++;
    }

    ?>



  </body>
</html>