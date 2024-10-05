# base/pmt_player_state.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Tracks player state
#
# Arguments: (none)

# Player state: walking
scoreboard players set @a[tag=t_pm_owner,scores={__walkDist=1..}] __walking_cur 1
scoreboard players set @a[tag=t_pm_owner,scores={__walkDist=0}] __walking_cur 0
scoreboard players set @a[tag=t_pm_owner] __walkDist 0

scoreboard players set @a[tag=t_pm_owner,scores={__walking_cur=0,__walking_prev=0}] ps_walking 0
scoreboard players set @a[tag=t_pm_owner,scores={__walking_cur=0,__walking_prev=1}] ps_walking -1
scoreboard players set @a[tag=t_pm_owner,scores={__walking_cur=1,__walking_prev=0}] ps_walking 2
scoreboard players set @a[tag=t_pm_owner,scores={__walking_cur=1,__walking_prev=1}] ps_walking 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __walking_prev = @a[tag=t_pm_owner,limit=1] __walking_cur

# Player state: sprinting
scoreboard players set @a[tag=t_pm_owner,scores={__sprintDist=1..}] __sprinting_cur 1
scoreboard players set @a[tag=t_pm_owner,scores={__sprintDist=0}] __sprinting_cur 0
scoreboard players set @a[tag=t_pm_owner] __sprintDist 0

scoreboard players set @a[tag=t_pm_owner,scores={__sprinting_cur=0,__sprinting_prev=0}] ps_sprinting 0
scoreboard players set @a[tag=t_pm_owner,scores={__sprinting_cur=0,__sprinting_prev=1}] ps_sprinting -1
scoreboard players set @a[tag=t_pm_owner,scores={__sprinting_cur=1,__sprinting_prev=0}] ps_sprinting 2
scoreboard players set @a[tag=t_pm_owner,scores={__sprinting_cur=1,__sprinting_prev=1}] ps_sprinting 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __sprinting_prev = @a[tag=t_pm_owner,limit=1] __sprinting_cur

# Player state: crouching (moving while sneaking)
scoreboard players set @a[tag=t_pm_owner,scores={__crouchDist=1..}] __crouching_cur 1
scoreboard players set @a[tag=t_pm_owner,scores={__crouchDist=0}] __crouching_cur 0
scoreboard players set @a[tag=t_pm_owner] __crouchDist 0

scoreboard players set @a[tag=t_pm_owner,scores={__crouching_cur=0,__crouching_prev=0}] ps_crouching 0
scoreboard players set @a[tag=t_pm_owner,scores={__crouching_cur=0,__crouching_prev=1}] ps_crouching -1
scoreboard players set @a[tag=t_pm_owner,scores={__crouching_cur=1,__crouching_prev=0}] ps_crouching 2
scoreboard players set @a[tag=t_pm_owner,scores={__crouching_cur=1,__crouching_prev=1}] ps_crouching 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __crouching_prev = @a[tag=t_pm_owner,limit=1] __crouching_cur

# Player state: falling (any time spent in the air)
scoreboard players set @a[tag=t_pm_owner,nbt={OnGround:0b}] __falling_cur 1
scoreboard players set @a[tag=t_pm_owner,nbt={OnGround:1b}] __falling_cur 0

scoreboard players set @a[tag=t_pm_owner,scores={__falling_cur=0,__falling_prev=0}] ps_falling 0
scoreboard players set @a[tag=t_pm_owner,scores={__falling_cur=0,__falling_prev=1}] ps_falling -1
scoreboard players set @a[tag=t_pm_owner,scores={__falling_cur=1,__falling_prev=0}] ps_falling 2
scoreboard players set @a[tag=t_pm_owner,scores={__falling_cur=1,__falling_prev=1}] ps_falling 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __falling_prev = @a[tag=t_pm_owner,limit=1] __falling_cur

# Player state: swimming ("sprinting" underwater)
scoreboard players set @a[tag=t_pm_owner,scores={__swimDist=1..}] __swimming_cur 1
scoreboard players set @a[tag=t_pm_owner,scores={__swimDist=0}] __swimming_cur 0
scoreboard players set @a[tag=t_pm_owner] __swimDist 0

scoreboard players set @a[tag=t_pm_owner,scores={__swimming_cur=0,__swimming_prev=0}] ps_swimming 0
scoreboard players set @a[tag=t_pm_owner,scores={__swimming_cur=0,__swimming_prev=1}] ps_swimming -1
scoreboard players set @a[tag=t_pm_owner,scores={__swimming_cur=1,__swimming_prev=0}] ps_swimming 2
scoreboard players set @a[tag=t_pm_owner,scores={__swimming_cur=1,__swimming_prev=1}] ps_swimming 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __swimming_prev = @a[tag=t_pm_owner,limit=1] __swimming_cur

