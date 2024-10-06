# base/npe_eid_acquire.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Generates a unique EID for the entity, sets eid_owner to 0, and sets eid_state to 1 if it was previously 0

# Reset EID_GLOBAL_COUNTER if out of bounds 
execute if score EID_GLOBAL_COUNTER num matches ..20000 run scoreboard players set EID_GLOBAL_COUNTER num 20000
execute if score EID_GLOBAL_COUNTER num matches 99999.. run scoreboard players set EID_GLOBAL_COUNTER num 20000

# Increment EID_GLOBAL_COUNTER and issue EID
scoreboard players add EID_GLOBAL_COUNTER num 1
scoreboard players operation @s eid_self = EID_GLOBAL_COUNTER num
scoreboard players set @s eid_owner 0

# Update eid_state
scoreboard players add @s eid_state 0
scoreboard players set @s[scores={eid_state=0}] eid_state 1
