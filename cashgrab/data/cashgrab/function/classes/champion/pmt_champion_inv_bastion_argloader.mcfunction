# classes/champion/pmt_champion_inv_bastion.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts Bastion (shield) item
#
# Arguments: 
#   slot    :   which slot to insert into
#   damage  :   durability damage amount

# Class variable usage:
#	cv_A	:	Commander Charge sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Bastion (shield) durability/hits remaining
#	cv_F	:	Bastion (shield) refresh cooldown, in ms
#	cv_G	:	
#	cv_H	:	

clear @a[tag=t_pm_owner,limit=1] minecraft:shield

# If shield is fully depleted, do nothing
execute if score @a[tag=t_pm_owner,limit=1] cv_E matches ..0 run return 0

# Slot to insert into depends on trinket position
execute if score @a[tag=t_pm_owner,limit=1] trinket_in_offhand matches 0 run data modify storage cashgrab:champion_args shield_slot set value "weapon.offhand"
execute if score @a[tag=t_pm_owner,limit=1] trinket_in_offhand matches 1 run data modify storage cashgrab:champion_args shield_slot set value "hotbar.1"

# Shield damage depends on cv_E
execute if score @a[tag=t_pm_owner,limit=1] cv_E matches 5 run data modify storage cashgrab:champion_args shield_damage set value 0
execute if score @a[tag=t_pm_owner,limit=1] cv_E matches 4 run data modify storage cashgrab:champion_args shield_damage set value 67
execute if score @a[tag=t_pm_owner,limit=1] cv_E matches 3 run data modify storage cashgrab:champion_args shield_damage set value 134
execute if score @a[tag=t_pm_owner,limit=1] cv_E matches 2 run data modify storage cashgrab:champion_args shield_damage set value 201
execute if score @a[tag=t_pm_owner,limit=1] cv_E matches 1 run data modify storage cashgrab:champion_args shield_damage set value 268

# Run function
function cashgrab:classes/champion/pmt_champion_inv_bastion with storage cashgrab:champion_args
