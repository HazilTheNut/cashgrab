# classes/evincer/pmtl_evincer_cast_ochre_laser.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Casts Ochre Laser
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

execute positioned ~ ~1 ~ run particle item{item:"minecraft:golden_sword"} ^-0.5 ^0.45 ^0.4 0.075 0.2 0.075 0.025 20

execute positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:14,\
i_origin_loc:1,\
col_terrain_allowed:"#cashgrab:partialsolid",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_step:"cashgrab_ex:classes/evincer/pmtl_ochre_laser_step",\
func_npe_end:"cashgrab_ex:classes/evincer/pmtl_ochre_laser_end",\
}
