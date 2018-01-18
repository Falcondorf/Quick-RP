# Quick-RP
A mini RPG game in ruby

## Requirement
~~As this game is in Ruby, you will need to install the Ruby interpreter.~~
[Click here to download Ruby installer for Windows](https://github.com/oneclick/rubyinstaller2/releases/download/rubyinstaller-2.5.0-1/rubyinstaller-2.5.0-1-x86.exe)

You no longer need the interpreter and all. A compiled version is available now.
[Click here to download the exe](https://github.com/Falcondorf/Quick-RP/raw/master/Quick-RP.exe)
## Manual
You are about to play a very simple RPG. Every adventure is unique as a lot of variables are set randomly.
Everytime you move forward you will either find a shop where you can buy and sell stuff or just manage your inventory and you will fight dangerous enemies each with their unique stats.
You as well as the monsters have different stats:
- HP: The health you have (you can heal it or take damage, at zero it's death) 
- STR: The strenght of your attack (This is the basic damage you deal)
- INT: The intelligence wich gives you magic power (Not yet implemented)
- LCK: Your luck to make critical hits
- DXT: The dexterity you dodge your opponent attacks

When you arrive at the 20th position, you'll fight Hastzora. This is the final and most dangerous Boss of the game. Prepare yourself well for this encounter, defeat enemies to loot golds and gears to equip and use the shops to upgrade your champions.

## Shop
Everytime you get in a shop, you will have the possibility to buy Items and Gears. The more you advance in the game and the rarer they will be. You can also decide to sell the stuff you don't need for some golds. Finally you can manage your stuff by showing your bag and the gear you are equipped but also use items or swap gears.
Gears will add stats to your champion or you can use these items:
- Health potion: Will heal you of 10[Basic] - 50[Rare] -100[Epic] HP.
- Bag-slots: Add 1[Basic] - 5[Rare] - 10[Epic] slots to your bag to carry more stuff
- Instant poison: **Not yet implemented**
- Elixirs: They will show as the name of a stat with "+" following. (ex: str+ add 1 point of Strenght / lck++ add 5 points of Luck / hps+++ add 10 points to you max HP). This increase a stat permanently.

## Battle
Everytime a battle start, you take a rest that will heal you 25HP before the fight (100HP before a Boss). When it's your turn, you can do unlimited moves until you attack. You can use as much items as you want, swap all your gears, watch your bag content and stats before attacking. 
After you attack an enemy, they will also counter attack immediatly after you.