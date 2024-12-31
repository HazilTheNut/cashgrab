# classes/vampire/pm_vampire_create_soul_siphon_missile
#
# Context:
#	as: a Player Monitor (pm) marker
#   + assumes that the Vampire that originated this remnant is tagged with t_vampire_mark_owner
#
# Summary: Creates Soul Siphon missile from originator Vampire towards PM owner
#
# Arguments: (none)

# Search for owner since we do not assume they are tagged for this function
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args

# Owner of this PM should now be tagged with t_eid_matches

# If owner is not a target of Soul Siphon, do nothing
execute unless entity @a[tag=t_eid_matches,tag=t_vampire_soulsiphon_target] run return 0

# Create soul siphon missile flying from Vampire originator to PM owner
execute at @a[tag=t_vampire_mark_owner,limit=1] positioned ~ ~1 ~ facing entity @a[tag=t_eid_matches,limit=1] eyes run function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.65f,\
i_lifetime_ticks:50,\
i_origin_loc:1,\
f_focal_dist_m:50,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
f_tracking_scalar:0.95f,\
t_missile_name:"t_vampire_soulsiphon_missile",\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_tracking_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cg_maks:classes/vampire/vampire_missile_tick",\
func_npe_end:"cg_maks:classes/vampire/vampire_missile_end",\
b_assign_as_peer:1,\
}
