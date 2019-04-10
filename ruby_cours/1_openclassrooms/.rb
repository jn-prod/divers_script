# les classes

class Utilisateur
  attr_accessor :prenom, :nom

end

bob = Utilisateur.new
bob.prenom = "bob"
bob.nom = "lennon"

puts bob.prenom + " " + bob.nom
