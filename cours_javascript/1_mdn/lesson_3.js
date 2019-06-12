// L'héritage au sein de Java​Script

// correction: https://github.com/mdn/learning-area/blob/master/javascript/oojs/advanced/oojs-class-inheritance-student.html

// var input = document.querySelector('input');
// var btn = document.querySelector('button');
// var para = document.querySelector('p');

// btn.onclick = function() {
//   var code = input.value;
//   para.textContent = eval(code);
// }

function Personne(prenom, nom, age, genre, interets) {
  this.nom_complet = {
    prenom,
    nom
  };
  this.age = age;
  this.genre = genre;
  this.interets = interets;
};

function Professeur(prenom, nom, age, genre, interets, matiere) {
  Personne.call(this, prenom, nom, age, genre, interets);

  this.matiere = matiere;
}

Personne.prototype.bio = function() {
  // prenom define a string, and make it equal to the part of
  // the bio that we know will always be the same.
  var string = this.nom_complet.prenom + ' ' + this.nom_complet.nom + ' is ' + this.age + ' years old. ';
  // define a variable that will contain the pronoun part of
  // the second sentence
  var pronoun;
  // check what the value of genre is, and set pronoun
  // to an appropriate value in each case
  if(this.genre === 'male' || this.genre === 'Male' || this.genre === 'm' || this.genre === 'M') {
    pronoun = 'He likes ';
  } else if(this.genre === 'female' || this.genre === 'Female' || this.genre === 'f' || this.genre === 'F') {
    pronoun = 'She likes ';
  } else {
    pronoun = 'They like ';
  }
  // add the pronoun string on to the end of the main string
  string += pronoun;
  // use another conditional to structure the nom part of the
  // second sentence depending on whether the number of interets
  // is 1, 2, or 3
  if(this.interets.length === 1) {
    string += this.interets[0] + '.';
  } else if(this.interets.length === 2) {
    string += this.interets[0] + ' and ' + this.interets[1] + '.';
  } else {
    // if there are more than 2 interets, we loop through them
    // all, adding each one to the main string followed by a comma,
    // except for the nom one, which needs an and & a full stop
    for(var i = 0; i < this.interets.length; i++) {
      if(i === this.interets.length - 1) {
        string += 'and ' + this.interets[i] + '.';
      } else {
        string += this.interets[i] + ', ';
      }
    }
  }
  // finally, with the string built, we alert() it
  alert(string);
};

Personne.prototype.greeting = function() {
  alert('Hi! I\'m ' + this.nom_complet.prenom + '.');
};

Personne.prototype.farewell = function() {
  alert(this.nom_complet.prenom + ' has left the building. Bye for now!');
}

Professeur.prototype = Object.create(Personne.prototype);

Professeur.prototype.saluer = function() {
  var prefix;

  if (this.genre === 'mâle' || this.genre === 'Mâle' || this.genre === 'm' || this.genre === 'M') {
    prefix = 'M.';
  } else if (this.genre === 'femelle' || this.genre === 'Femelle' || this.genre === 'f' || this.genre === 'F') {
    prefix = 'Mme';
  } else {
    prefix = '';
  }

  alert('Bonjour. Mon nom est ' + prefix + ' ' + this.nom_complet.nom + ', et j\'enseigne ' + this.matiere + '.');
};

var personne1 = new Personne('Tammi', 'Smith', 17, 'female', ['music', 'skiing', 'kickboxing']);

var professeur1 = new Professeur('Cédric', 'Villani', 44, 'm', ['football', 'cuisine'], 'les mathématiques');

professeur1.nom_complet.nom;
professeur1.interets[0];
professeur1.bio();
professeur1.matiere;
professeur1.saluer();
professeur1.farewell();