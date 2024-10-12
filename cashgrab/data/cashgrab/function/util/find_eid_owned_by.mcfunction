# util/find_eid_owned_by.mcfunction
#
# Context: None
#
# Summary: clears t_eid_matches tag of all entities then 
#			looks up all entities with eid_state >= 1 and 
#			tags any whose eid_owner matches with t_eid_matches
#
# Arguments:
#	eid	: EID to search for

# Remove tag in case 
tag @e remove t_eid_matches
$tag @e[scores={eid_owner=$(eid),eid_state=1..}] add t_eid_matches
#$tellraw @a[tag=t_debug] "util/find_eid_owned_by: eid_owner searched for: $(eid)"
