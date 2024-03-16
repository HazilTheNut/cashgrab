# classes/ranger/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 4
#
# Summary: Populates inventory for the Ranger class based on their current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Arrow count
#	cv_F	:	Crossbow state (0 = no arrow loaded, 1 = arrow loaded)
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @s armor.head with minecraft:leather_helmet{Unbreakable:1b,display:{color:2665010}}
item replace entity @s armor.chest with minecraft:leather_chestplate{Unbreakable:1b,display:{color:2665010}}
item replace entity @s armor.legs with minecraft:leather_leggings{Unbreakable:1b,display:{color:2665010}}
item replace entity @s armor.feet with minecraft:leather_boots{Unbreakable:1b,display:{color:2665010},AttributeModifiers:[\
{AttributeName:"generic.movement_speed",Name:"speed_bonus",Slot:"feet",Operation:1,Amount:0.3,UUID:[I; 4,14,1,0]},\
{AttributeName:"generic.armor",Name:"boots_armor",Slot:"feet",Operation:0,Amount:1,UUID:[I; 4,14,2,0]}]}

# =============================
# Hotbar

# Machete
item replace entity @s hotbar.0 with minecraft:stone_sword{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Machete\"}"},\
AttributeModifiers:[\
{AttributeName:"generic.attack_damage",Name:"machete_atkdmg",Slot:"mainhand",Operation:0,Amount:5,UUID:[I; 4,1,1,0]},\
{AttributeName:"generic.attack_speed",Name:"machete_atkspd",Slot:"mainhand",Operation:0,Amount:-2,UUID:[I; 4,1,2,0]}]}

# Crossbow
item replace entity @s[scores={cv_F=0}] weapon.offhand with minecraft:crossbow{\
Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Hunting Bow\"}"}}
item replace entity @s[scores={cv_F=1..}] weapon.offhand with minecraft:crossbow{\
Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Hunting Bow\"}"},ChargedProjectiles:[{id:"minecraft:arrow",Count:1b}],Charged:1b}

# Arrows
clear @s minecraft:arrow
item replace entity @s[scores={cv_E=1}] hotbar.3 with minecraft:arrow 1
item replace entity @s[scores={cv_E=2}] hotbar.3 with minecraft:arrow 2
item replace entity @s[scores={cv_E=3}] hotbar.3 with minecraft:arrow 3

# Climbing Energy
execute store result storage coinwwars:ranger_args data.count int 1 run scoreboard players get @s cv_B
function coinwars:classes/ranger/pe_display_climbing_energy with storage coinwwars:ranger_args data
