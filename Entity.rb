class Entity
  attr_accessor :hp, :str, :int, :lck
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
     self.hp -= damge
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