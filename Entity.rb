class Entity
  attr_accessor :hp, :str, :int, :lck, :dxt
  attr_reader :is_dead
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
     puts "#{damage} damage(s) taken."
     self.hp -= damage 
     return
   end
   
   def die ()
     if (hp <=0 )
       isdead = true
     end
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