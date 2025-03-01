# tutorial/trainee/pmtl_blink_end.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Performs Blink teleportation
#
# Arguments: (none)

playsound minecraft:entity.player.teleport player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1.0 0.75 1.0

# If there was an immediate collision, do nothing
$execute if score NUM_END_REASON_TERRAIN_COLLISION_IMMEDIATE num matches $(end_reason) run return 0

execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~-1 ~ #cashgrab:nonsolid run tp @a[tag=t_pm_owner,limit=1] ~ ~-1 ~
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~-1 ~ #cashgrab:nonsolid run particle minecraft:smoke ~ ~-1 ~ 0.5 0.75 0.5 0 40
execute align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~-1 ~ #cashgrab:nonsolid run tp @a[tag=t_pm_owner,limit=1] ~ ~ ~
execute align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~-1 ~ #cashgrab:nonsolid run particle minecraft:smoke ~ ~ ~ 0.5 0.75 0.5 0 40
