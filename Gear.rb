$list_weapons = [
  ["Sword",0,5,0,0,3], #name - str - int - lck - dxt // These represents base bonus stats
  []
]

$list_helmets = [
  
]

$list_armor = [
  
]

$list_gloves = [
  
]

$list_pants = [
  
]

$list_boots = [
  
]

class Gear
  attr_accessor :name, :place, :rarity, :hp, :str, :int, :lck, :dxt

  def initialize (emplacement) #Create default starting equipement
    
    self.rarity = "[Basic]"
    self.hp = 0
    self.str = 0
    self.int = 0
    self.lck = 0
    self.dxt = 0
    
    case(emplacement)
    when "Head"
      self.name = "Hat"
    when "Chest" 
      self.name = "Shirt"
      self.hp = 3
    when "Hands"
      self.name = "Mittens"
    when "Legs"
      self.name = "Trouser"
    when "Foot"
      self.name = "Socks"
    when "Weapon"
      self.name = "Stick"
      self.str = 2
    else
      raise "Bad emplacement, please choose a correct one."
    end
    
    self.place = emplacement 
  end
  
  def initialize (rarity, roll) #Create a Random equipement
    
  end
  
  def to_s
    "#{self.rarity}#{self.name}\n-------------------\nHP:#{self.hp}\nStr:#{self.str}\nInt:#{self.int}\nLck:#{self.lck}\nDxt:#{self.dxt}"
  end

end

=begin
#Demo test with exception handling
begin
  gtest = Gear.new("Weapons") #put in singular form
  puts gtest
rescue Exception=>e
  puts "Error : #{e}"
end
=end