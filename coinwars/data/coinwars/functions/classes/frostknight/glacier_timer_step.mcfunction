# classes/frostknight/glacier_timer_step.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Frost Knight's glacier step function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

# Pulse at regular intervals of timer lifetime
execute if score @s tmr_lifetime_ticks matches 121 run tag @s add t_frostknight_glacier_pulse
execute if score @s tmr_lifetime_ticks matches 81 run tag @s add t_frostknight_glacier_pulse
execute if score @s tmr_lifetime_ticks matches 41 run tag @s add t_frostknight_glacier_pulse
execute if score @s tmr_lifetime_ticks matches 1 run tag @s add t_frostknight_glacier_pulse

# Pulse effect
execute if entity @s[tag=t_frostknight_glacier_pulse] run playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 1.0 2.0
execute if entity @s[tag=t_frostknight_glacier_pulse] run particle minecraft:cloud ~ ~0.15 ~ 2 0.1 2 0 70
execute if entity @s[tag=t_frostknight_glacier_pulse] run tag @s add t_dmg_loc
execute if entity @s[tag=t_frostknight_glacier_pulse] run function coinwars:util/pe_eid_find_owner
execute if entity @s[tag=t_frostknight_glacier_pulse] run tag @e[scores={eid_compare=0}] add t_dmg_src
execute if entity @s[tag=t_frostknight_glacier_pulse] run function coinwars:util/pe_col_entity_filter_hostile
execute if entity @s[tag=t_frostknight_glacier_pulse] positioned ~-4 ~-2 ~-4 as @e[tag=t_collision_candidate,dx=8,dy=5,dz=8] run damage @s 2.0 minecraft:player_explosion by @e[tag=t_dmg_src,limit=1,sort=nearest] from @e[tag=t_dmg_loc,limit=1,sort=nearest]
execute if entity @s[tag=t_frostknight_glacier_pulse] positioned ~-4 ~-2 ~-4 run effect give @e[tag=t_collision_candidate,dx=8,dy=5,dz=8] minecraft:slowness 3 2

execute if entity @s[tag=t_frostknight_glacier_pulse] run tag @e remove t_dmg_loc
execute if entity @s[tag=t_frostknight_glacier_pulse] run tag @e remove t_dmg_src

tag @s remove t_frostknight_glacier_pulse
