# classes/titan/pmt_titan_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Titan class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Power Strike cooldown timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cooldown_ticks 260
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1
