# classes/stargazer/pmtl_stargazer_use_ability.mcfunction
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
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	Vortex Snare sfx timer
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset

# If Mana insufficent, do nothing
execute unless score @a[tag=t_pm_owner,limit=1] cv_A matches 25.. run return 0

# sfx
playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 1.0 2.0

# Spawn Star Shower
execute positioned ~ ~1.625 ~ rotated ~ -70 run function cashgrab:util/npe_raycast {\
i_range_m:7,\
i_origin_loc:1,\
col_terrain_allowed:"#cashgrab:partialsolid",\
b_fit_player:1,\
func_npe_entity_filter:"cashgrab:util/npe_col_filter_entity_none",\
func_npe_step:"cashgrab_ex:classes/stargazer/npe_star_shower_missile_tick",\
func_npe_end:"cashgrab_ex:classes/stargazer/pmtl_stargazer_place_star_shower_timer",\
}

# Decrement Mana
scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_A 25

# Reload inventory displays
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_spells
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_mana
