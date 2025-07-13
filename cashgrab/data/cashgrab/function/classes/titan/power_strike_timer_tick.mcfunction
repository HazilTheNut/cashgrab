# classes/titan/power_strike_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#
# Summary: Titan's Power Strike knockback effect timer tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	Power Strike on ground cleanup timer
#	cv_D	:	Power Strike timer originator EID
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

# If hit wall, damage, apply slow, and clean up
execute if entity @s[tag=t_hit_wall] run function cashgrab:classes/titan/power_strike_timer_hurt_owner

# If owner is on the ground for 8+ server ticks, clean up
execute if entity @e[tag=t_timer_owner,nbt={OnGround:1b}] run scoreboard players add @s cv_C 1
execute if score @s cv_C matches 8.. run tag @s add t_cleanup
