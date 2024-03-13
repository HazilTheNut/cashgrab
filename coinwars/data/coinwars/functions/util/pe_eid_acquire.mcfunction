# util/pe_eid_acquire.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Generates a unique EID for the entity, sets eid_owner to its own eid_self, and sets eid_state to 1 if it was previously 0

scoreboard players add EID_GLOBAL_COUNTER num 1
scoreboard players operation @s eid_self = EID_GLOBAL_COUNTER num
scoreboard players operation @s eid_owner = @s eid_self

scoreboard players add @s eid_state 0
scoreboard players set @s[scores={eid_state=0}] eid_state 1
