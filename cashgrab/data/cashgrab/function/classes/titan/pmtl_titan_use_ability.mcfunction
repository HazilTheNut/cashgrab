# classes/titan/pmtl_titan_use_ability.mcfunction
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
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	Power Strike on ground cleanup timer
#	cv_D	:	Power Strike timer originator EID
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

playsound minecraft:block.portal.travel player @a ~ ~ ~ 0.15 2.0

execute positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:20,\
i_origin_loc:1,\
col_terrain_allowed:"#cashgrab:nonsolid",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_step:"cashgrab:classes/titan/pull_raycast_step",\
func_npe_end:"cashgrab:classes/titan/pull_raycast_end",\
}
