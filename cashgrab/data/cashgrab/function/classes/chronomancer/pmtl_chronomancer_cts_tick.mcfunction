# classes/chronomancer/pmtl_chronomancer_cts_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Class-and-Trinket tick function for Chronomancer class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if crossbow is in offhand, and 0 otherwise
#	cv_B	:	Crossbow reload timer
#	cv_C	:	1 if crossbow is loaded, and 0 otherwise
#	cv_D	:	
#	cv_E	:	1 if Stasis field is active, and 0 otherwise
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Track position of the crossbow in inventory
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand minecraft:crossbow run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1

# If player used crossbow, delete arrow
execute if score @a[tag=t_pm_owner,limit=1] evl_crossbows matches 1.. run kill @e[type=minecraft:arrow,limit=1,sort=nearest,distance=..3]
execute if score @a[tag=t_pm_owner,limit=1] evl_crossbows matches 1.. run function cashgrab:util/pmt_inv_refresh
