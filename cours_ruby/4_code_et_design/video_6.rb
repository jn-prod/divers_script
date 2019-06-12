class Adresse

  attr_accessor :rue, :code_postal, :ville, :pays

  def initialize
    @rue = @code_postal = @ville = @pays = ""
    
  end

end

class User
  attr_accessor :prenom, :nom, :email, :adresse

  def initialize
    @prenom = @nom = @email = ""
    @adresse = Adresse.new
  end

  def read_adresse
    "#{self.adresse.rue}, #{self.adresse.code_postal} #{self.adresse.ville}, #{self.adresse.pays}"
  end

end

adresse_de_marc = Adresse.new
adresse_de_marc.rue = "rue des capucines"
adresse_de_marc.code_postal = "76000"
adresse_de_marc.ville = "Rouen"
adresse_de_marc.pays = "France"

user = User.new
user.prenom = "Marc"
user.nom = "Dupont"
user.email = "marc.dupont@gmail.lol"
user.adresse = adresse_de_marc

puts user.inspect
puts user.read_adresse