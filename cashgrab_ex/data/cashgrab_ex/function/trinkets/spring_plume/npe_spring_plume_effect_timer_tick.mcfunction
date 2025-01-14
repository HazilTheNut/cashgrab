# trinkets/spring_plume/npe_spring_plume_effect_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Spring Plume timer tick function, handles granting slow falling potion effect
#
# Arguments: (none)

# Give slow falling effect if player jumps
effect give @a[tag=t_timer_owner,limit=1,scores={evl_jump=1..}] minecraft:slow_falling 3

# Remove slow falling if player is on the ground
effect clear @a[tag=t_timer_owner,limit=1,scores={ps_falling=..0}] minecraft:slow_falling

# Display particles
particle minecraft:effect ~ ~0.2 ~ 0.05 0.15 0.05 0 1 normal
