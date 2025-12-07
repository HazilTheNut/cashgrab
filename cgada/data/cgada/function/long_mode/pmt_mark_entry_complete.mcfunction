# Arguments:
#	entry_idx		: Entry index number

# Record player has died
$data modify storage cgada:long_data entries[$(entry_idx)].b_entry_complete set value 1

# Copy gameplay lifetime to entry
$execute store result storage cgada:long_data entries[$(entry_idx)].i_gameplay_lifetime_ticks int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] __cgada_gameplay_lifetime_ticks
