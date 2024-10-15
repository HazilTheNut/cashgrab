# base/npe_grab.mcfunction
#
# Context:
#	as: a nonplayer entity
#	at: the entity
#
# Summary: Updates grab_state for entities and sets gravity attributes accordingly
#
# Arguments: (none)

tag @s add t_grab_subject

function cashgrab:base/npe_grab_common

tag @s remove t_grab_subject
