<?php $title = htmlspecialchars($comment['comment']); ?>

<?php ob_start(); ?>
<h1>Modifier mon commentaire</h1>
<p><a href="index.php?action=post&id=<?= $comment['post_id']?>">Retour au billet</a></p>

<form action="index.php?action=updateComment&amp;id=<?= $comment['id'] ?>&amp;post_id=<?= $comment['post_id']?>" method="post">
    <div>
        <label for="comment">Commentaire</label><br />
        <textarea id="comment" name="comment"><?= $comment['comment']?></textarea>
    </div>
    <div>
        <input type="submit" />
    </div>
</form>
<?php $content = ob_get_clean(); ?>

<?php require('template.php'); ?>
