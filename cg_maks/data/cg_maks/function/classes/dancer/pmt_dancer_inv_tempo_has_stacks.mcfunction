# classes/dancer/pmt_dancer_inv_tempo.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#   + the pm's owner has a cv_A value > 0.
#
# Summary: Populates Tempo inventory slot for the Dancer class for the command executor
#
# Arguments: (none)

# Check if the pm's owner has each stack of Tempo, then give them the corresponding icon.
execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 1 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:note_block[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Passive]\"},{\"color\":\"white\",\"text\":\" Tempo\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
'["",{"text":"Hitting enemies with ","italic":false,"color":"gray"}]',\
'["",{"text":" consecutive melee hits ","italic":false,"color":"gray"}]',\
'["",{"text":" grants stacks of ","italic":false,"color":"gray"},{"text":"Tempo","italic":false,"color":"yellow"},{"text":".","italic":false,"color":"gray"}]',\
'["",{"text":"Each ","italic":false,"color":"gray"},{"text":"Tempo","italic":false,"color":"yellow"},{"text":" stack grants","italic":false,"color":"gray"}]',\
'["",{"text":" increased speed.","italic":false,"color":"gray"}]',\
'["",{"text":"===","italic":false,"color":"dark_gray"}]',\
'["",{"text":"You have ","italic":false,"color":"dark_gray"},{"text":"1","italic":false,"color":"yellow"},{"text":" stack.","italic":false,"color":"dark_gray"}]'\
]] 1

execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 2 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:note_block[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Passive]\"},{\"color\":\"white\",\"text\":\" Tempo\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
'["",{"text":"Hitting enemies with ","italic":false,"color":"gray"}]',\
'["",{"text":" consecutive melee hits ","italic":false,"color":"gray"}]',\
'["",{"text":" grants stacks of ","italic":false,"color":"gray"},{"text":"Tempo","italic":false,"color":"yellow"},{"text":".","italic":false,"color":"gray"}]',\
'["",{"text":"Each ","italic":false,"color":"gray"},{"text":"Tempo","italic":false,"color":"yellow"},{"text":" stack grants","italic":false,"color":"gray"}]',\
'["",{"text":" increased speed.","italic":false,"color":"gray"}]',\
'["",{"text":"===","italic":false,"color":"dark_gray"}]',\
'["",{"text":"You have ","italic":false,"color":"dark_gray"},{"text":"2","italic":false,"color":"yellow"},{"text":" stacks.","italic":false,"color":"dark_gray"}]'\
]] 2

execute if score @a[tag=t_pm_owner,limit=1] cv_A matches 3 run item replace entity @a[tag=t_pm_owner,limit=1] hotbar.5 with minecraft:note_block[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Passive]\"},{\"color\":\"white\",\"text\":\" Tempo\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
'["",{"text":"Hitting enemies with ","italic":false,"color":"gray"}]',\
'["",{"text":" consecutive melee hits ","italic":false,"color":"gray"}]',\
'["",{"text":" grants stacks of ","italic":false,"color":"gray"},{"text":"Tempo","italic":false,"color":"yellow"},{"text":".","italic":false,"color":"gray"}]',\
'["",{"text":"Each ","italic":false,"color":"gray"},{"text":"Tempo","italic":false,"color":"yellow"},{"text":" stack grants","italic":false,"color":"gray"}]',\
'["",{"text":" increased speed.","italic":false,"color":"gray"}]',\
'["",{"text":"===","italic":false,"color":"dark_gray"}]',\
'["",{"text":"You have ","italic":false,"color":"dark_gray"},{"text":"3","italic":false,"color":"yellow"},{"text":" stacks.","italic":false,"color":"dark_gray"}]'\
]] 3

