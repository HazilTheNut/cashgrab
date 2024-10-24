# classes/titan/pull_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Titan's missile tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

particle minecraft:cloud ~ ~ ~ 0 0 0 0 1

# Find owner and tag them with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# If owner is missing or takes damage, clean up and release grab
execute unless entity @e[tag=t_eid_matches] run tag @s add t_cleanup
execute if entity @e[scores={evl_dmg_taken=1..},tag=t_eid_matches] run tag @s add t_cleanup
execute if entity @e[scores={evl_dmg_taken=1..},tag=t_eid_matches] run tag @e[tag=t_eid_matches] add t_grab_release
