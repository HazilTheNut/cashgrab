# classes/champion/pmtl_champion_loop.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Loop function for Champion class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Decrement Commander Charge sequence timer
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0.. run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_A 1

# Add more particles to speed effect
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1.. run particle minecraft:effect ~ ~0.5 ~ 0.5 0.5 0.5 0 1

# Apply absorption shield
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run function cashgrab:classes/champion/pmtl_apply_absorption_aoe
