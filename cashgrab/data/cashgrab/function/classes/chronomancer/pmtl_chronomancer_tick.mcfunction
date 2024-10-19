# classes/chronomancer/pmtl_chronomancer_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Chronomancer class
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

# Track loaded state of crossbow
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 1
execute if items entity @a[tag=t_pm_owner,limit=1] hotbar.* minecraft:crossbow[minecraft:count=1,minecraft:charged_projectiles=[]] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 0
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.* minecraft:crossbow[minecraft:count=1,minecraft:charged_projectiles=[]] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 0

# Upon firing an arrow, initiate reload timer
execute if score @a[tag=t_pm_owner,limit=1] evl_crossbows matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 50

# Decrement reload timer and reload when complete
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_B=0..}] cv_B 1
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_B=5..},tag=t_stasis] cv_B 5
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 0 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 1
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 0 run function cashgrab:classes/chronomancer/pmt_chronomancer_inv_crossbow

# Update crossbow after firing an arrow
execute if score @a[tag=t_pm_owner,limit=1] evl_crossbows matches 1.. run function cashgrab:classes/chronomancer/pmt_chronomancer_inv_crossbow

# Update Crossbow when entering or exiting stasis
execute if score @a[tag=t_pm_owner,limit=1] stasis_state matches -1 run function cashgrab:classes/chronomancer/pmt_chronomancer_inv_crossbow
execute if score @a[tag=t_pm_owner,limit=1] stasis_state matches 2 run function cashgrab:classes/chronomancer/pmt_chronomancer_inv_crossbow

