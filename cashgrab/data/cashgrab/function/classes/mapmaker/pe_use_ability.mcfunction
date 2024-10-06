# classes/mapmaker/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = -10
#	at: the entity
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Toggle cv_A value
scoreboard players add @s cv_A 1
scoreboard players set @s[scores={cv_A=2..}] cv_A 0

effect give @s[scores={cv_A=1}] minecraft:night_vision infinite
effect clear @s[scores={cv_A=0}] minecraft:night_vision
