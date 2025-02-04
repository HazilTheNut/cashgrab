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

# vfx
particle minecraft:dust{color:[0.45f,0.9f,0.15f],scale:1.0} ~ ~ ~ 0 0 0 0 1
particle minecraft:entity_effect{color:[0.35f,0.6f,0.15f,0.75f]} ~ ~ ~ 0 0 0 0 1

execute if score @s stasis_state matches 1..2 run return 0

# sfx
scoreboard players add @s tv_A 1
scoreboard players set @s[scores={tv_A=4..}] tv_A 0

execute if score @s tv_A matches 0 run playsound block.bubble_column.upwards_ambient player @a ~ ~ ~ 0.5 1.75
