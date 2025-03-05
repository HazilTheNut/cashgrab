# trinkets/nox_bomb/npe_nox_bomb_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Nox Bomb missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

$tellraw @a[tag=t_debug] "trinkets/nox_bomb/npe_nox_bomb_end $(end_reason)"

$execute unless score NUM_END_REASON_TERRAIN_COLLISION num matches $(end_reason) run return 0

function cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_splash

playsound minecraft:block.slime_block.hit player @a ~ ~ ~ 1.0 1.25

# Spawn secondary wave of missiles
execute positioned ~ ~0.5 ~ rotated ~30 0 run function cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_spawn_missile
execute positioned ~ ~0.5 ~ rotated ~90 0 run function cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_spawn_missile
execute positioned ~ ~0.5 ~ rotated ~150 0 run function cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_spawn_missile
execute positioned ~ ~0.5 ~ rotated ~-30 0 run function cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_spawn_missile
execute positioned ~ ~0.5 ~ rotated ~-90 0 run function cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_spawn_missile
execute positioned ~ ~0.5 ~ rotated ~-150 0 run function cashgrab_ex:trinkets/nox_bomb/npe_nox_bomb_spawn_missile
