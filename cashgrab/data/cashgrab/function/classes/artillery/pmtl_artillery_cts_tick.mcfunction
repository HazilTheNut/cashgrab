# classes/artillery/pmtl_artillery_cts_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Class-and-Trinket tick function for Artillery class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Power Shot charge
#	cv_F	:	Power Shot cooldown, in ms
#	cv_G	:	
#	cv_H	:	

# If player used crossbow, delete arrow
execute if score @a[tag=t_pm_owner,limit=1] evl_bows matches 1.. run kill @e[type=minecraft:arrow,limit=1,sort=nearest,distance=..3]
execute if score @a[tag=t_pm_owner,limit=1] evl_bows matches 1.. run function cashgrab:classes/artillery/pmt_artillery_inv_bow_and_arrow
