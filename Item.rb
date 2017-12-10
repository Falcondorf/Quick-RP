class Item
  attr_accessor :name, :rarity, :type
  
  def initialize(name, rarity, type)
    if(type != "potion" && type != "elixir" && type != "bag-slot" && type != "poison") #Verify strings are correct
      raise "Initializing Item with wrong argument(s)"
    end
    self.name = name
    self.rarity = rarity
    self.type = type
  end
  
  def to_s
    "[#{self.rarity}]#{self.name}"
  end
    
end

=begin
itest = Item.new("Starting Potion","Basic","potion")

puts itest
=end