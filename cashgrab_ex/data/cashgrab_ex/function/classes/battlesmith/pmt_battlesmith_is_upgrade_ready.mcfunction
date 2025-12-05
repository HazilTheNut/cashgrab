# classes/battlesmith/pmt_battlesmith_is_upgrade_ready.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Returns 1 if Upgrade Weapon is ready, and 0 otherwise
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

# Tier II costs 5 scrap
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_E=0,cv_A=7..}] run return 1

# Tier III costs 12 scrap
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_E=1,cv_A=13..}] run return 1

# Tier IV costs 20 scrap
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_E=2,cv_A=20..}] run return 1

return 0
