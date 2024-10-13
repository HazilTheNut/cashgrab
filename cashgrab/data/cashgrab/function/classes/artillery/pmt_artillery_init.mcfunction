# classes/artillery/pmt_artillery_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Artillery class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cooldown_ticks 240
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges 3
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 3
