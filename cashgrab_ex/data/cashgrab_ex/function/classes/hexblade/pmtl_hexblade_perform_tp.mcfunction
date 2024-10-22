# classes/hexblade/pmtl_hexblade_perform_tp.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	+ the target of the hex is tagged with t_hex_target
#	at: end of raycast
#
# Summary: Equips the Hexblade class onto the command executor
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

# Teleport
execute align xyz positioned ~0.5 ~0.5 ~0.5 run tp @a[tag=t_pm_owner,limit=1] ~ ~ ~ ~180 10

# sfx / vfx
playsound minecraft:entity.wither.shoot player @a ~ ~ ~ 0.35 1.75
particle minecraft:dust{color:[0.8f,0.2f,0.6f],scale:1.0} ~ ~1.25 ~ 0.35 1.0 0.35 0 40
