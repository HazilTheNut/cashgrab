# base/pe_eid_acquire_npc.mcfunction
#
# Context:
#	as: a non-player entity
#
# Summary: Generates a unique EID for the entity, sets eid_owner to 0, and sets eid_state to 1 if it was previously 0

execute if score EID_GLOBAL_COUNTER num matches ..20000 run scoreboard players set EID_GLOBAL_COUNTER num 20000
execute if score EID_GLOBAL_COUNTER num matches 99999.. run scoreboard players set EID_GLOBAL_COUNTER num 20000

scoreboard players add EID_GLOBAL_COUNTER num 1
scoreboard players operation @s eid_self = EID_GLOBAL_COUNTER num
scoreboard players set @s eid_owner 0

scoreboard players add @s eid_state 0
scoreboard players set @s[scores={eid_state=0}] eid_state 1
