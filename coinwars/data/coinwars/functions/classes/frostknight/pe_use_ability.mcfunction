# classes/frostknight/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = 7
#	at: the entity
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

playsound minecraft:entity.breeze.shoot player @a ~ ~ ~ 1.0 1.5

function coinwars:util/pe_create_missile {\
f_speed_mpt:0.5f,\
i_lifetime_ticks:60,\
i_range_m:10,\
i_origin_loc:1,\
i_gravity_vy_mmpt:250,\
i_gravity_const_mmpt2:50,\
f_tracking_scalar:0,\
t_missile_name:"t_frostknight_glacier_missile",\
col_terrain_allowed:"minecraft:air",\
func_entity_filter:"coinwars:util/pe_col_entity_filter_none",\
func_tracking_filter:"coinwars:util/dummy",\
func_start:"coinwars:util/dummy",\
func_step:"coinwars:classes/frostknight/glacier_missile_step",\
func_end:"coinwars:classes/frostknight/glacier_missile_end",\
}
