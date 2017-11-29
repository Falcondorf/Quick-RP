require "Gear.rb"

class Loot
  attr_accessor :gold, :gear
  
  def initialize()
    self.gold = rand(7)
    gear = Gear.new()
  end
  
  def reward_bonus(nodamage)
    if (nodamage)
      self.gold *= 2
    end
  end
end