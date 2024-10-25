# classes/hexblade/pmtl_hexblade_end.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Cleans up bestowed Hex
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Pointer to target of hex (from Hexblade to target)
#	cv_B	:	Hex duration/sequence timer
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run return 0

# Get target of hex
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_A
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args

# Remove glowing potion effect
effect clear @e[tag=t_eid_matches] minecraft:glowing
