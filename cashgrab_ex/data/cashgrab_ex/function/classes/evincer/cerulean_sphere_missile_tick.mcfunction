# classes/evincer/cerulean_sphere_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Evincer's Cerulean Sphere missile tick function
#
# Arguments: (none)

particle minecraft:dust{color:[0.00,0.70,1.00],scale:3.0} ~ ~ ~ 0 0 0 0 1 force
particle minecraft:splash ~ ~ ~ 0.1 0.1 0.1 0 1
