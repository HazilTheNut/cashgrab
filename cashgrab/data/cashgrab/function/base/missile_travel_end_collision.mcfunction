# base/missile_travel_end_cleanup.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Runs missile end function with the appropriate collision end_reason, then kills the missile
#
# Arguments:
#	func_npe_end			: String function name to run when either the missile collides or expires

$execute if entity @s[scores={__col_terrain=1..}] run function $(func_npe_end) {end_reason:20}
$execute if entity @s[scores={__col_terrain=0,__col_entity=1..}] run function $(func_npe_end) {end_reason:30}

function cashgrab:base/npe_cleanup {b_self_destruct:0}
scoreboard players reset @s
kill @s