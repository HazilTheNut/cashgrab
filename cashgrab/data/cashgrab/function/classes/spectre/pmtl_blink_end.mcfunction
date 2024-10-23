# classes/spectre/pmtl_blink_end.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Performs blink teleportation
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

execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~-1 ~ #cashgrab:nonsolid run tp @a[tag=t_pm_owner,limit=1] ~ ~-1 ~
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~-1 ~ #cashgrab:nonsolid run particle minecraft:smoke ~ ~-1 ~ 0.5 0.75 0.5 0 40
execute align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~-1 ~ #cashgrab:nonsolid run tp @a[tag=t_pm_owner,limit=1] ~ ~ ~
execute align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~-1 ~ #cashgrab:nonsolid run particle minecraft:smoke ~ ~ ~ 0.5 0.75 0.5 0 40

playsound minecraft:entity.player.teleport player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1.0 0.75
