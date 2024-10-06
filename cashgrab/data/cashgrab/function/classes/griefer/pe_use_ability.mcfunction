# classes/griefer/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = 1
#	at: the entity
#
# Summary: Uses Crash Landing ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Player Y position, in mm
#	cv_G	:	Crash Landing cutoff height, in mm
#	cv_H	:	Creeper fuse timer


scoreboard players set @s cv_A 1
scoreboard players set @s cv_B 7

effect give @s minecraft:levitation 1 35 true

playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 3.0 1.0
