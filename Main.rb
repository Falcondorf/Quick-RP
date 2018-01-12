require "Adventure.rb"

adv = Adventure.new()

while (!adv.gameover && !adv.champion.is_dead) #Loop control end game
  if (adv.journey.at(adv.position).instance_of? Shop) #check if Shop or encounter
    in_shop = true
    puts "You arrived in a shop, many goods are in sale and you can sell your stuff here for golds."
    while (in_shop) #Loop control in shop
      puts "Choose an option: \n1)Display goods\n2)Buy\n3)Sell\n4)Exit shop"
      opt = gets.to_i()
      case (opt)
      when 1 #Displaying Shop
        puts adv.journey.at(adv.position)
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
            when 0
              buying = false
            when 1
              begin
                puts "What's the id of the item?"
                id_it = gets.to_i() - 1
                if (id_it > adv.journey.at(adv.position).items.length-1 || id_it < 0) #Check user input available and correct
                  raise "Wrong ID."
                elsif (adv.journey.at(adv.position).items.length == 0)
                  puts "All items sold."
                else
                  if (adv.champion.money > adv.journey.at(adv.position).items.at(id_it).value)
                     item = adv.journey.at(adv.position).sell("Item", id_it)
                     adv.champion.add_to_bag(item)
                     adv.champion.money -= item.value
                  else
                    puts "You don't have enough money"
                  end                
                end
              rescue => exception
                puts "Debug rescue: #{exception}"
                retry
              end
            when 2
                puts "buy gear"
            else
                puts "Invalid option"
            end             
          end
        end
      when 3
        puts "Selling"
      when 4
        puts "Leave"
        in_shop = false
        adv.position += 1
      else
        puts "Invalid option"
      end
    end
  else
    puts "Encounter"
    adv.position += 1
    if (adv.position == 20) # After the Final boss, position is superior to the journey length and end the game
      adv.gameover = true
      puts "Game finished"
    end
  end
end