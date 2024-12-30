# classes/vampire/vampire_missile_end.mcfunction
#
# Context:
#	as: a missile
#	at: the missile
#	facing: the missile's facing direction
#
# Summary: Vampire's Soul Siphon missile end function
#
# Arguments:
#	end_reason	: The reason for why the end function was called (0 = cleaned up, 1 = hit block terrain, 2 = hit entity, 3 = expired)

$scoreboard players set @s temp_A $(end_reason)

# Find owner and tag with t_missile_owner
execute store result storage cashgrab:eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:eid_args
tag @e[tag=t_eid_matches,limit=1] add t_missile_owner

# If missile hit, reduce cooldown by 3 seconds and damage target.
execute if score @s temp_A matches 2 run tellraw @a[tag=t_debug] "vampire_missile_end returned 2"
execute if score @s temp_A matches 2 run scoreboard players remove @a[tag=t_missile_owner,limit=1,scores={ability_cd_ms=3001..30000}] ability_cd_ms 3000
execute if score @s temp_A matches 2 run tag @s add t_dmg_by
execute if score @s temp_A matches 2 run function cashgrab:util/npe_dmg {\
d_dmg_amount:1.0,\
s_dmg_type:"minecraft:magic",\
t_dmg_target:"t_collision_found",\
t_dmg_by:"t_dmg_by",\
t_dmg_from:"t_missile_owner",\
b_remove_tags:1\
}

# If this damage killed a player, create a Remnant timer.
execute if entity @a[tag=t_marked_target,scores={evl_death=1..}] run tag @a[tag=t_missile_owner,limit=1] add t_pm_owner
execute if entity @a[tag=t_marked_target,scores={evl_death=1..}] run function cg_maks:classes/vampire/pmtl_vampire_create_remnant_at_marked_target
execute if entity @a[tag=t_marked_target,scores={evl_death=1..}] run tag @a remove t_pm_owner

#If missile missed, do nothing except clean up.
particle explosion ~ ~ ~ 0.0 0.0 0.0 0 2

# Clean up tags
tag @e remove t_dmg_by
tag @a remove t_missile_owner