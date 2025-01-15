# trinkets/hedge_seed/npe_hedge_seed_timer_grow.mcfunction
#
# Context:
#	as: a timer entity
#	at: the timer's owner
#
# Summary: Places leaf block at new height
#
# Arguments: 
#   height      : New height value for column of hedge wall, in m

# Stop growing if reached a ceiling
$execute unless block ~ ~$(height) ~ minecraft:air run return run scoreboard players set @s tv_D 0

# sfx / vfx
$particle minecraft:block{block_state:"minecraft:mangrove_leaves"} ~ ~$(height) ~ 0.6 0.6 0.6 0 20 force
playsound minecraft:block.grass.step player @a ~ ~ ~ 1.0 1.75

# Place block
$setblock ~ ~$(height) ~ minecraft:mangrove_leaves

# Set new height of wall
$scoreboard players set @s tv_C $(height)
