# trinkets/pmtl_tick_vigor_flask.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Inventory tracking and handling of trinkets
#
# Arguments: (none)

# If you use an egg while holding your trinket, deduct trinket_charges
execute if entity @a[tag=t_pm_owner,limit=1,scores={ev_eggs=1..,trinket_held=1}] positioned ~ ~1.625 ~ run tellraw @a[tag=t_debug] "--- Start of test raycast"
execute if entity @a[tag=t_pm_owner,limit=1,scores={ev_eggs=1..,trinket_held=1}] positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:5,\
i_origin_loc:1,\
col_terrain_allowed:"#cashgrab:partialsolid",\
b_fit_player:1,\
func_entity_filter:"cashgrab:util/npe_col_filter_entity_owner",\
func_step:"cashgrab:trinkets/test_item/pmtl_raycast_step",\
func_end:"cashgrab:trinkets/test_item/pmtl_raycast_end",\
}

execute if entity @a[tag=t_pm_owner,limit=1,scores={ev_eggs=1..,trinket_held=1}] run scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={trinket_charges=1..}] trinket_charges 1
execute if entity @a[tag=t_pm_owner,limit=1,scores={ev_eggs=1..,trinket_held=1}] run function cashgrab:util/pmt_inv_trinket_argloader
