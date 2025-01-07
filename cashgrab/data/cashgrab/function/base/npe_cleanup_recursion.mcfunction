# base/npe_cleanup_recursion.mcfunction
#
# Context:
#	as: a nonplayer entity with nonzero eid_state
#
# Summary: Performs recursion for cashgrab:npe_cleanup
#
# Arguments: (none)

function cashgrab:base/npe_cleanup {b_self_destruct:1}