# base/pmtl_coins.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Handles coins mechanics for each player
#
# Arguments: (none)

# Consume coin plate when a player runs over a coin plate
execute if block ~ ~ ~ minecraft:light_weighted_pressure_plate align xyz run function cashgrab:base/pmtl_consume_coinplate_argloader

# When a player picks up a coin, award some health and refresh coin display
execute if entity @a[tag=t_pm_owner,limit=1,scores={evl_coin_pickup=1..}] run function cashgrab:util/pmt_inv_coins_argloader
effect give @a[tag=t_pm_owner,limit=1,scores={evl_coin_pickup=1..},nbt=!{active_effects:[{id:"minecraft:regeneration"}]}] minecraft:regeneration 7 1 false
effect give @a[tag=t_pm_owner,limit=1,scores={evl_coin_pickup=1..}] minecraft:saturation 7 1 false

# If coin spilling mechanics are enabled, run spilling mechanics
execute if score ENABLE_COIN_SPILLING num matches 1.. run function cashgrab:base/pmtl_coins_spilling
