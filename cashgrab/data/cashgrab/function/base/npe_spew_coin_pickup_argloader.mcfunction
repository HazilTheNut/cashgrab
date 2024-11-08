# base/npe_spew_coin_pickup_argloader.mcfunction
#
# Context: 
#	as: a player
#	at: the entity
#
# Summary: Loads arguments for and runs cashgrab:base/npe_spew_coin_pickup
#
# Arguments: (none)

execute store result storage cashgrab:spew_coin_args vx double 0.001 run random value -90..90
execute store result storage cashgrab:spew_coin_args vz double 0.001 run random value -90..90

function cashgrab:base/npe_spew_coin_pickup with storage cashgrab:spew_coin_args
