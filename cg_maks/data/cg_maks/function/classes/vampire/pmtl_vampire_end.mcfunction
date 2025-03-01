# classes/hexblade/pmtl_vampire_end.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Cleans up bestowed Marks/Remnants
#
# Arguments: (none)

# Search for and destroy any existing timers associated with this vampire
execute store result storage cg_maks:vampire_eid_args vampire_eid int 1 run scoreboard players get @s eid_owner
function cg_maks:classes/vampire/npe_destory_vampire_timers with storage cg_maks:vampire_eid_args
