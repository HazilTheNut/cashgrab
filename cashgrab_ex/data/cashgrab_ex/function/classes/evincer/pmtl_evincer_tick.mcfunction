# classes/evincer/pmtl_evincer_tick.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Tick function for Evincer class
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

# =========================
# Cast abilities based on current sword state

execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=1,evc_sticks=1..}] run function cashgrab_ex:classes/evincer/pmtl_evincer_cast_ochre_laser
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=2,evc_sticks=1..}] positioned ~ ~1 ~ positioned ^-0.20 ^-0.05 ^0.25 run function cashgrab_ex:classes/evincer/pmtl_evincer_cast_pearlescent_wave
execute if entity @a[tag=t_pm_owner,limit=1,scores={cv_A=3,evc_sticks=1..}] run function cashgrab_ex:classes/evincer/pmtl_evincer_cast_cerulean_sphere

# Reset sword back to normal and refresh inventory
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evc_sticks=1..}] cv_A 0
execute if entity @a[tag=t_pm_owner,limit=1,scores={evc_sticks=1..}] run function cashgrab_ex:classes/evincer/pmt_evincer_inv

# Consume event
scoreboard players set @a[tag=t_pm_owner,limit=1] evc_sticks 0
