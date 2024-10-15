# base/pmtl_consume_coinplate_argloader.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position, which must also be a coin plate
#	rotated: as the owner
#
# Summary: Loads args for and runs cashgrab:base/pmtl_consume_coinplate
#
# Arguments: (none)

execute store result storage cashgrab:consume_coinplate_args qty int 1 run scoreboard players get NUM_COINS_PER_COINPLATE num
function cashgrab:base/pmtl_consume_coinplate with storage cashgrab:consume_coinplate_args
