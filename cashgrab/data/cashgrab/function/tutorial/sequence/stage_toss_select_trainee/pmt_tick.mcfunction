# tutorial/sequence/stage_toss_select_trainee/pmt_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tick function for current tutorial sequence stage
#
# Arguments: (none)

# Progress if player clicks on inventory cts icon
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.13 * run clear @a[tag=t_pm_owner,limit=1]
execute unless items entity @a[tag=t_pm_owner,limit=1] inventory.13 * run scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_seq_next_idx 22
