# classes/cloudbreaker/cloud_timer_end.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Cloud timer end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# vfx / sfx
particle minecraft:cloud ~ ~ ~ 0.25 0.25 0.25 0 1 normal
playsound minecraft:entity.breeze.idle_ground player @a ~ ~ ~ 0.2 2.0

fill ~ ~ ~ ~ ~ ~ minecraft:air replace
