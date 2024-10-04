# base/gt_playerinit_loop.mcfunction
#
# Context: Global tick
#
# Summary: Assigns EIDs to all players with reinitialize set to 1+
#
# Arguments: (none)

# If no player has t_player_initialize, this is the start of initializing a new player
# Otherwise, we are looping because the random number we assigned as already used

# Tag a player with t_player_initialize if this is the start of the outer loop
execute unless entity @a[tag=t_player_initialize] run tag @r[scores={reinitialize=1..}] add t_player_initialize

# Invalidate eid_state as it is being overwritten
scoreboard players set @a[tag=t_player_initialize] eid_state 0

# Assign initializing player their EID
function coinwars:base/gt_playerinit_loop_assign_eid

# ---- Past this point, the initializing player has received a valid EID

# Generate a Player Monitor marker (pm) at 0,100,0 whose owner is this new player
# pms occupy an eid space = 10001-19999 that is their owner's eid + 10000
summon minecraft:marker 0 100 0 {Tags:["t_pm_init"]}
scoreboard players operation @e[tag=t_pm_init,limit=1] eid_owner = @a[tag=t_player_initialize,limit=1] eid_self
scoreboard players operation @e[tag=t_pm_init,limit=1] eid_self = @e[tag=t_pm_init,limit=1] eid_owner
scoreboard players add @e[tag=t_pm_init,limit=1] eid_self 10000
scoreboard players set @e[tag=t_pm_init,limit=1] eid_state 1

# Finish initialization of pm
tag @e[tag=t_pm_init] add t_pm
tag @e[tag=t_pm_init] remove t_pm_init

# Initialize player scoreboard values
scoreboard players set @a[tag=t_player_initialize,limit=1] eid_state 2
scoreboard players set @a[tag=t_player_initialize,limit=1] team_id 0
scoreboard players set @a[tag=t_player_initialize,limit=1] coins 0
scoreboard players set @a[tag=t_player_initialize,limit=1] __iev_logout 0
scoreboard players set @a[tag=t_player_initialize,limit=1] reinitialize 0

# Remove tag as operation has completed
tag @a remove t_player_initialize

# Loop while reinitializing players exist
execute if entity @a[scores={reinitialize=1..}] run function coinwars:base/gt_playerinit_loop_recursion
