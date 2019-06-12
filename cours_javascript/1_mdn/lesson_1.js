// Les bases de Java​Script, orienté objet


// littéral objet
var personne = {
  nom: {
    prenom: 'Jean',
    nomFamille: 'Martin'
  },
  age: 32,
  sexe: 'masculin',
  interets: ['musique', 'skier'],
  bio: function() {
    alert(this.nom[0] + ' ' + this.nom[1] + ' a ' + this.age + ' ans. Il aime ' + this.interets[0] + ' et ' + this.interets[1] + '.');
  },
  salutation: function() {
    alert('Bonjour ! Je suis ' + this.nom[0] + '.');
  }
};

console.log(personne.age, " - ", personne.nom.prenom)
console.log(personne['age'], " - ", personne['nom']['prenom'])

// Définir les membres d'un objet

personne.age = 45
personne['nom']['nomFamille'] = 'Rabuchon'
personne['yeux'] = 'noisette'

personne.auRevoir = function() { alert("Bye bye tout le monde !"); }
personne.auRevoir()

// Qu'est-ce que « this » ?

var personne1 = {
  nom: 'Christophe',
  salutation: function() {
    alert('Bonjour ! Je suis ' + this.nom + '.');
  }
}

var personne2 = {
  nom: 'Bruno',
  salutation: function() {
    alert('Bonjour ! Je suis ' + this.nom + '.');
  }
}
