# base/cts/pmt_cts_input_random.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Class-and-trinket random selection input collector function
#
# Arguments: (none)

function cashgrab:base/cts/pmt_select_random with storage cashgrab:cts_inv_args

# Tag pm owner with t_cts_input_found
tag @a[tag=t_pm_owner,limit=1] add t_cts_input_found
