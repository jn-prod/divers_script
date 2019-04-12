module Notable
  MOYENNE = 10

  attr_writer :notes

  def self.included(base)
    def base.test
      puts "test"
    end
  end

  def ajouteNote(note)
    raise ArgumentError, "note n'est pas un entier" if !note.respond_to? :to_i
    notes << note
  end

  def notes
    notes.inspect
  end

  def moyenne?
    moyenne >= MOYENNE
  end

  def moyenne
    somme = 0
    notes.each do |note|
      somme += note
    end
    somme / notes.length
  end

  def notes
    @notes = [] if !@notes
    @notes
  end

end

module Grafikart

  class Eleve

    attr_reader :nom, :notes
    attr_writer :note

    def initialize(nom)
      @nom = nom
      @notes = []
    end

    include Notable

    def >(eleve)
      moyenne > eleve.moyenne
    end

  end

  class Date

    def demo
      puts "je suis un fruit"
    end
    
  end

  class Delegue < Eleve
    def demo
      puts MOYENNE
    end

    def participe_au_conseil_de_classe
      if moyenne?
        puts "Salut je suis au conseil"
      end
    end

    def moyenne
      moyenne = super
      moyenne + 1
    end

    def ajouterNote(note)
      super(note + 1)
    end

  end

  class Professeur
    include Notable
  end

end

jean = Grafikart::Eleve.new("Jean")
jean.ajouteNote(18)
jean.ajouteNote(14)

puts "#{jean.nom} à #{jean.moyenne}"

prof = Grafikart::Professeur.new
begin
  prof.notes = [18,14]
  prof.ajouteNote([18,14])
rescue Exception # erreur globale
  puts "Impossible d'ajouter une note"
rescue ZeroDivisionError # erreur spécifique division par 0
  puts "Le professeur n'a pas de note"
ensure
  puts "Salut fin"
end
prof.ajouteNote(14)

puts "Le proffesseur à #{prof.moyenne}"

Grafikart::Eleve.test