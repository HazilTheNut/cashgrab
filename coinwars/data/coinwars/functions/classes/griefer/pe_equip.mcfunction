# classes/griefer/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = 1
#
# Summary: Equips the Griefer class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

scoreboard players set @s ability_cfg_cooldown_ticks 200
scoreboard players set @s ability_cfg_charges 1
scoreboard players set @s ability_charges 1

scoreboard players set @s cv_C 0

