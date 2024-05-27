# classes/titan/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = 8
#
# Summary: Equips the Titan class onto the command executor
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
#	cv_H	:	

scoreboard players set @s ability_cfg_cooldown_ticks 30
scoreboard players set @s ability_cfg_charges 1
scoreboard players set @s ability_charges 1
