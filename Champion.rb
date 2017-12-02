require "Entity.rb"
require "Gear.rb"

class Champion < Entity
    attr_accessor :max_hp, :max_bag_place, :dxt, :gears, :bag
    
    
    def initialize (hp,str,int,lck,dxt)
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
        dodge = calc_escape(self.dxt)
        if(dodge)
          puts "Dodged"
          damage = 0
        end
        puts "You took #{damage} damage(s)."
        self.hp -= damage        
      end
    
    def to_s
        "Your champion has actually #{self.hp}/#{self.max_hp}(+#{calc_bonus("hp")}).\nStats:\nStrenght:#{self.str}(+#{calc_bonus("str")}) -- Intelligence:#{self.int}(+#{calc_bonus("int")}) -- Luck:#{self.lck}(+#{calc_bonus("lck")}) -- Dexterity:#{self.dxt}(+#{calc_bonus("dxt")})"
    end
    
    private
    
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

ptest = Champion.new(rand(1..100), rand(1..10), rand(1..10), rand(1..25), rand(1..10))
puts ptest
puts "Test dealing damage :: #{ptest.fight()}"