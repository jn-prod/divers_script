# ___Heritage

class Eleve

  MOYENNE = 10

  attr_reader :nom, :notes
  attr_writer :note

  def initialize(nom)
    @nom = nom
    @notes = []
  end

  def ajouterNote(note)
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

  def puts(chaine)
    super chaine.upcase
  end

  def afficherNom
    puts "Je suis #{nom}"
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

d = Delegue.new("Jean")
d.ajouterNote(8)

puts d.nom
# puts d.demo
# puts d.participe_au_conseil_de_classe
# puts d.ajouterNote(9)
# puts d.class.superclass # vérifier l'héritage de la class

puts d.afficherNom
