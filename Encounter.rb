require "Mob.rb"

class Encounter
  attr_accessor :location, :mob, :loot, :nodamage #Nodamage boolean check to add loot bonus
  
  def initialize (location)
    self.location = location
    self.mob= Mob.new(location)   
  end
  
  
end