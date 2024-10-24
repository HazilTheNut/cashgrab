# classes/skirmisher/pmtl_skirmisher_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses Boomerang ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Held item: 0 = neither sword, 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_B	:	Item config: 0 = has both, 1 = only Cleaving Cutlass, 2 = only Dancing Rapier
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Boomerang type: 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

# If no sword held, do nothing
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 500
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run return 0

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 15000

# Set item configuration to only having the other sword
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 2
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1

# Throw Cleaving Cutlass
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.7f,\
i_lifetime_ticks:200,\
i_origin_loc:1,\
f_focal_dist_m:15,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
f_tracking_scalar:0f,\
t_missile_name:"t_boomerang",\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/dummy",\
func_npe_start:"cashgrab:classes/skirmisher/boomerang_start_cutlass",\
func_npe_tick:"cashgrab:classes/skirmisher/boomerang_tick",\
func_npe_end:"cashgrab:classes/skirmisher/boomerang_end",\
b_assign_as_peer:1,\
}

# Throw Dancing Rapier
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:1.0f,\
i_lifetime_ticks:200,\
i_origin_loc:1,\
f_focal_dist_m:15,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
f_tracking_scalar:0f,\
t_missile_name:"t_boomerang",\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/dummy",\
func_npe_start:"cashgrab:classes/skirmisher/boomerang_start_rapier",\
func_npe_tick:"cashgrab:classes/skirmisher/boomerang_tick",\
func_npe_end:"cashgrab:classes/skirmisher/boomerang_end",\
b_assign_as_peer:1,\
}

