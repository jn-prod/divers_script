# villes = ['Paris', 'New York', 'Berlin', 'Montréal']

# puts "DEFI N°1 - Si j'étais en vacances, j'irais à ..."

# villes.each do |ville|
#   puts ville
# end

# next

# voyages = [
#   { ville: "Paris", duree: 10 },
#   { ville: "New York", duree: 5 },
#   { ville: "Berlin", duree: 2 },
#   { ville: "Montréal", duree: 15 }
# ]

# puts "DEFI N°2 - Détail de mes vacances de rêve"

# voyages.each do |voyage|
#   puts "Voyage à #{voyage[:ville]} de #{voyage[:duree]} jours"
# end

# next

voyages = [
  { ville: "Paris", duree: 10 },
  { ville: "New York", duree: 5 },
  { ville: "Berlin", duree: 2 },
  { ville: "Montréal", duree: 15 }
]

puts "DEFI N°3 - Mes vacances de rêve (enfin presque)"

voyages.each do |voyage|
  duree = voyage[:duree]
  if (duree < 5 || duree == 5) 
    puts "Voyage à #{voyage[:ville]} de #{voyage[:duree]} jours"
  end
end