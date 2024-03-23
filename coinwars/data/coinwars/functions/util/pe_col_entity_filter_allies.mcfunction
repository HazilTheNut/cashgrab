# util/pe_col_filter_entity_allies.mcfunction
#
# Context:
#	as: an entity
#	at: the entity
#
# Summary: Tags all entities considered allies (team members only) to the owner with t_collision_candidate
#
# Arguments: (none)

tag @e[scores={eid_state=1..}] remove t_collision_candidate

function coinwars:util/pe_eid_find_owner

tag @e[scores={eid_state=2,eid_compare=0}] add t_collision_candidate
execute if score @s team_id matches 1 run tag @e[scores={team_id=1}] add t_collision_candidate
execute if score @s team_id matches 2 run tag @e[scores={team_id=2}] add t_collision_candidate
