# classes/skirmisher/boomerang_start.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Creates spinning feather item display for Skirmisher Boomerang
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if holding the Dancing Rapier, and 0 otherwise. 
#				Used to track which weapon is equipped to not reset their current positions when inventory refreshes.
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:feather",Count:1b},Tags:["t_boomerang_itemdisp_init"],Rotation:[0.0f,90.0f]}
execute as @e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init] run function coinwars:util/pe_eid_acquire
scoreboard players operation @e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init] eid_owner = @s eid_self

#tellraw @a[tag=t_debug] [{"text":"my eid_self "},{"score":{"name":"@s","objective":"eid_self"}},{"text":" disp eid_owner "},{"score":{"name":"@e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init]","objective":"eid_owner"}}]

tag @e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init] add t_boomerang_itemdisp
tag @e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init] remove t_boomerang_itemdisp_init
