# classes/ranger/pmtl_ranger_wall_climb_active.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Handles Wall Climb active state collision detection (player it tagged with t_ranger-climb if they should climb)
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Wall Climb state (-1 = exit, 0 = inactive, 1 = active, 2 = enter)
#	cv_B	:	Wall Climb energy
#	cv_C	:	Wall Climb sound effect timer
#	cv_D	:	
#	cv_E	:	Arrow count
#	cv_F	:	Crossbow state (b'XY, where X is if in hotbar and Y is if arrow loaded)
#	cv_G	:	
#	cv_H	:	

# Wall Climb collision check
tag @a[tag=t_pm_owner,limit=1] remove t_ranger_climb
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^ ^ ^ #cashgrab:nonsolid run tag @a[tag=t_pm_owner,limit=1] add t_ranger_climb
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^ ^ ^1 #cashgrab:nonsolid run tag @a[tag=t_pm_owner,limit=1] add t_ranger_climb
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^0.6 ^ ^1 #cashgrab:nonsolid run tag @a[tag=t_pm_owner,limit=1] add t_ranger_climb
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^-0.6 ^ ^1 #cashgrab:nonsolid run tag @a[tag=t_pm_owner,limit=1] add t_ranger_climb
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~1 ~0.5 unless block ^ ^ ^ #cashgrab:nonsolid run tag @a[tag=t_pm_owner,limit=1] add t_ranger_climb
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~1 ~0.5 unless block ^ ^ ^1 #cashgrab:nonsolid run tag @a[tag=t_pm_owner,limit=1] add t_ranger_climb
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~1 ~0.5 unless block ^0.6 ^ ^1 #cashgrab:nonsolid run tag @a[tag=t_pm_owner,limit=1] add t_ranger_climb
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. rotated ~ 0 align xyz positioned ~0.5 ~1 ~0.5 unless block ^-0.6 ^ ^1 #cashgrab:nonsolid run tag @a[tag=t_pm_owner,limit=1] add t_ranger_climb

# Wall Climb tick down
scoreboard players remove @a[tag=t_pm_owner,limit=1,tag=t_ranger_climb,scores={cv_A=1,cv_B=0..}] cv_B 1
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. store result storage cashgrab:ranger_args data.count int 1 run scoreboard players get @a[tag=t_pm_owner,limit=1] cv_B
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches 1.. run function cashgrab:classes/ranger/pmt_ranger_inv_climbing_energy with storage cashgrab:ranger_args data
execute if score @a[tag=t_pm_owner,limit=1] cv_B matches ..0 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:air
