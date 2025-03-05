# trinkets/nox_bomb/npe_nox_bomb_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Nox Bomb splash effect
#
# Arguments: (none)

# vfx / sfx
particle minecraft:dust{color:[0.45f,0.9f,0.15f],scale:1.0} ~ ~ ~ 2.40 0.05 2.40 0 65
particle minecraft:entity_effect{color:[0.35f,0.6f,0.15f,0.75f]} ~ ~ ~ 2.40 0.05 2.40 0 65
playsound minecraft:entity.generic.extinguish_fire player @a ~ ~ ~ 1.0 1.5

# Apply poison
function cashgrab:util/npe_col_entity_filter_hostile
execute positioned ~-6 ~-2 ~-6 run effect give @e[tag=t_collision_candidate,dx=11,dy=4,dz=11] minecraft:poison 10
execute positioned ~-6 ~-2 ~-6 run effect give @e[tag=t_collision_candidate,dx=11,dy=4,dz=11] minecraft:slowness 10

