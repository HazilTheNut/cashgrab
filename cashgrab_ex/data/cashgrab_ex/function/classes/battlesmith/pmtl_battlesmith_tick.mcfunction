# classes/battlesmith/pmtl_battlesmith_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Battlesmith class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Scrap count
#	cv_B	:	Upgrade Weapon sequence time, in ticks
#	cv_C	:	
#	cv_D	:	Coin pickup scrap generation lockout timer
#	cv_E	:	Weapon progression level
#	cv_F	:	
#	cv_G	:	Molten Mortar sfx timer
#	cv_H	:

# =========================
# Scrap collection

# Generate scrap from weapon hits
tag @a[tag=t_pm_owner,limit=1,scores={cv_A=..19,evl_dmg_dealt=1..}] add t_award_scrap

# Generate scrap from preiodically collecting coins
tag @a[tag=t_pm_owner,limit=1,scores={cv_A=..19,cv_D=0,evl_coin_pickup=1..}] add t_award_scrap
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={cv_A=..19,cv_D=0,evl_coin_pickup=1..}] cv_D 60

# Decrement coin collection lockout timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_D=1..}] cv_D 1

# Award scrap
scoreboard players add @a[tag=t_pm_owner,limit=1,tag=t_award_scrap] cv_A 1
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_scrap] run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_scrap
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_scrap] run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_upgrade
tag @a[tag=t_pm_owner,limit=1] remove t_award_scrap

# =========================
# Upgrade

# Upgrade weapon sequence timing
#   0   =   Idle
#   3   =   Step 1 icon
#   13  =   Step 2 icon
#   23  =   Step 3 icon
#   33  =   Done
#   34  =   Idle

# Determine if player is elligible to upgrade
execute store result score @a[tag=t_pm_owner,limit=1] temp_A run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_is_upgrade_ready

# Reset sequence timer when entering or exiting crouch
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,temp_A=1}] cv_B 0
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=-1}] cv_B 0

# Progress sequence timer while crouched
scoreboard players add @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1}] cv_B 1

# Update inventory at various intervals
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=3}] run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_upgrade
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=13}] run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_upgrade
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=23}] run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_upgrade
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=33}] run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_upgrade

# Play sfx at various intervals
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=3}] run playsound minecraft:block.metal.place player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 0.5 1.65 0.5
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=13}] run playsound minecraft:block.metal.place player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 0.5 1.70 0.5
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=23}] run playsound minecraft:block.metal.place player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 0.5 1.75 0.5
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=33}] run playsound minecraft:block.metal.place player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 0.5 2.0 0.5

# At end of sequence, spend Scrap and upgrade weapon

# Tier II costs 5 scrap
# Tier III costs 12 scrap
# Tier IV costs 20 scrap
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=33,cv_E=0,cv_A=5..}] cv_A 5
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=33,cv_E=1,cv_A=12..}] cv_A 12
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=33,cv_E=2,cv_A=20..}] cv_A 20
scoreboard players add @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=33,cv_E=..2}] cv_E 1
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=33}] run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_sword
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,temp_A=1,cv_B=33}] run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_scrap

# Update inventory when uncrouching
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=-1}] run function cashgrab_ex:classes/battlesmith/pmt_battlesmith_inv_upgrade
