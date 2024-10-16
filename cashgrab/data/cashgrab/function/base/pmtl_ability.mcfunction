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

# If the player is in Gameplay activity state and has an ability charge, use ability and then expend charge
execute if entity @a[tag=t_pm_owner,scores={__iev_drop=1..,ability_charges=1..}] run function cashgrab:classes/pmtl_class_use_ability
scoreboard players remove @a[tag=t_pm_owner,scores={__iev_drop=1..,ability_charges=1..,activity_state=20..29}] ability_charges 1
# Regardless of player state, refresh inventory whenever they toss an item
execute if entity @a[tag=t_pm_owner,scores={__iev_drop=1..}] run function cashgrab:util/pmt_inv_refresh
# Consume event
scoreboard players set @a[tag=t_pm_owner] __iev_drop 0

# =============================
# Handle cooldowns

# Only run the below during Gameplay activity_state
execute unless entity @a[tag=t_pm_owner,scores={activity_state=20..29}] run return 0

# Start ability cooldown if there is a charge yet to be recharged
execute if score @a[tag=t_pm_owner,limit=1] ability_charges < @a[tag=t_pm_owner,limit=1] ability_cfg_charges run scoreboard players operation @a[tag=t_pm_owner,limit=1,scores={ability_cd_ticks=..0}] ability_cd_ticks = @a[tag=t_pm_owner,limit=1] ability_cfg_cooldown_ticks

# If no cooldowns are running, return
execute if score @a[tag=t_pm_owner,limit=1] ability_cd_ticks matches ..-1 run return 0

# Tick down cooldowns
scoreboard players remove @a[tag=t_pm_owner,scores={ability_cd_ticks=0..}] ability_cd_ticks 1

# Award an ability charge when cooldown timer hits 0 (it will decrement again to -1 if no more ability charges need to be provided)
scoreboard players add @a[tag=t_pm_owner,scores={ability_cd_ticks=0}] ability_charges 1

# Display cooldown icon

# Calculate ability_cd_secs based on ability_cd_ticks
scoreboard players operation @a[tag=t_pm_owner,limit=1] ability_cd_secs = @a[tag=t_pm_owner,limit=1] ability_cd_ticks
scoreboard players operation @a[tag=t_pm_owner,limit=1] ability_cd_secs /= NUM_TICKS_PER_SEC num
# we have rounding up at home
scoreboard players add @a[tag=t_pm_owner,scores={ability_cd_ticks=1..}] ability_cd_secs 1

# Display ability icon while cooldown is ticking down
execute if entity @a[tag=t_pm_owner,scores={ability_cd_ticks=0..}] run function cashgrab:util/pmt_inv_ability_icon_argloader
