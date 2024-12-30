# classes/hexblade/hex_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Hexblade's Hex missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

# Class variable usage:
#	cv_A	:	Pointer to target of hex (from Hexblade to target)
#	cv_B	:	Hex duration/sequence timer
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

$scoreboard players set @s temp_A $(end_reason)

# If missile missed, reduce cooldown
execute if score @s temp_A matches 1 run function cashgrab_ex:classes/hexblade/hex_missile_end_refund
execute if score @s temp_A matches 3 run function cashgrab_ex:classes/hexblade/hex_missile_end_refund

# If missile hit an entity, damage and set as hex target
execute if score @s temp_A matches 2 run function cashgrab_ex:classes/hexblade/hex_missile_end_entity_hit
