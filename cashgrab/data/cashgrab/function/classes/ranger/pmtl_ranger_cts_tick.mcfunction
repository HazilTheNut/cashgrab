# classes/ranger/pmtl_ranger_cts_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Class-and-Trinket tick function for Ranger class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	Wall Climb sound effect timer
#	cv_D	:	
#	cv_E	:	Arrow count
#	cv_F	:	Crossbow state (0 = unloaded, 1 = loaded)
#	cv_G	:	
#	cv_H	:	

# If player used crossbow, delete arrow
execute if score @a[tag=t_pm_owner,limit=1] evl_crossbows matches 1.. run kill @e[type=minecraft:arrow,limit=1,sort=nearest,distance=..3]
execute if score @a[tag=t_pm_owner,limit=1] evl_crossbows matches 1.. run function cashgrab:util/pmt_inv_refresh
