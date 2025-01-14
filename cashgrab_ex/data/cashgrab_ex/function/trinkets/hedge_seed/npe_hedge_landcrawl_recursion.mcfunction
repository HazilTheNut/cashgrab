# trinkets/hedge_seed/npe_hedge_landcrawl_recursion.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Recursion call for cashgrab_ex:trinkets/hedge_seed/npe_hedge_landcrawl
#
# Arguments:
#   y_offset    : y offset of hedge placement

# Place hedge timer
$execute positioned ~ ~$(y_offset) ~ run function cashgrab_ex:trinkets/hedge_seed/npe_place_hedge_timer

# Loop
$execute positioned ~ ~$(y_offset) ~ run function cashgrab_ex:trinkets/hedge_seed/npe_hedge_landcrawl
