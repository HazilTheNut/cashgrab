# classes/evincer/pmtl_prismatic_flash_particles.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Plays particles for Primsatic
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

execute if entity @a[tag=t_pm_owner,scores={cv_A=1}] run particle minecraft:block{block_state:"minecraft:resin_block"} ~ ~ ~ 0.5 0.75 0.5 0.1 40
execute if entity @a[tag=t_pm_owner,scores={cv_A=2}] run particle minecraft:block{block_state:"minecraft:pearlescent_froglight"} ~ ~ ~ 0.5 0.75 0.5 0.1 40
execute if entity @a[tag=t_pm_owner,scores={cv_A=3}] run particle minecraft:block{block_state:"minecraft:prismarine"} ~ ~ ~ 0.5 0.75 0.5 0.1 40
