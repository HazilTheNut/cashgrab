# base/npe_grab.mcfunction
#
# Context:
#	as: a nonplayer entity
#	at: the entity
#
# Summary: Updates grab_state for entities and sets gravity attributes accordingly
#
# Arguments: (none)

# Find owner and tag them with t_pm_owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_grab_subject

function cashgrab:base/npe_grab_common

tag @a remove t_grab_subject
