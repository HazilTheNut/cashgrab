# trinkets/hedge_seed/npe_hedge_seed_timer_destroy.mcfunction
#
# Context:
#	as: a timer entity
#	at: the timer's owner
#
# Summary: Destroys leaf block column
#
# Arguments: 
#   height      : Height value for column of hedge wall, in m

# sfx / vfx


# Destroy blocks
$fill ~ ~ ~ ~ ~$(height) ~ minecraft:air replace minecraft:mangrove_leaves
