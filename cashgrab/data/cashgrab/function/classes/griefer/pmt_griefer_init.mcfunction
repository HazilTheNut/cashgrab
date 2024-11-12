# classes/griefer/pmt_griefer_equip.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Griefer class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Crash Landing state (0 = inactive, 1 = active)
#	cv_B	:	Crash Landing levitation timer
#	cv_C	:	Creeper in a Bottle cooldown (in ms)
#	cv_D	:	Creeper in a Bottle charge
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	Creeper fuse timer

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 9000
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max 1
scoreboard players set @a[tag=t_pm_owner,limit=1] ability_charges 1

scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 0
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_D 1

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_xpbottles 0