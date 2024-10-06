# base/pmt_inv_coins_argloader.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Loads args for and runs cashgrab:base/pmt_inv_trinket
#
# Arguments: (none)

# Calculate tens and ones place of coin count
scoreboard players operation @a[tag=t_pm_owner,limit=1] __coins_disp_ones = @a[tag=t_pm_owner,limit=1] coins
scoreboard players operation @a[tag=t_pm_owner,limit=1] __coins_disp_tens = @a[tag=t_pm_owner,limit=1] coins
scoreboard players operation @a[tag=t_pm_owner,limit=1] __coins_disp_ones %= NUM_TEN num
scoreboard players operation @a[tag=t_pm_owner,limit=1] __coins_disp_tens /= NUM_TEN num

execute store result storage cashgrab:args_coindisplay coins_ones int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __coins_disp_ones
execute store result storage cashgrab:args_coindisplay coins_tens int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __coins_disp_tens

# If the ones or tens place is zero, replace it with a value the inventory system likes more
execute if entity @a[tag=t_pm_owner,limit=1,scores={__coins_disp_ones=..0}] run data merge storage cashgrab:args_coindisplay {coins_ones:1}
execute if entity @a[tag=t_pm_owner,limit=1,scores={__coins_disp_tens=..0}] run data merge storage cashgrab:args_coindisplay {coins_tens:1}

function cashgrab:base/pmt_inv_coins with storage cashgrab:args_coindisplay
