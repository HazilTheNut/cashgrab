# base/npe_cleanup.mcfunction
#
# Context:
#	as: a nonplayer entity with nonzero eid_state
#
# Summary: Tags self and subordinates to the executor and tags them all as t_cleanup
#
# Arguments:
#   b_self_destruct  : if 1, call end functions and/or destroy caller

tag @s add t_cleanup

function cashgrab:util/npe_eid_find_subs

execute store result score @s temp_A run execute if entity @e[scores={eid_state=1..,eid_compare=0}]

tellraw @a[tag=t_debug] [{"type":"text","text":"base/npe_cleanup eid_self: "},{"type":"score","score":{"name":"@s","objective":"eid_self"}},{"type":"text","text":" eid_owner: "},{"type":"score","score":{"name":"@s","objective":"eid_owner"}},{"type":"text","text":" num subs: "},{"type":"score","score":{"name":"@s","objective":"temp_A"}}]

# If cleanup originated from player death, propagate t_cleanup_player_death tag
execute if entity @s[tag=t_cleanup_player_death] run tag @e[scores={eid_state=1..,eid_compare=0}] add t_cleanup_player_death

execute as @e[scores={eid_state=1..,eid_compare=0}] run function cashgrab:base/npe_cleanup_recursion

$execute unless score NUM_ONE num matches $(b_self_destruct) run return 0

# If I am a missile or timer, call my respective end function behaviors
execute if entity @s[type=minecraft:marker,tag=t_missile] at @s rotated as @s run function cashgrab:base/missile_end_cleanup with entity @s data
execute if entity @s[type=minecraft:marker,tag=t_timer] at @s rotated as @s run function cashgrab:base/timer_end_cleanup with entity @s data

# If I am tagged as t_no_self_cleanup, I am not an entity that has code elsewhere that completes the cleanup
#	Thus, destroy myself
execute unless entity @s[tag=t_no_self_cleanup] run return 0
tp @s ~ ~-1000 ~
kill @s
