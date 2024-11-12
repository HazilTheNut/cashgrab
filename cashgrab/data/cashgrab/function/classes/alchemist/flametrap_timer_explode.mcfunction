# classes/alchemist/flametrap_timer_explode.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Alchemist's Flame Trap timer explosion
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Find owner and tag them with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# sfx / vfx
particle minecraft:lava ~ ~ ~ 2.5 0.5 2.5 0 50
particle minecraft:flame ~ ~ ~ 2.5 0.5 2.5 0 50
playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 0.5 2.0
playsound minecraft:entity.blaze.shoot player @a[tag=t_eid_matches,limit=1] ~ ~ ~ 0.5 2.0 0.5

# Apply damage
tag @s add t_dmg_by
tag @a[tag=t_eid_matches] add t_dmg_from
function cashgrab:util/npe_col_entity_filter_hostile
tag @e[tag=t_collision_candidate,distance=..4.5] add t_dmg_trgt
effect give @e[tag=t_dmg_trgt] minecraft:glowing 10 0
function cashgrab:util/npe_dmg {\
d_dmg_amount:9.0,\
s_dmg_type:"minecraft:fireball",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}
