# classes/stargazer/pmtl_stargazer_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Stargazer class
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

# =========================
# Mana generation

# Start timer if Mana needs to recharge
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=..24,cv_B=..0}] cv_B 1000

# Decrement Mana recharge timer
scoreboard players operation @a[tag=t_pm_owner,limit=1,scores={cv_B=0..}] cv_B -= @a[tag=t_pm_owner,limit=1] ability_cd_tickrate

# If Mana recharge timer is complete, award mana
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=..24,cv_B=..0}] run function cashgrab_ex:classes/stargazer/pmt_stargazer_award_mana

# =========================
# Spell casting

# Astral Dart
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..,evc_iron_ingots=1..}] run function cashgrab_ex:classes/stargazer/pmtl_stargazer_cast_astral_dart

# Rift Glyph
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=6..,evc_resin_bricks=1..}] run function cashgrab_ex:classes/stargazer/pmtl_stargazer_cast_rift_glyph

# Vortex Snare
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=10..,evc_gold_ingots=1..}] run function cashgrab_ex:classes/stargazer/pmtl_stargazer_cast_vortex_snare

# =========================
# Spell lockout timer

# Decrement spell lockout timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_C=0..}] cv_C 1

# When timer reaches 0, refresh spells display
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_C=0}] run function cashgrab_ex:classes/stargazer/pmt_stargazer_inv_spells
