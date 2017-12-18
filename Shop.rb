require "Item.rb"
require "Gear.rb"

class Shop
  #TODO a shopkeeper that will sell goods for the champion or buy his stuff
  attr_accessor :level, :items, :gears
  
  def initialize(level) #The level determines the rarity of its goods
    self.level = level
    self.items  = Array.new
    for i in (0..3)
      item_vals = roll_items
      items.push(Item.new(item_vals[0],item_vals[1],item_vals[2]))
    end
    for k in (0..2)
      #gears.push(Gear.new())
    end
  end
  
  private
  
  def roll_items()
    it_roll = rand(4)
    rar_roll = roll_rarity()
    
    case (it_roll)
    when 0
      name = "Health Potion"
      type = "potion"
    when 1
      name = roll_elixir_stat(rar_roll)
      type = "elixir"
    when 2
      name = "Bag Pocket"
      type = "bag-slot"
    when 3
      name = "Instant Poison"
      type = "poison"
    end 
    
    return name, rar_roll, type
  end
  
  def roll_rarity
    roll = rand(100)
    if (self.level == 1)
      if (roll < 80)
        "Basic"
      elsif (roll < 95)
        "Rare"
      else
        "Epic"
      end
    elsif (self.level == 2)
      if (roll < 65)
        "Basic"
      elsif (roll < 85)
        "Rare"
      else
        "Epic"
      end
    elsif (self.level == 3)
      if (roll < 50)
        "Basic"
      elsif (roll < 90)
        "Rare"
      else
        "Epic"
      end
    elsif (self.level == 4)
      if (roll < 35)
        "Basic"
      elsif (roll < 60)
        "Rare"
      else
        "Epic"
      end
    end
  end
  
  def roll_elixir_stat(rarity)
    roll = rand(5)  
      
    case(roll)
    when 0
      string="hps"
    when 1
      string="str"
    when 2
      string="int"
    when 3
      string="lck"
    when 4
      string="dxt"
    end
    
    case(rarity)
    when "Basic"
      string += "+"
    when "Rare"
      string += "++"
    when "Epic"
      string += "+++"
    end
    
    return string
  end
end

=begin
shtest = Shop.new(4)

puts shtest.items[0]
=end
