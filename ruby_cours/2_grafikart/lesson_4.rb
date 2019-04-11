# ___les conditions

# puts "Entrez un chiffre"
# chiffre = gets.chomp.to_i

# if chiffre.even?
#   puts "votre chiffre est pair"
# else
#   puts "votre chiffre est impair"
# end

# adeviner = 15

# ___

# a == b
# a > b
# a >= b
# a < b
# a <= b
# a != b

# ___

# if chiffre < adeviner
#   puts "#{chiffre} est trop petit :("
# elsif chiffre > adeviner
#   puts "#{chiffre} est trop grand :("
# else
#   puts "#{chiffre} est le résultat, bravo"
# end

# if chiffre != adeviner
#   puts "Tu as perdu :("
# else
#   puts "#{chiffre} est le résultat, bravo"
# end

# unless chiffre == adeviner
#   puts "Tu as perdu :("
# else
#   puts "#{chiffre} est le résultat, bravo"
# end

# puts "#{chiffre} est le résultat, bravo" if chiffre == adeviner

# if !chiffre.even?
#   puts "Ton chiffre est impair"
# end

# ___

puts "Entrez un mot"

mot = gets.chomp.downcase

if mot == mot.reverse
  puts "Ce mot est un palyndrome"
else 
  puts "Ce mot n'est pas un palyndrome"
end
