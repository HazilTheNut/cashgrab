# classes/vampire/pmtl_vampire_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Play some vfx and spawn in bat missiles to have them track towards each player within X blocks.

# Tag affected players
tag @e[type=player,distance=..10,tag=!t_pm_owner] add t_vampire_soulsiphon_target

# sfx
playsound entity.elder_guardian.curse player @a ~ ~ ~ 1 1.1

# spawn bat swarm
tag @a[tag=t_pm_owner,limit=1] add t_vampire_mark_owner
execute as @e[tag=t_pm] run function cg_maks:classes/vampire/pm_vampire_create_soul_siphon_missile

# Clean up tags
tag @a remove t_vampire_mark_owner
tag @a remove t_vampire_soulsiphon_target
