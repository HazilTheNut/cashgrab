
$function cashgrab:util/npe_create_timer {\
lifetime_ticks:300,\
b_anchor_at_pos:1,\
t_timer_name:"t_rc_test_timer",\
func_npe_start:"cashgrab:util/noop",\
func_npe_tick:"$(func_npe_tick)",\
func_npe_end:"cashgrab:util/noop",\
b_assign_as_peer:1,\
}
