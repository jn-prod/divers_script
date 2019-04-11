# ___Les boucles

# i = 0

# while i < 10 
#   i += 1
#   puts i
# end

# ____ while && until

# adeviner = 4
# a = 0

# while adeviner != a # until adeviner == a
#   puts "Entrez votre chiffre"
#   a = gets.chomp.to_i  
#   if a > adeviner
#     puts "Trop grand"
#   elsif a < adeviner
#     puts "Trop petit"
#   end
# end

# puts "Vous avez deviné le chiffre"

# ____ for

# for num in 1..10
#   puts num
# end

# for num in 1...10
#   next if num == 3
#   puts num
# end


# adeviner = 4

# a = nil

# for num in 1..3
#   next if a == adeviner
#   puts "Entrez votre chiffre"
#   a = gets.chomp.to_i
#   if a > adeviner
#     puts "Chiffre trop grand"
#   elsif a < adeviner
#     puts "Ciffre trop petit"
#   end
# end

# puts "Bravo ! vous avez gagné" if a == adeviner

# ___ intérator

# adeviner = 4

# a = nil

# loop do
#   puts "Entrez votre chiffre"
#   a = gets.chomp.to_i
#   if a > adeviner
#     puts "Chiffre trop grand"
#   elsif a < adeviner
#     puts "Ciffre trop petit"
#   else
#     puts "Bravo ! vous avez gagné"
#     break 
#   end
# end

# new exemple

# adeviner = 4

# a = nil

# 3.times do |num|
#   next if a == adeviner
#   puts "Entrez votre chiffre"
#   a = gets.chomp.to_i
#   if a > adeviner
#     puts "Chiffre trop grand"
#   elsif a < adeviner
#     puts "Ciffre trop petit"
#   end
# end

# puts "Bravo ! vous avez gagné" if a == adeviner

# ___ each

eleves = ["Jean", "Marie", "Benoit"]

eleves.each do |eleve|
  puts "Bonjour #{eleve} !"
end

eleves.each {|eleve| puts "Bonjour #{eleve} !"}

marine = {age: 4, nom: "marine", note: 14}

marine.each do |cle, valeur|
  puts "#{cle}: #{valeur}"
end
