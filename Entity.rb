class Entity
  attr_accessor :hp, :str, :int, :lck, :dxt
  @crit = false
  
  def fight
        crit = calc_crit(self.lck)
        if (crit)
          puts "CRITICAL HIT !!!"
          crit = false
          return str*2
        else
          return str
        end
      end
      
   def hit (damage)
     dodge = calc_escape(self.dxt)
     if(dodge)
       puts "Dodged"
       damage = 0
     end
     puts "You took #{damage} damage(s)."
     self.hp -= damage 
     return
   end
   
   private 
   def calc_crit(lck)
    roll = rand(1..100)
    return (roll < lck)
   end
   
   def calc_escape(dxt)
     roll = rand(1..100)
     return (roll < dxt)
   end
  
end