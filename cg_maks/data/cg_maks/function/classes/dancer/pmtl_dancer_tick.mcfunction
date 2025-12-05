# classes/dancer/pmtl_dancer_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Dancer class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Tempo Stacks (0-3)
#	cv_B	:	Tempo Hit Combo Window
#	cv_C	:	Tempo Timer
#	cv_D	:	Sound Effect timer (base)
#	cv_E	:	Sforzando missile sequence timer
#	cv_F	:	Sound Effect timer (refresh buff)
#	cv_G	:	Refresh Buff Timer Cooldown / Sforzando missile pitch deflection (mdeg)
#	cv_H	:   Sforzando missile yaw deflection (mdeg)
# =========================================
# SFORZANDO
# =========================================

# Add a tag to this player if their Tempo matches and they recently used their ability.
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=0..3,cv_E=8}] run tag @a[tag=t_pm_owner,limit=1] add t_dancer_sforz_missile
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=0..3,cv_E=7}] run tag @a[tag=t_pm_owner,limit=1] add t_dancer_sforz_missile
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=0..3,cv_E=6}] run tag @a[tag=t_pm_owner,limit=1] add t_dancer_sforz_missile
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1..3,cv_E=5}] run tag @a[tag=t_pm_owner,limit=1] add t_dancer_sforz_missile
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=2..3,cv_E=3}] run tag @a[tag=t_pm_owner,limit=1] add t_dancer_sforz_missile
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=3,cv_E=1}] run tag @a[tag=t_pm_owner,limit=1] add t_dancer_sforz_missile

# Create missiles
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_dancer_sforz_missile] at @a[tag=t_pm_owner,limit=1,tag=t_dancer_sforz_missile] run function cg_maks:classes/dancer/pmtl_dancer_create_missile with storage cg_maks:offset_args
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_dancer_sforz_missile] run tellraw @a[tag=t_debug] "classes/dancer/pmtl_dancer_tick: Missile created"

# =========================================
# SOUND EFFECTS
# =========================================

#If 0 stacks, play power down (1.15 1.07 0.99)
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 9 if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.15
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 6 if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.07
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 3 if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 0.99

# If one stack, play power up x1 (1 x3)
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 9 if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 6 if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 3 if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1

# If two stacks, power up x2 (1.05 x3)
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 9 if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.05
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 6 if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.05
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 3 if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.05

# If one stack, play power up x3 (1.1 x3)
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 9 if score @a[tag=t_pm_owner,limit=1] cv_A matches 3 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.1
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 6 if score @a[tag=t_pm_owner,limit=1] cv_A matches 3 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.1
execute if score @a[tag=t_pm_owner,limit=1] cv_D matches 3 if score @a[tag=t_pm_owner,limit=1] cv_A matches 3 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.1

# If full stacks and refreshing buff, play refresh (0.99 1.07 1.15)
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches 9 if score @a[tag=t_pm_owner,limit=1] cv_A matches 3 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 0.99
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches 6 if score @a[tag=t_pm_owner,limit=1] cv_A matches 3 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.07
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches 3 if score @a[tag=t_pm_owner,limit=1] cv_A matches 3 run playsound minecraft:block.note_block.pling player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 1 1.15

# =========================================
# PARTICLE EFFECTS
# =========================================
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1..3 run particle minecraft:note ~ ~1 ~ 0.5 0.5 0.5 0.5 1
 
# =========================================
# DETECT EDGE CASES WHERE TIMER NEEDS TO BE RESET
# =========================================
execute if entity @a[tag=t_pm_owner,scores={evl_death=1},limit=1] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -1

# =========================================
# IF TEMPO TIMER EXPIRED
# =========================================

# Set cv_A and cv_B values to 0 
execute unless score @a[tag=t_pm_owner,limit=1] evl_dmg_dealt matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run tellraw @a[tag=t_debug] "classes/dancer/pmtl_dancer_tick: Tempo expired!"
execute unless score @a[tag=t_pm_owner,limit=1] evl_dmg_dealt matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0
execute unless score @a[tag=t_pm_owner,limit=1] evl_dmg_dealt matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 0

# Set armor to base value.
execute unless score @a[tag=t_pm_owner,limit=1] evl_dmg_dealt matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run function cg_maks:classes/dancer/pmt_dancer_inv_armor

# Update Tempo slot in inventory
execute unless score @a[tag=t_pm_owner,limit=1] evl_dmg_dealt matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run function cg_maks:classes/dancer/pmt_dancer_inv_tempo

#Start sound effect timer
execute unless score @a[tag=t_pm_owner,limit=1] evl_dmg_dealt matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_D 10

#Set cv_C to -2 (inactive timer state)
execute unless score @a[tag=t_pm_owner,limit=1] evl_dmg_dealt matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -2

# =========================================
# ON EVERY TICK
# =========================================

# Decrement Missile sequence timer and clear relevant tag
execute unless score @a[tag=t_pm_owner,limit=1] cv_E matches ..0 run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_E 1
tag @a remove t_dancer_sforz_missile

# Decrement Sound Effect Timer(s)
execute unless score @a[tag=t_pm_owner,limit=1] cv_D matches ..0 run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_D 1
execute unless score @a[tag=t_pm_owner,limit=1] cv_F matches ..0 run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_F 1
execute unless score @a[tag=t_pm_owner,limit=1] cv_G matches ..0 run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_G 1

# Decrement Hit Combo Window by 1 (until 0 ticks).
execute unless score @a[tag=t_pm_owner,limit=1] cv_B matches ..0 run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_B 1

# Decrement Tempo timer by 1 (until 0 ticks).
execute unless score @a[tag=t_pm_owner,limit=1] cv_C matches ..-2 run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_C 1

# If Tempo timer hit 0 this tick, decrement it one more time to trigger buff cleanup next tick.
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 0 run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_C 1

# =========================================
# IF PLAYER DEALT DAMAGE THIS TICK
# =========================================
execute unless score @a[tag=t_pm_owner,limit=1] evl_dmg_dealt matches 1.. run return 0
# IF TRUE
# Find out if player is eligible for a new stack, then add a tag.
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1..30 run tag @a[tag=t_pm_owner,limit=1] add t_add_tempo

# Set Hit Combo Window to 30 ticks.
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 30

# Increment Tempo stacks by 1 (unless already full).
execute if score @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_A matches 3.. run tag @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] add t_refresh_sfx
execute unless score @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_A matches 3.. run scoreboard players add @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_A 1
execute unless score @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_A matches 3.. run tellraw @a[tag=t_debug] "classes/dancer/pmtl_dancer_tick: Tempo stack added"

# Set Tempo timer to X seconds.
scoreboard players set @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_C 240

# Update player armor to the new tempo stacks.
function cg_maks:classes/dancer/pmt_dancer_inv_armor

# Update Tempo slot in inventory
function cg_maks:classes/dancer/pmt_dancer_inv_tempo

# Start sound effect timer
execute unless entity @a[tag=t_pm_owner,tag=t_refresh_sfx,limit=1] run scoreboard players set @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_D 9
execute if entity @a[tag=t_pm_owner,tag=t_refresh_sfx,limit=1,scores={cv_G=..0}] run scoreboard players set @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_F 9
execute if entity @a[tag=t_pm_owner,tag=t_refresh_sfx,limit=1,scores={cv_G=..0}] run scoreboard players set @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_G 100

# Clean up tags
tag @a remove t_add_tempo
tag @a remove t_refresh_sfx
