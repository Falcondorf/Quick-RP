require "Adventure.rb"

adv = Adventure.new()

while (!adv.gameover && !adv.champion.is_dead) #Loop control end game
  if (adv.place().instance_of? Shop) #check if Shop or encounter
    in_shop = true
    puts "You arrived in a shop, many goods are in sale and you can sell your stuff here for golds."
    while (in_shop) #Loop control in shop
      puts "Choose an option: \n1)Display goods\n2)Buy\n3)Sell\n4)Inventory\n5)Exit shop"
      opt = gets.to_i()
      case (opt)
      when 1 #Displaying Shop
        puts adv.place()
      when 2 #Buying stuff to the shop
        if (adv.champion.bag.length == adv.champion.max_bag_place) #Check bag isn't full
          puts "You can't buy anything, your bag is full. Try selling stuff first."
        else
          buying = true
          while (buying)
            puts "You have #{adv.champion.money} golds to spend."
            puts "Want to buy Item(1) or Gear(2) -- 0 to stop buying?"
            buy_opt = gets.to_i()
            case (buy_opt)
            when 0 #Exit buying
              buying = false
            when 1 #Manage Items buying
              puts adv.place().show_items
              begin
                puts "What's the id of the item?"
                id_it = gets.to_i() - 1
                if (id_it > adv.place().items.length-1 || id_it < 0) #Check user input available and correct
                  raise "Wrong ID."
                elsif (adv.place().items.length == 0)
                  puts "All items sold."
                else
                  if (adv.champion.money >= adv.place().items.at(id_it).value)
                     item = adv.place().sell("Item", id_it)
                     adv.champion.add_to_bag(item)
                     adv.champion.money -= item.value
                  else
                    puts "You don't have enough money"
                  end                
                end
              rescue => exception
                puts exception
                retry
              end
            when 2 #Manage Gears buying
                puts adv.place().show_gears
                begin
                  puts "What's the id of the gear?"
                  id_gr = gets.to_i() - 1
                  if (id_gr > adv.place().gears.length - 1 || id_gr < 0)
                    raise "Wrong ID."
                  elsif (adv.place().gears.length == 0)
                    puts "All items sold."
                  else
                    if (adv.champion.money >= adv.place().gears.at(id_gr).value)
                       item = adv.place().sell("Gear", id_gr)
                       adv.champion.add_to_bag(item)
                       adv.champion.money -= item.value
                    else
                      puts "You don't have enough money"
                    end    
                  end
                rescue => exception
                  puts exception
                  retry
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
            puts "You have nothing to sell."
            selling = false
          else
            begin
              adv.champion.show_bag_content()
              puts "What's the id of the item to sell? (0 to stop selling)\nYou will gain 2/3 of the item's worth."
              bag_id = gets.to_i()
              if (bag_id == 0)
                selling = false
              elsif (bag_id < 0 || bag_id > adv.champion.bag.length)
                raise "Wrong ID."
              else
                credit = adv.place().buy(adv.champion.bag.at(bag_id-1).value)              
                adv.champion.money += credit
                adv.champion.throw_away(bag_id-1)
                puts "You gained #{credit} gold(s) and now have #{adv.champion.money} gold(s)."
              end
            rescue => exception
              puts exception
            end
          end
        end 
      when 4
        puts "Inventory"       
      when 5
        puts "Leave"
        in_shop = false
        adv.position += 1
      else
        puts "Invalid option"
      end
    end
  else
    puts "Encounter in #{adv.place()}"
    adv.position += 1
    if (adv.position == 20) # After the Final boss, position is superior to the journey length and end the game
      adv.gameover = true
      puts "Game finished"
    end
  end
end