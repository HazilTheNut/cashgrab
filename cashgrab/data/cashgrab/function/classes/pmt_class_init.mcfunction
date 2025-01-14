# classes/pmt_class_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Equips a class onto the command executor
#
# Arguments:
#	func_pmt_init	: class init function

# Reset ability cooldown
scoreboard players set @a[tag=t_pm_owner] ability_cd_tickrate 50
scoreboard players set @a[tag=t_pm_owner] ability_cd_ms 0
scoreboard players set @a[tag=t_pm_owner] ability_cd_display_secs 0

# Reset class variables
scoreboard players set @a[tag=t_pm_owner] cv_A 0
scoreboard players set @a[tag=t_pm_owner] cv_B 0
scoreboard players set @a[tag=t_pm_owner] cv_C 0
scoreboard players set @a[tag=t_pm_owner] cv_D 0
scoreboard players set @a[tag=t_pm_owner] cv_E 0
scoreboard players set @a[tag=t_pm_owner] cv_F 0
scoreboard players set @a[tag=t_pm_owner] cv_G 0
scoreboard players set @a[tag=t_pm_owner] cv_H 0

# Remove all potion effects
effect clear @a[tag=t_pm_owner]

# Reset t_trinket_force_hotbar tag
tag @a[tag=t_pm_owner] remove t_trinket_force_hotbar

# Run respective class equipment function
$function $(func_pmt_init)

function cashgrab:util/pmt_inv_refresh