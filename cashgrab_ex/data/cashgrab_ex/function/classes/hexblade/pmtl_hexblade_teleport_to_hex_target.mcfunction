# classes/hexblade/pmtl_hexblade_create_remnant_at_hex_target.mcfunction
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
#	cv_A	:	Pointer to target of hex (from Hexblade to target)
#	cv_B	:	Hex duration/sequence timer
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Raycast behind target to find a good place to teleport, then teleport there
execute at @e[tag=t_hex_target,limit=1] positioned ~ ~1 ~ rotated as @e[tag=t_hex_target,limit=1] rotated ~180 -15 run function cashgrab:util/npe_raycast {\
i_range_m:3,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:nonsolid",\
b_fit_player:1,\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_step:"cashgrab:util/dummy",\
func_npe_end:"cashgrab_ex:classes/hexblade/pmtl_hexblade_perform_tp"\
}

# Consume Hex
effect clear @e[tag=t_hex_target,limit=1] minecraft:glowing
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_A 0
scoreboard players set @a[tag=t_pm_owner,limit=1] cv_B 0
function cashgrab_ex:classes/hexblade/pmt_hexblade_inv_blight_step

# If Hex target is a remnant timer, clean it up
tag @e[tag=t_hex_target,tag=t_hexblade_remnant_timer] add t_cleanup
