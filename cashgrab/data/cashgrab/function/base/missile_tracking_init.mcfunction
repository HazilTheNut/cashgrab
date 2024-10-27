# base/missile_tracking_init.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Initializes tracking behavior of missiles
#
# Arguments:
#	f_tracking_scalar			: Scalar of strength of tracking towards potential targets

# Calculate min and max angle difference to give up tracking at
scoreboard players set @s __mis_tracking_giveup_max_mdeg 0
execute store result score @s __mis_tracking_giveup_max_mdeg run data get entity @s data.f_tracking_scalar 80000
scoreboard players add @s __mis_tracking_giveup_max_mdeg 10000
scoreboard players operation @s __mis_tracking_giveup_min_mdeg = @s __mis_tracking_giveup_max_mdeg
scoreboard players operation @s __mis_tracking_giveup_min_mdeg *= NUM_NEG_ONE num

# Calculate minimum and maximum displacement angles to apply tracking to
$execute store result entity @s data.f_tracking_scalar_squared float $(f_tracking_scalar) run data get entity @s data.f_tracking_scalar 1000
execute store result entity @s data.f_tracking_scalar_squared float 0.001 run data get entity @s data.f_tracking_scalar_squared 1
#tellraw @a[tag=t_debug] [{"type":"text","text":"base/missile_tracking_init data: "},{"type":"nbt","source":"entity","entity":"@s","nbt":"data"}]

scoreboard players set @s __mis_tracking_adjust_max_mdeg 0
execute store result score @s __mis_tracking_adjust_max_mdeg run data get entity @s data.f_tracking_scalar_squared 10000
scoreboard players operation @s __mis_tracking_adjust_min_mdeg = @s __mis_tracking_adjust_max_mdeg
scoreboard players operation @s __mis_tracking_adjust_min_mdeg *= NUM_NEG_ONE num

# Clear tag
tag @s remove t_missile_init_tracking
