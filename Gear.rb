$list_weapons = [
  ["Sword",0,5,0,1,3], #name - hp - str - int - lck - dxt // These represents base bonus stats
  ["Axe",0,7,0,2,1],
  ["Dagger",0,3,0,8,8],
  ["Hammer",0,10,0,0,0],
  ["Wand",0,0,15,0,4],
  ["Staff",0,4,10,0,0],
  ["Bow",0,8,0,3,0],
  ["Shield",5,2,0,0,0]
]

$list_helmets = [
  ["Cool glasses",0,0,0,0,0],
  ["Leather helmet",3,0,0,0,4],
  ["Iron helmet",5,0,0,0,0],
  ["Cap",0,0,5,0,0],
  ["Golden diadem",0,0,0,10,0]
]

$list_armor = [
  
]

$list_gloves = [
  
]

$list_pants = [
  
]

$list_boots = [
  
]

class Gear
  attr_accessor :name, :place, :rarity, :hp, :str, :int, :lck, :dxt, :value

  def initialize (emplacement) #Create default starting equipement
    
    self.rarity = "[Basic]"
    self.hp = 0
    self.str = 0
    self.int = 0
    self.lck = 0
    self.dxt = 0
    self.value = 1
    
    case(emplacement)
    when "Head"
      self.name = "Hat"
    when "Chest" 
      self.name = "Shirt"
      self.hp = 3
    when "Hands"
      self.name = "Mittens"
    when "Legs"
      self.name = "Trouser"
    when "Foot"
      self.name = "Socks"
      self.dxt = 1
    when "Weapon"
      self.name = "Stick"
      self.str = 2
    else
      raise "Bad emplacement, please choose a correct one."
    end
    
    self.place = emplacement 
  end
  
  def initialize (rarity, roll) #Create a Random equipement DIV = emplacement - MOD = number in DB
    emp = roll/10
    i = roll%10
    self.rarity = "[#{rarity}]"
    
    case(rarity)
    when "Basic"
      mult = 1
    when "Rare"
      mult = 2
    when "Epic"
      mult = 4
    else
      raise "Wrong rarity."
    end
    
    if (emp == 1 || emp == 7)
      #head
      self.place = "Head"
      self.name = $list_helmets[i][0]
      self.hp = $list_helmets[i][1]*mult
      self.str = $list_helmets[i][2]*mult
      self.int = $list_helmets[i][3]*mult
      self.lck = $list_helmets[i][4]*mult
      self.dxt = $list_helmets[i][5]*mult
    elsif(emp == 2 || emp == 8)
      #armor
      self.place = "Chest"
      self.name = $list_armor[i][0]
      self.hp = $list_armor[i][1]*mult
      self.str = $list_armor[i][2]*mult
      self.int = $list_armor[i][3]*mult
      self.lck = $list_armor[i][4]*mult
      self.dxt = $list_armor[i][5]*mult
    elsif(emp == 3 || emp == 9)
      #weapon
      self.place = "Weapon"
      self.name = $list_weapons[i][0]
      self.hp = $list_weapons[i][1]*mult
      self.str = $list_weapons[i][2]*mult
      self.int = $list_weapons[i][3]*mult
      self.lck = $list_weapons[i][4]*mult
      self.dxt = $list_weapons[i][5]*mult
    elsif(emp == 4 || emp == 10)
      #pants
      self.place = "Legs"
      self.name = $list_pants[i][0]
      self.hp = $list_pants[i][1]*mult
      self.str = $list_pants[i][2]*mult
      self.int = $list_pants[i][3]*mult
      self.lck = $list_pants[i][4]*mult
      self.dxt = $list_pants[i][5]*mult
    elsif(emp == 5)
      #gloves
      self.place = "Hands"
      self.name = $list_gloves[i][0]
      self.hp = $list_gloves[i][1]*mult
      self.str = $list_gloves[i][2]*mult
      self.int = $list_gloves[i][3]*mult
      self.lck = $list_gloves[i][4]*mult
      self.dxt = $list_gloves[i][5]*mult
    elsif(emp == 6)
      #boots
      self.place = "Foot"
      self.name = $list_boots[i][0]
      self.hp = $list_boots[i][1]*mult
      self.str = $list_boots[i][2]*mult
      self.int = $list_boots[i][3]*mult
      self.lck = $list_boots[i][4]*mult
      self.dxt = $list_boots[i][5]*mult
    else
      raise "Roll calculation error; must be between 1 and 10."
    end
    
    self.value = 0 #TODO
    
  end

  def to_s
    "#{self.rarity}#{self.name}\n-------------------\nHP:#{self.hp}\nStr:#{self.str}\nInt:#{self.int}\nLck:#{self.lck}\nDxt:#{self.dxt}\n-------------------\nWorth #{self.value} gold(s)"
  end

end


#Demo test with exception handling
begin
  gtest = Gear.new("Head") #put in singular form
  puts gtest
rescue Exception=>e
  puts "Error : #{e}"
end
