# base/gt_playerinit.mcfunction
#
# Context: Global tick
#
# Summary: Handles initialization of players upon login
#
# Arguments: (none)

# Enable reinitialize trigger
scoreboard players enable @a reinitialize

# Players with an eid_state of 0 have just logged in the first time
scoreboard players add @a eid_state 0
scoreboard players set @a[scores={eid_state=0}] reinitialize 1

# Players with a nonzero __iev_logout have previously logged out and now are back on the server
scoreboard players set @a[scores={__iev_logout=1..}] reinitialize 1

# Loop through all initializing players
execute if entity @a[scores={reinitialize=1..}] run function coinwars:base/gt_playerinit_loop

