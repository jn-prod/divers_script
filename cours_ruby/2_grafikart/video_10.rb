# ___Proc, Block, Lambda

# tableau = [1, 2, 6]
# tableau2 = tableau.map { |item| item * 2 }
# puts tableau2.inspect

# ___ 

# def demo
#   puts "bonjour"
#   yield('Marc')
#   puts "Aurevoir"
#   yield('Jean')
# end

# demo { |nom| puts "Comment ça va #{nom}" }

# ___

# eleves = [
#   {note: 15, nom: "Marine"},
#   {note: 4, nom: "Marc"},
#   {note: 10, nom: "Jean"},
#   {note: 10, nom: "Marion"}
# ]

# def alamoyenne(eleves)
#   eleves.each do |eleve|
#     if eleve[:note] >= 10
#       yield(eleve)
#     end
#   end
# end

# affichier_moyenne = Proc.new { |eleve| puts "#{eleve[:nom]} à la moyenne"}
# affichier_moyenne.call({note: 10, nom: "azeaze"})
# alamoyenne eleves, &affichier_moyenne

# ___

# a = [1, 2, 3, 6]
# b = [1, 7, 9]

# carre = Proc.new { |n| n**2 }

# a.map!(&carre)
# b.map!(&carre)

# puts a.inspect
# puts b.inspect

# ___

# eleves = [
#   {note: 15, nom: "Marine"},
#   {note: 4, nom: "Marc"},
#   {note: 10, nom: "Jean"},
#   {note: 10, nom: "Marion"}
# ]

# def alamoyenne(eleves, &demo)
#   eleves.each do |eleve|
#     if eleve[:note] >= 10
#       demo.call(eleve)
#     end
#   end
# end

# alamoyenne(eleves) { |eleve| puts "#{eleve[:nom]} à la moyenne" }

# ___

# eleves = [
#   {note: 15, nom: "Marine"},
#   {note: 4, nom: "Marc"},
#   {note: 10, nom: "Jean"},
#   {note: 10, nom: "Marion"}
# ]

# def alamoyenne(eleves, moyenneproc, pasmoyenneproc)
#   eleves.each do |eleve|
#     if eleve[:note] >= 10
#       moyenneproc.call(eleve)
#     else 
#       pasmoyenneproc.call(eleve)
#     end
#   end
# end

# affichier_moyenne_ok = Proc.new { |eleve| puts "#{eleve[:nom]} à la moyenne" }
# affichier_moyenne_ko = Proc.new { |eleve| puts "#{eleve[:nom]} n'à pas la moyenne" }

# alamoyenne(eleves, affichier_moyenne_ok, affichier_moyenne_ko)

# ___

# eleves = [
#   {note: 15, nom: "Marine"},
#   {note: 4, nom: "Marc"},
#   {note: 10, nom: "Jean"},
#   {note: 10, nom: "Marion"}
# ]

# def alamoyenne(eleves, moyenneproc, pasmoyenneproc)
#   eleves.each do |eleve|
#     if eleve[:note] >= 10
#       moyenneproc.call(eleve, "test")
#     else 
#       pasmoyenneproc.call(eleve)
#     end
#   end
# end

# affichier_moyenne_ok = Proc.new { |eleve| puts "#{eleve[:nom]} à la moyenne" }
# affichier_moyenne_ko = lambda { |eleve| puts "#{eleve[:nom]} n'à pas la moyenne" }
# affichier_moyenne_ko = -> (eleve) { puts "#{eleve[:nom]} n'à pas la moyenne" }

# alamoyenne(eleves, affichier_moyenne_ok, affichier_moyenne_ko)

# ___

# # _ Lambda = Vérifie paraètre, return renvoie à la fonction
# def a_lambda
#   a = lambda { return "Salut" }
#   a.call
#   return "Au revoir"
# end

# # _ Proc peu importe les paramètres, return 
# def a_proc
#   a = Proc.new { return "Salut" }
#   a.call
#   return "Au revoir"
# end

# puts a_lambda
# puts a_proc

# ___

a = ["1", "4", 5]

puts "Première version"
puts a.map { |n| n.to_i }
puts "Deuxième version"
puts a.map(&:to_i)
