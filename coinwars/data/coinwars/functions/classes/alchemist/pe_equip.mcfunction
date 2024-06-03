# classes/alchemist/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = 9
#
# Summary: Equips the Alchemist class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Grant potions on equip
scoreboard players set @s cv_A 1
scoreboard players set @s cv_B 1

scoreboard players set @s ability_cfg_cooldown_ticks 400
scoreboard players set @s ability_cfg_charges 2
scoreboard players set @s ability_charges 2
