require "Gear.rb"

class Loot
  attr_accessor :gold, :gear
  
  def initialize()
    
  end
  
  def reward_bonus(nodamage)
    if (nodamage)
      self.gold *= 2
    end
  end
end