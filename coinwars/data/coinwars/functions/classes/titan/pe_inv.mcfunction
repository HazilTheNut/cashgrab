# classes/titan/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 8
#
# Summary: Populates inventory for the Titan class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @s armor.head with minecraft:iron_helmet[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.chest with minecraft:iron_chestplate[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.legs with minecraft:iron_leggings[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.feet with minecraft:iron_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",uuid:[I; 8,14,1,0],name:"speed_bonus",amount:0.15,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",uuid:[I; 8,14,2,0],name:"boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar

# Giant Hammer
item replace entity @s hotbar.0 with minecraft:iron_axe[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Giant Hammer\"}",\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",uuid:[I; 8,1,1,0],name:"giant_hammer_atkdmg",amount:9,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",uuid:[I; 8,1,2,0],name:"giant_hammer_atkspd",amount:-3,operation:"add_value"}]]
