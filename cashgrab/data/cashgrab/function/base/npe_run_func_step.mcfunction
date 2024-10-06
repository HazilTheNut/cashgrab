# util/npe_run_func_step.mcfunction
#
# Context:
#	as: an entity with tag t_generic_has_func_step and a function resource locator at nbt data.func_step
#	at: the entity
#	facing: as the entity
#
# Summary: Runs the stored func_step function
#
# Arguments:
#	func_step	: step function to run

$function $(func_step)
