# classes/evincer/pmt_evincer_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Evincer class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 7000
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1
