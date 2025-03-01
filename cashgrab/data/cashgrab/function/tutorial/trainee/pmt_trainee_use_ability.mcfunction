# tutorial/trainee/pmt_trainee_use_ability.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Uses command executor's equipped class ability
#
# Arguments: (none)

# No effect with insufficient tutorial progress
execute if score @a[tag=t_pm_owner,limit=1] __tutorial_trainee_progress matches ..1 run return 0

# No effect if not holding sword
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches ..0 run scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 50
execute if score @a[tag=t_pm_owner,limit=1] cv_F matches ..0 run return 0

scoreboard players set @a[tag=t_pm_owner,limit=1] ability_cfg_cd_ms 5000

# Blink
particle minecraft:smoke ~ ~1 ~ 0.5 0.75 0.5 0 40

execute positioned ~ ~1.625 ~ run function cashgrab:util/npe_raycast {\
i_range_m:8,\
i_origin_loc:0,\
col_terrain_allowed:"#cashgrab:nonsolid",\
b_fit_player:1,\
func_npe_entity_filter:"cashgrab:util/npe_col_entity_filter_none",\
func_npe_step:"cashgrab:util/noop",\
func_npe_end:"cashgrab:tutorial/trainee/pmtl_blink_end",\
}

# Release player if they were grabbed
tag @a[tag=t_pm_owner,limit=1] add t_grab_release