# classes/stargazer/pmtl_rift_glyph_raycast_end.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: end of raycast
#	rotated: as the owner
#
# Summary: Performs Rift Glyph forwards teleport
#
# Arguments: (none)

execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~-1 ~ #cashgrab:nonsolid rotated as @a[tag=t_pm_owner,limit=1] run tp @a[tag=t_pm_owner,limit=1] ~ ~-1 ~ ~ ~
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~-1 ~ #cashgrab:nonsolid run particle minecraft:entity_effect{color:[0.8,0.7,0.5,1.0]} ~ ~ ~ 0.25 0.45 0.25 0.5 15
execute align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~-1 ~ #cashgrab:nonsolid rotated as @a[tag=t_pm_owner,limit=1] run tp @a[tag=t_pm_owner,limit=1] ~ ~ ~ ~ ~
execute align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~-1 ~ #cashgrab:nonsolid run particle minecraft:entity_effect{color:[0.8,0.7,0.5,1.0]} ~ ~1 ~ 0.25 0.45 0.25 0.5 15