# Player state: onwater_walk
scoreboard players set @a[tag=t_pm_owner,scores={__onwater_walkDist=1..}] __onwater_walking_cur 1
scoreboard players set @a[tag=t_pm_owner,scores={__onwater_walkDist=0}] __onwater_walking_cur 0
scoreboard players set @a[tag=t_pm_owner] __onwater_walkDist 0

scoreboard players set @a[tag=t_pm_owner,scores={__onwater_walking_cur=0,__onwater_walking_prev=0}] ps_onwater_walking 0
scoreboard players set @a[tag=t_pm_owner,scores={__onwater_walking_cur=0,__onwater_walking_prev=1}] ps_onwater_walking -1
scoreboard players set @a[tag=t_pm_owner,scores={__onwater_walking_cur=1,__onwater_walking_prev=0}] ps_onwater_walking 2
scoreboard players set @a[tag=t_pm_owner,scores={__onwater_walking_cur=1,__onwater_walking_prev=1}] ps_onwater_walking 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __onwater_walking_prev = @a[tag=t_pm_owner,limit=1] __onwater_walking_cur

# Player state: underwater_walk
scoreboard players set @a[tag=t_pm_owner,scores={__underwater_walkDist=1..}] __underwater_walking_cur 1
scoreboard players set @a[tag=t_pm_owner,scores={__underwater_walkDist=0}] __underwater_walking_cur 0
scoreboard players set @a[tag=t_pm_owner] __underwater_walkDist 0

scoreboard players set @a[tag=t_pm_owner,scores={__underwater_walking_cur=0,__underwater_walking_prev=0}] ps_underwater_walking 0
scoreboard players set @a[tag=t_pm_owner,scores={__underwater_walking_cur=0,__underwater_walking_prev=1}] ps_underwater_walking -1
scoreboard players set @a[tag=t_pm_owner,scores={__underwater_walking_cur=1,__underwater_walking_prev=0}] ps_underwater_walking 2
scoreboard players set @a[tag=t_pm_owner,scores={__underwater_walking_cur=1,__underwater_walking_prev=1}] ps_underwater_walking 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __underwater_walking_prev = @a[tag=t_pm_owner,limit=1] __underwater_walking_cur

# Player state: climbing
scoreboard players set @a[tag=t_pm_owner,scores={__climbDist=1..}] __climbing_cur 1
scoreboard players set @a[tag=t_pm_owner,scores={__climbDist=0}] __climbing_cur 0
scoreboard players set @a[tag=t_pm_owner] __climbDist 0

scoreboard players set @a[tag=t_pm_owner,scores={__climbing_cur=0,__climbing_prev=0}] ps_climbing 0
scoreboard players set @a[tag=t_pm_owner,scores={__climbing_cur=0,__climbing_prev=1}] ps_climbing -1
scoreboard players set @a[tag=t_pm_owner,scores={__climbing_cur=1,__climbing_prev=0}] ps_climbing 2
scoreboard players set @a[tag=t_pm_owner,scores={__climbing_cur=1,__climbing_prev=1}] ps_climbing 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __climbing_prev = @a[tag=t_pm_owner,limit=1] __climbing_cur

# Player state: aviating
scoreboard players set @a[tag=t_pm_owner,scores={__aviateDist=1..}] __aviating_cur 1
scoreboard players set @a[tag=t_pm_owner,scores={__aviateDist=0}] __aviating_cur 0
scoreboard players set @a[tag=t_pm_owner] __aviateDist 0

scoreboard players set @a[tag=t_pm_owner,scores={__aviating_cur=0,__aviating_prev=0}] ps_aviating 0
scoreboard players set @a[tag=t_pm_owner,scores={__aviating_cur=0,__aviating_prev=1}] ps_aviating -1
scoreboard players set @a[tag=t_pm_owner,scores={__aviating_cur=1,__aviating_prev=0}] ps_aviating 2
scoreboard players set @a[tag=t_pm_owner,scores={__aviating_cur=1,__aviating_prev=1}] ps_aviating 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __aviating_prev = @a[tag=t_pm_owner,limit=1] __aviating_cur

# Player state: moving (any form of common movement)

scoreboard players set @a[tag=t_pm_owner,scores={ps_aviating=0,ps_climbing=0,ps_crouching=0,ps_falling=0,ps_onwater_walking=0,ps_sprinting=0,ps_swimming=0,ps_underwater_walking=0,ps_walking=0}] ps_moving 0

