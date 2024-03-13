# base/pe_display_coins_argloader.mcfunction
#
# Context:
#	as: a player
#
# Summary: Loads arguments for base/pe_display_coins then runs it

# Calculate tens and ones place of coin count
scoreboard players operation @s __coins_disp_ones = @s coins
scoreboard players operation @s __coins_disp_tens = @s coins
scoreboard players operation @s __coins_disp_ones %= NUM_TEN num
scoreboard players operation @s __coins_disp_tens /= NUM_TEN num

execute store result storage coinwars:args_coindisplay coins_ones int 1 run scoreboard players get @s __coins_disp_ones
execute store result storage coinwars:args_coindisplay coins_tens int 1 run scoreboard players get @s __coins_disp_tens

# If the ones or tens place is zero, replace it with a value the inventory system likes more
execute if entity @s[scores={__coins_disp_ones=..0}] run data merge storage coinwars:args_coindisplay {coins_ones:1}
execute if entity @s[scores={__coins_disp_tens=..0}] run data merge storage coinwars:args_coindisplay {coins_tens:1}


function coinwars:base/pe_display_coins with storage coinwars:args_coindisplay
