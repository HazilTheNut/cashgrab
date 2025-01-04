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
#	cv_A	:	Pointer (stored on Hexblade) to target of hex
#	cv_B	:	Pointer (stored on Hex timer) to Hexblade
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	1 iff Hex target exists
#	cv_F	:	Hex target existence state (-1..2 style state for if Hex target exists)
#	cv_G	:	
#	cv_H	:

execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run return 0

# Destroy Hex timer
execute store result storage cashgrab_ex:hexblade_eid_args hexblade_eid int 1 run scoreboard players get @s eid_owner
function cashgrab_ex:classes/hexblade/npe_destroy_hex_timer with storage cashgrab_ex:hexblade_eid_args
