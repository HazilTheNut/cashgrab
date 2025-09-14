# classes/frostknight/glacier_timer_pulse.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Frost Knight's glacier damage pulse
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

# vfx / sfx
playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 1.0 2.0
particle minecraft:cloud ~ ~0.15 ~ 2.2 0.1 2.2 0 90

# Find owner and tag them with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Apply damage
tag @s add t_dmg_by
tag @a[tag=t_eid_matches] add t_dmg_from
function cashgrab:util/npe_col_entity_filter_hostile
execute positioned ~-5 ~-2 ~-5 run tag @e[tag=t_collision_candidate,dx=9,dy=5,dz=9] add t_dmg_trgt
effect give @e[tag=t_dmg_trgt] minecraft:slowness 3 2
function cashgrab:util/npe_dmg {\
d_dmg_amount:1.5,\
s_dmg_type:"minecraft:player_explosion",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}
