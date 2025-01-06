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
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:

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

#Set cv_C to -2 (inactive timer state)
execute unless score @a[tag=t_pm_owner,limit=1] evl_dmg_dealt matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -2

# =========================================
# ON EVERY TICK
# =========================================

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
execute unless score @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_A matches 3.. run scoreboard players add @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_A 1
execute unless score @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_A matches 3.. run tellraw @a[tag=t_debug] "classes/dancer/pmtl_dancer_tick: Tempo stack added"

# Set Tempo timer to X seconds.
scoreboard players set @a[tag=t_pm_owner,tag=t_add_tempo,limit=1] cv_C 240

# Update player armor to the new tempo stacks.
function cg_maks:classes/dancer/pmt_dancer_inv_armor

# Update Tempo slot in inventory
function cg_maks:classes/dancer/pmt_dancer_inv_tempo

# Clean up tags
tag @a remove t_add_tempo
