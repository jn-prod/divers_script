class Animal
  attr_accessor :nom
  
  def initialize(nom)
    @nom = nom
  end
end

class Chien < Animal
  def parler
    puts "#{nom}: Wouf Wouf, Je suis un chien "
  end
end

class Chat < Animal
  def parler
    puts "#{nom}: Miaou Miaou, Je suis un chat"
  end
end

mon_chien = Chien.new("Bob, alias le chien")
mon_chat = Chat.new("Adeline, alias le chat")

mon_chat.parler
mon_chien.parler