# base/gt_playerinit_loop.mcfunction
#
# Context: Global tick
#
# Summary: Assigns EIDs to all players with reinitialize set to 1+
#
# Arguments: (none)

# Tag a player with t_player_initialize
tag @r[scores={reinitialize=1..}] add t_player_initialize

# Invalidate eid_state as it is being overwritten
scoreboard players set @a[tag=t_player_initialize] eid_state 0

# Assign initializing player their EID
function cashgrab:base/gt_playerinit_loop_assign_eid

# ---- Past this point, the initializing player has received a valid EID

# Generate a Player Monitor marker (pm) at 0,100,0 whose owner is this new player
# pms occupy an eid space = 10001-19999 that is their owner's eid + 10000
summon minecraft:marker 0 100 0 {Tags:["t_pm_init"],CustomName:"pm"}
scoreboard players operation @e[tag=t_pm_init,limit=1] eid_owner = @a[tag=t_player_initialize,limit=1] eid_self
scoreboard players operation @e[tag=t_pm_init,limit=1] eid_self = @e[tag=t_pm_init,limit=1] eid_owner
scoreboard players add @e[tag=t_pm_init,limit=1] eid_self 10000
scoreboard players set @e[tag=t_pm_init,limit=1] eid_state 1
# Set selected indices to bad values. pm will eventually pick on this and import owner player's selections as well as load data from cashgrab:game_info.classes
scoreboard players set @e[tag=t_pm_init,limit=1] __cts_selected_class_idx 0
scoreboard players set @e[tag=t_pm_init,limit=1] __cts_selected_trinket_idx 0

# Finish initialization of pm
tag @e[tag=t_pm_init] add t_pm
tag @e[tag=t_pm_init] remove t_pm_init

# Set spawnpoint and tag player for map teleportation
execute if score DEVELOPER_MODE num matches 0 run spawnpoint @a[tag=t_player_initialize] 0 100 0
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 0 run tag @a[tag=t_player_initialize] add dtm_send_to_lobby
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 0 run scoreboard players set @a[tag=t_player_initialize] activity_state 0
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 1.. run tag @a[tag=t_player_initialize] add dtm_send_to_spawn_select
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 1.. run scoreboard players set @a[tag=t_player_initialize] activity_state 10

# --- Initialize player scoreboard values

# EID values
scoreboard players set @a[tag=t_player_initialize,limit=1] eid_grabbed_by 0
scoreboard players set @a[tag=t_player_initialize,limit=1] eid_state 2
scoreboard players set @a[tag=t_player_initialize,limit=1] team_id 0

# Game objectives
scoreboard players set @a[tag=t_player_initialize,limit=1] coins 0

# CTS
scoreboard players add @a[tag=t_player_initialize,limit=1] __cts_selected_class_idx 0
scoreboard players set @a[tag=t_player_initialize,limit=1,scores={__cts_selected_class_idx=0}] __cts_selected_class_idx 1
scoreboard players add @a[tag=t_player_initialize,limit=1] __cts_classes_page_idx 0
scoreboard players add @a[tag=t_player_initialize,limit=1] __cts_selected_trinket_idx 0
scoreboard players set @a[tag=t_player_initialize,limit=1,scores={__cts_selected_trinket_idx=0}] __cts_selected_trinket_idx 1
scoreboard players add @a[tag=t_player_initialize,limit=1] __cts_trinkets_page_idx 0

# Clear events
scoreboard players set @a[tag=t_player_initialize,limit=1] __iev_logout 0
scoreboard players set @a[tag=t_player_initialize,limit=1] reinitialize 0

# Remove tag as operation has completed
tag @a remove t_player_initialize

# Loop while reinitializing players exist
execute if entity @a[scores={reinitialize=1..}] run function cashgrab:base/gt_playerinit_loop_recursion
