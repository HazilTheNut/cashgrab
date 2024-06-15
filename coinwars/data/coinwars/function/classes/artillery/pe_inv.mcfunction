# classes/artillery/pe_inv.mcfunction
#
# Context:
#	as: an entity with class = 5
#
# Summary: Populates inventory for the Artillery class for the command executor
#
# Arguments: (none)

#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# =============================
# Armor
item replace entity @s armor.head with minecraft:leather_helmet[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:dyed_color=11842740]
item replace entity @s armor.chest with minecraft:chainmail_chestplate[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.legs with minecraft:chainmail_leggings[minecraft:unbreakable={show_in_tooltop:false}]
item replace entity @s armor.feet with minecraft:leather_boots[minecraft:unbreakable={show_in_tooltip:false},\
minecraft:dyed_color=11842740,\
minecraft:attribute_modifiers=[\
{type:"generic.movement_speed",slot:"feet",id:"coinwars:speed_bonus",amount:0.2,operation:"add_multiplied_base"},\
{type:"generic.armor",slot:"feet",id:"coinwars:boots_armor",amount:1,operation:"add_value"}\
]]

# =============================
# Hotbar

# Infinibow
item replace entity @s hotbar.0 with minecraft:bow[minecraft:unbreakable={show_in_tooltop:false},\
minecraft:item_name="{\"italic\":false,\"color\":\"red\",\"text\":\"Infinibow\"}",\
minecraft:enchantments={levels:{infinity:1}}]

item replace entity @s hotbar.1 with minecraft:arrow
