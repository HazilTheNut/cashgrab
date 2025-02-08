# classes/stargazer/npe_vortex_snare_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Vortex Snare missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called

$execute if score NUM_END_REASON_CLEANUP num matches $(end_reason) run return 0
$execute if score NUM_END_REASON_CLEANUP_PLAYER_DEATH num matches $(end_reason) run return 0

# Place timer
execute rotated 0 -90 run function cashgrab:util/npe_raycast {\
i_range_m:1,\
i_origin_loc:1,\
col_terrain_allowed:"#cashgrab:partialsolid",\
b_fit_player:1,\
func_npe_entity_filter:"cashgrab:util/npe_col_filter_entity_none",\
func_npe_step:"cashgrab:util/noop",\
func_npe_end:"cashgrab_ex:classes/stargazer/npe_vortex_snare_missile_place_timer",\
}

