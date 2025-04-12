# classes/stargazer/pmtl_stargazer_cts_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Class-and-Trinket tick function for Stargazer class
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

# Reload spells if they are used
execute if entity @a[tag=t_pm_owner,limit=1,scores={evc_iron_ingots=1..}] run function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_astral_dart
execute if entity @a[tag=t_pm_owner,limit=1,scores={evc_resin_bricks=1..}] run function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_rift_glyph
execute if entity @a[tag=t_pm_owner,limit=1,scores={evc_gold_ingots=1..}] run function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_vortex_snare

# Consume events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_iron_ingots 0
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_resin_bricks 0
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_gold_ingots 0

