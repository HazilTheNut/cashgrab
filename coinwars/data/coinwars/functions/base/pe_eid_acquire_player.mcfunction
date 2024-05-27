# base/pe_eid_acquire_player.mcfunction
#
# Context:
#	as: a player
#
# Summary: Generates a unique EID for the entity, sets eid_owner to 0, and sets eid_state to 2

# Get a random EID
execute store result score @s eid_self run random value 1..9999

# If someone else has that EID, retry
function coinwars:util/pe_eid_find_self
scoreboard players set @s eid_compare 1
execute if entity @e[scores={eid_compare=0}] run function coinwars:base/pe_eid_acquire_player_recursion

# Initialize eid_owner and eid_state
scoreboard players set @s eid_owner 0
scoreboard players set @s eid_state 2

