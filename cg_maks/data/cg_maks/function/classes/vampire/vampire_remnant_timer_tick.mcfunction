# classes/vampire/vampire_remnant_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#
# Summary: Vampire's Remnant timer tick
#
# Arguments: (none)

# Fall to the nearest eligible terrain if necessary
execute if block ~ ~-1 ~ #cashgrab:nonsolid align y positioned ~ ~-1 ~ run tp @s ~ ~ ~

# Base particle display
particle minecraft:dust{color:[1f,0f,0f],scale:1.0} ~ ~0.5 ~ 0.1 0.1 0.1 0 2

# Find owner and display special particles for them.
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
particle minecraft:dust{color:[1f,0.7f,0.35f],scale:1.0} ~ ~0.5 ~ 0.2 0.2 0.2 0 2 normal @a[tag=t_eid_matches,limit=1]