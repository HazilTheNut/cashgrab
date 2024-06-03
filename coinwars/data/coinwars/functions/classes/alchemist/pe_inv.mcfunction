# classes/alchemist/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 9
#
# Summary: Populates inventory for the Alchemist class for the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @s armor.head with minecraft:leather_helmet[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=9516260]
item replace entity @s armor.chest with minecraft:leather_chestplate[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=9516260]
item replace entity @s armor.legs with minecraft:leather_leggings[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=9516260]
item replace entity @s armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=9516260,\
minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",uuid:[I; 9,14,1,0],name:"speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",uuid:[I; 9,14,2,0],name:"boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar

# Magicite Shiv
item replace entity @s hotbar.0 with minecraft:amethyst_shard[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:enchantment_glint_override=true,\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Magicite Shiv\"}",\
minecraft:attribute_modifiers=[\
{type:"generic.attack_damage",slot:"mainhand",uuid:[I; 9,1,1,0],name:"magiciteshiv_atkdmg",amount:4,operation:"add_value"},\
{type:"generic.attack_speed",slot:"mainhand",uuid:[I; 9,1,2,0],name:"magiciteshiv_atkspd",amount:-2,operation:"add_value"}]]

# Potions

