# classes/stargazer/npe_vortex_snare_timer_tick.mcfunction
#
# Context:
#	as: a timer or missile
#	at: the timer or missile
#	facing: the entity's facing direction
#
# Summary: Vortex Snare bounding box particles function
#
# Arguments: (none)

particle minecraft:dust{color:[0.42,0.18,0.66],scale:1} ~-4.4 ~-0.35 ~ 0.02 0.02 2 0 6
particle minecraft:dust{color:[0.42,0.18,0.66],scale:1} ~4.4 ~-0.35 ~ 0.02 0.02 2 0 6
particle minecraft:dust{color:[0.42,0.18,0.66],scale:1} ~ ~-0.35 ~-4.4 2 0.02 0.02 0 6
particle minecraft:dust{color:[0.42,0.18,0.66],scale:1} ~ ~-0.35 ~4.4 2 0.02 0.02 0 6

