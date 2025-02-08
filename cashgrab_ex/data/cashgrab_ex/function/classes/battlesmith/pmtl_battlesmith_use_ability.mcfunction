# classes/battlesmith/pmtl_battlesmith_use_ability.mcfunction
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

# Class variable usage:
#	cv_A	:	Scrap count
#	cv_B	:	Upgrade Weapon sequence time, in ticks
#	cv_C	:	
#	cv_D	:	Coin pickup scrap generation lockout timer
#	cv_E	:	Weapon progression level
#	cv_F	:	
#	cv_G	:	Molten Mortar sfx timer
#	cv_H	:

playsound minecraft:block.lava.pop player @a ~ ~ ~ 1.0 0.75

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.30f,\
i_lifetime_ticks:100,\
i_origin_loc:1,\
f_focal_dist_m:50,\
i_gravity_vy_mmpt:100,\
i_gravity_const_mmpt2:40,\
f_tracking_scalar:0.0f,\
t_missile_name:"t_battlesmith_mortar_missile",\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/battlesmith/mortar_missile_tick",\
func_npe_end:"cashgrab_ex:classes/battlesmith/mortar_missile_end",\
b_assign_as_peer:1,\
}

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.40f,\
i_lifetime_ticks:100,\
i_origin_loc:1,\
f_focal_dist_m:50,\
i_gravity_vy_mmpt:150,\
i_gravity_const_mmpt2:40,\
f_tracking_scalar:0.0f,\
t_missile_name:"t_battlesmith_mortar_missile",\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/battlesmith/mortar_missile_tick",\
func_npe_end:"cashgrab_ex:classes/battlesmith/mortar_missile_end",\
b_assign_as_peer:1,\
}

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.50f,\
i_lifetime_ticks:100,\
i_origin_loc:1,\
f_focal_dist_m:50,\
i_gravity_vy_mmpt:200,\
i_gravity_const_mmpt2:40,\
f_tracking_scalar:0.0f,\
t_missile_name:"t_battlesmith_mortar_missile",\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/battlesmith/mortar_missile_tick",\
func_npe_end:"cashgrab_ex:classes/battlesmith/mortar_missile_end",\
b_assign_as_peer:1,\
}

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.60f,\
i_lifetime_ticks:100,\
i_origin_loc:1,\
f_focal_dist_m:50,\
i_gravity_vy_mmpt:250,\
i_gravity_const_mmpt2:40,\
f_tracking_scalar:0.0f,\
t_missile_name:"t_battlesmith_mortar_missile",\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/battlesmith/mortar_missile_tick",\
func_npe_end:"cashgrab_ex:classes/battlesmith/mortar_missile_end",\
b_assign_as_peer:1,\
}
