# classes/mapmaker/pmt_mapmaker_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips the Mapmaker class onto the command executor
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner] ability_cfg_cd_ms 500
scoreboard players set @a[tag=t_pm_owner] ability_cfg_charges_max 1
scoreboard players set @a[tag=t_pm_owner] ability_charges 1

# Clear events
scoreboard players set @a[tag=t_pm_owner] evc_maps 0
