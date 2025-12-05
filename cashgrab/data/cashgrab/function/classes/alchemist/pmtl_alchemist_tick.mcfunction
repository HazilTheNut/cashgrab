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
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	
#	cv_H	:	

# Inventory tracking: Caustic Fume
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0
execute if items entity @a[tag=t_pm_owner,limit=1] hotbar.* minecraft:splash_potion[minecraft:enchantment_glint_override=true] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.* minecraft:splash_potion[minecraft:enchantment_glint_override=true] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1

# Inventory tracking: Booster Brew
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 0
execute if items entity @a[tag=t_pm_owner,limit=1] hotbar.* minecraft:potion[minecraft:enchantment_glint_override=true] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1
execute if items entity @a[tag=t_pm_owner,limit=1] weapon.* minecraft:potion[minecraft:enchantment_glint_override=true] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1

# Remove empty bottles produced from drinking Booster Brew
clear @a[tag=t_pm_owner,limit=1] minecraft:glass_bottle

# Each potion takes various amounts of time to brew which defines these ranges for cv_C:
#	0		= idle
#	1-40	= brewing Caustic Brew
#		1	= (step 1 icon)
#		14	= (step 2 icon)
#		27	= (step 3 icon)
#		40	= award potion
#	101-140	= brewing Booster Brew
#		101	= (step 1 icon)
#		114	= (step 2 icon)
#		127	= (step 3 icon)
#		140	= award potion
#	201-280	= crafting Trinket
#		201	= (step 1 icon)
#		216	= (step 2 icon)
#		232	= (step 3 icon)
#		248	= (step 4 icon)
#		264	= (step 5 icon)
#		280	= award potion

# ===========================================================
# Initiate potion brewing sequence when entering crouch

# Case I: Begin Caustic Fume
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,cv_A=0}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 1

# Case II: Begin Booster Brew
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,cv_A=1,cv_B=0}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 101

# Case III: Begin Trinket
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,cv_A=1,cv_B=1}] if score @a[tag=t_pm_owner,limit=1] trinket_charges < @a[tag=t_pm_owner,limit=1] trinket_charges_max run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 201

# Case IV: Do nothing
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=2,cv_A=1,cv_B=1}] if score @a[tag=t_pm_owner,limit=1] trinket_charges >= @a[tag=t_pm_owner,limit=1] trinket_charges_max run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -1

# ===========================================================
# Potion brewing sequence

# Update potion brewing icon as you gain progress
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 1 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 14 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 27 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 101 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 114 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 127 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 201 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 216 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 232 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 248 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 264 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon

# Progress potion brewing while crouching
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 1 if score @a[tag=t_pm_owner,limit=1] cv_C matches 1.. run scoreboard players add @a[tag=t_pm_owner,limit=1] cv_C 1

# --- Award potions upon completing a sequence
# Caustic Fume done
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=40}] run tag @a[tag=t_pm_owner,limit=1] add t_award_potions
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=40}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=40,cv_B=0}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 101
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=40,cv_B=1}] if score @a[tag=t_pm_owner,limit=1] trinket_charges < @a[tag=t_pm_owner,limit=1] trinket_charges_max run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 201
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=40,cv_B=1}] if score @a[tag=t_pm_owner,limit=1] trinket_charges >= @a[tag=t_pm_owner,limit=1] trinket_charges_max run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -1
# Booster Brew done
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=140}] run tag @a[tag=t_pm_owner,limit=1] add t_award_potions
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=140}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 1
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=140}] if score @a[tag=t_pm_owner,limit=1] trinket_charges < @a[tag=t_pm_owner,limit=1] trinket_charges_max run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 201
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=140}] if score @a[tag=t_pm_owner,limit=1] trinket_charges >= @a[tag=t_pm_owner,limit=1] trinket_charges_max run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -1
# Trinket done
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=280}] run tag @a[tag=t_pm_owner,limit=1] add t_trinket_replenish
execute if entity @a[tag=t_pm_owner,limit=1,scores={ps_sneaking=1,cv_C=280}] run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C -1

# Award potions
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_potions] run clear @a[tag=t_pm_owner,limit=1] *[minecraft:custom_data={is_alchemist_potion:1}]
execute if entity @a[tag=t_pm_owner,limit=1,tag=t_award_potions] run function cashgrab:classes/alchemist/pmt_alchemist_inv_potions

tag @a[tag=t_pm_owner,limit=1] remove t_award_potions

# Consume events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_potions 0
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_splash_potions 0

# ===========================================================
# Exit potion brewing by uncrouching
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 0

# Update potion brewing icon when entering or leaving crouch
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches -1 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] ps_sneaking matches 2 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon

# Update potion brewing icon on sequence complete
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run function cashgrab:classes/alchemist/pmt_alchemist_inv_potion_brewing_icon
execute if score @a[tag=t_pm_owner,limit=1] cv_C matches -1 run scoreboard players set @a[tag=t_pm_owner,limit=1] cv_C 0

# ===========================================================
# Translocator teleport sequence
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_F=0..}] cv_F 1
scoreboard players add @a[tag=t_pm_owner,limit=1,scores={evl_dmg_taken=1..,cv_F=0..}] cv_F 10
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches 1.. run particle minecraft:dust{color:[0.4,1.0,0.8],scale:2.0f} ~ ~1.2 ~ 0.35 0.6 0.35 0.2 1 force
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches 1.. run particle minecraft:enchanted_hit ~ ~1.2 ~ 0.35 0.6 0.35 0.2 1
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches 0 run function cashgrab:classes/alchemist/pmtl_alchemist_teleport