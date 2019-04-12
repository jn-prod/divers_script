# ___Les modules

require 'date'
require_relative 'eleve'

module Geometrie
  module Cercle

    PI = 3.1415

    def self.perimetre(rayon)
      2 * PI * rayon
    end

    def self.creerEleve(nom)
      Grafikart::Eleve.new(nom)
    end

  end
end

# puts Cercle.perimetre(10)
# puts Cercle::PI
# puts "---------"
# puts "afficher la date"
# puts Date.today.monday?

puts "---------"
puts "appeler les class élève depuis require_relative"
puts Grafikart::Date.new.demo
puts Grafikart::Eleve.new("Jean").nom

module Grafikart
  puts Date.new.demo
  puts Eleve.new("Jean").nom
end

puts "---------"

puts Geometrie::Cercle::PI

puts Geometrie::Cercle::creerEleve("Marc").nom