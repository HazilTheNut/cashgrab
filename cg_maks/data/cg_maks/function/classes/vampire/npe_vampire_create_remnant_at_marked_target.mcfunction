# classes/vampire/npe_vampire_create_remnant_at_marked_target.mcfunction
#
# Context:
#	as: a non-player entity
#   + assumes that target entity is tagged with t_vampire_marked_target
#   + assumes that the Vampire that originated this remnant is tagged with t_vampire_mark_owner
#	at: the entity's location
#	
#
# Summary: Creates a Remnant timer that the Vampire can interact with.
#
# Arguments: (none)

# Debug statement
tellraw @a[tag=t_debug] "classes/vampire/pmtl_vampire_create_remnant_at_marked_target.mcfunction"

# Set timer
execute at @a[tag=t_vampire_marked_target,limit=1] rotated as @a[tag=t_vampire_marked_target,limit=1] run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:200,\
b_anchor_at_pos:1,\
t_timer_name:"t_vampire_remnant_timer_init",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cg_maks:classes/vampire/vampire_remnant_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}

# Transfer ownership of this timer to the Vampire who marked the player initially.
scoreboard players operation @n[tag=t_vampire_remnant_timer_init] eid_owner = @a[tag=t_vampire_mark_owner,limit=1] eid_self

# Update inventory display to show available Remnant

# Add/remove necessary tags to timer and notify Vampire.
tag @n[tag=t_vampire_remnant_timer_init] add t_vampire_remnant_timer
tag @n[tag=t_vampire_remnant_timer_init] add t_stasis_immune
tag @n[tag=t_vampire_remnant_timer_init] remove t_vampire_remnant_timer_init
# TODO replace with inventory update
# tellraw @a[tag=t_pm_owner,limit=1] "remnant ready" 




