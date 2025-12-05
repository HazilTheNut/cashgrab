# classes/dancer/pmtl_dancer_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#   + the owner of the pm is tagged with t_dancer_sforz_missile
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Dancer class
#
# Arguments:
#   pitch: The offset value assigned to pitch (in degrees)
#   yaw: The offset value assigned to yaw (in degrees)

# Class variable usage:
#	cv_A	:	Tempo Stacks (0-3)
#	cv_B	:	Tempo Hit Combo Window
#	cv_C	:	Tempo Timer
#	cv_D	:	Sound Effect timer (base)
#	cv_E	:	Sforzando missile sequence timer
#	cv_F	:	Sound Effect timer (refresh buff)
#	cv_G	:	Refresh Buff Timer Cooldown / Sforzando missile pitch deflection (mdeg)
#	cv_H	:   Sforzando missile yaw deflection (mdeg)

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.45f,\
i_lifetime_ticks:40,\
i_origin_loc:1,\
f_focal_dist_m:10,\
i_gravity_vy_mmpt:450,\
i_gravity_const_mmpt2:110,\
t_missile_name:"t_dancer_sforz_missile_init",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cg_maks:classes/dancer/dancer_missile_tick",\
func_npe_end:"cg_maks:classes/dancer/dancer_missile_end",\
b_assign_as_peer:1,\
}

# Yaw deflection: based on position in missile firing sequence (increments by 15 degrees with each one)
scoreboard players operation @e[tag=t_dancer_sforz_missile_init,limit=1] cv_H = @a[tag=t_pm_owner,limit=1] cv_H
scoreboard players add @a[tag=t_pm_owner,limit=1] cv_H 15000

# Pitch deflection: roll randomly
execute store result score @e[tag=t_dancer_sforz_missile_init,limit=1] cv_G run random value -15000..30000

# Clean up tags
tag @e[tag=t_dancer_sforz_missile_init,limit=1] add t_dancer_sforz_missile
tag @e[tag=t_dancer_sforz_missile_init,limit=1] remove t_dancer_sforz_missile_init
