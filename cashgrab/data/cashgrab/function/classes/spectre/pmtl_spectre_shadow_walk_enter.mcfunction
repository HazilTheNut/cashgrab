# classes/spectre/pmtl_spectre_shadow_walk_enter.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Enters Shadow Walk state
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown (in ms)
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Input sanitation
execute unless score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run return 0

# Enter state
tag @a[tag=t_pm_owner,limit=1] add t_invisible
tag @a[tag=t_pm_owner,limit=1] add t_trinket_force_hotbar
function cashgrab:util/pmt_inv_refresh
particle minecraft:smoke ~ ~1 ~ 0.5 0.75 0.5 0 40
effect give @a[tag=t_pm_owner,limit=1] minecraft:speed 3 13 true
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 10000
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1
