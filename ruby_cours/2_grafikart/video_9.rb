# ___Astuces et Typage

# cmd = gets.chomp

# case cmd
#   when "add" then puts "Ajouter un produit"
#   when "rm" then puts "Suppression du produit"
#   else puts "Commande inconnue 0_o"
# end

# ___ternaire

# correspond à une fonction if
# puts a < b ? "a inférieur à B" : "a supérieur ou égal à B"
# _
# a = false
# b = "salut"
# puts a || b #affiche b si a n'est pas définis

# _

# a = "chien"
# a ||= "valeur par default"
# puts a

# _

# a = [1, 2, 5] << 4
# puts a

# _

def majuscule(nom)
  if nom.respond_to?(:to_s) # est-ce que je peux convertir mon nom en chaine de caratère
    nom.to_s.upcase
  end
end

def triple(chiffre)
  if chiffre.respond_to?(:to_f)
    chiffre.to_f * 3
  else
    puts "Erreur"
  end
end

puts triple("salut")
puts triple("1.385")
puts triple(2)
puts triple(%w{a b c d})