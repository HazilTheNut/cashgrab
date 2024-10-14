# classes/titan/pull_missile_step.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Titan's missile step function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer
#	cv_B	:	
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

execute if entity @e[scores={ev_dmg_taken=1..},tag=t_eid_matches] run tag @s add t_cleanup
execute if entity @s[tag=t_cleanup] run return 0

#execute as @e[scores={eid_compare=0}] at @s run particle minecraft:crit ~ ~ ~ 1 1 1 0 10
#effect give @e[scores={eid_compare=0}] minecraft:levitation 1 255
attribute @n[tag=t_eid_matches] minecraft:generic.gravity base set 0
execute rotated as @n[tag=t_eid_matches] run tp @n[tag=t_eid_matches] ~ ~-0.75 ~ ~ ~
