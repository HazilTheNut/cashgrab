# base/pmtl_trinket_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Branching tick function for equipped trinket
#
# Arguments:
#	func_pmtl_tick	: function to run every tick

# Track whether trinket is held. trinket_held can be used by trinket code to determine if the player's use item button will use a trinket
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={trinket_in_offhand=0}] trinket_held 0
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_selected_hotbar_slot=3}] unless items entity @a[tag=t_pm_owner,limit=1] hotbar.3 #cashgrab:usable[!custom_data={is_trinket:1}] run scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_held 1
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.* *[custom_data={is_trinket:1}] run scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_held 1
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand *[custom_data={is_trinket:1}] if items entity @a[tag=t_pm_owner,limit=1] weapon.mainhand #cashgrab:usable run scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_held 0

# Track whether trinket is in offhand
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_in_offhand 0
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.offhand *[custom_data={is_trinket:1}] run scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_in_offhand 1

# Branch execution based on equipped trinket
$function $(func_pmtl_tick)
