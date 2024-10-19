# classes/alchemist/pmtl_alchemist_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Alchemist class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	Flame Trap expiration timer
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Inventory tracking: Caustic Brew
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0
execute if items entity @a[tag=t_pm_owner,limit=1] hotbar.* minecraft:splash_potion[minecraft:enchantment_glint_override=true] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.* minecraft:splash_potion[minecraft:enchantment_glint_override=true] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1

# Inventory tracking: Booster Brew
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 0
execute if items entity @a[tag=t_pm_owner,limit=1] hotbar.* minecraft:potion[minecraft:enchantment_glint_override=true] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.* minecraft:potion[minecraft:enchantment_glint_override=true] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1

# Remove empty bottles produced from drinking Booster Brew
clear @a[tag=t_pm_owner,limit=1] minecraft:glass_bottle

# Each potion takes 3 seconds to brew which defines these ranges for cv_C:
#	0		= idle
#	1-50	= brewing Caustic Brew
#		1	= (step 1 icon)
#		16	= (step 2 icon)
#		32	= (step 3 icon)
#		50	= award potion
#	51-100	= brewing Booster Brew
#		51	= (step 1 icon)
#		66	= (step 2 icon)
#		82	= (step 3 icon)
#		100	= award potion

# ===========================================================
# Initiate potion brewing sequence when entering crouch

# Case I: Begin Caustic Fume
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,cv_A=0}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 1

# Case II: Begin Booster Brew
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,cv_A=1,cv_B=0}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 51

# Case III: Do nothing
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,cv_A=1,cv_B=1,trinket_charges=0}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 101

execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,cv_A=1,cv_B=1,trinket_charges=1}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -1

# ===========================================================
# Potion brewing sequence

# Update potion brewing icon as you gain progress
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 1 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 16 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 32 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 51 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 66 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 82 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 101 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 121 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 141 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 161 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 181 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon

# Progress potion brewing while crouching
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 1.. run scoreboard players add @a[tag=t_pm_owner,limit=1] cv_C 1

# --- Award potions upon completing a sequence
# Caustic Fume done
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=50}] run tag @a[tag=t_pm_owner,limit=1] add t_award_potions
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=50}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=50,cv_B=1,trinket_charges=0}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 101
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=50,cv_B=1,trinket_charges=1..}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -1
# Booster Brew done
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=100}] run tag @a[tag=t_pm_owner,limit=1] add t_award_potions
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=100}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=100,trinket_charges=1..}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -1
# Vigor Flask done
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=200}] run tag @a[tag=t_pm_owner,limit=1] add t_award_potions
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=200}] run function cashgrab:trinkets/pmt_trinket_init with entity @s data.trinket_info
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=200}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -1

# Award potions
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_potions] run clear @a[tag=t_pm_owner,limit=1] minecraft:potion
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_potions] run clear @a[tag=t_pm_owner,limit=1] minecraft:splash_potion
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_potions] run function cashgrab:classes/alchemist/pmt_alchemist_inv_potions
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_potions] run function cashgrab:util/pmt_inv_trinket_argloader

tag @a[tag=t_pm_owner,limit=1] remove t_award_potions

# ===========================================================
# Exit potion brewing by uncrouching
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 0

# Update potion brewing icon when entering or leaving crouch
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches -1 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 2 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon

# Update potion brewing icon on sequence complete
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 0
