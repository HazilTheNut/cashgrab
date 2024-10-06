# util/npe_col_filter_entity_hostile.mcfunction
#
# Context:
#	as: a nonplayer entity
#
# Summary: Tags all entities considered hostile (other ffa entities or enemy team) to the owner with t_collision_candidate
#
# Arguments: (none)

tag @e[scores={eid_state=1..}] remove t_collision_candidate

function cashgrab:util/npe_eid_find_owner

tag @e[scores={eid_state=2,eid_compare=1..}] add t_collision_candidate
tag @s remove t_collision_candidate
execute if score @s team_id matches 1 run tag @e[scores={team_id=1}] remove t_collision_candidate
execute if score @s team_id matches 2 run tag @e[scores={team_id=2}] remove t_collision_candidate
