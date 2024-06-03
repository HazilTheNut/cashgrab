# classes/skirmisher/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = 2
#	at: the entity
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

execute if score @s cv_A matches 0 run scoreboard players set @s ability_cfg_cooldown_ticks 10
execute if score @s cv_A matches 0 run return 0

scoreboard players set @s ability_cfg_cooldown_ticks 300
execute if score @s cv_A matches 1 run scoreboard players set @s cv_B 2
execute if score @s cv_A matches 2 run scoreboard players set @s cv_B 1

execute if score @s cv_A matches 1 run function coinwars:util/pe_create_missile {\
f_speed_mpt:0.7f,\
i_lifetime_ticks:400,\
i_range_m:15,\
i_origin_loc:1,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
f_tracking_scalar:0f,\
t_missile_name:"t_boomerang",\
col_terrain_allowed:"#coinwars:partialsolid",\
func_entity_filter:"coinwars:util/pe_col_entity_filter_none",\
func_tracking_filter:"coinwars:util/dummy",\
func_start:"coinwars:classes/skirmisher/boomerang_start_cutlass",\
func_step:"coinwars:classes/skirmisher/boomerang_step",\
func_end:"coinwars:classes/skirmisher/boomerang_end",\
}

execute if score @s cv_A matches 2 run function coinwars:util/pe_create_missile {\
f_speed_mpt:1.0f,\
i_lifetime_ticks:400,\
i_range_m:15,\
i_origin_loc:1,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
f_tracking_scalar:0f,\
t_missile_name:"t_boomerang",\
col_terrain_allowed:"#coinwars:partialsolid",\
func_entity_filter:"coinwars:util/pe_col_entity_filter_none",\
func_tracking_filter:"coinwars:util/dummy",\
func_start:"coinwars:classes/skirmisher/boomerang_start_rapier",\
func_step:"coinwars:classes/skirmisher/boomerang_step",\
func_end:"coinwars:classes/skirmisher/boomerang_end",\
}

