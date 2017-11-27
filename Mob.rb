require "Formulas.rb"

#Key is name of the mob and values an array describing base hp, str and lck
$list_forest_mobs_attr = [
   ["Wolf",15,3,5],
   ["Boar",17,4,0],
   ["Bear",22,12,0],
   ["Flesh eating plant",10,5,2],
   ["Forest bandit",18,18,3],
   ["Cursed Treant",32,12,0],
   ["Giant termite",13,7,0],
   ["Rabid rodent",15,8,0],
   ["Fierce Raven",13,6,1],
   ["Evil Fairy",8,8,100]
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

class Mob
    attr_accessor :name, :hp, :str, :lck
    @crit = false
    
    def initialize (location)
      rand_spawn = rand(11)
      case (location)
      when "Forest"
        self.name=($list_forest_mobs_attr[rand_spawn][0])
        self.hp=($list_forest_mobs_attr[rand_spawn][1])
        self.str=($list_forest_mobs_attr[rand_spawn][2])
        self.lck=($list_forest_mobs_attr[rand_spawn][3])
      when "Cave"
        self.name=($list_cave_mobs_attr[rand_spawn][0])
        self.hp=($list_cave_mobs_attr[rand_spawn][1])
        self.str=($list_cave_mobs_attr[rand_spawn][2])
        self.lck=($list_cave_mobs_attr[rand_spawn][3])
      when "Dungeon"
        self.name=($list_dungeon_mobs_attr[rand_spawn][0])
        self.hp=($list_dungeon_mobs_attr[rand_spawn][1])
        self.str=($list_dungeon_mobs_attr[rand_spawn][2])
        self.lck=($list_dungeon_mobs_attr[rand_spawn][3])
      when "City"
        self.name=($list_city_mobs_attr[rand_spawn][0])
        self.hp=($list_city_mobs_attr[rand_spawn][1])
        self.str=($list_city_mobs_attr[rand_spawn][2])
        self.lck=($list_city_mobs_attr[rand_spawn][3])
      else 
        raise "Unknown location"
      end
    end
    
    def fight
      crit = calc_crit(self.lck)
      if (crit)
        puts "CRITICAL HIT !!!"
        crit = false
        return str*1.5
      else
        return str
      end
    end
    
    def hit (damage)
      self.hp -= damge
    end
    
    def to_s
      "Name:#{self.name}\nHP:#{self.hp}\nStrenght:#{self.str}\nLuck:#{self.lck}"
    end
end

mtest = Mob.new("Forest")
puts mtest
puts mtest.fight()