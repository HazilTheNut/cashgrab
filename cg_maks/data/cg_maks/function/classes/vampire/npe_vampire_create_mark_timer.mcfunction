# classes/vampire/npe_vampire_create_mark_timer.mcfunction
#
# Context:
#	as: a non-player entity
#   + assumes that target entity is tagged with t_vampire_marked_target
#   + assumes that the Vampire that originated this remnant is tagged with t_vampire_mark_owner
#	at: the entity's location
#	
#
# Summary: Creates a Mark timer that handles the Vampire's Marked debuff.
#
# Arguments: (none)
# TODO look into delegating debuff behavior into this timer's start function
execute at @a[tag=t_vampire_marked_target,limit=1] rotated as @a[tag=t_vampire_marked_target,limit=1] run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:140,\
b_anchor_at_pos:0,\
t_timer_name:"t_vampire_mark_timer_init",\
func_npe_start:"cg_maks:classes/vampire/vampire_mark_timer_start",\
func_npe_tick:"cg_maks:classes/vampire/vampire_mark_timer_tick",\
func_npe_end:"cg_maks:classes/vampire/vampire_mark_timer_end",\
b_assign_as_peer:1,\
}

# Ensure this timer is owned by the target entity
scoreboard players operation @n[tag=t_vampire_mark_timer_init] eid_owner = @a[tag=t_vampire_marked_target,limit=1] eid_self
scoreboard players operation @n[tag=t_vampire_mark_timer_init] cv_B = @a[tag=t_vampire_mark_owner,limit=1] eid_self

# Clean up some tags
tag @n[tag=t_vampire_mark_timer_init] add t_stasis_immune
tag @n[tag=t_vampire_mark_timer_init] add t_vampire_mark_timer
tag @n[tag=t_vampire_mark_timer_init] remove t_vampire_mark_timer_init