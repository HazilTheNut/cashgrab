# util/pe_col_filter_entity_owner.mcfunction
#
# Context:
#	as: an entity
#	at: the entity
#
# Summary: Tags this entity's owner with t_collision_candidate
#
# Arguments: (none)

tag @e[scores={eid_state=1..}] remove t_collision_candidate

function coinwars:util/pe_eid_find_owner

tag @e[scores={eid_state=2,eid_compare=0}] add t_collision_candidate
