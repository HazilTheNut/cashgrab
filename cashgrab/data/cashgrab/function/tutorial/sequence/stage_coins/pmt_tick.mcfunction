# tutorial/sequence/stage_coins/pmt_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tick function for current tutorial sequence stage
#
# Arguments: (none)

# Progress to next stage when player collects a coin
execute if score @a[tag=t_pm_owner,limit=1] evl_coin_pickup matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_seq_next_idx 12
