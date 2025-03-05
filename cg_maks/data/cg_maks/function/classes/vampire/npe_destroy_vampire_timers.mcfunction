# classes/vampire/npe_destroy_vampire_timers.mcfunction
#
# Context:
#	as: a non-player entity
#
# Summary: Destroys the currently-existing Mark and/or Remnant timers
#
# Arguments:
#   vampire_eid :  EID of the originator of the associated timers

# Class variable usage:
#	cv_A	:	
#	cv_B	:	Pointer to this Vampire (stored on timers)
#	cv_C	:	
#	cv_D	:	
#	cv_E	:	
#	cv_F	:	
#	cv_G	:	
#	cv_H	:	

# Search for Mark/Remnant timers that point to the relevant Vampire and schedule them for cleanup
$tag @e[tag=t_vampire_mark_timer,scores={cv_B=$(vampire_eid)}] add t_cleanup
$tag @e[tag=t_vampire_remnant_timer,scores={cv_B=$(vampire_eid)}] add t_cleanup