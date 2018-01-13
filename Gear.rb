
#The lists must not have more than 10 items or they will never be accessed /!\
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
  ["Cool glasses",0,0,1,0,0],
  ["Leather helmet",3,0,0,0,4],
  ["Iron helmet",5,0,0,0,0],
  ["Cap",0,0,5,0,0],
  ["Golden diadem",0,0,0,10,0],
  ["Leprechaun cap",0,0,2,8,4],
  ["Iron band",2,4,0,0,3],
  ["Skull",1,5,0,0,0],
  ["Hermes helmet",0,0,4,1,15]
]

$list_armor = [
  ["Leather chestplate",2,0,0,0,5],
  ["Iron chestplate",4,1,0,0,0],
  ["Runic tunic",0,0,10,1,0],
  ["Weighless shirt",0,0,3,1,12],
  ["Golden chestplate",2,1,1,15,0],
  ["Diamond chestplate",10,2,0,3,0],
  ["Bone chestplate",1,7,3,0,3]
]

$list_gloves = [
  ["Claws",0,9,0,1,3],
  ["Leather gloves",2,0,0,0,2],
  ["Iron gauntlet",4,3,0,0,0],
  ["Ring with runes and ruby",0,0,5,3,3],
  ["Golden bracelet",0,0,10,2,2],
  ["Force glove",3,7,0,0,1],
  ["Copper Bracelet",3,3,0,0,0]
]

$list_pants = [
  ["Leather pants",3,0,0,0,1],
  ["Bone pants",1,5,3,0,4],
  ["Iron legplate",4,3,0,0,0],
  ["Weighless pants",0,0,4,0,10],
  ["Witch skirt",0,0,12,0,0],
  ["Golden legplate",2,1,1,15,0],
  ["Dragon's scale pants",10,5,1,3,1],
  ["Diamond legplate",10,1,0,4,0]
]

$list_boots = [
  ["Hermes sandals",0,0,4,1,11],
  ["Leather shoes",2,0,0,0,2],
  ["Iron boots",5,1,0,0,0],
  ["Magic sandals",0,0,8,2,0],
  ["Golden shoes",1,0,0,10,1],
  ["Obsidian boots",12,1,0,0,0],
  ["Boots with spikes",2,9,0,0,0]
]

class Gear
  attr_accessor :name, :place, :rarity, :hp, :str, :int, :lck, :dxt, :value
  
  def initialize(*args)
    if (args.length == 1)
      constr1(args[0])
    elsif (args.length == 2)
      constr2(args[0],args[1])
    else
      raise "Wrong number of arguments"
    end
  end

  def to_s
    "[#{self.rarity}]#{self.name} => (#{self.place})\n-------------------\nHP:#{self.hp}\nStr:#{self.str}\nInt:#{self.int}\nLck:#{self.lck}\nDxt:#{self.dxt}\n-------------------\nWorth #{self.value} gold(s)"  end
    private
    
    def constr1(emplacement)
          self.rarity = "Basic"
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
    
    def constr2(rarity, roll)
          emp = roll/10
          i = roll%10
          self.rarity = rarity
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
            if (i >= $list_helmets.length) 
              i = i % $list_helmets.length
            end
            
            self.place = "Head"
            self.name = $list_helmets[i][0]
            self.hp = $list_helmets[i][1]*mult
            self.str = $list_helmets[i][2]*mult
            self.int = $list_helmets[i][3]*mult
            self.lck = $list_helmets[i][4]*mult
            self.dxt = $list_helmets[i][5]*mult
          elsif(emp == 2 || emp == 8)
            #armor
            if (i >= $list_armor.length) 
              i = i % $list_armor.length
            end
            
            self.place = "Chest"
            self.name = $list_armor[i][0]
            self.hp = $list_armor[i][1]*mult
            self.str = $list_armor[i][2]*mult
            self.int = $list_armor[i][3]*mult
            self.lck = $list_armor[i][4]*mult
            self.dxt = $list_armor[i][5]*mult
          elsif(emp == 3 || emp == 9)
            #weapon
            if (i >= $list_weapons.length) 
              i = i % $list_weapons.length
            end
            
            self.place = "Weapon"
            self.name = $list_weapons[i][0]
            self.hp = $list_weapons[i][1]*mult
            self.str = $list_weapons[i][2]*mult
            self.int = $list_weapons[i][3]*mult
            self.lck = $list_weapons[i][4]*mult
            self.dxt = $list_weapons[i][5]*mult
          elsif(emp == 4 || emp == 10)
            #pants
            if (i >= $list_pants.length) 
              i = i % $list_pants.length
            end
            
            self.place = "Legs"
            self.name = $list_pants[i][0]
            self.hp = $list_pants[i][1]*mult
            self.str = $list_pants[i][2]*mult
            self.int = $list_pants[i][3]*mult
            self.lck = $list_pants[i][4]*mult
            self.dxt = $list_pants[i][5]*mult
          elsif(emp == 0 || emp == 5)
            #gloves
            if (i >= $list_gloves.length) 
              i = i % $list_gloves.length
            end
            
            self.place = "Hands"
            self.name = $list_gloves[i][0]
            self.hp = $list_gloves[i][1]*mult
            self.str = $list_gloves[i][2]*mult
            self.int = $list_gloves[i][3]*mult
            self.lck = $list_gloves[i][4]*mult
            self.dxt = $list_gloves[i][5]*mult
          elsif(emp == 6)
            #boots
            if (i >= $list_boots.length) 
              i = i % $list_boots.length
            end
            
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
          
          self.value = 5*mult
    end
end

=begin
#Demo test with exception handling
begin
  gtest = Gear.new("Basic",rand(1..100))
  puts gtest
rescue Exception=>e
  puts "Error : #{e}"
end
=end