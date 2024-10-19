# base/pmt_trinket_count.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Counts number of trinkets in inventory and writes sum to trinket_charges
#
# Arguments: (none)

# Get trinket quantity on both hotbar and offhand
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 0
execute store result score @a[tag=t_pm_owner,limit=1] temp_A run execute if items entity @a[tag=t_pm_owner,limit=1] hotbar.* *[minecraft:custom_data={is_trinket:1}]
scoreboard players operation @a[tag=t_pm_owner,limit=1] trinket_charges += @a[tag=t_pm_owner,limit=1] temp_A
execute store result score @a[tag=t_pm_owner,limit=1] temp_A run execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand *[minecraft:custom_data={is_trinket:1}]
scoreboard players operation @a[tag=t_pm_owner,limit=1] trinket_charges += @a[tag=t_pm_owner,limit=1] temp_A
