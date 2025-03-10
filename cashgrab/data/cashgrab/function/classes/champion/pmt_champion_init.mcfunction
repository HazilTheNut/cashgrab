# classes/champion/pmt_champion_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Champion class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Bastion (shield) durability/hits remaining
#	cv_F	:	Bastion (shield) refresh cooldown, in ms
#	cv_G	:	
#	cv_H	:	

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 12000
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1

# Start with full durability on shield
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 5
