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
item replace entity @s armor.head with minecraft:leather_helmet{Unbreakable:1b,display:{color:11842740}}
item replace entity @s armor.chest with minecraft:chainmail_chestplate{Unbreakable:1b,display:{color:2665010}}
item replace entity @s armor.legs with minecraft:chainmail_leggings{Unbreakable:1b,display:{color:2665010}}
item replace entity @s armor.feet with minecraft:leather_boots{Unbreakable:1b,display:{color:11842740},AttributeModifiers:[\
{AttributeName:"generic.movement_speed",Name:"speed_bonus",Slot:"feet",Operation:1,Amount:0.2,UUID:[I; 4,14,1,0]},\
{AttributeName:"generic.armor",Name:"boots_armor",Slot:"feet",Operation:0,Amount:1,UUID:[I; 4,14,2,0]}]}

# =============================
# Hotbar

# Infinibow
item replace entity @s hotbar.0 with minecraft:bow{Unbreakable:1b,display:{Name:"{\"italic\":false,\"color\":\"red\",\"text\":\"Infinibow\"}"},\
Enchantments:[{id:"minecraft:infinity",lvl:1}]}
item replace entity @s hotbar.1 with minecraft:arrow
