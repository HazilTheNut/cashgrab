# util/pe_eid_acquire.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Generates a unique EID for the entity, sets eid_owner to its own eid_self, and sets eid_state to 1 if it was previously 0

execute if entity @s[type=minecraft:player] run function coinwars:base/pe_eid_acquire_player
execute unless entity @s[type=minecraft:player] run function coinwars:base/pe_eid_acquire_npc
