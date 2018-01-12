require "Champion.rb"
require "Encounter.rb"
require "Shop.rb"

class Adventure
  attr_accessor :champion, :journey, :gameover, :position
  
  def initialize()
    self.position = 0
    self.gameover = false
    self.journey = Array.new()
    self.champion = Champion.new(rand(1..100), rand(1..10), rand(1..10), rand(1..25), rand(1..10))
          
    for i in (1..20)
      if(i == 20)          
        self.journey.insert(i-1, Encounter.new("Final Boss"))
      elsif(i % 5 == 0)
        self.journey.insert(i-1, Encounter.new("Boss"))
      else
        roll = rand(1..6)
        if (i > 0 && i < 5)
          location = "Forest"
        elsif (i > 5 && i < 10)
          location = "Cave"
        elsif (i > 10 && i < 15)
          location = "Dungeon"
        elsif (i > 15 && i < 20)
          location = "City"
        end
        if (roll > 4)
          self.journey.insert(i-1, Shop.new(location))
        else
          self.journey.insert(i-1, Encounter.new(location))
        end
      end
    end
    end
  
  def to_s
    disp = "This adventure will go through\n"
    for i in (0...20)
      disp += "#{i+1}:#{self.journey.at(i)}\n"
    end
    disp += "Lead by:\n #{self.champion}"
    return disp
  end
  
end
