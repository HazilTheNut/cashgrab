# trinkets/pmtl_test_item_use_item.mcfunction
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

# Create effects
tellraw @a[tag=t_debug] "--- Start of test raycast"
execute positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:5,\
i_origin_loc:1,\
col_terrain_allowed:"#cashgrab:partialsolid",\
b_fit_player:1,\
func_entity_filter:"cashgrab:util/npe_col_filter_entity_owner",\
func_step:"cashgrab:trinkets/test_item/pmtl_raycast_step",\
func_end:"cashgrab:trinkets/test_item/pmtl_raycast_end",\
}

# Consume events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_eggs 0
