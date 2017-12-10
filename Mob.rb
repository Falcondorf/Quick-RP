require "Entity.rb"

#Key is name of the mob and values an array describing base hp, str and lck
$list_forest_mobs_attr = [
   ["Wolf",30,6,0,18,10],
   ["Boar",34,8,0,0,5],
   ["Bear",44,20,0,0,5],
   ["Flesh eating plant",20,15,4,10,7],
   ["Forest bandit",36,18,1,15,15],
   ["Cursed Treant",54,24,15,0,1],
   ["Giant termite",26,14,0,0,3],
   ["Rabid rodent",30,16,0,0,10],
   ["Fierce Raven",26,12,4,20,10],
   ["Evil Fairy",16,8,30,100,35]
]

$list_cave_mobs_attr = [
  ["Bat",20,8,0,20,15],
  ["Sly Goblin",28,13,7,13,7],
  ["Spider",18,10,0,10,5],
  ["Stone Elemental",60,28,0,1,1],
  ["Slime",80,1,0,25,0],
  ["Miner",36,17,5,20,13],
  ["Cave Bear",30,22,0,0,5],
  ["Drooling Troll",40,27,0,0,1],
  ["Shrooman",30,15,5,10,14],
  ["Wicked Fairy",17,9,30,100,35]
]

$list_dungeon_mobs_attr = [
  ["Dusty Skeleton",20,13,0,40,3],
  ["Elegant Vampire",38,18,58,20,18],
  ["Golem",75,35,0,1,1],
  ["Stinky Undead",22,17,0,5,3],
  ["Living Armor",30,30,30,5,0],
  ["Sad Ghost",1,1,70,0,99],
  ["Fake-Chest",20,25,0,15,5],
  ["Automaton",18,17,30,35,5],
  ["Gargoyle",30,30,30,5,2],
  ["Bewitching Medusa",20,12,38,10,10]
]

$list_city_mobs_attr = [
  ["Thief"],
  ["Harlequin"],
  ["Corrupted Guard"],
  ["Stray Dog"],
  ["Giant Sewer Rat"],
  ["Drunken"],
  ["Assassin"],
  ["Giant Slug"],
  ["Crazy Chemist"],
  ["Failed Experiment"]
]

$list_Bosses_attr = [
  
]

class Mob < Entity    
  attr_accessor :name
  
    def initialize (location)
      rand_spawn = rand(10)
      case (location)
      when "Forest"
        self.name=($list_forest_mobs_attr[rand_spawn][0])
        self.hp=($list_forest_mobs_attr[rand_spawn][1])
        self.str=($list_forest_mobs_attr[rand_spawn][2])
        self.int=($list_forest_mobs_attr[rand_spawn][3])
        self.lck=($list_forest_mobs_attr[rand_spawn][4])
        self.dxt=($list_forest_mobs_attr[rand_spawn][5])
      when "Cave"
        self.name=($list_cave_mobs_attr[rand_spawn][0])
        self.hp=($list_cave_mobs_attr[rand_spawn][1])
        self.str=($list_cave_mobs_attr[rand_spawn][2])
        self.int=($list_cave_mobs_attr[rand_spawn][3])
        self.lck=($list_cave_mobs_attr[rand_spawn][4])
        self.dxt=($list_cave_mobs_attr[rand_spawn][5])
      when "Dungeon"
        self.name=($list_dungeon_mobs_attr[rand_spawn][0])
        self.hp=($list_dungeon_mobs_attr[rand_spawn][1])
        self.str=($list_dungeon_mobs_attr[rand_spawn][2])
        self.int=($list_dungeon_mobs_attr[rand_spawn][3])
        self.lck=($list_dungeon_mobs_attr[rand_spawn][4])
        self.dxt=($list_dungeon_mobs_attr[rand_spawn][5])
      when "City"
        self.name=($list_city_mobs_attr[rand_spawn][0])
        self.hp=($list_city_mobs_attr[rand_spawn][1])
        self.str=($list_city_mobs_attr[rand_spawn][2])
        self.int=($list_city_mobs_attr[rand_spawn][3])
        self.lck=($list_city_mobs_attr[rand_spawn][4])
        self.dxt=($list_city_mobs_attr[rand_spawn][5])
      else 
        raise "Unknown location"
      end
    end
    
    def to_s
      "Name:#{self.name}\nHP:#{self.hp}\nStrenght:#{self.str}\nIntelligence:#{self.int}\nLuck:#{self.lck}\nDexterity:#{self.dxt}"
    end
end

mtest = Mob.new("Dungeon")
puts mtest
puts "#{mtest.fight()} damage(s)"