# classes/dancer/dancer_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Dancer's Sforzando missile tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Tempo Stacks (0-3)
#	cv_B	:	Tempo Hit Combo Window
#	cv_C	:	Tempo Timer
#	cv_D	:	Sound Effect timer (base)
#	cv_E	:	Sforzando missile sequence timer
#	cv_F	:	Sound Effect timer (refresh buff)
#	cv_G	:	Refresh Buff Timer Cooldown / Sforzando missile pitch deflection (mdeg)
#	cv_H	:   Sforzando missile yaw deflection (mdeg)

# Apply initial angle deflections
scoreboard players operation @s mis_func_tick_dyaw_mdeg = @s cv_H
scoreboard players operation @s mis_func_tick_dpitch_mdeg = @s cv_G
scoreboard players set @s cv_H 0
scoreboard players set @s cv_G 0

particle minecraft:note ~ ~ ~ 0 0 0 0.5 1 force

# Check if conditions necessary for a missile offset are present
execute unless score @s mis_lifetime_ticks matches 1 run return 0
execute if score @s stasis_state matches 1..2 run return 0


