# classes/artillery/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = 5
#
# Summary: Equips the Artillery class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

scoreboard players set @s ability_cfg_cooldown_ticks 240
scoreboard players set @s ability_cfg_charges 3
scoreboard players set @s ability_charges 3
