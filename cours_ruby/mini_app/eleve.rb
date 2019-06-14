class Eleve

  attr_accessor :nom, :notes

  def initialize(nom)
    @nom = nom
    @notes = []
  end

  def ajouteNote(note)
    notes << note.to_i
  end

  def demandeNote
    puts "Souhaitez-vous ajouter une nouvelle note ? O/N"
    continue = gets.chomp

    if continue == "O"
      puts "Quelle est votre note ?"
      ajouteNote(gets.chomp) 
    end

  end

end