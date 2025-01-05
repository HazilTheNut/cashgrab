# classes/hexblade/pmtl_hexblade_teleport_to_hex_target.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#	+ the target of the hex is tagged with t_hex_target
#	at: the owner's position
#	rotated: as the owner
#
# Summary: Equips the Hexblade class onto the command executor
#
# Arguments: (none)

# Class variable usage:
#	cv_A	:	Pointer (stored on Hexblade) to target of hex
#	cv_B	:	Pointer (stored on Hex timer) to Hexblade
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	1 iff Hex target exists
#	cv_F	:	Hex target existence state (-1..2 style state for if Hex target exists)
#	cv_G	:	
#	cv_H	:

# Release from any grabs
tag @a[tag=t_pm_owner,limit=1] add t_grab_release

# Raycast behind target to find a good place to teleport, then teleport there
execute if entity @e[tag=t_hex_target,tag=!t_hexblade_remnant_timer] at @e[tag=t_hex_target,limit=1] positioned ~ ~1 ~ rotated as @e[tag=t_hex_target,limit=1] rotated ~180 -15 run function cashgrab:util/npe_raycast {\
i_range_m:2,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:nonsolid",\
b_fit_player:1,\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_step:"cashgrab:util/noop",\
func_npe_end:"cashgrab_ex:classes/hexblade/pmtl_hexblade_perform_tp"\
}

# If Hex target is remnant, teleport directly to it
execute if entity @e[tag=t_hex_target,tag=t_hexblade_remnant_timer] at @e[tag=t_hex_target,limit=1] positioned ~ ~1 ~ rotated as @e[tag=t_hex_target,limit=1] run function cashgrab_ex:classes/hexblade/pmtl_hexblade_perform_tp

# Heal player
effect give @a[tag=t_pm_owner,limit=1] minecraft:regeneration 5 1

# Destroy Hex timer
execute store result storage cashgrab_ex:hexblade_eid_args hexblade_eid int 1 run scoreboard players get @s eid_owner
function cashgrab_ex:classes/hexblade/npe_destroy_hex_timer with storage cashgrab_ex:hexblade_eid_args

# If Hex target is a remnant timer, schedule cleanup
tag @e[tag=t_hex_target,tag=t_hexblade_remnant_timer] add t_cleanup
