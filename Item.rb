class Item
  attr_accessor :name, :rarity, :type, :value
  
  def initialize(name, rarity, type)
    if(type != "potion" && type != "elixir" && type != "bag-slot" && type != "poison") #Verify strings are correct
      raise "Initializing Item with wrong argument(s)"
    end
    self.name = name
    self.rarity = rarity
    self.type = type
    case (rarity)
    when "Basic"
      self.value = 3
    when "Rare"
      self.value = 8
    when "Epic"
      self.value = 15
    else
      raise "Wrong rarity."
    end
  end
  
  def to_s
    "[#{self.rarity}]#{self.name}"
  end
    
end

=begin
itest = Item.new("Starting Potion","Basic","potion")

puts itest
=end