# classes/alchemist/pmtl_alchemist_teleport.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Teleports to Translocator Pad
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	1 if has Caustic Brew, 0 otherwise
#	cv_B	:	1 if has Booster Brew, 0 otherwise
#	cv_C	:	Potion brewing timer
#	cv_D	:	
#	cv_E	:	Translocator ability state (0 = throw, 1 = teleport)
#	cv_F	:	Translocator teleport sequence timer, in ticks
#	cv_G	:	
#	cv_H	:	

# Remove slowness and grabs
effect clear @a[tag=t_pm_owner,limit=1] minecraft:slowness
tag @a[tag=t_pm_owner,limit=1] add t_grab_release

# Search for translocator teleport target
function cashgrab:util/npe_eid_find_peers
tag @e[tag=t_alchemist_translocator,scores={eid_compare=0},limit=1,sort=arbitrary] add t_alchemist_tp_target

# Teleport to target
tag @e[tag=t_alchemist_tp_target,limit=1] add t_cleanup
execute at @e[tag=t_alchemist_tp_target,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run tp @a[tag=t_pm_owner,limit=1] ~ ~ ~ ~ ~

# vfx / sfx
execute at @e[tag=t_alchemist_tp_target,limit=1] run playsound minecraft:entity.player.teleport player @a ~ ~ ~ 1.0 1.0
execute at @e[tag=t_alchemist_tp_target,limit=1] run particle minecraft:dust{color:[0.4,1.0,0.8],scale:4.0f} ~ ~1.2 ~ 0.35 0.6 0.35 0.2 30 force

# Clean up tags
tag @e[tag=t_alchemist_tp_target,limit=1] remove t_alchemist_tp_target
