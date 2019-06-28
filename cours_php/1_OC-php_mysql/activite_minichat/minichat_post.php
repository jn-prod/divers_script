<?php
	// Creation du cookie qui retient le pseudo 
	if(isset($_POST['pseudo'])){
		setcookie('pseudo', $_POST['pseudo'],time()+365*24*3600,null,null,false,true);
	}
	
	// Connexion à la base de données
	try
	{
		$bdd = new PDO('mysql:host=localhost;dbname=test;charset=utf8', 'root', '');
	}
	catch(Exception $e)
	{
		die('Erreur : ' . $e->getMessage());
	}

	// Verification
	if(isset($_POST['pseudo']) && isset($_POST['message']) && !empty($_POST['pseudo']) && !empty($_POST['message'])) {
		// Sécurisation des informations
		$pseudo = htmlspecialchars($_POST['pseudo']);
		$message = htmlspecialchars($_POST['message']);
		// Insertion du message à l'aide d'une requête préparée
		$req = $bdd->prepare('INSERT INTO minichat (pseudo, message,date_message) VALUES(:pseudo, :message,NOW())');
		$req->execute(array(
			pseudo => $pseudo,
			message => $message
		));
	}

	// Redirection du visiteur vers la page du minichat
	header('Location: minichat.php');
?>