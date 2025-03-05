# classes/alchemist/pmtl_alchemist_cts_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Class-and-Trinket tick function for Alchemist class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	
#	cv_H	:	

# Always treat Caustic Fume and Booster Brew to be in inventory
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1

# Remove empty bottles produced from drinking Booster Brew
clear @a[tag=t_pm_owner,limit=1] minecraft:glass_bottle

# If player used splash potion, delete it
execute if score @a[tag=t_pm_owner,limit=1] evc_splash_potions matches 1.. run kill @e[type=minecraft:potion,limit=1,sort=nearest,distance=..3]

# If player uses potions, refresh inv
execute if score @a[tag=t_pm_owner,limit=1] evc_potions matches 1.. run function cashgrab:util/pmt_inv_refresh
execute if score @a[tag=t_pm_owner,limit=1] evc_splash_potions matches 1.. run function cashgrab:util/pmt_inv_refresh

# Consume events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_potions 0
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_splash_potions 0
