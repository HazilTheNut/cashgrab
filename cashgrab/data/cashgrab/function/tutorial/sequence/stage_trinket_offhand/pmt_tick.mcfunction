# tutorial/sequence/stage_trinket_offhand/pmt_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tick function for current tutorial sequence stage
#
# Arguments: (none)

# Check if player drank the Vigor Flask from offhand
execute if score @a[tag=t_pm_owner,limit=1] trinket_charges matches 0 if score @a[tag=t_pm_owner,limit=1] trinket_in_offhand matches 1 run scoreboard players set @a[tag=t_pm_owner,limit=1] __tutorial_seq_next_idx 53
