# classes/battlesmith/mortar_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Battlesmith's Molten Mortar missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

# Class variable usage:
#	cv_A	:	Scrap count
#	cv_B	:	Upgrade Weapon sequence time, in ticks
#	cv_C	:	
#	cv_D	:	Coin pickup scrap generation lockout timer
#	cv_E	:	Weapon progression level
#	cv_F	:	
#	cv_G	:	Molten Mortar sfx timer
#	cv_H	:

$execute unless score NUM_END_REASON_TERRAIN_COLLISION num matches $(end_reason) run return 0

execute align y positioned ~ ~0.1 ~ run function cashgrab:util/npe_create_timer {\
i_lifetime_ticks:130,\
b_anchor_at_pos:1,\
t_timer_name:"t_battlesmith_mortar_timer",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/battlesmith/mortar_timer_tick",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}
