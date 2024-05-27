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

function coinwars:util/pe_eid_find_owner

execute if entity @e[scores={eid_compare=0,ev_dmg_taken=1..}] run tag @s add t_cleanup
execute if entity @e[scores={eid_compare=0,ev_dmg_taken=1..}] run return 0

#execute as @e[scores={eid_compare=0}] at @s run particle minecraft:crit ~ ~ ~ 1 1 1 0 10
#effect give @e[scores={eid_compare=0}] minecraft:levitation 1 255
attribute @e[scores={eid_compare=0},limit=1] minecraft:generic.gravity base set 0
execute rotated as @e[scores={eid_compare=0}] run tp @e[scores={eid_compare=0}] ~ ~-0.75 ~ ~ ~
