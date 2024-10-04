# base/gt_find_eid.mcfunction
#
# Context: Global tick
#
# Summary: clears t_eid_matches tag of all entities then 
#			looks up all entities with eid_state >= 1 and 
#			tags any whose eid_self matches with t_eid_matches
#
# Arguments:
#	eid	: EID to search for

# Remove tag in case 
tag @a remove t_eid_matches
$tag @a[scores={eid_self=$(eid),eid_state=1..}] add t_eid_matches
