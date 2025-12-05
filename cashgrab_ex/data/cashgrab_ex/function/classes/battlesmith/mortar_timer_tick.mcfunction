# classes/battlesmith/mortar_timer_tick.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#	facing: the timer's facing direction
#
# Summary: Battlesmith's Molten Mortar timer tick function
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

particle minecraft:dust{color:[1.0f,0.6f,0.3f],scale:1.0f} ~ ~0.15 ~ 0.5 0.1 0.5 0 1
particle minecraft:flame ~ ~0.15 ~ 0.5 0.1 0.5 0 1 force

execute if score @s stasis_state matches 1..2 run return 0

# sfx
scoreboard players add @s cv_G 1
execute if score @s cv_G matches 5 run playsound minecraft:block.campfire.crackle player @a ~ ~ ~ 0.5 1.0
execute if score @s cv_G matches 5 run scoreboard players set @s cv_G 0

# tmr_lifetime_ticks sequence:
#   1   = detonate
#   26   = detonate
#   51   = detonate
#   76   = detonate


#particle minecraft:lava ~ ~ ~ 0.05 0.05 0.05 0 1

execute if score @s tmr_lifetime_ticks matches 1 run function cashgrab_ex:classes/battlesmith/mortar_timer_detonate
execute if score @s tmr_lifetime_ticks matches 26 run function cashgrab_ex:classes/battlesmith/mortar_timer_detonate
execute if score @s tmr_lifetime_ticks matches 51 run function cashgrab_ex:classes/battlesmith/mortar_timer_detonate
execute if score @s tmr_lifetime_ticks matches 76 run function cashgrab_ex:classes/battlesmith/mortar_timer_detonate
