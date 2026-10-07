# classes/archer/pmt_archer_score_kill.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Kill score callback
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Rocket Barrage missiles sequence timer
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	Power Shot charge
#	cv_F	:	Power Shot cooldown, in ms
#	cv_G	:	
#	cv_H	:	Snipend intermediate calculatoin

# Award 5 coins
tellraw @a[tag=t_pm_owner,tag=t_debug] "pmt_archer_score_kill"
scoreboard players operation @a[tag=t_pm_owner,limit=1] cv_H = @a[tag=t_pm_owner,limit=1] evl_player_kills
scoreboard players operation @a[tag=t_pm_owner,limit=1] cv_H *= NUM_FIVE num
scoreboard players operation @a[tag=t_pm_owner,limit=1] coins += @a[tag=t_pm_owner,limit=1] cv_H

# Update item display
function cashgrab:util/pmt_inv_coins_argloader
