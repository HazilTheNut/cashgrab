# base/pmt_trinket_determine_slot.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Handles detection of whether trinket is in offhand or not
#
# Arguments: (none)

#execute store success score @a[tag=t_pm_owner,limit=1] trinket_in_offhand run execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand *[custom_data={is_trinket:1}]

# Calculate hotbar slot
execute if score @a[tag=t_pm_owner,limit=1] trinket_cfg_pos matches 0 store result score @a[tag=t_pm_owner,limit=1] __trinket_slot_id run data get entity @s data.class_info.trinket_default_hotbar_slot
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={trinket_cfg_pos=1}] __trinket_slot_id 3

# Allow t_trinket_force_hotbar to override
scoreboard players set @a[tag=t_pm_owner,limit=1,tag=t_trinket_force_hotbar] __trinket_slot_id 3

# Determine trinket_in_offhand
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__trinket_slot_id=-1}] trinket_in_offhand 1
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__trinket_slot_id=0..}] trinket_in_offhand 0

