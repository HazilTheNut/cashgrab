# base/pm_handle_player_death.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#
# Summary: Handles player deaths near the end of a server tick
#
# Arguments: (none)

tag @a remove t_pm_owner

# Find owner and tag them with t_pm_owner
execute store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_pm_owner

# =============================
# Handle player deaths

# === Detect if player has died
execute if score @a[tag=t_pm_owner,limit=1] evl_death matches 1.. run tellraw @a[tag=t_debug] "base/pm_handle_player_death: Player death caught"
execute if score @a[tag=t_pm_owner,limit=1] evl_death matches 1.. run function cashgrab:base/pm_cleanup_player_subs {b_player_died:1}
execute if entity @a[tag=t_pm_owner,limit=1,scores={evl_death=1..,activity_state=21}] at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run playsound minecraft:block.chain.break player @a ~ ~ ~ 0.75 0.65
execute if entity @a[tag=t_pm_owner,limit=1,scores={evl_death=1..,activity_state=21}] at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run particle minecraft:block{block_state:{Name:"minecraft:gold_block"}} ~ ~1.25 ~ 0.40 0.40 0.40 1 20
execute if entity @a[tag=t_pm_owner,limit=1,scores={evl_death=1..,activity_state=21}] at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:base/pmtl_create_coinshower
execute if entity @a[tag=t_pm_owner,limit=1,scores={evl_death=1..,activity_state=21}] at @a[tag=t_pm_owner,limit=1] rotated as @a[tag=t_pm_owner,limit=1] run function cashgrab:classes/pmtl_class_end with entity @s data.class_info
# Set dead player activity_state
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 0 run scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evl_death=1..,activity_state=0..29}] activity_state 0
execute if score DEVELOPER_MODE num matches 0 if score NUM_GAMESTATE num matches 1.. run scoreboard players set @a[tag=t_pm_owner,limit=1,scores={evl_death=1..,activity_state=0..29}] activity_state 10
# Release dead player from grabs
tag @a[tag=t_pm_owner,limit=1,scores={evl_death=1..}] add t_grab_release
# Tag dead player to handle when they respawn
tag @a[tag=t_pm_owner,limit=1,scores={evl_death=1..}] add t_died

tag @a[tag=t_pm_owner] remove t_pm_owner
