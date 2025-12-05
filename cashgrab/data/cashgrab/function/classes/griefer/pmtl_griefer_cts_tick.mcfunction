# classes/griefer/pmtl_griefer_cts_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Class-and-Trinket tick function for Griefer class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper Conduit cooldown (in ms)
#	cv_D	:	Creeper Conduit charge
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Creeper fuse timer

execute if score @a[tag=t_pm_owner,limit=1] evc_xpbottles matches 1.. run function cashgrab:util/pmt_inv_refresh

# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_xpbottles 0
