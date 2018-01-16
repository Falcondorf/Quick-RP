require_relative "./Entity.rb"

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
  ["Bat",30,8,0,20,15],
  ["Sly Goblin",38,13,7,13,7],
  ["Spider",28,10,0,10,5],
  ["Stone Elemental",70,28,0,1,1],
  ["Slime",80,1,0,25,0],
  ["Miner",46,17,5,20,13],
  ["Cave Bear",40,22,0,0,5],
  ["Drooling Troll",50,27,0,0,1],
  ["Shrooman",45,15,5,10,14],
  ["Wicked Fairy",27,9,30,100,35]
]

$list_dungeon_mobs_attr = [
  ["Dusty Skeleton",40,13,0,40,3],
  ["Elegant Vampire",58,18,58,20,18],
  ["Golem",95,35,0,1,1],
  ["Stinky Undead",42,17,0,5,3],
  ["Living Armor",50,30,30,5,0],
  ["Sad Ghost",1,1,70,0,85],
  ["Fake-Chest",40,25,0,15,5],
  ["Automaton",38,17,30,35,5],
  ["Gargoyle",50,30,30,5,2],
  ["Bewitching Gorgon",40,12,38,10,10]
]

$list_city_mobs_attr = [
  ["Thief",40,22,15,40,50],
  ["Harlequin",55,32,5,10,10],
  ["Corrupted Guard",85,45,4,20,10],
  ["Stray Dog",35,30,2,15,60],
  ["Giant Sewer Rat",72,40,5,10,5],
  ["Drunken",10,3,0,65,70],
  ["Assassin",50,44,40,75,55],
  ["Giant Slug",130,12,2,0,0],
  ["Crazy Chemist",48,20,85,42,12],
  ["Failed Experiment",110,37,0,0,0]
]

$list_Bosses_attr = [
  ["Takuma The Crazy Samourai",180,35,15,20,35],
  ["Thousand Heads Hydra",140,24,5,10,30],
  ["Fairy Empress",95,27,100,85,24],
  ["Your Ex",100,28,0,40,10],
  ["Bernard The Explorer",150,20,50,30,60],
  ["Don Tonto Del Grifo",150,41,5,5,25],
  ["Henry The Inquisitor",120,25,37,35,30],
  ["Tri-Golem",250,15,0,0,0],
  ["Razuum The Eldest Drake",300,20,67,15,40],
  ["Ghuz'loran Moon Creature",160,39,50,20,55]
]

class Mob < Entity
  
    def initialize (location)
      self.is_dead = false
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
      when "Boss"
        self.name=($list_Bosses_attr[rand_spawn][0])
        self.hp=($list_Bosses_attr[rand_spawn][1])
        self.str=($list_Bosses_attr[rand_spawn][2])
        self.int=($list_Bosses_attr[rand_spawn][3])
        self.lck=($list_Bosses_attr[rand_spawn][4])
        self.dxt=($list_Bosses_attr[rand_spawn][5])
      when "Final Boss"
        self.name="Hastzora"
        self.hp=1200
        self.str=40
        self.int=50
        self.lck=40
        self.dxt=45
      else 
        raise "Unknown location"
      end
    end
    
    def to_s
      "Name:#{self.name}\nHP:#{self.hp}\nStrenght:#{self.str}\nIntelligence:#{self.int}\nLuck:#{self.lck}\nDexterity:#{self.dxt}"
    end
end

=begin
mtest = Mob.new("Dungeon")
puts mtest
puts "#{mtest.fight()} damage(s)"
=end