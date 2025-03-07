# util/npe_col_entity_filter_owner.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Tags this entity's owner with t_collision_candidate
#
# Arguments: (none)

tag @e[scores={eid_state=1..}] remove t_collision_candidate
tag @a[scores={eid_state=1..}] remove t_collision_candidate

# Tag owner with t_eid_matches
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Only the owner is a collision candidates
tag @e[scores={eid_state=2},tag=t_eid_matches] add t_collision_candidate
tag @a[scores={eid_state=2},tag=t_eid_matches] add t_collision_candidate
