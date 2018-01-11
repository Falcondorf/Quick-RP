require "Gear.rb"

class Loot
  attr_accessor :gold, :gear, :level
  
  def initialize(level,nodamage)
    self.level = level
    self.gold = rand(1..7)
    reward_bonus(nodamage)
    rarity = roll_rarity
    self.gear = Gear.new(rarity,rand(1..100))
  end
  
  def to_s
    "You looted : #{self.gold} gold(s) and [#{gear.rarity}]#{gear.name}"
  end
  
  private
  
  def reward_bonus(nodamage)
    if (nodamage)
      self.gold *= 2
    end
  end
  
  def roll_rarity
      roll = rand(100)
      if (self.level == "Forest")
        if (roll < 80)
          "Basic"
        elsif (roll < 95)
          "Rare"
        else
          "Epic"
        end
      elsif (self.level == "Cave")
        if (roll < 65)
          "Basic"
        elsif (roll < 85)
          "Rare"
        else
          "Epic"
        end
      elsif (self.level == "Dungeon")
        if (roll < 50)
          "Basic"
        elsif (roll < 90)
          "Rare"
        else
          "Epic"
        end
      elsif (self.level == "City")
        if (roll < 35)
          "Basic"
        elsif (roll < 60)
          "Rare"
        else
          "Epic"
        end
      end
    end
  
end

=begin
tloot = Loot.new("Cave",true)

puts tloot
=end