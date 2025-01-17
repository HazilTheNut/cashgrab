# trinkets/hedge_seed/npe_hedge_seed_timer_end.mcfunction
#
# Context:
#	as: a timer entity
#	at: the timer's owner
#
# Summary: End function of Hedge Seed timer
#
# Arguments: 
#	end_reason	: The reason for why the end function was called

# If wall did not form, do nothing
execute if score @s tv_B matches ..0 run return 0

# Destroy wall
execute store result storage cashgrab_ex:hedge_args height int 1 run scoreboard players get @s tv_C
function cashgrab_ex:trinkets/hedge_seed/npe_hedge_seed_timer_destroy with storage cashgrab_ex:hedge_args

# vfx / sfx
execute if score @s tv_C matches 0 run particle minecraft:block{block_state:"minecraft:mangrove_leaves"} ~ ~0.0 ~ 0.2 0.40 0.2 0 5 normal
execute if score @s tv_C matches 1 run particle minecraft:block{block_state:"minecraft:mangrove_leaves"} ~ ~0.5 ~ 0.2 0.60 0.2 0 10 normal
execute if score @s tv_C matches 2 run particle minecraft:block{block_state:"minecraft:mangrove_leaves"} ~ ~1.0 ~ 0.2 0.80 0.2 0 15 normal
execute if score @s tv_C matches 3 run particle minecraft:block{block_state:"minecraft:mangrove_leaves"} ~ ~1.5 ~ 0.2 1.00 0.2 0 20 normal
execute if score @s tv_C matches 4 run particle minecraft:block{block_state:"minecraft:mangrove_leaves"} ~ ~2.0 ~ 0.2 1.20 0.2 0 25 normal
playsound minecraft:block.grass.break player @a ~ ~ ~ 0.75 1.25
