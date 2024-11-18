# classes/cloudbreaker/pmtl_cloudbreaker_use_ability.mcfunction
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
#	cv_A	:	Nimbus Stride duration remaining, in ticks
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# sfx
playsound minecraft:entity.breeze.jump player @a ~ ~ ~ 1.0 0.85

# Grant speed
effect give @a[tag=t_pm_owner,limit=1] minecraft:speed 5 0

# Start Cloud Path duration
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 80
