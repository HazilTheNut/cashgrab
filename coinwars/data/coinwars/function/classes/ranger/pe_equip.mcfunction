# classes/ranger/pe_equip.mcfunction
#
# Context:
#	as: an entity with class = 4
#
# Summary: Equips the Ranger class onto the command executor
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

scoreboard players set @s ability_cfg_cooldown_ticks 240
scoreboard players set @s ability_cfg_charges 1
scoreboard players set @s ability_charges 1

scoreboard players set @s cv_B 20
scoreboard players set @s cv_E 3
scoreboard players set @s cv_F 1
