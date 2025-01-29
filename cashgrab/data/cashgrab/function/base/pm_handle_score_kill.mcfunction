# base/pm_handle_score_kill.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Handles player kill scoring detection near the end of a server tick
#
# Arguments: (none)

tag @a remove t_pm_owner

# Find owner and tag them with t_pm_owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_pm_owner

# If owner has not scored a kill, clean up and exit
execute if score @a[tag=t_pm_owner,limit=1] evl_player_kills matches ..0 run return run tag @a[tag=t_pm_owner] remove t_pm_owner

# Below only runs when player scores a kill

# =============================
# Handle player kill scoring

tellraw @a[tag=t_debug] "base/pm_handle_score_kill: Player kill caught"

# Run class score kill function
function cashgrab:classes/pmt_class_score_kill with entity @s data.class_info

# Run kill scoring listener code for direct subordinates of player
function cashgrab:util/npe_eid_find_peers
tag @a[tag=t_pm_owner] add t_player_owner
execute as @e[scores={eid_compare=0},tag=t_score_kill_listener,type=minecraft:marker] at @s run function cashgrab:base/npe_score_kill_listener with entity @s data

# Run all kill scoring listener code from plugins
function #cashgrab:pmt_score_kill

# Clean up tag
tag @a[tag=t_pm_owner] remove t_player_owner
tag @a[tag=t_pm_owner] remove t_pm_owner
