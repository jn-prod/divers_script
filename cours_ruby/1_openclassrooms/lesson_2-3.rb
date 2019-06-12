# les methodes

# methodes sans paramètres

# class Utilisateur
#   attr_accessor :prenom, :nom

#   def nom_complet
#     prenom + " " + nom
#   end
# end

# bob = Utilisateur.new
# bob.nom = "Lennon"
# bob.prenom = "Bob"

# puts bob.nom_complet

# les methodes avec paramêtre

# class Utilisateur
#   attr_accessor :prenom, :nom, :pays

#   def nom_complet
#     prenom + " " + nom
#   end

#   def habite_en(valeur)
#     valeur == pays
#   end
# end

# bob = Utilisateur.new
# bob.nom = "Lennon"
# bob.prenom = "Bob"
# bob.pays = "France"

# puts bob.nom_complet

# puts "Est-ce que Bob habite en France ?"

# puts bob.habite_en("France")

# puts "Est-ce que Bob habite en Suisse ?"

# puts bob.habite_en("Suisse")

# if bob.habite_en("Suisse")
#   puts "Bonjour cher ami Suisse"
# else
#   puts "Tu n'es pas Suisse"
# end

# exemple

class Eleve
  attr_accessor :prenom, :nom, :langage_prefere
  
  #méthode sans paramètre
  def nom_complet 
    prenom + " " + nom
  end
  
  #méthode avec paramètre
  def aime_le(langage)
    if langage == langage_prefere
      "Oui :)"
    else
      "Non :("
    end
  end

end

jc = Eleve.new
jc.prenom = "John"
jc.nom = "Cleese"
jc.langage_prefere = "Python"

puts "Est-ce que " + jc.nom_complet + " aime le Ruby ?\n" + jc.aime_le("Ruby")
