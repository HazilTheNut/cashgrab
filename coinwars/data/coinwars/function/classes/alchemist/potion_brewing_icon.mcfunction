# classes/alchemist/potion_brewing_icon.mcfunction
#
# Context:
#	as: an entity with class = 9
#	at: the entity
#
# Summary: Updates potion brewing display item based on cv_C (potion brewing timer)
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

# Each potion takes 3 seconds to brew which defines these ranges for cv_C:
#	0		= idle
#	1-50	= brewing Caustic Brew
#		1	= (step 1 icon)
#		16	= (step 2 icon)
#		32	= (step 3 icon)
#		50	= award potion
#	51-100	= brewing Booster Brew
#		51	= (step 1 icon)
#		66	= (step 2 icon)
#		82	= (step 3 icon)
#		100	= award potion

#	0		= idle
execute if score @s cv_C matches ..0 run item replace entity @s hotbar.5 with minecraft:cauldron[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Crouch]\"},{\"color\":\"white\",\"text\":\" Brew Potions\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Brews potions while crouching.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Each potion requires 2.5 seconds:\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\" Caustic Brew\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" first, then\"}]",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\" Booster Brew\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" second\"}]"\
]] 1

#	1-50	= brewing Caustic Brew
#		1	= (step 1 icon)
execute if score @s cv_C matches 1..15 run item replace entity @s hotbar.5 with minecraft:poisonous_potato[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Caustic Brew...\"}",\
] 1

#		16	= (step 2 icon)
execute if score @s cv_C matches 16..31 run item replace entity @s hotbar.5 with minecraft:turtle_scute[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Caustic Brew...\"}",\
] 2

#		32	= (step 3 icon)
execute if score @s cv_C matches 32..49 run item replace entity @s hotbar.5 with minecraft:lime_dye[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Caustic Brew...\"}",\
] 3

#	51-100	= brewing Booster Brew
#		51	= (step 1 icon)
execute if score @s cv_C matches 51..65 run item replace entity @s hotbar.5 with minecraft:nether_wart[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Booster Brew...\"}",\
] 1

#		66	= (step 2 icon)
execute if score @s cv_C matches 66..81 run item replace entity @s hotbar.5 with minecraft:red_dye[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Booster Brew...\"}",\
] 2

#		82	= (step 3 icon)
execute if score @s cv_C matches 82..99 run item replace entity @s hotbar.5 with minecraft:pink_dye[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Booster Brew...\"}",\
] 3

