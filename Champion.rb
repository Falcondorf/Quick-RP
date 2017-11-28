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
      
        self.max_pv = 100
        self.max_bag_place = 5
=begin
Let's try to implement the equipement with a Hash 
        self.gears = {
          "Head" => Gear.new()
        }
=end
        self.hp = hp
        self.str = str
        self.int = int
        self.lck = lck
        self.dxt = dxt
    end
    
  def fight
        crit = calc_crit(self.lck)
        if (crit)
          puts "CRITICAL HIT !!!"
          crit = false
          return str*1.5  #Ajouter les bonus d'equipement
        else
          return str      #idem
        end
      end
      
      def hit(damage)
        self.hp -= damage #Calcul des bonus 
      end
    
    def to_s
        "Your champion has actually #{self.hp} HP left.\nStats:\nStrenght:#{self.str} -- Intelligence:#{self.int} -- Luck:#{self.lck} -- Dexterity:#{self.dxt}"
    end
end

ptest = Champion.new(1+rand(100), 1+rand(10), 1+rand(10), 1+rand(25), 1+rand(10))
puts ptest