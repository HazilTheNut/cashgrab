# classes/spectre/pmtl_spectre_shadow_walk_active.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Shadow Walk active state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Input sanitation
execute unless score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run return 0

# Active state
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. store result storage cashgrab:spectre_args data.count int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_B
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. run function cashgrab:classes/spectre/pmt_spectre_inv_shadow_walk with storage cashgrab:spectre_args data
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches ..0 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:air
