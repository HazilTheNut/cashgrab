# base/projectile_stasis.mcfunction
#
# Context:
#	as: a #cashgrab:projectile entity
#	at: the entity
#
# Summary: Handles projectile entity stasis mechanic
#
# Arguments: (none)

# =============================
# Enter stasis state

# Store position and velocty
execute if score @s stasis_state matches 2 store result score @s stasis_stored_x_pos_mm run data get entity @s Pos[0] 1000
execute if score @s stasis_state matches 2 store result score @s stasis_stored_y_pos_mm run data get entity @s Pos[1] 1000
execute if score @s stasis_state matches 2 store result score @s stasis_stored_z_pos_mm run data get entity @s Pos[2] 1000

execute if score @s stasis_state matches 2 store result score @s stasis_stored_x_vel_mmpt run data get entity @s Motion[0] 1000
execute if score @s stasis_state matches 2 store result score @s stasis_stored_y_vel_mmpt run data get entity @s Motion[1] 1000
execute if score @s stasis_state matches 2 store result score @s stasis_stored_z_vel_mmpt run data get entity @s Motion[2] 1000

execute if score @s stasis_state matches 2 run scoreboard players set @s stasis_reset_pos_timer 0

# Arrows: store if it is a crit arrow
execute if entity @s[type=minecraft:arrow] if score @s stasis_state matches 2 store result score @s stasis_stored_arrow_crit run data get entity @s crit

# Disable gravity and AI
execute if score @s stasis_state matches 2 run data merge entity @s {NoAI:1b,NoGravity:1b,crit:0b}

# =============================
# In stasis state

# Retain position with (almost) no velocity
execute if score @s stasis_reset_pos_timer matches 0 if score @s stasis_state matches 1..2 store result entity @s Pos[0] double 0.001 run scoreboard players get @s stasis_stored_x_pos_mm
execute if score @s stasis_reset_pos_timer matches 0 if score @s stasis_state matches 1..2 store result entity @s Pos[1] double 0.001 run scoreboard players get @s stasis_stored_y_pos_mm
execute if score @s stasis_reset_pos_timer matches 0 if score @s stasis_state matches 1..2 store result entity @s Pos[2] double 0.001 run scoreboard players get @s stasis_stored_z_pos_mm
scoreboard players add @s stasis_reset_pos_timer 1
execute if score @s stasis_reset_pos_timer matches 2.. run scoreboard players set @s stasis_reset_pos_timer 0

execute if score @s stasis_state matches 2 store result entity @s Motion[0] double 0.000005 run scoreboard players get @s stasis_stored_x_vel_mmpt
execute if score @s stasis_state matches 2 store result entity @s Motion[1] double 0.000005 run scoreboard players get @s stasis_stored_y_vel_mmpt
execute if score @s stasis_state matches 2 store result entity @s Motion[2] double 0.000005 run scoreboard players get @s stasis_stored_z_vel_mmpt

# =============================
# Exit stasis state

# Restore position and velocity
execute if score @s stasis_state matches -1 store result entity @s Motion[0] double 0.001 run scoreboard players get @s stasis_stored_x_vel_mmpt
execute if score @s stasis_state matches -1 store result entity @s Motion[1] double 0.001 run scoreboard players get @s stasis_stored_y_vel_mmpt
execute if score @s stasis_state matches -1 store result entity @s Motion[2] double 0.001 run scoreboard players get @s stasis_stored_z_vel_mmpt

# Reenable gravity and AI
execute if score @s stasis_state matches -1 run data merge entity @s {NoAI:1b,NoGravity:0b}

# Arrows: restore if it is a crit arrow
execute if entity @s[type=minecraft:arrow] if score @s stasis_state matches -1 store result entity @s crit byte 1 run scoreboard players get @s stasis_stored_arrow_crit