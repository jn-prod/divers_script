# ___Les class

# class Eleve

#   def initialize(nom, age)
#     @nom = nom
#     @age = age
#   end

#   def bonjour
#     puts "Bonjour je m'appelle #{@nom}, j'ai #{@age} ans"
#     if is_majeur?
#       puts "je suis majeur"
#     else
#       puts "je ne suis pas majeur"
#     end
#   end

#   def is_majeur?
#     @age >= 18
#   end

# end

# eleve1 = Eleve.new("Jean", 18)
# eleve2 = Eleve.new("Marc", 15)
# puts eleve1.bonjour
# puts eleve2.is_majeur?

# ___ setter et getter personnalisée

# class Eleve

#   def initialize(nom)
#     @nom = nom
#   end

#   # _setter
#   def age=(age)
#     @age = age
#   end

#   # _getter
#   def age
#     @age
#   end

# end

# eleve1 = Eleve.new("Jean")
# eleve1.age = 10
# puts eleve1.age

# ___ setter et getter par default

# class Eleve

#   attr_accessor # définir un getter et un setter
#   attr_reader :nom, :age, :taille # définir un getter
#   attr_writer :age# définir un setter

#   def initialize(nom)
#     @nom = nom
#   end

#   def demo_public
#     demo
#   end

#   private # toutes les méthodes en-dessous ne peuvent pas être appelé à l'exterieur de cette classe

#   def demo
#     puts "Mon test de demo appelable via la partie public de ma classe"
#   end

# end

# eleve1 = Eleve.new("Jean")
# eleve1.age = 18
# eleve1.demo_public
# puts "age #{eleve1.age}"

# ___ méthodes de class

#_ @ = instance
#_ @@ = class
#_ $ = global
#_ MAJUSCULE = constante


# $a = "ici" # variable globale
# MAJORITE = 18 # constante

# class Eleve

#   @@majorite = MAJORITE #variable de classe

#   def self.bonjour_1(nom)
#     puts "Salut #{@@majorite} ans"
#     puts "Commençons #{$a} #{nom}"
#   end

#   def initialize(nom, age)
#     @nom = nom #variable d'instance
#     @age = age
#   end

#   def bonjour
#     self.class.bonjour_1(@nom)
#   end

#   def is_majeur?
#     @age >= @@majorite
#   end

# end

# Eleve.bonjour_1("Qui est tu ?")

# def Eleve.bonjour_2(nom)
#   puts "Salut #{nom}"
# end

# Eleve.bonjour_1("Recommençons, qui est tu ?")

# eleve = Eleve.new("Jean", 15)
# puts eleve.is_majeur?
# puts eleve.bonjour

# ___ Monkeypatching

# class String

#   def bonjour
#     "Bonjour #{self}"
#   end

# end

# puts "Jean".bonjour

# ___

class Eleve

  MOYENNE = 10

  attr_reader :nom, :notes
  attr_writer :note

  def initialize(nom)
    @nom = nom
    @notes = []
  end

  def ajouteNote(note)
    @notes << note
  end

  def notes
    @notes.inspect
  end

  def moyenne?
    moyenne >= MOYENNE
  end

  def moyenne
    somme = 0
    @notes.each do |note|
      somme += note
    end
    somme / @notes.length
  end

  def >(eleve)
    moyenne > eleve.moyenne
  end

end

jean = Eleve.new("Jean")
jean.ajouteNote(15)
jean.ajouteNote(10)
jean.ajouteNote(2)
# puts jean.notes # [18, 10, 2]
# puts "Moyenne? #{jean.moyenne?}" # true / false
# puts "Moyenne de #{jean.nom} : #{jean.moyenne}" # 12

marc = Eleve.new("Jean")
marc.ajouteNote(18)
marc.ajouteNote(18)
marc.ajouteNote(18)

puts jean > marc
