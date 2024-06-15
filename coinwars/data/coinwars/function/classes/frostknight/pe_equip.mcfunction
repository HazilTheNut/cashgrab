# classes/frostknight/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = 7
#
# Summary: Equips the Frost Knight class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

scoreboard players set @s ability_cfg_cooldown_ticks 180
scoreboard players set @s ability_cfg_charges 2
scoreboard players set @s ability_charges 2
