# classes/skirmisher/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = 2
#	at: the entity
#
# Summary: Loop function for Skirmisher class
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

# Sword position tracking
scoreboard players set @s cv_A 0
scoreboard players set @s[nbt={SelectedItem:{id:"minecraft:iron_sword"}}] cv_A 1
scoreboard players set @s[nbt={SelectedItem:{id:"minecraft:golden_sword"}}] cv_A 2

# When ability exits cooldown, return sword to player
execute if score @s ability_cd_ticks matches 1 run scoreboard players set @s cv_B 0
execute if score @s ability_cd_ticks matches 1 run function coinwars:classes/skirmisher/pe_inv
