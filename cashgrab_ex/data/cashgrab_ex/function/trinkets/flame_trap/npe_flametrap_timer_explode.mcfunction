# trinkets/flame_trap/npe_flametrap_timer_explode.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Alchemist's Flame Trap timer explosion
#
# Arguments: (none)

# Trinket variable usage:
#	tv_A	:	Flame Trap expiration timer
#	tv_B	:	
#	tv_C	:	
#	tv_D	:	

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
tag @e[tag=t_collision_candidate,distance=..4.25] add t_dmg_trgt
function cashgrab:util/npe_dmg {\
d_dmg_amount:7.5,\
s_dmg_type:"cashgrab:fire_explosion",\
t_dmg_target:"t_dmg_trgt",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_dmg_from",\
b_remove_tags:1\
}
