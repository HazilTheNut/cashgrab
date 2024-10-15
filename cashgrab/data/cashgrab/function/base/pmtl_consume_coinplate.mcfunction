# base/pmtl_consume_coinplate.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position, which must also be a coin plate
#	rotated: as the owner
#
# Summary: Handles coins mechanics for each player
#
# Arguments:
#	qty	: Coin item quantity

# Detect when a player runs over a coin plate
$summon minecraft:item ~0.5 ~0.25 ~0.5 {Item:{id:"minecraft:gold_nugget",count:$(qty),components:{"minecraft:item_name":"Coin"}},Tags:["t_pickup"]}
summon minecraft:marker ~0.5 ~0.25 ~0.5 {Tags:["t_coinplate_cooldown_init"]}
setblock ~ ~ ~ minecraft:heavy_weighted_pressure_plate

# Coin plate initialization
scoreboard players set @e[tag=t_coinplate_cooldown_init] __coinplate_timer_ticks 300
tag @e[tag=t_coinplate_cooldown_init] add t_coinplate_cooldown
tag @e[tag=t_coinplate_cooldown_init] remove t_coinplate_cooldown_init
