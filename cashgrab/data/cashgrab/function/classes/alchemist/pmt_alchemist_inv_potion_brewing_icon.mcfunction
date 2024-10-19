# classes/alchemist/potion_brewing_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
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
#	101-200	= crafting Trinket
#		101	= (step 1 icon)
#		121	= (step 2 icon)
#		141	= (step 3 icon)
#		161	= (step 4 icon)
#		181	= (step 5 icon)
#		200	= award potion

#	0		= idle
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches ..0 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:cauldron[\
minecraft:item_name="[{\"color\":\"green\",\"italic\":false,\"text\":\"[Crouch]\"},{\"color\":\"white\",\"text\":\" Brew Potions\"}]",\
minecraft:lore=[\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Brews potions while crouching\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" in the following order with the\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" listed time required:\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"Caustic Fume\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" (2.5 sec)\"}]",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"Booster Brew\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" (2.5 sec)\"}]",\
"[{\"color\":\"green\",\"italic\":false,\"text\":\"Your Trinket\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" (5 sec)\"}]"\
]] 1

#	1-50	= brewing Caustic Brew
#		1	= (step 1 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 1..15 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:poisonous_potato[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Caustic Brew...\"}",\
] 1

#		16	= (step 2 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 16..31 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:turtle_scute[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Caustic Brew...\"}",\
] 2

#		32	= (step 3 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 32..49 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:lime_dye[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Caustic Brew...\"}",\
] 3

#	51-100	= brewing Booster Brew
#		51	= (step 1 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 51..65 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:honeycomb[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Booster Brew...\"}",\
] 1

#		66	= (step 2 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 66..81 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:orange_dye[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Booster Brew...\"}",\
] 2

#		82	= (step 3 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 82..99 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:glowstone_dust[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Brewing Booster Brew...\"}",\
] 3

#	101-200	= brewing Booster Brew
#		101	= (step 1 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 101..120 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:quartz[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 1

#		121	= (step 2 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 121..140 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:phantom_membrane[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 2

#		141	= (step 3 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 141..160 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:white_dye[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 3

#		161	= (step 4 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 161..180 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:bone_meal[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 4

#		181	= (step 5 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 181..200 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:sugar[\
minecraft:item_name="{\"color\":\"green\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 5
