# classes/champion/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 6
#
# Summary: Populates inventory for the Champion class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @s armor.head with minecraft:golden_helmet[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.chest with minecraft:golden_chestplate[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.legs with minecraft:golden_leggings[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.feet with minecraft:golden_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",uuid:[I; 6,14,1,0],name:"speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",uuid:[I; 6,14,2,0],name:"boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar

# Duskpiercer
item replace entity @s hotbar.0 with minecraft:golden_sword[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Duskpiercer\"}",\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",uuid:[I; 6,1,1,0],name:"duskpiercer_atkdmg",amount:4,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",uuid:[I; 6,1,2,0],name:"duskpiercer_atkspd",amount:-2,operation:"add_value"}]]

# Bastion
item replace entity @s weapon.offhand with minecraft:shield[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Bastion\"}"]
