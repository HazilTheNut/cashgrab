# trinkets/spring_plume/npe_spring_plume_effect_timer_end.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Spring Plume timer end function
#
# Arguments: (none)

# Remove slow falling effect
effect clear @a[tag=t_timer_owner,limit=1] minecraft:slow_falling
