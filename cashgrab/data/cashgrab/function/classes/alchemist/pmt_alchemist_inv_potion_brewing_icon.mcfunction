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
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport, 2 = update display for teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	
#	cv_H	:	

# Each potion takes various amounts of time to brew which defines these ranges for cv_C:
#	0		= idle
#	1-40	= brewing Caustic Brew
#		1	= (step 1 icon)
#		14	= (step 2 icon)
#		27	= (step 3 icon)
#		40	= award potion
#	101-140	= brewing Booster Brew
#		101	= (step 1 icon)
#		114	= (step 2 icon)
#		127	= (step 3 icon)
#		140	= award potion
#	201-280	= crafting Trinket
#		201	= (step 1 icon)
#		216	= (step 2 icon)
#		232	= (step 3 icon)
#		248	= (step 4 icon)
#		264	= (step 5 icon)
#		280	= award potion

#	0		= idle
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches ..0 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:cauldron[\
minecraft:custom_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Crouch]\"},{\"color\":\"white\",\"text\":\" Brew Potions\"}]",\
minecraft:lore=[\
"{\"color\":\"dark_gray\",\"italic\":true,\"text\":\"Crouch holding any item to use.\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\"Crafts items while crouching\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" in the following order with the\"}",\
"{\"color\":\"gray\",\"italic\":false,\"text\":\" listed time required:\"}",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"Caustic Fume\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" (2 secs)\"}]",\
"[{\"color\":\"yellow\",\"italic\":false,\"text\":\"Booster Brew\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" (2 secs)\"}]",\
"[{\"color\":\"green\",\"italic\":false,\"text\":\"Your Trinket\"},{\"color\":\"gray\",\"italic\":false,\"text\":\" (4 secs)\"}]"\
]] 1

#	1-40	= brewing Caustic Brew
#		1	= (step 1 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 1..13 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:poisonous_potato[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Brewing Caustic Brew...\"}",\
] 1

#		14	= (step 2 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 14..26 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:turtle_scute[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Brewing Caustic Brew...\"}",\
] 2

#		27	= (step 3 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 27..39 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:lime_dye[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Brewing Caustic Brew...\"}",\
] 3

#	101-140	= brewing Booster Brew
#		101	= (step 1 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 101..113 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:honeycomb[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Brewing Booster Brew...\"}",\
] 1

#		114	= (step 2 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 114..126 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:orange_dye[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Brewing Booster Brew...\"}",\
] 2

#		127	= (step 3 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 127..139 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:glowstone_dust[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Brewing Booster Brew...\"}",\
] 3

#	201-280	= crafting Trinket
#		201	= (step 1 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 201..215 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:quartz[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 1

#		216	= (step 2 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 216..231 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:phantom_membrane[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 2

#		232	= (step 3 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 232..247 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:white_dye[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 3

#		248	= (step 4 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 248..263 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:bone_meal[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 4

#		264	= (step 5 icon)
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 264..279 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:sugar[\
minecraft:custom_name="{\"color\":\"light_purple\",\"italic\":false,\"text\":\"Crafting Trinket...\"}",\
] 5
