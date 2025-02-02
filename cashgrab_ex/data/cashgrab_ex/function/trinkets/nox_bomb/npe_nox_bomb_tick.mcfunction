# trinkets/nox_bomb/npe_nox_bomb_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Nox Bomb missile tick function
#
# Arguments: (none)

particle minecraft:dust{color:[0.45f,0.9f,0.15f],scale:1.0} ~ ~ ~ 0 0 0 0 1
particle minecraft:entity_effect{color:[0.35f,0.6f,0.15f,0.75f]} ~ ~ ~ 0 0 0 0 1
