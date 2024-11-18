# classes/cloudbreaker/pmtl_cloudbreaker_cts_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Class-and-Trinket tick function for Cloudbreaker class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Nimbus Stride duration remaining, in ticks
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Thunder Seed charge
#	cv_F	:	Thunder Seed cooldown, in ms
#	cv_G	:	
#	cv_H	:	

execute if score @a[tag=t_pm_owner,limit=1] evc_torchflower_seeds matches 1.. run function cashgrab:util/pmt_inv_refresh

# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_torchflower_seeds 0
