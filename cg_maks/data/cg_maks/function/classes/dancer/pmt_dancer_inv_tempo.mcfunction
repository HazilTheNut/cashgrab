# classes/dancer/pmt_dancer_inv_tempo.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Populates Tempo inventory slot for the Dancer class for the command executor
#
# Arguments: (none)

# Check if player currently has tempo stacks, and delegate to child function if true.
execute unless score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run function cg_maks:classes/dancer/pmt_dancer_inv_tempo_has_stacks
execute unless score @a[tag=t_pm_owner,limit=1] cv_A matches 0 run return 0

# If 0 stacks, display a glass pane named "Tempo" describing the buffs

item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:gray_stained_glass_pane[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Passive]\"},{\"color\":\"white\",\"text\":\" Tempo\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
'["",{"text":"Hitting enemies with ","italic":false,"color":"gray"}]',\
'["",{"text":" consecutive melee hits ","italic":false,"color":"gray"}]',\
'["",{"text":" grants stacks of ","italic":false,"color":"gray"},{"text":"Tempo","italic":false,"color":"yellow"},{"text":".","italic":false,"color":"gray"}]',\
'["",{"text":"Each ","italic":false,"color":"gray"},{"text":"Tempo","italic":false,"color":"yellow"},{"text":" stack grants","italic":false,"color":"gray"}]',\
'["",{"text":" increased speed.","italic":false,"color":"gray"}]',\
'["",{"text":"===","italic":false,"color":"dark_gray"}]',\
'["",{"text":"You have ","italic":false,"color":"dark_gray"},{"text":"0","italic":false,"color":"yellow"},{"text":" stacks.","italic":false,"color":"dark_gray"}]'\
]] 1
