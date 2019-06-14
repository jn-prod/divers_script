require_relative 'eleve'

jean = Eleve.new("Jean")

puts "hello #{jean.nom}"
jean.demandeNote
puts "#{jean.nom} voici vos notes: #{jean.notes.inspect}"