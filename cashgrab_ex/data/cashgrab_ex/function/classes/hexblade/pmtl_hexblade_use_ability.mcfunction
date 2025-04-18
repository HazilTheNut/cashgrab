# classes/hexblade/pmtl_hexblade_use_ability.mcfunction
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
#	cv_A	:	Pointer (stored on Hexblade) to target of hex
#	cv_B	:	Pointer (stored on Hex timer) to Hexblade
#	cv_C	:	
#	cv_D	:	Blight Step countdown
#	cv_E	:	1 iff Hex target exists
#	cv_F	:	Hex target existence state (-1..2 style state for if Hex target exists)
#	cv_G	:	
#	cv_H	:

playsound minecraft:entity.ghast.shoot player @a ~ ~ ~ 1.0 1.5

function cashgrab:util/npe_create_missile {\
f_speed_mpt:0.65f,\
i_lifetime_ticks:50,\
i_origin_loc:1,\
f_focal_dist_m:50,\
i_gravity_vy_mmpt:0,\
i_gravity_const_mmpt2:0,\
f_tracking_scalar:0.65f,\
t_missile_name:"t_hexblade_hex_missile",\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_tracking_filter:"cashgrab:util/npe_col_entity_filter_hostile",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/hexblade/hex_missile_tick",\
func_npe_end:"cashgrab_ex:classes/hexblade/hex_missile_end",\
b_assign_as_peer:1,\
}
