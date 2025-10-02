# Arguments:
#	entry_idx		: Entry index number

# Record player has died
$data modify storage cgada:long_data entries[$(entry_idx)].b_entry_complete set value 1