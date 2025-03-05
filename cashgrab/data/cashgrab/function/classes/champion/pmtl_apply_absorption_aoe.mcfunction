# classes/champion/pmtl_apply_absorption_aoe.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
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

# Apply absorption shield
function cashgrab:util/npe_col_entity_filter_allies
effect give @e[tag=t_collision_candidate,distance=..5,scores={stat_hp=..6}] minecraft:absorption 4 2
effect give @e[tag=t_collision_candidate,distance=..5,scores={stat_hp=7..12}] minecraft:absorption 4 1
effect give @e[tag=t_collision_candidate,distance=..5,scores={stat_hp=13..}] minecraft:absorption 4 0
effect give @e[tag=t_collision_candidate,distance=..5,type=!minecraft:player] minecraft:absorption 4 0

# vfx
execute if score @a[tag=t_pm_owner,limit=1] team_id matches 0 run particle minecraft:block{block_state:"minecraft:gold_block"} ~ ~0.4 ~ 0.75 1.0 0.75 0 25
execute if score @a[tag=t_pm_owner,limit=1] team_id matches 1.. run particle minecraft:block{block_state:"minecraft:gold_block"} ~ ~0.4 ~ 2.5 0.1 2.5 0 50

# Apply absorption to players
tag @a[tag=t_collision_candidate,distance=..5] add t_champion_set_absorption_timer
execute as @e[tag=t_pm] run function cashgrab:classes/champion/pm_set_absorption_timer
tag @a remove t_champion_set_absorption_timer

# Apply absorption to non-entity allies
execute as @e[type=!minecraft:player,tag=t_collision_candidate,distance=..5] at @s run particle minecraft:crit ~ ~0.4 ~ 1.25 1.0 1.25 0 50
execute as @e[type=!minecraft:player,tag=t_collision_candidate,distance=..5] at @s run playsound minecraft:item.axe.wax_off player @a ~ ~ ~ 1.0 2.0
execute as @e[type=!minecraft:player,tag=t_collision_candidate,distance=..5] at @s run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:80,\
b_anchor_at_pos:0,\
t_timer_name:"t_champion_absorption_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:classes/champion/npe_absorption_particle_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
}

tag @e[tag=t_champion_absorption_timer_init] add t_champion_absorption_timer
tag @e[tag=t_champion_absorption_timer_init] remove t_champion_absorption_timer_init