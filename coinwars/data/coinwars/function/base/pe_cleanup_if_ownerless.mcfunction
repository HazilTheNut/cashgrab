# base/pe_cleanup_if_ownerless.mcfunction
#
# Context: Global tick
#
# Summary: Handles when to issue the "t_return_to_lobby" tag. The map will handle teleporting players with t_return_to_lobby as well as removing the tag
#
# Arguments: (none)

# If I have been cleaned up, assume all of my subordinates are too
execute if entity @s[tag=t_cleanup] run return 0

# Try to find my owner. If it exists, do nothing
function coinwars:util/pe_eid_find_owner
execute if entity @e[scores={eid_compare=0}] run return 0

function coinwars:base/pe_cleanup
