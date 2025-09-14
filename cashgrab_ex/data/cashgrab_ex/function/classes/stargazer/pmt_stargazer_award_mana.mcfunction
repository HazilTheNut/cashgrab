# classes/stargazer/pmtl_stargazer_award_mana.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Generates 1 Mana
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Mana count
#	cv_B	:	Mana generation timer, in ms
#	cv_C	:	Spell usage lockout timer, in ticks
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Star Shower activation timer
#	cv_G	:	Star Shower yaw offset
#	cv_H	:   Star Shower pitch offset

# Generate 1 Mana
scoreboard players add @a[tag=t_pm_owner,limit=1] cv_A 1

# Refresh inventory display
function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_mana

# Refresh various inventory displays at certain Mana values
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_astral_dart
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 6 run function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_rift_glyph
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 11 run function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_vortex_snare
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 25 run function cashgrab:util/pmt_inv_ability_icon_argloader
