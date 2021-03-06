require_relative "./Adventure.rb"

adv = Adventure.new()

while (!adv.gameover && !adv.champion.is_dead) #Loop control end game
  if (adv.place().instance_of? Shop) #check if Shop or encounter
    in_shop = true
    puts "\nYou arrived in a shop, many goods are in sale and you can sell your stuff here for golds."
    while (in_shop) #Loop control in shop
      puts "\nChoose an option: \n1)Display goods\n2)Buy\n3)Sell\n4)Inventory\n5)Exit shop\n----------\nYou have #{adv.champion.money} gold(s)."
      opt = gets.to_i()
      case (opt)
      when 1 #Displaying Shop
        puts adv.place()
      when 2 #Buying stuff to the shop
        if (adv.champion.bag.length == adv.champion.max_bag_place) #Check bag isn't full
          puts "\nYou can't buy anything, your bag is full. Try selling stuff first."
        else
          buying = true
          while (buying)
            puts "\nYou have #{adv.champion.money} golds to spend."
            puts "Want to buy Item(1) or Gear(2) -- 0 to stop buying?"
            buy_opt = gets.to_i()
            case (buy_opt)
            when 0 #Exit buying
              buying = false
            when 1 #Manage Items buying
              if (adv.place().items.empty?)
                puts "\nAll items sold."
              elsif(adv.champion.bag.length < adv.champion.max_bag_place)
                puts adv.place().show_items
                begin
                  puts "\nWhat's the id of the item?"
                  id_it = gets.to_i() - 1
                  if (id_it > adv.place().items.length-1 || id_it < 0) #Check user input available and correct
                    raise "Wrong ID."
                  else
                    if (adv.champion.money >= adv.place().items.at(id_it).value)
                       item = adv.place().sell("Item", id_it)
                       adv.champion.add_to_bag(item)
                       adv.champion.money -= item.value
                    else
                      puts "\nYou don't have enough money"
                    end                
                  end
                rescue => exception
                  puts exception
                  retry
                end
              else
                puts "Your bag is already full."
              end
            when 2 #Manage Gears buying
              if (adv.place().gears.empty?)
                puts "\nAll items sold."
              elsif(adv.champion.bag.length < adv.champion.max_bag_place)
                  puts adv.place().show_gears
                  begin
                    puts "\nWhat's the id of the gear?"
                    id_gr = gets.to_i() - 1
                    if (id_gr > adv.place().gears.length - 1 || id_gr < 0)
                      raise "Wrong ID."
                    else
                      if (adv.champion.money >= adv.place().gears.at(id_gr).value)
                         item = adv.place().sell("Gear", id_gr)
                         adv.champion.add_to_bag(item)
                         adv.champion.money -= item.value
                      else
                        puts "\nYou don't have enough money"
                      end    
                    end
                  rescue => exception
                    puts exception
                    retry
                  end
              else
                puts "Your bag is already full."
              end
            else
                puts "Invalid option"
            end             
          end
        end
      when 3 #Manage items selling
        selling = true
        while (selling) #Control loop check we are still selling
          if (adv.champion.bag.length == 0)
            puts "\nYou have nothing to sell."
            selling = false
          else
            begin
              adv.champion.show_bag_content()
              puts "\nWhat's the id of the item to sell? (0 to stop selling)\nYou will gain 2/3 of the item's worth."
              bag_id = gets.to_i()
              if (bag_id == 0)
                selling = false
              elsif (bag_id < 0 || bag_id > adv.champion.bag.length)
                raise "Wrong ID."
              else
                credit = adv.place().buy(adv.champion.bag.at(bag_id-1).value)              
                adv.champion.money += credit
                adv.champion.throw_away(bag_id-1)
                puts "\nYou gained #{credit} gold(s) and now have #{adv.champion.money} gold(s)."
              end
            rescue => exception
              puts exception
            end
          end
        end 
      when 4        
        puts "\nFrom here, you can manage your inventory and gear:"
        in_inventory = true
        while (in_inventory)
          puts "\n0)Champion stats\n1)Display bag\n2)Display equipped gear\n3)Equip a gear or use an item\n4)Throw an item\n5)Back to shop"
          inv_option = gets.to_i()
          case (inv_option)
          when 0
            puts adv.champion
          when 1
            adv.champion.show_bag_content()
          when 2
            adv.champion.show_gear_equipped()
          when 3
            if (adv.champion.bag.length == 0)
              puts "\nYou bag is empty."
            else
              begin
                adv.champion.show_bag_content()
                puts "\nType the id of the item in your bag, an item is used and a gear swapped.(0 to cancel)"
                bag_id = gets.to_i()
                if(bag_id != 0)
                  if (bag_id <= 0 || bag_id > adv.champion.bag.length)
                    raise "Wrong ID of empty slot."
                  end
                  if (adv.champion.bag.at(bag_id-1).instance_of? Item)
                    adv.champion.use_item(bag_id-1)
                  else
                    adv.champion.equip_gear(bag_id-1)
                  end
                end
              rescue => exception
                puts exception
                retry
              end
            end
          when 4
            if (adv.champion.bag.length == 0)
              puts "\nYour bag is empty."
            else
              begin
                adv.champion.show_bag_content()
                puts "\nType the id of the item in your bag you want to throw away.(0 to cancel)"
                bag_id = gets.to_i()
                if (bag_id != 0)
                  if (bag_id <= 0 || bag_id > adv.champion.bag.length)
                    raise "Wrong ID of empty slot."
                  end
                  adv.champion.throw_away(bag_id-1)
                end
              rescue =>exception
                puts exception
                retry
              end
            end
          when 5
            in_inventory = false
          else
            puts "Invalid option"
          end
        end
      when 5
        puts "\nThanks for coming and good luck ahead."
        in_shop = false
        adv.position += 1
      else
        puts "Invalid option"
      end
    end
  else
    if (adv.place().location == "Boss" || adv.place().location == "Final Boss")
      puts "You felt the danger ahead and prepared for the battle. You took a good rest..."
      adv.champion.heal(100)
    else
      puts "You took a quick rest."
      adv.champion.heal(25)
    end    
      puts "\nYou encountered a #{adv.place().mob.name}... Prepare to fight"   
    while (!adv.champion.is_dead() && !adv.place().mob.is_dead())
      begin
        player_turn = true
        while(player_turn)
          puts adv.champion.show_hp_status()
          puts "\nWhat will you do?\n1)Attack\n2)Use an item or change gear\n3)Show Inventory\n4)Show gear equipped\n5)Show your stats"
          enc_decision = gets.to_i()
          if (enc_decision < 0 || enc_decision > 5)
            raise "Invalid option."
          end
           case (enc_decision)
           when 1
             adv.place().attack_mob(adv.champion.fight())
             player_turn = false
           when 2
             if (adv.champion().bag.length == 0)
              puts "\nYour bag is empty."
             else
                 puts "\nType id of the item to use or the gear to swap.(0 to cancel)"
                 adv.champion.show_bag_content()
                 it_id = -1
                 while (it_id > adv.champion.bag.length || it_id < 0)
                   it_id = gets.to_i()
                 end
                 if (it_id != 0)
                   if (adv.champion.bag.at(it_id-1).instance_of? Item)
                     adv.champion.use_item(it_id-1)
                   else
                     adv.champion.equip_gear(it_id-1)
                   end
                 end
             end
             when 3
               adv.champion.show_bag_content()
             when 4
               adv.champion.show_gear_equipped()
             when 5
               puts adv.champion
             else
               puts "\nInvalid option."
             end
        end
      rescue => exception
        puts exception
        retry
      end
      if (!adv.place().mob.is_dead())       
        puts "\n#{adv.place().mob.name} is attacking you...\n"
        adv.champion.hit(adv.place().mob_attacking())        
        player_turn = true
      else 
        if (adv.champion.bag.length == adv.champion.max_bag_place)
          puts "Your bag is full, You cannot loot the new stuff...\nYou earned #{adv.place().loot.gold} golds."
          adv.champion.money += adv.place().loot.gold
        else
          puts adv.place().loot
          adv.champion.money += adv.place().loot.gold
          adv.champion.add_to_bag(adv.place().loot.gear.dup())
        end
      end
    end    
    adv.position += 1      
    if (adv.position == 20) # After the Final boss, position is superior to the journey length and end the game
      adv.gameover = true
    end
  end
end

if (adv.champion.is_dead)
  puts "You died on your epic journey, but you'll have better luck next time."
else
  puts "You succeeded in your quest and are now a respected and powerful Hero."
end

puts "Press any key to close the Console..."

gets.chomp()