# base/npe_coinshower_dispense_coin.mcfunction
#
# Context: 
#	as: a player
#	at: the entity
#
# Summary: Dispenses a coin from a coin shower
#
# Arguments:
#	vx	: x velocity of the coin
#	vz	: z velocity of the coin

function cashgrab:base/npe_spew_coin_pickup_argloader

scoreboard players operation @s __coinshower_timer_ticks = @s __coinshower_period_ticks
scoreboard players remove @s __coinshower_coins 1
