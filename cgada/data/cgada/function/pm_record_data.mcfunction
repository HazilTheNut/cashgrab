
# Find owner and tag them with t_pm_owner
execute store result storage cgada:find_eid_args eid int 1 run scoreboard players get @s eid_owner
function cashgrab:util/find_eid_self with storage cgada:find_eid_args
tag @a[tag=t_eid_matches,limit=1] add t_pm_owner

execute unless entity @a[tag=t_pm_owner] run return 0

# If player collects coins while in gameplay, increment class coins total
execute if score @a[tag=t_pm_owner,limit=1,scores={activity_state=20..29}] evl_coin_pickup matches 1.. run function cgada:pmt_increment_data_argloader {func_increment:"cgada:pmt_increment_coins_total"}

# If player died while in gameplay, increment total deaths
execute if score @a[tag=t_pm_owner,limit=1,scores={activity_state=10..29}] evl_death matches 1.. run function cgada:pmt_increment_data_argloader {func_increment:"cgada:pmt_increment_deaths_total"}

# Remove tag
tag @a remove t_pm_owner
