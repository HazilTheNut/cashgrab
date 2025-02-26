# base/pmtl_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tracks item tosses, activating class abilities, and cooldowns
#
# Arguments: (none)

# =============================
# Consume toss item event

# If the player is in Gameplay or Tutorial activity states and has an ability charge, use ability and then expend charge
execute if entity @a[tag=t_pm_owner,limit=1,scores={__iev_drop=1..,ability_charges=1..,activity_state=20..29}] run function cashgrab:classes/pmtl_class_use_ability with entity @s data.class_info
execute if entity @a[tag=t_pm_owner,limit=1,scores={__iev_drop=1..,ability_charges=1..,activity_state=30..39}] run function cashgrab:tutorial/trainee/pmt_trainee_use_ability
scoreboard players operation @a[tag=t_pm_owner,limit=1,scores={__iev_drop=1..,ability_charges=1..,activity_state=20..39,ability_cd_ms=..0}] ability_cd_ms = @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={__iev_drop=1..,ability_charges=1..,activity_state=20..39}] ability_charges 1
# Regardless of player state, refresh inventory whenever they toss an item
execute if entity @a[tag=t_pm_owner,limit=1,scores={__iev_drop=1..}] run function cashgrab:util/pmt_inv_refresh
# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] __iev_drop 0

# =============================
# Handle cooldowns

# Only run the below during Gameplay activity_state
execute unless entity @a[tag=t_pm_owner,limit=1,scores={activity_state=20..29}] run return 0

# If no charges are left to recharge, return
execute if score @a[tag=t_pm_owner,limit=1] ability_charges >= @a[tag=t_pm_owner,limit=1] ability_cfg_charges_max run return 0

# If cooldown has fully ticked down, award ability charge and restart cooldown if more charges need to recharge
execute if score @a[tag=t_pm_owner,limit=1] ability_cd_ms matches ..0 run function cashgrab:base/pmt_ability_award_charge

# If no new cooldown has started, return
execute if score @a[tag=t_pm_owner,limit=1] ability_cd_ms matches ..0 run return 0

# Tick down cooldowns
scoreboard players operation @a[tag=t_pm_owner,limit=1,scores={ability_cd_ms=0..}] ability_cd_ms -= @a[tag=t_pm_owner,limit=1] ability_cd_tickrate

# Display cooldown icon

# Calculate __ability_cd_display_secs based on ability_cd_ms
scoreboard players operation @a[tag=t_pm_owner,limit=1] __ability_cd_display_secs = @a[tag=t_pm_owner,limit=1] ability_cd_ms
scoreboard players operation @a[tag=t_pm_owner,limit=1] __ability_cd_display_secs /= NUM_ONE_THOUSAND num
# we have rounding up at home
scoreboard players add @a[tag=t_pm_owner,scores={ability_cd_ms=1..}] __ability_cd_display_secs 1

# Display ability icon while cooldown is ticking down
execute if entity @a[tag=t_pm_owner,scores={ability_cd_ms=0..}] run function cashgrab:util/pmt_inv_ability_icon_argloader
