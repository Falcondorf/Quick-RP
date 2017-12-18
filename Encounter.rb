require "Mob.rb"
require "Loot.rb"

class Encounter
  attr_accessor :location, :mob, :loot, :nodamage #Nodamage boolean check to add loot bonus
  
  def initialize (location)
    self.location = location
    self.mob= Mob.new(location)
    self.loot = Loot.new()
    self.nodamage = true
  end
  
  
end

=begin

tenc = Encounter.new("Cave")

puts tenc.mob()
=end