# classes/spectre/pmtl_spectre_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses Blink ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

particle minecraft:smoke ~ ~1 ~ 0.5 0.75 0.5 0 40

execute positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:11,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:partialsolid",\
b_fit_player:1,\
func_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_step:"cashgrab:util/dummy",\
func_end:"cashgrab:classes/spectre/pmtl_blink_end",\
}

# Release player if they were grabbed
tag @a[tag=t_pm_owner,limit=1] add t_grab_release
