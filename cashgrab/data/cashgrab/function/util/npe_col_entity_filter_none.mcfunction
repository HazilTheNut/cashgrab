# util/npe_col_filter_entity_owner.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Tags this entity's owner with t_collision_candidate
#
# Arguments: (none)

tag @e[scores={eid_state=1..}] remove t_collision_candidate
tag @a[scores={eid_state=1..}] remove t_collision_candidate
