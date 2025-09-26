# base/pmt_trinket_determine_offhand.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Handles detection of whether trinket is in offhand or not
#
# Arguments: (none)

#execute store success score @a[tag=t_pm_owner,limit=1] trinket_in_offhand run execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand *[custom_data={is_trinket:1}]

execute if score @a[tag=t_pm_owner,limit=1] __trinket_cfg_pos matches 0 store result score @a[tag=t_pm_owner,limit=1] trinket_in_offhand run data get entity @s data.class_info.trinket_default_offhand
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__trinket_cfg_pos=1}] trinket_in_offhand 0
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__trinket_cfg_pos=2}] trinket_in_offhand 1
