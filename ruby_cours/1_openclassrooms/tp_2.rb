# ___V1

# class Utilisateur
#   attr_accessor :prenom, :amis

#   def est_amis_avec?(prenom)
#     amis.each do |ami|
#       return true if ami.prenom == prenom
#     end
#     return false
#   end
# end

# alice = Utilisateur.new
# alice.prenom = "Alice"

# bob = Utilisateur.new
# bob.prenom = "Bob"

# jane = Utilisateur.new
# jane.prenom = "Jane"

# alice.amis = [bob, jane]

# puts alice.amis.size

# puts alice.est_amis_avec?("Bob")

# ___V2

class Utilisateur
  attr_accessor :prenom, :amis

  def initialize(prenom, sexe)
    if sex == "f"
      @prenom = "Madame" + prenom
    else
      @prenom = "Monsieur" + prenom
    end
  end

  def est_amis_avec?(prenom)
    amis.each do |ami|
      return true if ami.prenom == prenom
    end
    return false
  end
end

alice = Utilisateur.new("Alice", "f")

bob = Utilisateur.new("Bob", "h")

jane = Utilisateur.new("Jane")

puts alice.prenom
puts bob.prenom