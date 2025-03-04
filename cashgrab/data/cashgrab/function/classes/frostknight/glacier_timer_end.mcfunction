# classes/frostknight/glacier_timer_end.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Frost Knight's glacier end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

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
