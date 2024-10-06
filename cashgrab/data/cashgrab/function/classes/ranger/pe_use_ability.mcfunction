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
#	cv_F	:	Crossbow state (b'XY, where X is if in hotbar and Y is if arrow loaded)
#	cv_G	:	
#	cv_H	:	

scoreboard players set @s cv_E 3
execute if score @s cv_F matches 0 run scoreboard players set @s cv_F 1
execute if score @s cv_F matches 2 run scoreboard players set @s cv_F 3

playsound minecraft:item.flintandsteel.use player @s ~ ~ ~ 1.0 0.5

function coinwars:base/pe_refresh_inv
