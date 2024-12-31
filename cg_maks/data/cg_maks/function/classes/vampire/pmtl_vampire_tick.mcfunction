# classes/vampire/pmtl_vampire_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Vampire class
#
# Arguments: (none)

# Search for Remnant timers
function cashgrab:util/npe_eid_find_peers

# Tag all eligible Remnant timers for consumption, and then consume them.
tag @e[scores={eid_compare=0},tag=t_vampire_remnant_timer,distance=..0.5] add t_vampire_remnant_consume
execute if entity @e[tag=t_vampire_remnant_consume] run effect give @a[tag=t_pm_owner,limit=1] instant_health 1 0
execute if entity @e[tag=t_vampire_remnant_consume] run playsound minecraft:block.beacon.power_select player @a[tag=t_pm_owner,limit=1] ~ ~ ~ 2 1.5
tag @e[tag=t_vampire_remnant_consume] add t_cleanup