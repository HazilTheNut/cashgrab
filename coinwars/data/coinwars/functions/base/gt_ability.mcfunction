# base/gt_ability.mcfunction
#
# Context: Global level
#
# Summary: Tracks item tosses, activating class abilities, and cooldowns
#
# Arguments: (none)

# All dropped item entities are destroyed except for those that are tagged as "t_pickup"
kill @e[type=minecraft:item,tag=!t_pickup]

# Activate ability upon tossing an item
execute as @a[scores={__iev_drop=1..,ability_charges=1..}] at @s run function coinwars:classes/pe_use_ability_perclass
scoreboard players remove @a[scores={__iev_drop=1..,ability_charges=1..}] ability_charges 1
execute as @a[scores={__iev_drop=1..}] run function coinwars:base/pe_refresh_inv
scoreboard players set @a __iev_drop 0

# Tick down cooldowns
scoreboard players remove @a[scores={ability_cd_ticks=0..}] ability_cd_ticks 1

# Award an ability charge when cooldown timer hits 0 (it will decrement again to -1 if no more ability charges need to be provided)
scoreboard players add @a[scores={ability_cd_ticks=0}] ability_charges 1

# Start ability cooldown if there is a charge yet to be recharged
execute as @a[scores={ability_cd_ticks=..0}] if score @s ability_charges < @s ability_cfg_charges run scoreboard players operation @s ability_cd_ticks = @s ability_cfg_cooldown_ticks

# Calculate ability_cd_secs based on ability_cd_ticks
execute as @a run scoreboard players operation @s ability_cd_secs = @a ability_cd_ticks
execute as @a run scoreboard players operation @s ability_cd_secs /= NUM_TICKS_PER_SEC num
scoreboard players add @a[scores={ability_cd_ticks=1..}] ability_cd_secs 1

execute as @a[scores={ability_cd_ticks=0..}] run function coinwars:base/pe_display_ability_icon_argloader
