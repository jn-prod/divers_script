
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Mini-chat</title>
	</head>
	<style>
	form
	{
		text-align:center;
	}
	</style>
	<body>
	
	<form action="minichat_post.php" method="post">
		<p>
			<label for="pseudo">Pseudo</label> : <input type="text" name="pseudo" id="pseudo" value="<?php if(isset($_COOKIE['pseudo'])){ echo $_COOKIE['pseudo']; }?>" /><br />
			<label for="message">Message</label> :  <input type="text" name="message" id="message" /><br />

			<input type="submit" value="Envoyer" />
		</p>
	</form>

	<?php
	// Connexion à la base de données
	try
	{
	  $bdd = new PDO('mysql:host=localhost;dbname=test;charset=utf8', 'root', '');
	}
	catch(Exception $e)
	{
		die('Erreur : '. $e->getMessage());
	}

	// Récupération des 10 derniers messages
	$reponse = $bdd->query('SELECT pseudo, message, DATE_FORMAT(date_message, "Ecrit le %d/%m/%Y à %Hh%imin%ss") AS date_post FROM minichat ORDER BY ID DESC LIMIT 0, 10');

	// Affichage de chaque message (toutes les données sont protégées par htmlspecialchars)
	while ($donnees = $reponse->fetch())
	{
		echo '<p><strong>' . htmlspecialchars($donnees['pseudo']) . '</strong> : ' . utf8_decode(htmlspecialchars($donnees['message'])) . '<br><em>' . $donnees['date_post'] . '</em></p>';
	}

	$reponse->closeCursor();
	?>

	</body>
</html>