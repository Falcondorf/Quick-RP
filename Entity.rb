class Entity
  attr_accessor :hp, :str, :int, :lck, :dxt, :name, :is_dead
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
     puts "#{damage} damage(s) taken by #{self.name}"
     self.hp -= damage
     check_dead()
     return
   end   
   
   private 
   def calc_crit(lck)
    roll = rand(1..100)
    return (roll < lck)
   end
   
   def calc_escape(dxt)
     calc_dxt = dxt
     if(dxt > 90)
       calc_dxt = 90
     end
     roll = rand(1..100)
     return (roll < calc_dxt)
   end
   
   def check_dead ()
    if (hp <= 0 )
     self.is_dead = true
     puts "#{self.name} died during the battle..."     
    end
   end
end