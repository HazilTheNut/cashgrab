# classes/stargazer/pmtl_stargazer_cast_astral_dart.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Casts Astral Dart
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	Vortex Snare sfx timer
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset

# Create missile
function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.95f,\
i_lifetime_ticks:50,\
i_origin_loc:1,\
f_focal_dist_m:35,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
t_missile_name:"t_stargazer_astral_dart_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/stargazer/npe_astral_dart_missile_tick",\
func_npe_end:"cashgrab_ex:classes/stargazer/npe_astral_dart_missile_end",\
b_assign_as_peer:1,\
}

# Decrement Mana
scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_A 1

# Set lockout timer to 0.6 seconds
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 12

# Reload inventory displays
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_spells
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_mana
function cashgrab:util/pmt_inv_ability_icon_argloader

# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_iron_ingots 0
