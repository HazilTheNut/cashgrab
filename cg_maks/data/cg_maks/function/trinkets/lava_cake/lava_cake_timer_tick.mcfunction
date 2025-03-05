# trinkets/lava_cake/lava_cake_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer's owner
#
# Summary: Lava Cake timer tick
#
# Arguments: (none)

particle minecraft:lava ~ ~ ~ 0.25 0.25 0.25 1 1

#If on a relevant tick, play a sound effect
execute if entity @s[scores={tmr_lifetime_ticks=140}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1
execute if entity @s[scores={tmr_lifetime_ticks=120}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.05
execute if entity @s[scores={tmr_lifetime_ticks=100}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.1
execute if entity @s[scores={tmr_lifetime_ticks=80}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.15
execute if entity @s[scores={tmr_lifetime_ticks=60}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.2
execute if entity @s[scores={tmr_lifetime_ticks=40}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.25
execute if entity @s[scores={tmr_lifetime_ticks=30}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.3
execute if entity @s[scores={tmr_lifetime_ticks=20}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.35
execute if entity @s[scores={tmr_lifetime_ticks=15}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.4
execute if entity @s[scores={tmr_lifetime_ticks=10}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.45
execute if entity @s[scores={tmr_lifetime_ticks=5}] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1 1.5