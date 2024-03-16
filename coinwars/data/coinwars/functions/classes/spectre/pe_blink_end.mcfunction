# classes/spectre/pe_blink_end.mcfunction
#
# Context:
#	as: an entity with class = 3
#
# Summary: Performs blink teleportation
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

execute if block ~ ~-1 ~ #coinwars:nonsolid run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ #coinwars:nonsolid run particle minecraft:smoke ~ ~-1 ~ 0.5 0.75 0.5 0 40
execute unless block ~ ~-1 ~ #coinwars:nonsolid run tp @s ~ ~ ~
execute unless block ~ ~-1 ~ #coinwars:nonsolid run particle minecraft:smoke ~ ~ ~ 0.5 0.75 0.5 0 40

playsound minecraft:entity.player.teleport player @s ~ ~ ~ 1.0 0.75
