# trinkets/nox_bomb/npe_nox_bomb_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Nox Bomb secondary missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

$execute unless score NUM_END_REASON_TERRAIN_COLLISION num matches $(end_reason) run return 0

function cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_splash
