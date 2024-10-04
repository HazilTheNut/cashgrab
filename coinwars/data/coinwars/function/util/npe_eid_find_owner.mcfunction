# util/pe_eid_find_owner.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Sets eid_compare for entities with eid_state == 1..2 accoridingly:
#	eid_compare == 0 iff my eid_owner == their eid_self
#	eid_compare > 0 otherwise

# Perform comparison
execute as @e[scores={eid_state=1..2}] run scoreboard players operation @s eid_compare = @s eid_self
scoreboard players operation @e[scores={eid_state=1..2}] eid_compare -= @s eid_owner

# Exclude all entities with uninitialized / invalid / not yet valid EIDs
scoreboard players set @e[scores={eid_state=0}] eid_compare 1

# eid_compare = abs(eid_compare)
execute as @e[scores={eid_state=1..2,eid_compare=..-1}] run scoreboard players operation @s eid_compare *= NUM_NEG_ONE num
