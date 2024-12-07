# Class variable usage:
#	cv_A	:	1 if Tools are toggled on
#	cv_B	:	Smoothing Tool calculation temp
#	cv_C	:	Lighting Update timer
#	cv_D	:	
#	cv_E	:	Anchor X pos, in m
#	cv_F	:	Anchor Y pos, in m
#	cv_G	:	Anchor Z pos, in m
#	cv_H	:	Page Number

fill ~-1 ~ ~-1 ~1 ~3 ~1 minecraft:air

execute positioned ~-1 ~-1 ~-1 rotated 0 90 run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:leveler_allowed",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/noop",\
func_npe_step:"cashgrab:classes/mapmaker/leveler_raycast_step",\
func_npe_end:"cashgrab:util/noop",\
}

execute positioned ~-1 ~-1 ~ rotated 0 90 run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:leveler_allowed",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/noop",\
func_npe_step:"cashgrab:classes/mapmaker/leveler_raycast_step",\
func_npe_end:"cashgrab:util/noop",\
}

execute positioned ~-1 ~-1 ~1 rotated 0 90 run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:leveler_allowed",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/noop",\
func_npe_step:"cashgrab:classes/mapmaker/leveler_raycast_step",\
func_npe_end:"cashgrab:util/noop",\
}

execute positioned ~ ~-1 ~-1 rotated 0 90 run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:leveler_allowed",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/noop",\
func_npe_step:"cashgrab:classes/mapmaker/leveler_raycast_step",\
func_npe_end:"cashgrab:util/noop",\
}

execute positioned ~ ~-1 ~ rotated 0 90 run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:leveler_allowed",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/noop",\
func_npe_step:"cashgrab:classes/mapmaker/leveler_raycast_step",\
func_npe_end:"cashgrab:util/noop",\
}

execute positioned ~ ~-1 ~1 rotated 0 90 run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:leveler_allowed",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/noop",\
func_npe_step:"cashgrab:classes/mapmaker/leveler_raycast_step",\
func_npe_end:"cashgrab:util/noop",\
}

execute positioned ~1 ~-1 ~-1 rotated 0 90 run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:leveler_allowed",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/noop",\
func_npe_step:"cashgrab:classes/mapmaker/leveler_raycast_step",\
func_npe_end:"cashgrab:util/noop",\
}

execute positioned ~1 ~-1 ~ rotated 0 90 run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:leveler_allowed",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/noop",\
func_npe_step:"cashgrab:classes/mapmaker/leveler_raycast_step",\
func_npe_end:"cashgrab:util/noop",\
}

execute positioned ~1 ~-1 ~1 rotated 0 90 run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:leveler_allowed",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/noop",\
func_npe_step:"cashgrab:classes/mapmaker/leveler_raycast_step",\
func_npe_end:"cashgrab:util/noop",\
}
