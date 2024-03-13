# classes/skirmisher/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = 2
#
# Summary: Equips the Skirmisher class onto the command executor
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

scoreboard players set @s ability_cfg_cooldown_ticks 300
scoreboard players set @s ability_cfg_charges 1
scoreboard players set @s ability_charges 1

