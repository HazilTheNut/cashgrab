# base/pmt_tick_gameplay.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Runs behavior for Gameplay activity_state
#
# Arguments: (none)

# Run tick functions for trinket
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_trinket_tick with entity @s data.trinket_info

# Run toss ability code - this happens after trinket function
#   so inventory refreshes do not interfere with counting trinket quantity
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_ability

# Run tick functions for class
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:classes/pmtl_class_tick with entity @s data.class_info

# Handle coin mechanics and scoring
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_coins
function cashgrab:base/pmt_scoring