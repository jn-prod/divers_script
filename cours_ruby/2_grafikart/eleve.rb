module Notable
  MOYENNE = 10

  attr_writer :notes

  def self.included(base)
    def base.test
      puts "test"
    end
  end

  class Error < Exception # erreur globale
  end

  class MoyenneError < Error
    def initialize(msg = "Impossible de calculer une moyenne sans notes")
      super
    end
  end

  class AjoutNoteError < Error
  end

  def ajouteNote(note)
    raise AjoutNoteError if !note.respond_to? :to_i
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
    raise MoyenneError if notes.size == 0
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
  # prof.notes = [18,14]
  # prof.ajouteNote([18,14])
rescue Notable::Error => e
  puts e.to_s
ensure
  puts "Salut fin"
end
# prof.ajouteNote(14)

puts "Le proffesseur à #{prof.moyenne}"

Grafikart::Eleve.test