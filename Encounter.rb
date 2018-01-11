require "Mob.rb"
require "Loot.rb"

class Encounter
  attr_accessor :location, :mob, :loot, :nodamage #Nodamage boolean check to add loot bonus
  
  def initialize (location)
    self.location = location
    self.mob= Mob.new(location)
    self.nodamage = true
  end
  
  def attack_mob(damage)
    self.mob.hit(damage)
  end
  
  def mob_attacking()
    return self.mob.fight()
  end
  
  def to_s
    "You are in #{self.location} against a #{self.mob.name}"
  end
  
end

=begin

tenc = Encounter.new("Cave")

puts tenc.mob()
=end