# base/npe_raycast_loop_recursion.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Loops cashgrab:base/npe_raycast_loop
#
# Arguments: (none)

#tellraw @a[tag=t_debug] [{"type":"text","text":"Steps remaining: "},{"type":"score","score":{"name":"@s","objective":"rc_steps_remaining"}}]

function cashgrab:base/npe_raycast_loop with storage cashgrab:rc_args data
