module Notable
  MOYENNE = 10

  attr_writer :notes

  def ajouteNote(note)
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
prof.notes = [18,14]
prof.ajouteNote(18)
prof.ajouteNote(14)

puts "Le proffesseur à #{prof.moyenne}"