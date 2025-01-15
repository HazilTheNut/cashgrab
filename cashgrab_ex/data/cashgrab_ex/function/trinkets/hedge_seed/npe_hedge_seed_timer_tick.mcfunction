# trinkets/hedge_seed/npe_hedge_seed_timer_tick.mcfunction
#
# Context:
#	as: a timer entity
#	at: the timer's owner
#
# Summary: Tick function of Hedge Seed timer
#
# Arguments: (none)

# vfx
execute if score @s tv_D matches 1 run particle minecraft:dust{color:[0.2,0.7,0.5],scale:1.0f} ~ ~-0.3 ~ 0.25 0 0.25 0 2 force

# Check for stasis
execute if score @s stasis_state matches 1..2 run return 0

# Self destruct if starting block is not air
execute if score @s tv_B matches 0 unless block ~ ~ ~ minecraft:air run return run tag @s add t_cleanup

# Do below while hedge is growing
execute unless score @s tv_D matches 1 run return 0

# If timer has not yet reached full height, grow
execute if score @s tv_D matches 1 store result storage cashgrab_ex:hedge_args height int 1 run scoreboard players get @s tv_B
execute if score @s tv_D matches 1 run function cashgrab_ex:trinkets/hedge_seed/npe_hedge_seed_timer_grow with storage cashgrab_ex:hedge_args

# Increment height if still growing
execute if score @s tv_D matches 1 run scoreboard players add @s tv_B 1

# If height is at maximum, stop growing
execute if score @s tv_D matches 1 if score @s tv_B matches 5.. run scoreboard players set @s tv_D 0

