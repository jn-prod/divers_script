<?php
try
{
  $bdd = new PDO('mysql:host=localhost;dbname=admin;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
  
}
catch (Exception $e)
{
  die('Erreur : '.$e->getMessage());
};

// requete basic 


// $response = $bdd->query('SELECT console, nom, prix FROM jeux_video WHERE console="NES" OR console="PC" ORDER BY prix DESC LIMIT 3');
// while ($donnees = $response->fetch()) {
//   echo '<p>' . $donnees['console'] . ' - ' . $donnees['nom'] . ' - ' . $donnees['prix'] . '€</p>';
// }
// requete prepare
// if (isset($_GET["console"]))
// {

// $requete = $bdd->prepare('SELECT console, nom, prix FROM jeux_video WHERE possesseur = ? AND prix <= ? ');
// $requete->execute(array($_GET['possesseur'], $_GET['prix_max']));
// OU 
if (isset($_GET['possesseur']) && isset($_GET['prixmax']))
{
  $req = $bdd->prepare('SELECT nom, prix FROM jeux_video WHERE possesseur = :possesseur AND prix <= :prixmax');
  $req->execute(array('possesseur' => $_GET['possesseur'], 'prixmax' => $_GET['prix_max']));
  while ($donnees = $requete->fetch()) {
    echo '<p>' . $donnees['console'] . ' - ' . $donnees['nom'] . ' - ' . $donnees['prix'] . '€</p>';
  } 

}
// }

// Si tout va bien, on peut continuer

// On récupère tout le contenu de la table jeux_video
$reponse = $bdd->query('SELECT * FROM jeux_video');

// On affiche chaque entrée une à une
while ($donnees = $reponse->fetch())
{
?>
    <p>
    <strong>Jeu</strong> : <?php echo $donnees['nom']; ?><br />
    Le possesseur de ce jeu est : <?php echo $donnees['possesseur']; ?>, et il le vend à <?php echo $donnees['prix']; ?> euros !<br />
    Ce jeu fonctionne sur <?php echo $donnees['console']; ?> et on peut y jouer à <?php echo $donnees['nbre_joueurs_max']; ?> au maximum<br />
    <?php echo $donnees['possesseur']; ?> a laissé ces commentaires sur <?php echo $donnees['nom']; ?> : <em><?php echo $donnees['commentaires']; ?></em>
   </p>
<?php
}

$reponse->closeCursor(); // Termine le traitement de la requête


$req = $bdd->prepare('INSERT INTO jeux_video(nom, possesseur, console, prix, nbre_joueurs_max, commentaires) VALUES(:nom, :possesseur, :console, :prix, :nbre_joueurs_max, :commentaires)');
$req->execute(array(
  'nom' => $nom,
  'possesseur' => $possesseur,
  'console' => $console,
  'prix' => $prix,
  'nbre_joueurs_max' => $nbre_joueurs_max,
  'commentaires' => $commentaires
  ));

echo 'Le jeu a bien été ajouté !';

$req = $bdd->prepare('UPDATE jeux_video SET prix = :nvprix, nbre_joueurs_max = :nv_nb_joueurs WHERE nom = :nom_jeu');
$req->execute(array(
  'nvprix' => $nvprix,
  'nv_nb_joueurs' => $nv_nb_joueurs,
  'nom_jeu' => $nom_jeu
  ));

// DELETE FROM jeux_video WHERE nom='Battlefield 1942'

?>