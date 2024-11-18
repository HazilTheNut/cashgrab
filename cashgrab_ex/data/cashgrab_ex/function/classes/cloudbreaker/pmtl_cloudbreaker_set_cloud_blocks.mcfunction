# classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_blocks.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: where the block should be placed
#	rotated: as the owner
#
# Summary: Places cloud timers beneath player
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

execute positioned ~-1 ~-1 ~-1 run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air
execute positioned ~-1 ~-1 ~ run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air
execute positioned ~-1 ~-1 ~1 run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air
execute positioned ~ ~-1 ~-1 run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air
execute positioned ~ ~-1 ~ run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air
execute positioned ~ ~-1 ~1 run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air
execute positioned ~1 ~-1 ~-1 run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air
execute positioned ~1 ~-1 ~ run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air
execute positioned ~1 ~-1 ~1 run function cashgrab_ex:classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air
