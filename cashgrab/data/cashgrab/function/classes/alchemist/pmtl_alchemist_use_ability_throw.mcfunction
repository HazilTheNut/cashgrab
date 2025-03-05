# classes/alchemist/pe_use_ability.mcfunction
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
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	
#	cv_H	:	

# sfx
playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 0.5 1.5

# Launch missile
function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.3f,\
i_lifetime_ticks:200,\
i_origin_loc:1,\
f_focal_dist_m:5,\
i_gravity_vy_mmpt:100,\
i_gravity_const_mmpt2:40,\
f_tracking_scalar:0,\
t_missile_name:"t_alchemist_translocator_missile_init",\
col_terrain_allowed:"minecraft:air",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab:classes/alchemist/translocator_missile_tick",\
func_npe_end:"cashgrab:classes/alchemist/translocator_missile_end",\
b_assign_as_peer:1,\
}

tag @n[tag=t_alchemist_translocator_missile_init] add t_alchemist_translocator
tag @n[tag=t_alchemist_translocator_missile_init] add t_alchemist_translocator_missile
tag @n[tag=t_alchemist_translocator_missile_init] remove t_alchemist_translocator_missile_init

# Set ability state
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 3000
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 1