# classes/dancer/pmt_dancer_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Dancer class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Tempo Stacks (0-3)
#	cv_B	:	Tempo Hit Combo Window
#	cv_C	:	Tempo Timer (if necessary)
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 12000
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1