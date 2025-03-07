# classes/evincer/pmtl_evincer_cast_pearlescent_wave.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Casts Pearlescent Wave
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

particle item{item:"minecraft:iron_sword"} ~ ~ ~ 0.5 0.5 0.5 0.25 20

execute rotated ~-30 ~ run function cashgrab_ex:classes/evincer/pmtl_evincer_create_pearlescent_wave_missile
execute rotated ~-15 ~ run function cashgrab_ex:classes/evincer/pmtl_evincer_create_pearlescent_wave_missile
execute rotated ~0 ~ run function cashgrab_ex:classes/evincer/pmtl_evincer_create_pearlescent_wave_missile
execute rotated ~15 ~ run function cashgrab_ex:classes/evincer/pmtl_evincer_create_pearlescent_wave_missile
execute rotated ~30 ~ run function cashgrab_ex:classes/evincer/pmtl_evincer_create_pearlescent_wave_missile
