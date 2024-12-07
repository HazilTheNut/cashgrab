# classes/mapmaker/pmt_mapmaker_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Mapmaker class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if Tools are toggled on
#	cv_B	:	Smoothing Tool calculation temp
#	cv_C	:	Lighting Update timer
#	cv_D	:	
#	cv_E	:	Anchor X pos, in m
#	cv_F	:	Anchor Y pos, in m
#	cv_G	:	Anchor Z pos, in m
#	cv_H	:	Page Number

scoreboard players set @a[tag=t_pm_owner] ability_cfg_cd_ms 500
scoreboard players set @a[tag=t_pm_owner] ability_cfg_charges_max 1
scoreboard players set @a[tag=t_pm_owner] ability_charges 1

# Trinket not used with Mapmaker
scoreboard players set @a[tag=t_pm_owner] trinket_charges 0
scoreboard players set @a[tag=t_pm_owner] trinket_charges_max 0

# Clear events
scoreboard players set @a[tag=t_pm_owner] evc_eggs 0
