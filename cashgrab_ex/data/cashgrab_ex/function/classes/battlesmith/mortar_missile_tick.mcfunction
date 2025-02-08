# classes/battlesmith/mortar_missile_tick.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Battlesmith's Molten Mortar missile tick function
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Scrap count
#	cv_B	:	Upgrade Weapon sequence time, in ticks
#	cv_C	:	
#	cv_D	:	Coin pickup scrap generation lockout timer
#	cv_E	:	Weapon progression level
#	cv_F	:	
#	cv_G	:	Molten Mortar sfx timer
#	cv_H	:

particle minecraft:dust{color:[1.0f,0.6f,0.3f],scale:1.0f} ~ ~ ~ 0.05 0.05 0.05 0 1
particle minecraft:flame ~ ~ ~ 0 0 0 0 1
