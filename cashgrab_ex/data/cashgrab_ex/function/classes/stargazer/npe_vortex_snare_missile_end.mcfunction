# classes/stargazer/npe_vortex_snare_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Vortex Snare missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

$execute if score NUM_END_REASON_CLEANUP num matches $(end_reason) run return 0
$execute if score NUM_END_REASON_CLEANUP_PLAYER_DEATH num matches $(end_reason) run return 0

# Place timer
execute positioned ^ ^ ^-0.25 align y positioned ~ ~0.25 ~ run function cashgrab_ex:classes/stargazer/npe_vortex_snare_missile_place_timer
