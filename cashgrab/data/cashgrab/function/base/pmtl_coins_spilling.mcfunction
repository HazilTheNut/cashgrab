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

# If player is near a coin shower, set timer to 3 seconds
execute if entity @e[tag=t_coinshower,distance=..3] run scoreboard players set @a[tag=t_pm_owner,limit=1] __coinspilling_timer_ticks 60

# If in gameplay, decrement timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={__coinspilling_timer_ticks=1..,activity_state=20..29}] __coinspilling_timer_ticks 1

# If player is not above coin spilling threshold, do nothing else
execute if score @a[tag=t_pm_owner,limit=1] coins < NUM_COIN_SPILLING_THRESHOLD num run return 0

# Display particles
execute unless entity @a[tag=t_pm_owner,limit=1,scores={activity_state=20..29}] run particle minecraft:dust{color:[0.9f,0.9f,0.65f],scale:0.65} ~ ~1 ~ 0.2 0.6 0.2 0 1

# If timer is at zero, dispense coin and reset timer
execute unless entity @a[tag=t_pm_owner,limit=1,scores={__coinspilling_timer_ticks=..0,activity_state=20..29}] run return 0

function cashgrab:base/npe_spew_coin_pickup_argloader
scoreboard players remove @a[tag=t_pm_owner,limit=1] coins 1
function cashgrab:util/pmt_inv_coins_argloader
scoreboard players set @a[tag=t_pm_owner,limit=1] __coinspilling_timer_ticks 20
