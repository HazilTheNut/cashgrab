# classes/titan/pull_raycast_end.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Titan's missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$scoreboard players set @s temp_A $(end_reason)

$tellraw @a[tag=t_debug] "classes/titan/pull_raycast_end: end_reason: $(end_reason)"
execute if score @s col_terrain matches 1.. run tellraw @a[tag=t_debug] [{"type":"text","text":"classes/titan/pull_raycast_end: temp_A: "},{"type":"score","score":{"name":"@s","objective":"temp_A"}}]


execute unless score @s temp_A matches 2 run scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 3000
execute unless score @s temp_A matches 2 run return 0

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 13000

execute positioned ~ ~ ~ facing ^ ^ ^-1 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.5f,\
i_lifetime_ticks:50,\
i_origin_loc:0,\
f_focal_dist_m:25,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
t_missile_name:"t_titan_missile_init",\
f_tracking_scalar:0f,\
col_terrain_allowed:"#cashgrab:nonsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/dummy",\
func_npe_start:"cashgrab:util/dummy",\
func_npe_step:"cashgrab:classes/titan/pull_missile_step",\
func_npe_end:"cashgrab:classes/titan/pull_missile_end",\
b_assign_as_peer:0,\
}

# Reassign the missile's owner to the entity struck by the Pull ability
# This allows for the missile to destruct itself if the entity it is pulling either dies or exits the game
# 	handled by the underlying framework entity ownership system
scoreboard players operation @e[tag=t_titan_missile_init,limit=1,sort=nearest] eid_owner = @e[tag=t_collision_found,limit=1] eid_self
scoreboard players operation @e[tag=t_collision_found,limit=1] eid_grabbed_by = @e[tag=t_titan_missile_init,limit=1,sort=nearest] eid_self

scoreboard players operation @e[tag=t_titan_missile_init,limit=1,sort=nearest] mis_lifetime_ticks -= @s rc_steps_remaining
scoreboard players remove @e[tag=t_titan_missile_init,limit=1,sort=nearest] mis_lifetime_ticks 3

#tellraw @a[tag=t_debug] [{"type":"text","text":"classes/titan/pull_raycast_end: mis_lifetime_ticks: "},{"type":"score","score":{"name":"@e[tag=t_titan_missile_init,limit=1,sort=nearest]","objective":"mis_lifetime_ticks"}}]

tag @e[tag=t_titan_missile_init,limit=1,sort=nearest] add t_stasis_immune
tag @e[tag=t_titan_missile_init,limit=1,sort=nearest] add t_titan_missile
tag @e[tag=t_titan_missile_init,limit=1,sort=nearest] remove t_titan_missile_init
