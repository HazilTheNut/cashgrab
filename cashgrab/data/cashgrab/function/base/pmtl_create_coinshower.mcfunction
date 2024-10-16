# base/pmtl_create_coinshower.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position, which must also be a coin plate
#	rotated: as the owner
#
# Summary: Creates a coin shower
#
# Arguments: (none)

summon minecraft:marker ~ ~0.25 ~ {Tags:["t_coinshower_init"],data:{vx:0.0d,vz:0.0d}}

# Divide coins amongst player and the coin shower
scoreboard players operation @n[tag=t_coinshower_init] __coinshower_coins = @a[tag=t_pm_owner] coins
scoreboard players operation @a[tag=t_pm_owner] coins /= NUM_COINSHOWER_EXCHANGE_DIVISOR num
scoreboard players operation @n[tag=t_coinshower_init] __coinshower_coins -= @a[tag=t_pm_owner] coins

# Set droprate of coin shower based on number of coins (tries to max out at NUM_COINSHOWER_TARGET_TIME_TICKS)
scoreboard players operation @n[tag=t_coinshower_init] __coinshower_period_ticks = NUM_COINSHOWER_TARGET_TIME_TICKS num
scoreboard players operation @n[tag=t_coinshower_init] __coinshower_period_ticks /= @n[tag=t_coinshower_init] __coinshower_coins

# Ceiling the droprate
execute if score @n[tag=t_coinshower_init] __coinshower_period_ticks > NUM_COINSHOWER_MAX_PERIOD_TICKS num run scoreboard players operation @n[tag=t_coinshower_init] __coinshower_period_ticks = NUM_COINSHOWER_MAX_PERIOD_TICKS num

scoreboard players set @e[tag=t_coinshower_init,limit=1,sort=nearest] __coinshower_timer_ticks 0

tag @e[tag=t_coinshower_init,limit=1,sort=nearest] add t_coinshower
tag @e[tag=t_coinshower_init,limit=1,sort=nearest] remove t_coinshower_init

# Update owner coin display
function cashgrab:util/pmt_inv_coins_argloader
