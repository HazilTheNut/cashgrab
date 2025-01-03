# classes/dancer/pmt_dancer_inv_ability_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts equipped class ability icon into hotbar slot 4
#
# Arguments:
#	charges		: Number of charges of ability

$item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:orange_dye[\
minecraft:item_name="[{\"color\":\"light_purple\",\"italic\":false,\"text\":\"[Toss]\"},{\"color\":\"white\",\"text\":\" Sforzando\"}]",\
minecraft:hide_additional_tooltip={},\
minecraft:lore=[\
'["",{"text":"Toss any item to use.","color":"dark_gray"}]',\
'["",{"text":"Strikes your enemies with a","italic":false,"color":"gray"}]',\
'["",{"text":" dazzling flourish.","italic":false,"color":"gray"}]',\
'["",{"text":"More stacks of ","italic":false,"color":"gray"},{"text":"Tempo","italic":false,"color":"yellow"},{"text":" creates","italic":false,"color":"gray"}]',\
'["",{"text":" a larger flourish.","italic":false,"color":"gray"}]'\
]] $(charges)