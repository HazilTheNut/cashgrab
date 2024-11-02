# base/missile_main.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Runs missile end function with the reason of being cleaned up
#
# Arguments:
#	func_npe_end			: String function name to run when either the missile collides or expires

# Self-destruct if cleaned up
$function $(func_npe_end) {end_reason:0}
kill @s
