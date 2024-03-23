# base/gt_coins.mcfunction
#
# Context: Global tick
#
# Summary: Handles coins mechanics
#
# Arguments: (none)

# Detect when a player runs over a coin plate
execute as @a at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate align xyz run summon minecraft:item ~0.5 ~0.25 ~0.5 {Item:{id:"minecraft:gold_nugget",Count:1b,tag:{display:{Name:"Coin"}}},Tags:["t_cleanup"]}
execute as @a at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate align xyz run summon minecraft:marker ~0.5 ~0.25 ~0.5 {Tags:["t_coinplate_cooldown_init"]}
execute as @a at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate align xyz run setblock ~ ~ ~ minecraft:heavy_weighted_pressure_plate

# Coin plate initialization
scoreboard players set @e[tag=t_coinplate_cooldown_init] __coinplate_timer_ticks 260
tag @e[tag=t_coinplate_cooldown_init] add t_coinplate_cooldown
tag @e[tag=t_coinplate_cooldown_init] remove t_coinplate_cooldown_init

# Tick down coin plate cooldown
scoreboard players remove @e[tag=t_coinplate_cooldown] __coinplate_timer_ticks 1

# Recharge coin plate when cooldown expires
execute as @e[tag=t_coinplate_cooldown,scores={__coinplate_timer_ticks=..0}] at @s run setblock ~ ~ ~ minecraft:light_weighted_pressure_plate
kill @e[tag=t_coinplate_cooldown,scores={__coinplate_timer_ticks=..0}]

#execute if entity @e[tag=t_pickup] run tellraw @a[tag=t_debug] [{"type":"text","text":"Coin motion: "},{"type":"nbt","nbt":"Motion","entity":"@e[tag=t_pickup]"}]

# Display particles from coins dropped from coin showers
execute as @e[tag=t_coin_particles,nbt={OnGround:0b}] at @s run particle minecraft:block minecraft:gold_block ~ ~ ~ 0 0 0 0 1

# When a player picks up a coin, award some health and refresh coin display
execute as @a[scores={__iev_coin_pickup=1..}] run function coinwars:base/pe_display_coins_argloader
effect give @a[scores={__iev_coin_pickup=1..}] minecraft:regeneration 4 2 false
effect give @a[scores={__iev_coin_pickup=1..}] minecraft:saturation 7 1 false
scoreboard players set @a[scores={__iev_coin_pickup=1..}] __iev_coin_pickup 0
