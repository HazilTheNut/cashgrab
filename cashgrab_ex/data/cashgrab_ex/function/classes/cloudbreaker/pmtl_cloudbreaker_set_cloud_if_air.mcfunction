# classes/cloudbreaker/pmtl_cloudbreaker_set_cloud_if_air.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: where the block should be placed
#	rotated: as the owner
#
# Summary: Places a cloud timer if the execution location is air
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

execute align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~ ~ minecraft:air run return 0

execute align xyz positioned ~0.5 ~0.5 ~0.5 run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:3,\
b_anchor_at_pos:1,\
t_timer_name:"t_cloudbreaker_cloud_init",\
func_npe_start:"cashgrab_ex:classes/cloudbreaker/cloud_timer_start",\
func_npe_tick:"cashgrab:util/noop",\
func_npe_end:"cashgrab_ex:classes/cloudbreaker/cloud_timer_end",\
b_assign_as_peer:1,\
}

tag @n[tag=t_cloudbreaker_cloud_init] add t_stasis_immune
tag @n[tag=t_cloudbreaker_cloud_init] add t_cloudbreaker_cloud
tag @n[tag=t_cloudbreaker_cloud_init] remove t_cloudbreaker_cloud_init
