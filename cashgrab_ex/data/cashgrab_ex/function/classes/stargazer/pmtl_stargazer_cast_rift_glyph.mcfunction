# classes/stargazer/pmtl_stargazer_cast_rift_glyph.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Casts Rift Glyph
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

# sfx / vfx
particle minecraft:entity_effect{color:[0.8,0.7,0.5,1.0]} ~ ~1 ~ 0.25 0.45 0.25 0.5 15

# Search for previous Rift Glyph timer and mark it
function cashgrab:util/npe_eid_find_peers
tag @n[tag=t_stargazer_rift_glyph_timer,limit=1,scores={eid_compare=0}] add t_stargazer_rift_glyph_target

# Place Rift Glyph timer prior to teleport
function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:160,\
b_anchor_at_pos:1,\
t_timer_name:"t_stargazer_rift_glyph_timer_new",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/stargazer/npe_rift_glyph_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

# Teleport forwards if no Rift Glyph timer
execute unless entity @e[tag=t_stargazer_rift_glyph_target] positioned ~ ~1.625 ~ rotated ~180 0 run function cashgrab:util/npe_raycast {\
i_range_m:6,\
i_origin_loc:1,\
col_terrain_allowed:"#cashgrab:nonsolid",\
b_fit_player:0,\
func_npe_entity_filter:"cashgrab:util/npe_col_filter_entity_none",\
func_npe_step:"cashgrab:util/noop",\
func_npe_end:"cashgrab_ex:classes/stargazer/pmtl_rift_glyph_raycast_end",\
}

# Teleport to Rift Glyph timer and then kill it
execute if entity @e[tag=t_stargazer_rift_glyph_target] at @n[tag=t_stargazer_rift_glyph_target] run tp @a[tag=t_pm_owner,limit=1] ~ ~0.3 ~ facing entity @n[tag=t_stargazer_rift_glyph_timer_new] eyes
execute at @n[tag=t_stargazer_rift_glyph_target] run particle minecraft:entity_effect{color:[0.8,0.7,0.5,1.0]} ~ ~1 ~ 0.25 0.45 0.25 0.5 15
tag @e[tag=t_stargazer_rift_glyph_target] add t_cleanup

# Clean up tags
tag @e[tag=t_stargazer_rift_glyph_timer_new] add t_stargazer_rift_glyph_timer
tag @e[tag=t_stargazer_rift_glyph_timer_new] add t_stasis_immune
tag @e[tag=t_stargazer_rift_glyph_timer_new] remove t_stargazer_rift_glyph_timer_new

# Release player from grabs
tag @a[tag=t_pm_owner,limit=1] add t_grab_release

# Decrement Mana
scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_A 6

# Set lockout timer to 0.6 seconds
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 12

# Reload inventory displays
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_spells
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_mana
function cashgrab:util/pmt_inv_ability_icon_argloader

# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_wayfinder_armor_trim_smithing_templates 0
