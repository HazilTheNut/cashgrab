# base/pm_cleanup_if_ownerless.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Searches for owner and self destructs if there is none
#
# Arguments: (none)

# Find owner
execute store result storage coinwars:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function coinwars:util/gt_find_eid with storage coinwars:find_eid_args

# If owner does not exist, destroy this marker
execute if entity @a[tag=t_eid_matches] run return 0

# Self destruct
scoreboard players set @s eid_state 0
scoreboard players set @s eid_self 0
scoreboard players set @s eid_owner 0

# Tag myself as no owner to pass back to coinwars:tick that a pm has cleaned up
tag @s add t_pm_no_owner
