# trinkets/lava_cake/pmt_lava_cake_use_item.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Executes the behavior of Lava Cake when used
#
# Arguments: (none)

# Don't let this trinket stack with itself
function cashgrab:util/npe_eid_find_peers
execute if entity @e[tag=t_lava_cake_timer,scores={eid_compare=0}] run scoreboard players set @a[tag=t_eid_matches,limit=1] trinket_charges_modify 1
execute if entity @e[tag=t_lava_cake_timer,scores={eid_compare=0}] run return 0

effect give @a[tag=t_pm_owner,limit=1] minecraft:fire_resistance 7 0
effect clear @a[tag=t_pm_owner,limit=1] minecraft:mining_fatigue

# Create explosion timer
execute at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:140,\
b_anchor_at_pos:0,\
t_timer_name:"t_lava_cake_timer",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cg_maks:trinkets/lava_cake/lava_cake_timer_tick",\
func_npe_end:"cg_maks:trinkets/lava_cake/lava_cake_timer_end",\
b_assign_as_peer:1,\
}