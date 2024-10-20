# classes/alchemist/pmt_alchemist_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Alchemist class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Grant potions on equip
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 25000
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max 2
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 2

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_potions 0
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_splash_potions 0
