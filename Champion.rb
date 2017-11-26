class Champion
    attr_accessor :hp, :str, :int, :lck, :dxt
    @max_pv = 100
    @max_bag_place = 5
    @crit = false
    
    def initialize (hp,str,int,lck,dxt)
      if (hp < 45)
        hp += 35
      end
      
      if(str+int+lck+dxt < 40)
        str += 5
        int += 5
        lck += 2
        dxt += 3
      elsif (str+int+lck+dxt > 55)
        str -= 5
        int -= 5
        lck -= 2
        dxt -= 3
      end
      
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
          return str*1.5  #Ajouter les bonus d'équipement
        else
          return str      #idem
        end
      end
      
      def hit(damage)
        self.hp -= damage
      end
    
    def to_s
        "Your champion has actually #{self.hp} HP left.\nStats:\nStrenght:#{self.str} -- Intelligence:#{self.int} -- Luck:#{self.lck} -- Dexterity:#{self.dxt}"
    end
end

ptest = Champion.new(1+rand(100), 1+rand(25), 1+rand(25), 1+rand(5), 1+rand(10))
puts ptest