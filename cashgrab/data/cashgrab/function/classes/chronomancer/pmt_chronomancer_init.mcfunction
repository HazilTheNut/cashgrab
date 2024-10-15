# classes/chronomancer/pmt_chronomancer_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Chronomancer class onto the command executor
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

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cooldown_ticks 200
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1

# Initialize with crossbow loaded
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 1
