# classes/vampire/vampire_remnant_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Vampire's Remnant timer tick
#
# Arguments: (none)

particle minecraft:dust{color:[1f,0f,0f],scale:1.0} ~ ~0.5 ~ 0.1 0.1 0.1 0 3

# Check for collision
execute store result score @s temp_B run function cashgrab:util/npe_col_detect_entity {func_npe_entity_filter: "npe_col_entity_filter_owner"}

# If collision was detected, clean up this object and apply desired effects to owner.
execute if entity @s[scores={temp_B=1..}] run tellraw @a[tag=t_debug] "Remnant collision detected"
execute if entity @s[scores={temp_B=1..}] run effect give @a[tag=t_collision_found,limit=1] instant_health 1 0
execute if entity @s[scores={temp_B=1..}] run tag @e[tag=t_vampire_remnant_timer] add t_cleanup
execute if entity @s[scores={temp_B=1..}] run scoreboard players set @s temp_B 0