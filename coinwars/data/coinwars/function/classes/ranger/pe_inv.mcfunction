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
#	cv_F	:	Crossbow state (b'XY, where X is if in hotbar and Y is if arrow loaded)
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @s armor.head with minecraft:leather_helmet[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=2665010]
item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=2665010]
item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=2665010]
item replace entity @s armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},minecraft:dyed_color=2665010,minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",id:"coinwars:speed_bonus",amount:0.3,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",id:"coinwars:boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar

# Machete
item replace entity @s hotbar.0 with minecraft:stone_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Machete\"}",\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",id:"coinwars:spectral_blade_atkdmg",amount:7,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",id:"coinwars:spectral_blade_atkspd",amount:-2,operation:"add_value"}]]

# Crossbow
item replace entity @s[scores={cv_F=0}] weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Hunting Bow\"}"]
item replace entity @s[scores={cv_F=1}] weapon.offhand with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Hunting Bow\"}",\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1}]]
item replace entity @s[scores={cv_F=2}] hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Hunting Bow\"}"]
item replace entity @s[scores={cv_F=3}] hotbar.1 with minecraft:crossbow[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Hunting Bow\"}",\
minecraft:charged_projectiles=[{id:"minecraft:arrow",count:1}]]

# Arrows
clear @s minecraft:arrow
item replace entity @s[scores={cv_E=1}] hotbar.3 with minecraft:arrow 1
item replace entity @s[scores={cv_E=2}] hotbar.3 with minecraft:arrow 2
item replace entity @s[scores={cv_E=3}] hotbar.3 with minecraft:arrow 3

# Climbing Energy
execute store result storage coinwwars:ranger_args data.count int 1 run scoreboard players get @s cv_B
function coinwars:classes/ranger/pe_display_climbing_energy with storage coinwwars:ranger_args data
