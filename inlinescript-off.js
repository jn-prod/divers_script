var url = 'https://www.sudouest.fr/2017/11/19/comment-monsieur-t-shirt-a-cree-60-emplois-a-bordeaux-en-4-ans-3960745-705.php'

var xhr = new XMLHttpRequest();
xhr.open('GET', url);
xhr.onload = function() {
  if (xhr.status === 200) {
    console.log(xhr);
  }
  else {
    alert('Request failed.  Returned status of ' + xhr.status);
  }
};
xhr.send();