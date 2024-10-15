# classes/skirmisher/pmt_skirmisher_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Skirmisher class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Held item: 0 = neither sword, 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_B	:	Item config: 0 = has both, 1 = only Cleaving Cutlass, 2 = only Dancing Rapier
#	cv_C	:	If 1, refresh inventory
#	cv_D	:	
#	cv_E	:	Boomerang type: 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cooldown_ticks 300
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1

