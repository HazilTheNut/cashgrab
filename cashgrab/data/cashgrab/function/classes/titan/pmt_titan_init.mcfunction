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
#	cv_A	:	Power Strike cooldown timer (in ms)
#	cv_B	:	Power Strike charge
#	cv_C	:	Power Strike on ground cleanup timer
#	cv_D	:	Power Strike timer originator EID
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 13000
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1

scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_gold_axe_break 0
