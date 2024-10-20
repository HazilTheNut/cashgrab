# classes/griefer/pmtl_griefer_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Griefer class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	Player Y position, in mm
#	cv_G	:	Crash Landing cutoff height, in mm
#	cv_H	:	Creeper fuse timer

execute if score @a[tag=t_pm_owner,limit=1] evc_xpbottles matches 1.. run function cashgrab:util/pmt_inv_refresh

# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_xpbottles 0