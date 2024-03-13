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
#	cv_A	:	1 if holding the Dancing Rapier, and 0 otherwise. 
#				Used to track which weapon is equipped to not reset their current positions when inventory refreshes.
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

# Sword position tracking
scoreboard players set @s[nbt=!{SelectedItem:{id:"minecraft:golden_sword"}}] cv_A 0
scoreboard players set @s[nbt={SelectedItem:{id:"minecraft:golden_sword"}}] cv_A 1

