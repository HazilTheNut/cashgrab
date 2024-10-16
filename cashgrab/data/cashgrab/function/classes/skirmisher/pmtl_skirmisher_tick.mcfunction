# classes/skirmisher/pmtl_skirmisher_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Skirmisher class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Held item: 0 = neither sword, 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_B	:	Item config: 0 = has both, 1 = only Cleaving Cutlass, 2 = only Dancing Rapier
#	cv_C	:	If 1, refresh inventory
#	cv_D	:	
#	cv_E	:	Boomerang type: 1 = Cleaving Cutlass, 2 = Dancing Rapier
#	cv_F	:	Boomerang missile particle display timer
#	cv_G	:	Boomerang item display rotation
#	cv_H	:	Boomerang life timer (counts upwards instead of downwards for more readable code)

# Sword position tracking
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0
scoreboard players set @a[tag=t_pm_owner,limit=1,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] cv_A 1
scoreboard players set @a[tag=t_pm_owner,limit=1,nbt={SelectedItem:{id:"minecraft:golden_sword"}}] cv_A 2

# When ability exits cooldown, return sword to player
execute if score @a[tag=t_pm_owner,limit=1] ability_cd_ticks matches 1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 0
execute if score @a[tag=t_pm_owner,limit=1] ability_cd_ticks matches 1 run function cashgrab:classes/skirmisher/pmt_skirmisher_inv

# Refresh inventory when catching boomerang
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches 1.. run function cashgrab:classes/skirmisher/pmt_skirmisher_inv
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 0
