# base/pmt_player_state.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tracks player state
#
# Arguments: (none)

# Player state: falling (any time spent in the air)
execute unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"nbt":"{OnGround:1b}"}} run scoreboard players set @a[tag=t_pm_owner,limit=1] __falling_cur 1
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"nbt":"{OnGround:1b}"}} run scoreboard players set @a[tag=t_pm_owner,limit=1] __falling_cur 0

scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__falling_cur=0,__falling_prev=0}] ps_falling 0
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__falling_cur=0,__falling_prev=1}] ps_falling -1
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__falling_cur=1,__falling_prev=0}] ps_falling 2
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__falling_cur=1,__falling_prev=1}] ps_falling 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __falling_prev = @a[tag=t_pm_owner,limit=1] __falling_cur

# Player state: sneaking (holding down button)
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__sneakTime=1..}] __sneaking_cur 1
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__sneakTime=0}] __sneaking_cur 0
scoreboard players set @a[tag=t_pm_owner,limit=1] __sneakTime 0

scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__sneaking_cur=0,__sneaking_prev=0}] ps_sneaking 0
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__sneaking_cur=0,__sneaking_prev=1}] ps_sneaking -1
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__sneaking_cur=1,__sneaking_prev=0}] ps_sneaking 2
scoreboard players set @a[tag=t_pm_owner,limit=1,scores={__sneaking_cur=1,__sneaking_prev=1}] ps_sneaking 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __sneaking_prev = @a[tag=t_pm_owner,limit=1] __sneaking_cur

# Player state: selected hotbar slot
execute store result score @a[tag=t_pm_owner,limit=1] ps_selected_hotbar_slot run data get entity @a[tag=t_pm_owner,limit=1] SelectedItemSlot
