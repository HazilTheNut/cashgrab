# base/npe_coinshower.mcfunction
#
# Context: 
#	as: a coin shower marker
#	at: the entity
#
# Summary: Operates coin shower behavior
#
# Arguments: (none)

# Dispense a coin when the shower's timer reaches 0 and it has a coin to drop
execute if entity @s[scores={__coinshower_timer_ticks=0,__coinshower_coins=1..}] store result entity @s data.vx double 0.001 run random value -90..90
execute if entity @s[scores={__coinshower_timer_ticks=0,__coinshower_coins=1..}] store result entity @s data.vz double 0.001 run random value -90..90
execute if entity @s[scores={__coinshower_timer_ticks=0,__coinshower_coins=1..}] run function coinwars:base/npe_coinshower_dispense_coin with entity @s data

# Destroy coin shower when it has no more coins to drop
scoreboard players reset @s[scores={__coinshower_coins=..0}]
kill @s[scores={__coinshower_coins=..0}]

# Decrement coin shower timers
scoreboard players remove @s[scores={__coinshower_timer_ticks=1..}] __coinshower_timer_ticks 1
