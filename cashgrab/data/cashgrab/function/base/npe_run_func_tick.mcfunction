# util/npe_run_func_tick.mcfunction
#
# Context:
#	as: an entity with tag t_generic_has_func_tick and a function resource locator at nbt data.func_npe_tick
#	at: the entity
#	facing: as the entity
#
# Summary: Runs the stored func_npe_tick function
#
# Arguments:
#	func_npe_tick	: Function to run every tick

$function $(func_npe_tick)
