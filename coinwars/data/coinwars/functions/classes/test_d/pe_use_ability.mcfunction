# classes/test_d/pe_use_ability.mcfunction
#
# Context:
#	as: an entity with class = -4
#	at: the entity
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

function coinwars:util/pe_set_timer {\
lifetime_ticks:200,\
b_anchor_at_pos:1,\
t_timer_name:"t_class_d_timer_init",\
func_step:"coinwars:classes/test_d/timer_step",\
func_end:"coinwars:classes/test_d/timer_end"\
}

execute as @e[tag=t_class_d_timer_init,limit=1,sort=nearest] at @s positioned ~ ~2 ~ run function coinwars:util/pe_set_timer {\
lifetime_ticks:200,\
b_anchor_at_pos:1,\
t_timer_name:"t_class_d_timer2",\
func_step:"coinwars:classes/test_d/timer_step_2",\
func_end:"coinwars:classes/test_d/timer_end"\
}

tag @e[tag=t_class_d_timer_init,limit=1,sort=nearest] add t_class_d_timer
tag @e[tag=t_class_d_timer_init,limit=1,sort=nearest] remove t_class_d_timer_init
