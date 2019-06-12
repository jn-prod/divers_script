# ___Methodes

# def convert_to_min(seconds)
#   # return 0 if seconds.is_a? Integer
#   seconds = seconds.to_i
#   seconds / 60
# end

# puts convert_to_min(3600)
# puts convert_to_min("3600")

# ___

# def welcome(prenom, prefix = "Bonjour")
#   puts "#{prefix} #{prenom}"
# end

# welcome("jean")
# welcome("marc", "salut")

# ___

# def liste(prefix, *noms)
#   noms.each do |nom|
#     puts "- #{prefix} #{nom}"
#   end
# end

# liste("Salut", "Jean", "Marc", "Marion", "Jonathan", "John")

# ___

def reorganiser_liste(croissant, *noms)
  nouveau_noms = noms.collect { |nom| nom.ti_s }
  nouveau_noms.sort! # enregistrement de la variable classée avec "!"
  nouveau_noms.reverse! if !croissant # enregistrement de la variable classée "!"
  return nouveau_noms
end

# On organise de a => z
puts reorganiser_liste(true, "Marc", "Jean", "Marion", :Manon, :Jonathan, "Antoine").inspect

# On organise de z => a
puts reorganiser_liste(false, "Marc", "Jean", "Marion", :Manon, :Jonathan, "Antoine").inspect
