# classes/vampire/vampire_mark_timer_start.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#
# Summary: Vampire's Mark timer start
#
# Arguments: (none)

# Apply weakness and display subtitle text.
title @a[tag=t_timer_owner,limit=1] actionbar {"text":"MARKED!","bold":true,"color":"yellow"}
effect give @a[tag=t_timer_owner,limit=1] minecraft:weakness 7 1