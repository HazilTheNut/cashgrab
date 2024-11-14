# trinkets/echo_bolt/npe_echo_bolt_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Echo Bolt missile tick function
#
# Arguments: (none)

particle minecraft:dust{color:[0.1,0.4,0.6],scale:0.75} ~ ~ ~ 0 0 0 0 1
particle minecraft:electric_spark ~ ~ ~ 0.1 0.1 0.1 0 1
