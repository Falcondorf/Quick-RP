class Item
  attr_accessor :name, :rarity, :type
  
  def initialize(name, rarity, type)
    if() #Verify strings are correct
      raise "Initializing Item with wrong argument(s)"
    end
    self.name = name
    self.rarity = rarity
    self.type = type
  end
  
  
  #Refactor inside Champion
  def use ()
    case(self.type)
    when "potion"   #restore health (rarity determine how many health given back)
      
    when "elixir"   #increase stats definitly(rarity determines how many stats)
      
    when "bag-slot" #increase place in bag(rarity determines amount of slots)
      
    when "poison"   #deal damage to a mob(rarity determines how many damages)
          
    end
  end
end