# tutorial/sequence/stage_coins_healing/pmt_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tick function for current tutorial sequence stage
#
# Arguments: (none)

# Progress to next stage when player collects a coin while below full hp
execute if score @a[tag=t_pm_owner,limit=1] evl_coin_pickup matches 1.. if score @a[tag=t_pm_owner,limit=1] stat_hp matches ..19 run scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_seq_next_idx 13
