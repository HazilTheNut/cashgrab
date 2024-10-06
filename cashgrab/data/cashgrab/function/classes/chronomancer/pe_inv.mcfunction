# classes/chronomancer/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 10
#
# Summary: Populates inventory for the Chronomancer class for the command executor
#
# Arguments: (none)

#	cv_A	:	1 if crossbow is in offhand, and 0 otherwise
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @s armor.head with minecraft:diamond_helmet[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=10840833]
item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=10840833]
item replace entity @s armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=10840833,\
minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",id:"coinwars:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",id:"coinwars:boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar

# Time-Worn Splinter
item replace entity @s hotbar.0 with minecraft:stone_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Time-Worn Splinter\"}",\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",id:"coinwars:timeworn_atkdmg",amount:5,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",id:"coinwars:timeworn_atkspd",amount:-2,operation:"add_value"}]]

# Automechanical Crossbow
function coinwars:classes/chronomancer/update_crossbow
