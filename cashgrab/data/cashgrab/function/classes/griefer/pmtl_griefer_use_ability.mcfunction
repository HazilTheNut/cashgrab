# classes/griefer/pmtl_griefer_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses Crash Landing ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown (in ms)
#	cv_D	:	Creeper in a Bottle charge
#	cv_E	:	
#	cv_F	:	Player Y position, in mm
#	cv_G	:	Crash Landing cutoff height, in mm
#	cv_H	:	Creeper fuse timer


scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 7

effect give @a[tag=t_pm_owner,limit=1] minecraft:levitation 1 35 true

playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 3.0 1.0

# Release player if they were grabbed
tag @a[tag=t_pm_owner,limit=1] add t_grab_release
