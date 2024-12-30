# trinkets/accelerator/pmtl_accelerator_use_item.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Runs when trinket is used
#
# Arguments: (none)

# Don't let this trinket stack with itself
function cashgrab:util/npe_eid_find_peers
execute if entity @e[tag=t_accelerator_timer,scores={eid_compare=0}] run scoreboard players set @a[tag=t_eid_matches,limit=1] trinket_charges_modify 1
execute if entity @e[tag=t_accelerator_timer,scores={eid_compare=0}] run return 0

# Generate accelerator timer if none exist
function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:300,\
b_anchor_at_pos:0,\
t_timer_name:"t_accelerator_timer",\
func_npe_start:"cashgrab_ex:trinkets/accelerator/accelerator_timer_start",\
func_npe_tick:"cashgrab_ex:trinkets/accelerator/accelerator_timer_tick",\
func_npe_end:"cashgrab_ex:trinkets/accelerator/accelerator_timer_end",\
b_assign_as_peer:1,\
}
