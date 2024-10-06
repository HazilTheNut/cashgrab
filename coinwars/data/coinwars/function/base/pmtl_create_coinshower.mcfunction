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
scoreboard players operation @e[tag=t_coinshower_init,limit=1,sort=nearest] __coinshower_coins = @a[tag=t_pm_owner] coins
scoreboard players operation @e[tag=t_coinshower_init,limit=1,sort=nearest] __coinshower_coins /= NUM_COINSHOWER_EXCHANGE_DIVISOR num
scoreboard players operation @a[tag=t_pm_owner] coins -= @e[tag=t_coinshower_init,limit=1,sort=nearest] __coinshower_coins

# Set droprate of coin shower based on number of coins (tries to max out at 10 seconds)
scoreboard players set @e[tag=t_coinshower_init,limit=1,sort=nearest,scores={__coinshower_coins=..40}] __coinshower_period_ticks 5
scoreboard players set @e[tag=t_coinshower_init,limit=1,sort=nearest,scores={__coinshower_coins=41..50}] __coinshower_period_ticks 4
scoreboard players set @e[tag=t_coinshower_init,limit=1,sort=nearest,scores={__coinshower_coins=51..66}] __coinshower_period_ticks 3
scoreboard players set @e[tag=t_coinshower_init,limit=1,sort=nearest,scores={__coinshower_coins=67..100}] __coinshower_period_ticks 2
scoreboard players set @e[tag=t_coinshower_init,limit=1,sort=nearest,scores={__coinshower_coins=101..}] __coinshower_period_ticks 1
scoreboard players set @e[tag=t_coinshower_init,limit=1,sort=nearest] __coinshower_timer_ticks 0

tag @e[tag=t_coinshower_init,limit=1,sort=nearest] add t_coinshower
tag @e[tag=t_coinshower_init,limit=1,sort=nearest] remove t_coinshower_init
