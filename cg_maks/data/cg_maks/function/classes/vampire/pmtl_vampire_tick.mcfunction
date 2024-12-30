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

# Decrement Marked sequence timer
scoreboard players remove @a[tag=t_pm_owner,limit=1,scores={cv_A=1..}] cv_A 1