scoreboard players set @a[tag=t_pm_owner,scores={ps_aviating=-1}] ps_moving -1
scoreboard players set @a[tag=t_pm_owner,scores={ps_climbing=-1}] ps_moving -1
scoreboard players set @a[tag=t_pm_owner,scores={ps_crouching=-1}] ps_moving -1
scoreboard players set @a[tag=t_pm_owner,scores={ps_falling=-1}] ps_moving -1
scoreboard players set @a[tag=t_pm_owner,scores={ps_onwater_walking=-1}] ps_moving -1
scoreboard players set @a[tag=t_pm_owner,scores={ps_sprinting=-1}] ps_moving -1
scoreboard players set @a[tag=t_pm_owner,scores={ps_swimming=-1}] ps_moving -1
scoreboard players set @a[tag=t_pm_owner,scores={ps_underwater_walking=-1}] ps_moving -1
scoreboard players set @a[tag=t_pm_owner,scores={ps_walking=-1}] ps_moving -1

# At this line, ps_moving = 0 if no movement and -1 if any movement criteria is exiting its state
# Entering a new state while exiting any other one constitutes as no change in player movement state
scoreboard players set @a[tag=t_pm_owner,scores={ps_aviating=2,ps_moving=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_aviating=2,ps_moving=2}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_aviating=2,ps_moving=-1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_aviating=2,ps_moving=0}] ps_moving 2

scoreboard players set @a[tag=t_pm_owner,scores={ps_climbing=2,ps_moving=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_climbing=2,ps_moving=2}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_climbing=2,ps_moving=-1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_climbing=2,ps_moving=0}] ps_moving 2

scoreboard players set @a[tag=t_pm_owner,scores={ps_crouching=2,ps_moving=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_crouching=2,ps_moving=2}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_crouching=2,ps_moving=-1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_crouching=2,ps_moving=0}] ps_moving 2

scoreboard players set @a[tag=t_pm_owner,scores={ps_falling=2,ps_moving=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_falling=2,ps_moving=2}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_falling=2,ps_moving=-1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_falling=2,ps_moving=0}] ps_moving 2

scoreboard players set @a[tag=t_pm_owner,scores={ps_onwater_walking=2,ps_moving=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_onwater_walking=2,ps_moving=2}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_onwater_walking=2,ps_moving=-1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_onwater_walking=2,ps_moving=0}] ps_moving 2

scoreboard players set @a[tag=t_pm_owner,scores={ps_sprinting=2,ps_moving=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_sprinting=2,ps_moving=2}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_sprinting=2,ps_moving=-1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_sprinting=2,ps_moving=0}] ps_moving 2

scoreboard players set @a[tag=t_pm_owner,scores={ps_swimming=2,ps_moving=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_swimming=2,ps_moving=2}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_swimming=2,ps_moving=-1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_swimming=2,ps_moving=0}] ps_moving 2

scoreboard players set @a[tag=t_pm_owner,scores={ps_underwater_walking=2,ps_moving=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_underwater_walking=2,ps_moving=2}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_underwater_walking=2,ps_moving=-1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_underwater_walking=2,ps_moving=0}] ps_moving 2

scoreboard players set @a[tag=t_pm_owner,scores={ps_walking=2,ps_moving=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_walking=2,ps_moving=2}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_walking=2,ps_moving=-1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_walking=2,ps_moving=0}] ps_moving 2

scoreboard players set @a[tag=t_pm_owner,scores={ps_aviating=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_climbing=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_crouching=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_falling=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_onwater_walking=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_sprinting=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_swimming=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_underwater_walking=1}] ps_moving 1
scoreboard players set @a[tag=t_pm_owner,scores={ps_walking=1}] ps_moving 1

# Player state: sneaking (holding down button)
scoreboard players set @a[tag=t_pm_owner,scores={__sneakTime=1..}] __sneaking_cur 1
scoreboard players set @a[tag=t_pm_owner,scores={__sneakTime=0}] __sneaking_cur 0
scoreboard players set @a[tag=t_pm_owner] __sneakTime 0

scoreboard players set @a[tag=t_pm_owner,scores={__sneaking_cur=0,__sneaking_prev=0}] ps_sneaking 0
scoreboard players set @a[tag=t_pm_owner,scores={__sneaking_cur=0,__sneaking_prev=1}] ps_sneaking -1
scoreboard players set @a[tag=t_pm_owner,scores={__sneaking_cur=1,__sneaking_prev=0}] ps_sneaking 2
scoreboard players set @a[tag=t_pm_owner,scores={__sneaking_cur=1,__sneaking_prev=1}] ps_sneaking 1

scoreboard players operation @a[tag=t_pm_owner,limit=1] __sneaking_prev = @a[tag=t_pm_owner,limit=1] __sneaking_cur

# Player state: selected hotbar slot
execute store result score @a[tag=t_pm_owner,limit=1] ps_selected_hotbar_slot run data get entity @a[tag=t_pm_owner,limit=1] SelectedItemSlot
