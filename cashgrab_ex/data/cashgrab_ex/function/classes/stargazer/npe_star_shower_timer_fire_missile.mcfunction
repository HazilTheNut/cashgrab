# classes/stargazer/npe_star_shower_timer_fire_missile.mcfunction
#
# Context:
#	as: a timer
#	at: the timer
#	facing: the timer's facing direction
#
# Summary: Fires a Star Shower missile
#
# Arguments: 
#   dyaw    :   Yaw offset
#   f_speed_mpt    :   Missile speed

playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 0.33 2.0

$execute rotated ~$(dyaw) -10 run function cashgrab:util/npe_create_missile {\
f_speed_mpt:$(f_speed_mpt)f,\
i_lifetime_ticks:50,\
i_origin_loc:0,\
f_focal_dist_m:35,\
i_gravity_vy_mmpt:200,\
i_gravity_const_mmpt2:50,\
t_missile_name:"t_stargazer_star_shower_missile",\
f_tracking_scalar:0.0f,\
col_terrain_allowed:"#cashgrab:partialsolid",\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_tracking_filter:"cashgrab:util/noop",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"cashgrab_ex:classes/stargazer/npe_star_shower_missile_tick",\
func_npe_end:"cashgrab_ex:classes/stargazer/npe_star_shower_missile_end",\
b_assign_as_peer:1,\
}
