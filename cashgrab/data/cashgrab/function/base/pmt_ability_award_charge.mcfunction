# base/pmt_ability_award_charge.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Awards an ability charge to pm owner and starts next cooldown if more charges need to recharge
#
# Arguments: (none)

# Grant charge and refresh inventory display
execute if score @a[tag=t_pm_owner,limit=1] ability_charges < @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max run scoreboard players add @a[tag=t_pm_owner,limit=1] ability_charges 1
function cashgrab:util/pmt_inv_ability_icon_argloader

# Restart cooldown if more can be recharged
execute if score @a[tag=t_pm_owner,limit=1] ability_charges < @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max run scoreboard players operation @a[tag=t_pm_owner,limit=1] ability_cd_ms = @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms
