# classes/frostknight/glacier_missile_end.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Frost Knight's glacier end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

execute if score @s cv_H matches 1 run fill ~ ~ ~ ~ ~ ~ minecraft:air destroy
execute if score @s cv_H matches 2 run fill ~ ~ ~ ~ ~1 ~ minecraft:air destroy
