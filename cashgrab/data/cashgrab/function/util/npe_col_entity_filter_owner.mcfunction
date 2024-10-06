# util/npe_col_filter_entity_owner.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Tags this entity's owner with t_collision_candidate
#
# Arguments: (none)

tag @e[scores={eid_state=1..}] remove t_collision_candidate

function cashgrab:util/npe_eid_find_owner

tag @e[scores={eid_state=2,eid_compare=0}] add t_collision_candidate
