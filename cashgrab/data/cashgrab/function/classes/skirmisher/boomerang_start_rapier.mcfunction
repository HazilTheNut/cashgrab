# classes/skirmisher/boomerang_start_rapier.mcfunction
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
#	cv_A	:	Held item: 0 = neither sword, 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_B	:	Item config: 0 = has both, 1 = only Cleaving Cutlass, 2 = only Dancing Rapier
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Boomerang type: 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

scoreboard players set @s cv_E 2

# Generate item display entity
summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:golden_sword",Count:1b},Tags:["t_boomerang_itemdisp_init"],Rotation:[0.0f,90.0f],Enchantments:[{id:"minecraft:knockback",lvl:1}]}
execute as @e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init] run function cashgrab:util/npe_eid_acquire

# Set item display's owner to be this missile
scoreboard players operation @e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init] eid_owner = @s eid_self

#tellraw @a[tag=t_debug] [{"text":"my eid_self "},{"score":{"name":"@s","objective":"eid_self"}},{"text":" disp eid_owner "},{"score":{"name":"@e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init]","objective":"eid_owner"}}]

tag @e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init] add t_boomerang_itemdisp
tag @e[type=minecraft:item_display,tag=t_boomerang_itemdisp_init] remove t_boomerang_itemdisp_init
