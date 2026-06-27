# classes/spectre/pmt_spectre_score_kill.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Kill score callback
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Shadow Walk state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Shadow Walk timer
#	cv_C	:	Shadow Walk cooldown (in ms)
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Award a Blink charge
tellraw @a[tag=t_pm_owner,tag=t_debug] "pmt_spectre_score_kill"
scoreboard players add @a[tag=t_pm_owner,limit=1,scores={ability_charges=..2}] ability_charges 1

# Update item display
function cashgrab:util/pmt_inv_ability_icon_argloader
