# classes/evincer/pmtl_evincer_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Sword state (0 = base, 1 = ochre, 2 = pearl, 3 = cerulean)
#	cv_B	:	
#	cv_C	:	Pearlescent Wave missile yaw deflection
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:   

# Grant a random ability to sword
execute store result score @a[tag=t_pm_owner,limit=1] cv_A run random value 1..3
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 1

# Blink
particle minecraft:dust{color:[1.0,1.0,0.7],scale:2.0} ~ ~1 ~ 0.5 0.75 0.5 0 40

execute positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:7,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:nonsolid",\
b_fit_player:1,\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_step:"cashgrab:util/noop",\
func_npe_end:"cashgrab_ex:classes/evincer/pmtl_prismatic_flash_end",\
}

# Release player if they were grabbed
tag @a[tag=t_pm_owner,limit=1] add t_grab_release

