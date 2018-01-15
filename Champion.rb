require "Entity.rb"
require "Gear.rb"
require "Item.rb"

class Champion < Entity
    attr_accessor :max_hp, :max_bag_place, :gears, :bag, :money
    
    
    def initialize (hp,str,int,lck,dxt)
      self.is_dead = false
      name = "The hero"
      
      if (hp < 45)
        hp += 35
      end
      
      if(str+int+lck+dxt < 20)
        str += 5
        int += 5
        lck += 2
        dxt += 3
      elsif (str+int+lck+dxt > 30)
        str -= 5
        int -= 5
        lck -= 2
        dxt -= 3
      end
      
      str, int, lck, dxt = check_stats(str, int, lck, dxt)
      
        self.max_hp = 100
        self.max_bag_place = 5

        self.bag = [
          Item.new("Starting Potion","Basic","potion"),
          Item.new("Starting Potion","Basic","potion"),
          Item.new("Starting Potion","Basic","potion")
          ]
                
        self.gears = {
          "Head" => Gear.new("Head"),
          "Chest" => Gear.new("Chest"),
          "Hands" => Gear.new("Hands"),
          "Legs" => Gear.new("Legs"),
          "Foot" => Gear.new("Foot"),
          "Weapon" => Gear.new("Weapon")
        }

        self.hp = hp
        self.str = str
        self.int = int
        self.lck = lck
        self.dxt = dxt
        self.money = 5
    end
    
  def fight()
        power = str + calc_bonus("str")
        crit = calc_crit(self.lck)
        if (crit)
          puts "CRITICAL HIT !!!\n#{power*2} damage dealt..."
          crit = false
          return power*2
        else
          puts "#{power} damage dealt..."
          return power
        end
      end
      
      def hit(damage)
        dodge = calc_escape(self.dxt+calc_bonus("dxt"))
        if(dodge)
          puts "Dodged"
          damage = 0
        end
        puts "You took #{damage} damage(s)."
        self.hp -= damage
        check_dead()
      end
      
  def use_item (id)
    item_rarity = self.bag[id].rarity()
    item_type = self.bag[id].type()
    rar_mult = calc_rarity_mult(item_rarity)
    
    puts "You are using #{self.bag[id]}"
      case(item_type)
      when "potion"   #restore health (rarity determine how many health given back)
        if (self.hp == self.max_hp+calc_bonus("hp"))
          puts "Your hp are already full..."
        else
          self.hp += 10 * rar_mult
          puts "You healed #{10*rar_mult} hp."
          check_hp_overextend()
        end        
      when "elixir"   #increase stats definitly(rarity determines how many stats) 
        increase_stat(self.bag[id].name().slice(0..2), rar_mult)
      when "bag-slot" #increase place in bag(rarity determines amount of slots)
        self.max_bag_place += rar_mult
        puts "You can now carry #{rar_mult} more slots."
      when "poison"   #deal damage to a mob(rarity determines how many damages) //may be like a grenade
        #TODO
        puts "Not yet implemented (Sorry for that)"
      end
      
      self.bag.delete_at(id)
      
    end
    
    def equip_gear (id)
      
      place = self.bag.at(id).place
      self.bag[id] , gears[place] =  gears[place] , self.bag[id]
    end
    
    def add_to_bag(item)
      if (self.bag.size() == self.max_bag_place)
        puts "Your bag cannot carry anymore..."
      else
        puts "Adding #{item.name} to your bag."
        self.bag.push(item)
      end
    end
    
    def throw_away(id)
      puts "You threw away #{self.bag[id].name}"
      self.bag.delete_at(id)
    end
    
    def show_bag_content
      content = "You have in your bag:\n"
      for i in (0...max_bag_place)
        content += "#{i+1}) #{bag.at(i)}\n"
      end
      puts content
    end
    
    def show_gear_equipped
      equipement = "You are wearing: \n"
      gears.each do |k, g|
        equipement += "#{k} => #{g}\n--\n"
      end
      puts equipement
    end
    
    def show_hp_status
      return "\nYou have #{self.hp}/#{self.max_hp}(+#{calc_bonus("hp")})."
    end
    
    def to_s
        "Your champion has actually #{self.hp}/#{self.max_hp}(+#{calc_bonus("hp")}).\nStats:\nStrenght:#{self.str}(+#{calc_bonus("str")}) -- Intelligence:#{self.int}(+#{calc_bonus("int")}) -- Luck:#{self.lck}(+#{calc_bonus("lck")}) -- Dexterity:#{self.dxt}(+#{calc_bonus("dxt")})"
    end
    
private
    
    def increase_stat(stat, add)      
      case(stat)
        when "str"
          self.str += add
        when "int"
          self.int += add
        when "lck"
          self.lck += add
        when "dxt"
          self.dxt += add
        when "hps"
          self.max_hp += add
      else
        raise "Wrong string"
      end
      puts "You increased your #{stat}."
    end

    def check_hp_overextend
      if(self.hp > self.max_hp+calc_bonus("hp"))
        self.hp = self.max_hp+calc_bonus("hp")
        puts "HP maxed."
      end
    end
    
    def calc_rarity_mult(rar)
      case (rar)
      when "Basic"
        return 1
      when "Rare"
        return 5
      when "Epic"
        return 10
      end
    end
    
    def check_stats (str, int, lck, dxt)
      if (str <= 0)
        str = 1
      end
      if (int <= 0)
        int = 1
      end
      if (lck <= 0)
        lck = 1
      end
      if (dxt <= 0)
        dxt = 1
      end
      return str, int, lck, dxt
     end
      
  def calc_bonus(stat)
          bonus = 0
          self.gears.each do |place, gear|
            case (stat)
            when "hp"
              bonus += gear.hp
            when "str"
              bonus += gear.str
            when "int"
              bonus += gear.int
            when "lck"
              bonus += gear.lck
            when "dxt"
              bonus += gear.dxt
            end
          end
          return bonus
        end
end

=begin
ptest = Champion.new(rand(1..100), rand(1..10), rand(1..10), rand(1..25), rand(1..10))
puts ptest
ptest.show_gear_equipped()
print "Test dealing damage :: "
ptest.fight()
print "Test taking damage :: "
ptest.hit(15)

ptest.add_to_bag(Item.new("Test","Basic","potion"))
ptest.add_to_bag(Item.new("Test","Basic","potion"))
ptest.show_bag_content()
ptest.add_to_bag(Item.new("Test","Basic","potion"))

ptest.use_item(2)
ptest.show_bag_content()
ptest.add_to_bag(Gear.new("Rare", rand(1..100)))
puts ptest

ptest.equip_gear(4)
ptest.show_gear_equipped()
ptest.show_bag_content()
puts ptest

ptest.throw_away(0)
ptest.show_bag_content()
=end