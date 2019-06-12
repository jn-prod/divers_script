# ___TP compteur de mots

text = "Nous allons nous arrêter un instant afin d'essayer de mettre en pratique tout ce que l'on a vu jusqu'à maintenant à travers un exemple concret. Pour cet exercice nous allons essayer de calculer la fréquence des mots dans un texte en utilisant les éléments vus précédemment."

frequence = Hash.new(0)

mots = text.tr('.,":', '').downcase.split(' ')
# puts mots.inspect

mots.each do |mot|
  frequence[mot] += 1
end

frequence = frequence.sort_by { |mot, count| count }
frequence.reverse!

first = frequence.first

puts "Le mot qui apparait le plus souvent est le mot : \"#{first[0]}\" qui apparait #{first[1]}x"

# frequence.each do |mot|
#   puts "le mot \"#{mot[0]}\" apparait #{mot[1]} fois"
# end

# puts frequence.inspect