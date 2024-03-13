# util/pe_col_filter_entity_hostile.mcfunction
#
# Context:
#	as: an entity
#	at: the entity
#
# Summary: Tags all entities considered hostile (other ffa entities or enemy team) to the owner with t_collision_candidate
#
# Arguments: (none)

tag @e[scores={eid_state=1..}] remove t_collision_candidate

function coinwars:util/pe_eid_find_owner

tag @e[scores={eid_state=2,eid_compare=1..}] add t_collision_candidate
