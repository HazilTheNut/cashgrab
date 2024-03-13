# classes/griefer/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 1
#
# Summary: Populates inventory for the Griefer class based on their current state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @s armor.head with minecraft:golden_helmet{Unbreakable:1b}
item replace entity @s armor.chest with minecraft:leather_chestplate{Unbreakable:1b,display:{color:16490297}}
item replace entity @s armor.legs with minecraft:leather_leggings{Unbreakable:1b,display:{color:16490297}}
item replace entity @s armor.feet with minecraft:golden_boots{Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"speed_bonus",Slot:"feet",Operation:1,Amount:0.2,UUID:[I; 1,10,1,0]}]}

# =============================
# Hotbar

# Flame Staff
item replace entity @s hotbar.0 with minecraft:blaze_rod{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Flame Staff\"}"},\
AttributeModifiers:[\
{AttributeName:"generic.attack_damage",Name:"flame_staff_atkdmg",Slot:"mainhand",Operation:0,Amount:4,UUID:[I; 1,1,1,0]},\
{AttributeName:"generic.attack_speed",Name:"flame_staff_atkspd",Slot:"mainhand",Operation:0,Amount:-2,UUID:[I; 1,1,2,0]}],\
Enchantments:[{id:"minecraft:fire_aspect",lvl:1}]}

# Creeper in a Bottle
function coinwars:classes/griefer/creeper_ability_icon
