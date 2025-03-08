# classes/evincer/pmtl_prismatic_flash_end.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Performs Primsatic Flash teleportation
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

playsound minecraft:block.glass.break player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1.0 0.75 1.0
playsound minecraft:block.glass.break player @a[tag=!t_pm_owner] ~ ~ ~ 1.0 0.75

# If there was an immediate collision, do nothing
$execute if score NUM_END_REASON_TERRAIN_COLLISION_IMMEDIATE num matches $(end_reason) run return 0

execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~-1 ~ #cashgrab:nonsolid run tp @a[tag=t_pm_owner,limit=1] ~ ~-1 ~
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~-1 ~ #cashgrab:nonsolid positioned ~ ~-1 ~ run function cashgrab_ex:classes/evincer/pmtl_prismatic_flash_particles
execute align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~-1 ~ #cashgrab:nonsolid run tp @a[tag=t_pm_owner,limit=1] ~ ~ ~
execute align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~-1 ~ #cashgrab:nonsolid run function cashgrab_ex:classes/evincer/pmtl_prismatic_flash_particles
