require "Entity.rb"

#Key is name of the mob and values an array describing base hp, str and lck
$list_forest_mobs_attr = [
   ["Wolf",30,6,0,18],
   ["Boar",34,8,0,0],
   ["Bear",44,20,0,0],
   ["Flesh eating plant",20,15,4,10],
   ["Forest bandit",36,18,1,15],
   ["Cursed Treant",54,24,15,0],
   ["Giant termite",26,14,0,0],
   ["Rabid rodent",30,16,0,0],
   ["Fierce Raven",26,12,4,20],
   ["Evil Fairy",16,8,30,100]
]

$list_cave_mobs_attr = [
  ["Bat",20,8,0,20],
  ["Sly Goblin",28,13,7,13],
  ["Spider",18,10,0,10],
  ["Stone Elemental",60,28,0,1],
  ["Slime",80,1,0,25],
  ["Miner",36,17,5,20],
  ["Cave Bear",30,22,0,0],
  ["Drooling Troll",40,27,0,0],
  ["Shrooman",30,15,5,10],
  ["Wicked Fairy",17,9,30,100]
]

$list_dungeon_mobs_attr = [
  ["Dusty Skeleton",20,13,0,40],
  ["Elegant Vampire",38,18,58,20],
  ["Golem",75,35,0,1],
  ["Stinky Undead",22,17,0,5],
  ["Living Armor",30,30,30,5],
  ["Sad Ghost",1,1,70,0],
  ["Fake-Chest",20,25,0,15],
  ["Automaton",18,17,30,35],
  ["Gargoyle",30,30,30,5],
  ["Bewitching Medusa",20,12,38,10]
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
      when "Cave"
        self.name=($list_cave_mobs_attr[rand_spawn][0])
        self.hp=($list_cave_mobs_attr[rand_spawn][1])
        self.str=($list_cave_mobs_attr[rand_spawn][2])
        self.int=($list_cave_mobs_attr[rand_spawn][3])
        self.lck=($list_cave_mobs_attr[rand_spawn][4])
      when "Dungeon"
        self.name=($list_dungeon_mobs_attr[rand_spawn][0])
        self.hp=($list_dungeon_mobs_attr[rand_spawn][1])
        self.str=($list_dungeon_mobs_attr[rand_spawn][2])
        self.int=($list_dungeon_mobs_attr[rand_spawn][3])
        self.lck=($list_dungeon_mobs_attr[rand_spawn][4])
      when "City"
        self.name=($list_city_mobs_attr[rand_spawn][0])
        self.hp=($list_city_mobs_attr[rand_spawn][1])
        self.str=($list_city_mobs_attr[rand_spawn][2])
        self.int=($list_city_mobs_attr[rand_spawn][3])
        self.lck=($list_city_mobs_attr[rand_spawn][4])
      else 
        raise "Unknown location"
      end
    end
    
    def to_s
      "Name:#{self.name}\nHP:#{self.hp}\nStrenght:#{self.str}\nIntelligence:#{self.int}\nLuck:#{self.lck}"
    end
end

mtest = Mob.new("Dungeon")
puts mtest
puts "#{mtest.fight()} damage(s)"