# classes/titan/power_strike_timer_step.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#	facing: the Titan's original facing direction
#
# Summary: Titan's Power Strike knockback effect timer step function
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

particle minecraft:cloud ~ ~0.5 ~ 0.1 0.1 0.1 0 1

# Wall detection
execute unless block ~1 ~ ~ #coinwars:nonsolid run tag @s add t_hit_wall
execute unless block ~ ~ ~1 #coinwars:nonsolid run tag @s add t_hit_wall
execute unless block ~-1 ~ ~ #coinwars:nonsolid run tag @s add t_hit_wall
execute unless block ~ ~ ~-1 #coinwars:nonsolid run tag @s add t_hit_wall
execute unless block ~1 ~1 ~ #coinwars:nonsolid run tag @s add t_hit_wall
execute unless block ~ ~1 ~1 #coinwars:nonsolid run tag @s add t_hit_wall
execute unless block ~-1 ~1 ~ #coinwars:nonsolid run tag @s add t_hit_wall
execute unless block ~ ~1 ~-1 #coinwars:nonsolid run tag @s add t_hit_wall

function coinwars:util/pe_eid_find_owner

# If hit wall, apply slow and clean up
execute if entity @s[tag=t_hit_wall] run particle minecraft:cloud ~ ~0.5 ~ 0.75 0.75 0.75 0 30
execute if entity @s[tag=t_hit_wall] run effect give @e[scores={eid_compare=0}] minecraft:slowness 3 2
tag @s[tag=t_hit_wall] add t_cleanup

# If owner lands on the ground, clean up
execute if entity @e[scores={eid_compare=0},nbt={OnGround:1b}] run tag @s add t_cleanup
