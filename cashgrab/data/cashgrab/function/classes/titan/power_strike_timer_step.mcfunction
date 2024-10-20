# classes/titan/power_strike_timer_step.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#
# Summary: Titan's Power Strike knockback effect timer step function
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

particle minecraft:cloud ~ ~0.5 ~ 0.1 0.1 0.1 0 1

# Wall detection
execute unless block ~ ~ ~ #cashgrab:nonsolid run tag @s add t_hit_wall
execute unless block ~1 ~ ~ #cashgrab:nonsolid run tag @s add t_hit_wall
execute unless block ~ ~ ~1 #cashgrab:nonsolid run tag @s add t_hit_wall
execute unless block ~-1 ~ ~ #cashgrab:nonsolid run tag @s add t_hit_wall
execute unless block ~ ~ ~-1 #cashgrab:nonsolid run tag @s add t_hit_wall
execute unless block ~1 ~1 ~ #cashgrab:nonsolid run tag @s add t_hit_wall
execute unless block ~ ~1 ~1 #cashgrab:nonsolid run tag @s add t_hit_wall
execute unless block ~-1 ~1 ~ #cashgrab:nonsolid run tag @s add t_hit_wall
execute unless block ~ ~1 ~-1 #cashgrab:nonsolid run tag @s add t_hit_wall

# Find owner and tag them with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# If hit wall, apply slow and clean up
execute if entity @s[tag=t_hit_wall] run particle minecraft:cloud ~ ~0.5 ~ 0.75 0.75 0.75 0 30
execute if entity @s[tag=t_hit_wall] run playsound minecraft:block.grass.break player @a ~ ~ ~ 1.0 0.5
execute if entity @s[tag=t_hit_wall] run effect give @e[tag=t_eid_matches] minecraft:slowness 3 2
tag @s[tag=t_hit_wall] add t_cleanup

# If owner is on the ground for 2+ server ticks, clean up
execute if entity @e[tag=t_eid_matches,nbt={OnGround:1b}] run scoreboard players add @s cv_B 1
execute if score @s cv_B matches 2.. run tag @s add t_cleanup
