# classes/ranger/pmtl_ranger_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses Craft Arrows ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Arrow count
#	cv_F	:	Crossbow state (0 = unloaded, 1 = loaded)
#	cv_G	:	
#	cv_H	:	

scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 3
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_F 1

playsound minecraft:item.flintandsteel.use player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1.0 0.5

function cashgrab:util/pmt_inv_refresh
