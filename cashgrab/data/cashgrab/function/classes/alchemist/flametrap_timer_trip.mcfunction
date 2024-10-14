# classes/alchemist/flametrap_timer_step.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Alchemist's Flame Trap timer trip effects
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

# Find owner and tag them with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# sfx / vfx
particle minecraft:smoke ~ ~ ~ 0.5 0.5 0.5 0 20
particle minecraft:flame ~ ~ ~ 0.5 0.5 0.5 0 20
playsound minecraft:block.lever.click player @a ~ ~ ~ 0.5 1.5
playsound minecraft:block.lever.click player @a[tag=t_eid_matches,limit=1] ~ ~ ~ 0.5 1.5 0.5

# Notify owner by text chat
tellraw @a[tag=t_eid_matches,limit=1] {"color":"green","type":"text","text":"Someone has triggered one of your Flame Traps!"}
