# classes/vampire/pmt_vampire_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Vampire class onto the command executor
#
# Arguments: (none)

# Class variable usage: TODO Document these!
#	cv_A	:	Marked target timer
#	cv_B	:	Pointer to this Vampire
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 25000
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] cv_B = @a[tag=t_pm_owner,limit=1] eid_self