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
=begin

  def initialize (name, place, rarity, hp, str, int, lck, dxt)
    self.name = "[#{rarity}]#{name}"
    self.place = place
    
  end
=end
end