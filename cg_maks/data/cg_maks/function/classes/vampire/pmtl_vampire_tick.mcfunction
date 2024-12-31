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

# If a marked target died on this server tick, create a remnant timer at their death location.
execute if entity @a[tag=t_marked_target,scores={evl_death=1..}] as @a[tag=t_pm_owner,limit=1] run function cg_maks:classes/vampire/pmtl_vampire_create_remnant_at_marked_target

# Decrement Marked sequence timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_A=1..}] cv_A 1

#If timer has hit 0, remove the marked target tag
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1}] run function cashgrab:util/npe_col_entity_filter_hostile
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1}] run tag @e[tag=t_collision_candidate,tag=t_marked_target] remove t_marked_target