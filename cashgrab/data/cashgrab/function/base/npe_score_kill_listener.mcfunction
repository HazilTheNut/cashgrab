# base/npe_score_kill_listener.mcfunction
#
# Context:
#	as: a non-PM Marker entity
#       + tagged with t_score_kill_listener
#       + has data.func_npe_score_kill function pointer in NBT data
#   at: the entity
#
# Summary: Runs score kill listener code. Player owner is tagged with t_player_owner
#
# Arguments:
#	func_npe_score_kill	: function to run when player owner scores a kill

$function $(func_npe_score_kill)
