# util/pe_eid_find_owner.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Note: this function will fail to work with players. find_eid_self and find_eid_owned_by should be used when working with players
#
# Summary: Sets eid_compare for entities with eid_state == 1..2 accordingly:
#	eid_compare == 0 iff my eid_owner == their eid_self
#	eid_compare > 0 otherwise

# Perform comparison
execute as @e[scores={eid_state=1..2}] run scoreboard players operation @s eid_compare = @s eid_self
scoreboard players operation @e[scores={eid_state=1..2}] eid_compare -= @s eid_owner

# Exclude all entities with uninitialized / invalid / not yet valid EIDs
scoreboard players set @e[scores={eid_state=0}] eid_compare 1

# Players don't work with util/npe_eid_find_owner
scoreboard players set @a eid_compare 1

# eid_compare = abs(eid_compare)
execute as @e[scores={eid_state=1..2,eid_compare=..-1}] run scoreboard players operation @s eid_compare *= NUM_NEG_ONE num
