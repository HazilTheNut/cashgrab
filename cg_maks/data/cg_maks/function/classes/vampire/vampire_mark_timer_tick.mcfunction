# classes/vampire/vampire_mark_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#
# Summary: Vampire's Mark timer tick
#
# Arguments: (none)

#Play particles above targets head.
particle minecraft:dust{color:[1f,0f,0f],scale:1.0} ~ ~3 ~ 0.1 0.1 0.1 0 2 force

#Have a second color of particle for the player who applied the mark.
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s cv_B
function cashgrab:util/find_eid_self with storage cashgrab:eid_args

particle minecraft:dust{color:[1f,0.7f,0.35f],scale:1.0} ~ ~3 ~ 0.2 0.2 0.2 0 2 normal @a[tag=t_eid_matches,limit=1]