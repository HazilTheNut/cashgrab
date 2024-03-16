# classes/ranger/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = 4
#	at: the entity
#
# Summary: Uses Craft Arrows ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Arrow count
#	cv_F	:	Crossbow state (0 = no arrow loaded, 1 = arrow loaded)
#	cv_G	:	
#	cv_H	:	

scoreboard players set @s cv_E 3
scoreboard players set @s cv_F 1

playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 1.0 1.5

function coinwars:base/pe_refresh_inv
