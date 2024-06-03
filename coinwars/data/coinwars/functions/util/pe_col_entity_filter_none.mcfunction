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
