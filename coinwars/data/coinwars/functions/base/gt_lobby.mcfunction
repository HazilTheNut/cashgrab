# base/gt_lobby.mcfunction
#
# Context: Global tick
#
# Summary: Handles when to issue the "t_return_to_lobby" tag. The map will handle teleporting players with t_return_to_lobby as well as removing the tag
#
# Arguments: (none)

# Detect new players (with an eid_state of 0)
scoreboard players add @a eid_state 0
scoreboard players set @a[scores={eid_state=0}] team_id 0
tag @a[scores={eid_state=0}] add t_return_to_lobby
execute as @a[scores={eid_state=0}] run function coinwars:util/pe_eid_acquire

# Detect players returning to the server after leaving
tag @a[scores={__iev_logout=1..}] add t_return_to_lobby
execute as @a[scores={__iev_logout=1..}] run function coinwars:base/pe_cleanup
clear @a[scores={__iev_logout=1..}]
scoreboard players set @a[scores={__iev_logout=1..}] coins 0
scoreboard players set @a[scores={__iev_logout=1..}] __iev_logout 0

# Clean up players who have died
execute as @a[scores={__iev_death=1..}] run function coinwars:base/pe_cleanup
execute as @a[scores={__iev_death=1..}] run function coinwars:base/pe_create_coinshower
spawnpoint @a[scores={__iev_death=1..}] 0 100 0
tag @a[scores={__iev_death=1..}] add t_died
clear @a[scores={__iev_death=1..}]
scoreboard players set @a[scores={__iev_death=1..}] class 0
scoreboard players set @a[scores={__iev_death=1..}] __iev_death 0

# Clean up ownerless entities if player count has changed
execute if score NUM_PLAYERCOUNT_CHANGED num matches 1 as @e[scores={eid_state=1..}] run function coinwars:base/pe_cleanup_if_ownerless

# Return respawned players to the lobby
tag @a[scores={stat_alive_ticks=1..},tag=t_died] add t_return_to_lobby
tag @a[scores={stat_alive_ticks=1..},tag=t_died] remove t_died

# Reset class id for players who are returned to the lobby
scoreboard players set @a[tag=t_return_to_lobby] class 0
