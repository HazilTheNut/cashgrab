# classes/champion/pe_loop.mcfunction
#
# Context:
#	as: an entity with class = 6
#	at: the entity
#
# Summary: Loop function for Champion class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Decrement Commander Charge sequence timer
execute if score @s cv_A matches 0.. run scoreboard players remove @s cv_A 1

# Add more particles to speed effect
execute if score @s cv_A matches 1.. run particle minecraft:effect ~ ~0.5 ~ 0.5 0.5 0.5 0 1

# Apply absorption shield
execute if score @s cv_A matches 0 run function coinwars:util/pe_col_entity_filter_allies
execute if score @s cv_A matches 0 run effect give @e[tag=t_collision_candidate,distance=..5,scores={stat_hp=..6}] minecraft:absorption 4 2
execute if score @s cv_A matches 0 run effect give @e[tag=t_collision_candidate,distance=..5,scores={stat_hp=7..12}] minecraft:absorption 4 1
execute if score @s cv_A matches 0 run effect give @e[tag=t_collision_candidate,distance=..5,scores={stat_hp=13..}] minecraft:absorption 4 0
#execute if score @s cv_A matches 0 run particle minecraft:block minecraft:gold_block ~ ~0.4 ~ 2.5 0.1 2.5 0 50
execute if score @s cv_A matches 0 as @e[tag=t_collision_candidate,distance=..5] at @s run particle minecraft:crit ~ ~0.75 ~ 1 1 1 0 100
execute if score @s cv_A matches 0 as @e[tag=t_collision_candidate,distance=..5] at @s run function coinwars:util/pe_set_timer {\
lifetime_ticks:80,\
b_anchor_at_pos:0,\
t_timer_name:"t_champion_absorption_timer",\
func_step:"coinwars:classes/champion/pe_absorption_particle_timer_step",\
func_end:"coinwars:util/dummy",\
}

