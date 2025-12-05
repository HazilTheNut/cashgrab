# classes/dancer/dancer_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Dancer's Sforzando missile tick function
#
# Arguments: (none)

particle minecraft:note ~ ~ ~ 0 0 0 0.5 1 force

# Check if conditions necessary for a missile offset are present
execute unless score @s mis_lifetime_ticks matches 1 run return 0
execute if score @s stasis_state matches 1..2 run return 0


