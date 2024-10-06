# base/gt_coins.mcfunction
#
# Context: Global tick
#
# Summary: Handles coins mechanics
#
# Arguments: (none)

# Tick down coin plate cooldown
scoreboard players remove @e[tag=t_coinplate_cooldown] __coinplate_timer_ticks 1

# Recharge coin plate when cooldown expires
execute as @e[tag=t_coinplate_cooldown,scores={__coinplate_timer_ticks=..0}] at @s run setblock ~ ~ ~ minecraft:light_weighted_pressure_plate
kill @e[tag=t_coinplate_cooldown,scores={__coinplate_timer_ticks=..0}]

#execute if entity @e[tag=t_pickup] run tellraw @a[tag=t_debug] [{"type":"text","text":"Coin motion: "},{"type":"nbt","nbt":"Motion","entity":"@e[tag=t_pickup]"}]

# Display particles from coins dropped from coin showers
#execute as @e[tag=t_coin_particles,nbt={OnGround:0b},scores={stasis_state=0}] at @s run particle minecraft:block{block_state:"minecraft:gold_block"} ~ ~ ~ 0 0 0 0 1
execute as @e[tag=t_coin_particles,nbt={OnGround:0b},scores={stasis_state=0}] at @s run particle minecraft:dust{color:[0.9f,0.9f,0.65f],scale:0.65} ~ ~ ~ 0.05 0.05 0.05 0 1
