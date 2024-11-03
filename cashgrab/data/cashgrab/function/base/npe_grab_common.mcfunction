# base/npe_grab_common.mcfunction
#
# Context:
#	as: a nonplayer entity
#	at: the entity
#
# Summary: Updates grab_state for entity tagged with t_grab_subject and sets gravity attributes accordingly
#			The t_grab_subject tag is used to allow sharing code between nonplayer entity code and pms operating on players
#
# Arguments: (none)

# Perform state transition

# State transition grab_state based on value of eid_grabbed_by and presence of t_grab_release
scoreboard players add @e[tag=t_grab_subject,limit=1] grab_state 0

scoreboard players set @e[tag=t_grab_subject,limit=1,scores={eid_grabbed_by=1..,grab_state=2}] grab_state 1
scoreboard players set @e[tag=t_grab_subject,limit=1,scores={eid_grabbed_by=1..,grab_state=-1..0}] grab_state 2

scoreboard players set @e[tag=t_grab_subject,limit=1,scores={eid_grabbed_by=0,grab_state=-1}] grab_state 0
scoreboard players set @e[tag=t_grab_subject,limit=1,scores={eid_grabbed_by=0,grab_state=1..2}] grab_state -1

scoreboard players set @e[tag=t_grab_subject,limit=1,tag=t_grab_release,scores={grab_state=1..2}] eid_grabbed_by 0
scoreboard players set @e[tag=t_grab_subject,limit=1,tag=t_grab_release,scores={grab_state=1..2}] grab_state -1

tag @e[tag=t_grab_subject,limit=1] remove t_grab_release

execute if score @e[tag=t_grab_subject,limit=1] grab_state matches 0 run return 0

# Remove gravity for entities entering a grab
execute if score @e[tag=t_grab_subject,limit=1] grab_state matches 2 run attribute @e[tag=t_grab_subject,limit=1] minecraft:gravity base set 0

# While grabbed, teleport to grabber
execute if score @e[tag=t_grab_subject,limit=1] grab_state matches 1..2 store result storage cashgrab:find_eid_args eid int 1 run scoreboard players get @e[tag=t_grab_subject,limit=1] eid_grabbed_by
execute if score @e[tag=t_grab_subject,limit=1] grab_state matches 1..2 run function cashgrab:util/find_eid_self with storage cashgrab:find_eid_args
execute if score @e[tag=t_grab_subject,limit=1] grab_state matches 1..2 unless entity @e[tag=t_eid_matches] run scoreboard players set @e[tag=t_grab_subject,limit=1] eid_grabbed_by 0
execute if score @e[tag=t_grab_subject,limit=1] grab_state matches 1..2 unless entity @e[tag=t_eid_matches] run scoreboard players set @e[tag=t_grab_subject,limit=1] grab_state -1
execute if score @e[tag=t_grab_subject,limit=1] grab_state matches 1..2 if entity @a[tag=t_eid_matches] run scoreboard players set @e[tag=t_grab_subject,limit=1] eid_grabbed_by 0
execute if score @e[tag=t_grab_subject,limit=1] grab_state matches 1..2 if entity @a[tag=t_eid_matches] run scoreboard players set @e[tag=t_grab_subject,limit=1] grab_state -1
execute if score @e[tag=t_grab_subject,limit=1] grab_state matches 1..2 at @n[tag=t_eid_matches] run tp @e[tag=t_grab_subject,limit=1] ~ ~-0.75 ~

# Restore gravity for entities exiting a grab
execute if score @e[tag=t_grab_subject,limit=1] grab_state matches -1 run attribute @e[tag=t_grab_subject,limit=1] minecraft:gravity base set 0.08
