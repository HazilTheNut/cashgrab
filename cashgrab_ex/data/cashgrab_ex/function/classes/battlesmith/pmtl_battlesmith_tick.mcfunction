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
tag @a[tag=t_pm_owner,limit=1] remove t_award_scrap

