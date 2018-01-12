require "Adventure.rb"

tadv = Adventure.new()

for i in (0...tadv.journey.length())
  if (tadv.journey().at(i).instance_of? Shop)
    puts "It's a Shop"
  else
    puts "It's an Encounter"
  end
end