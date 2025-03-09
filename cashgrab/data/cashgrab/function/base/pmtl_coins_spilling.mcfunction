# base/pmtl_coins_spilling.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Handles coin spilling mechanics for each player
#
# Arguments: (none)

scoreboard players add @a[tag=t_pm_owner,limit=1] __coinspilling_timer_ticks 0

# Count down announcement lockout timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={__coinspilling_announcement_lockout_ticks=1..}] __coinspilling_announcement_lockout_ticks 1

# If player is near a coin shower, set timer to 3 seconds
execute if entity @e[tag=t_coinshower,distance=..3] run scoreboard players set @a[tag=t_pm_owner,limit=1] __coinspilling_timer_ticks 60

# If in gameplay, decrement timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={__coinspilling_timer_ticks=1..,activity_state=20..29}] __coinspilling_timer_ticks 1

# If player is not above coin spilling threshold, remove tag and do nothing else
execute if score @a[tag=t_pm_owner,limit=1] coins < NUM_COIN_SPILLING_THRESHOLD num run return run tag @a[tag=t_pm_owner] remove t_above_coinspilling_threshold

# Below only runs when player is at or above coin spilling threshold

# --- Chat announcement

# If player is above spilling threshold but not yet tagged for this, make announcement
execute if entity @a[tag=t_pm_owner,limit=1,tag=!t_above_coinspilling_threshold,scores={__coinspilling_announcement_lockout_ticks=0}] run tellraw @a [{"type":"selector","color":"yellow","selector":"@a[tag=t_pm_owner,limit=1]"},{"type":"text","color":"aqua","underlined":false,"text":" has so many coins that they're spilling out of their pockets! Defeat them before they win!"}]
scoreboard players set @a[tag=t_pm_owner,limit=1,tag=!t_above_coinspilling_threshold,scores={__coinspilling_announcement_lockout_ticks=0}] __coinspilling_announcement_lockout_ticks 600
tag @a[tag=t_pm_owner,limit=1] add t_above_coinspilling_threshold

# --- Coin dispensing

# Display particles
particle minecraft:dust{color:[0.9f,0.9f,0.65f],scale:0.65} ~ ~1 ~ 0.2 0.6 0.2 0 1

# If timer is at zero, dispense coin and reset timer
execute unless entity @a[tag=t_pm_owner,limit=1,scores={__coinspilling_timer_ticks=..0}] run return 0

function cashgrab:base/npe_spew_coin_pickup_argloader
scoreboard players remove @a[tag=t_pm_owner,limit=1] coins 1
function cashgrab:util/pmt_inv_coins_argloader
scoreboard players set @a[tag=t_pm_owner,limit=1] __coinspilling_timer_ticks 20
