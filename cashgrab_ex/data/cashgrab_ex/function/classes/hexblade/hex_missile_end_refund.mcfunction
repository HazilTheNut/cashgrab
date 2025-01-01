# classes/hexblade/hex_missile_end_refund.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Hexblade's Hex missile end function when refunding cooldown
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

# Find owner and tag with t_missile_owner
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @e[tag=t_eid_matches,limit=1] add t_missile_owner

# Reduce cooldown
scoreboard players set @a[tag=t_missile_owner,limit=1,scores={ability_cd_ms=1..8000}] ability_cd_ms 1
scoreboard players remove @a[tag=t_missile_owner,limit=1,scores={ability_cd_ms=8001..}] ability_cd_ms 8000

tag @a remove t_missile_owner
