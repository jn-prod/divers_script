# les classes

# classe Utilisateur

class Utilisateur
  attr_accessor :prenom, :nom
end

class PostSurUnBlog
  attr_accessor :titre, :contenue, :auteur 
end

class Email
  attr_accessor :envoyeur, :contenue, :sujet
end

bob = Utilisateur.new
bob.prenom = "bob"
bob.nom = "lennon"

puts bob.prenom + " " + bob.nom

jane = Utilisateur.new
jane.prenom = "jane"
jane.nom = "lennon"

puts jane.prenom