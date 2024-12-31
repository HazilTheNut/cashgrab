# classes/vampire/pmtl_vampire_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Vampire class
#
# Arguments: (none)

# Decrement Marked sequence timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_A=1..}] cv_A 1

#If timer has hit 0, remove the marked target tag
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1}] run function cashgrab:util/npe_col_entity_filter_hostile
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1}] run tag @e[tag=t_collision_candidate,tag=t_marked_target] remove t_marked_target