# classes/champion/pmtl_champion_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Champion class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Bastion (shield) durability remaining
#	cv_F	:	Bastion (shield) refresh cooldown, in ms
#	cv_G	:	
#	cv_H	:	

# =============================
# Commander / Valiant Charge

# Decrement Commander Charge sequence timer
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0.. run scoreboard players remove @a[tag=t_pm_owner,limit=1] cv_A 1

# Add more particles to speed effect
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1.. run particle minecraft:effect ~ ~0.5 ~ 0.5 0.5 0.5 0 1 force

# Apply absorption shield
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run function cashgrab:classes/champion/pmtl_apply_absorption_aoe

# =============================
# Bastion

# When blocking a hit, decrement durability, reduce Valiant/Commander Charge cooldown, start cooldown timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={evl_dmg_blocked_by_shield=1..}] cv_E 1
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evl_dmg_blocked_by_shield=1..}] cv_F 4000
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={evl_dmg_blocked_by_shield=1..,ability_cd_ms=1001..}] ability_cd_ms 1000
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evl_dmg_blocked_by_shield=1..,ability_cd_ms=1..1000}] ability_cd_ms 1
execute if score @a[tag=t_pm_owner,limit=1] evl_dmg_blocked_by_shield matches 1.. run function cashgrab:classes/champion/pmt_champion_inv_bastion_argloader

# If this damage blocked is the final hit, play sfx / vfx
execute if score @a[tag=t_pm_owner,limit=1] evl_dmg_blocked_by_shield matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_E matches 0 run playsound minecraft:item.shield.break player @a ~ ~ ~ 1.0 1.2
execute if score @a[tag=t_pm_owner,limit=1] evl_dmg_blocked_by_shield matches 1.. if score @a[tag=t_pm_owner,limit=1] cv_E matches 0 rotated ~ 0 run particle minecraft:item{item:"minecraft:shield"} ^ ^1 ^0.75 0.35 0.75 0.35 0.05 15 force

# Decrement Bastion cooldown
scoreboard players operation @a[tag=t_pm_owner,limit=1,scores={cv_F=1..}] cv_F -= @a[tag=t_pm_owner,limit=1] ability_cd_tickrate

# When cooldown expires, refresh Bastion
execute unless entity @a[tag=t_pm_owner,limit=1,scores={cv_E=..4,cv_F=..0}] run return 0
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_E 5
function cashgrab:classes/champion/pmt_champion_inv_bastion_argloader
