require "Formulas.rb"
require "Entity.rb"

#Key is name of the mob and values an array describing base hp, str and lck
$list_forest_mobs_attr = [
   ["Wolf",15,3,0,5],
   ["Boar",17,4,0,0],
   ["Bear",22,12,0,0],
   ["Flesh eating plant",10,5,4,2],
   ["Forest bandit",18,18,1,3],
   ["Cursed Treant",32,12,15,0],
   ["Giant termite",13,7,0,0],
   ["Rabid rodent",15,8,0,0],
   ["Fierce Raven",13,6,4,1],
   ["Evil Fairy",8,8,30,100]
]

$list_cave_mobs_attr = [
  ["Bat"],
  ["Sly Goblin"],
  ["Spider"],
  ["Stone Elemental"],
  ["Slime"],
  ["Minor"],
  ["Cave Bear"],
  ["Drooling Troll"],
  ["Shrooman"],
  ["Wicked Fairy"]
]

$list_dungeon_mobs_attr = [
  ["Dusty Skeleton"],
  ["Elegant Vampire"],
  ["Golem"],
  ["Stinky Undead"],
  ["Living Armor"],
  ["Sad Ghost"],
  ["Fake-Chest"],
  ["Automaton"],
  ["Gargoyle"],
  ["Bewitching Medusa"]
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
      rand_spawn = rand(11)
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

mtest = Mob.new("Forest")
puts mtest
puts "#{mtest.fight()} damage(s)"