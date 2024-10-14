# classes/frostknight/pmt_frostknight_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Frost Knight class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Glacier height

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cooldown_ticks 180
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges 2
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 2
