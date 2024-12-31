# classes/vampire/pmtl_vampire_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Play some vfx and spawn in bat missiles to have them track towards each player within X blocks.

# vfx
playsound entity.elder_guardian.curse player @e[type=player,distance=0..10] ~ ~ ~ 1 1.1
title @e[type=player,distance=1..10] times 0 120 20
title @e[type=player,distance=1..10] actionbar {"text":"MARKED!","bold":true,"color":"yellow"}
tag @e[type=player,distance=1..10] add t_marked_target
effect give @a[tag=t_marked_target] minecraft:weakness 7 1

# spawn bat swarm
execute at @a[tag=t_pm_owner,limit=1] facing entity @a[tag=t_marked_target] eyes run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.65f,\
i_lifetime_ticks:50,\
i_origin_loc:1,\
f_focal_dist_m:50,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
f_tracking_scalar:0.65f,\
t_missile_name:"t_vampire_soulsiphon_missile",\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_tracking_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cg_maks:classes/vampire/vampire_missile_tick",\
func_npe_end:"cg_maks:classes/vampire/vampire_missile_end",\
b_assign_as_peer:1,\
}

# Start mark timer
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 150
