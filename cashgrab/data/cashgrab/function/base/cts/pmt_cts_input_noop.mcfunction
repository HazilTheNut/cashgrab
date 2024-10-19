# base/cts/pmt_cts_input_noop.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Class-and-trinket selection "no op" input collector function
#
# Arguments: (none)

# Tag pm owner with t_cts_input_found
tag @a[tag=t_pm_owner,limit=1] add t_cts_input_found
