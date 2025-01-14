# trinkets/spring_plume/pmtl_spring_plume_use_item.mcfunction
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

# Remove grab effects
tag @a[tag=t_pm_owner,limit=1] add t_grab_release

# Create effect timer to grant slow falling when player jumps
function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:60,\
b_anchor_at_pos:0,\
t_timer_name:"t_spring_plume_effect_timer",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:trinkets/spring_plume/npe_spring_plume_effect_timer_tick",\
func_npe_end:"cashgrab_ex:trinkets/spring_plume/npe_spring_plume_effect_timer_end",\
b_assign_as_peer:1,\
}
