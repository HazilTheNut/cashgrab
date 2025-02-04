# trinkets/nox_bomb/pmt_nox_bomb_init.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Initializes Nox Bomb and its charge count
#
# Arguments: (none)

scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges 1
scoreboard players set @a[tag=t_pm_owner,limit=1] trinket_charges_max 1

# Clear events
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_echo_shards 0
