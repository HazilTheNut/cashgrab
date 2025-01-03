# base/npe_main.mcfunction
#
# Context:
#	as: a non-player, non-PM entity
#
# Summary: Top-level function call for non-player entities to be run every server tick
#
# Arguments: (none)

# TODO: figure out how to use @s target selectors to check if I am dead and return if so

# All dropped item entities are destroyed except for those that are tagged as "t_pickup"
kill @s[type=minecraft:item,tag=!t_pickup]

execute if entity @s[type=minecraft:marker,tag=t_missile] at @s rotated as @s run function cashgrab:base/missile_main with entity @s data
execute if entity @s[type=minecraft:marker,tag=t_timer] at @s rotated as @s run function cashgrab:base/timer_main with entity @s data
execute if entity @s[type=minecraft:marker,tag=t_coinshower] at @s run function cashgrab:base/npe_coinshower

kill @s[type=minecraft:egg]
kill @s[type=minecraft:experience_bottle]
execute as @s[type=minecraft:arrow,tag=!t_stasis,nbt={inGround:1b}] at @s run function cashgrab:base/arrow_cleanup

# If I am being cleaned up and I have no cleanup routine, self destruct
execute if entity @s[tag=t_cleanup,tag=t_no_self_cleanup] run function cashgrab:base/npe_cleanup {b_self_destruct:1}
