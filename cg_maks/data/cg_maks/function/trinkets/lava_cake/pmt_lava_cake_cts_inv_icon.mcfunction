# trinkets/lava_cakee/pmt_lava_cake_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:cake[\
minecraft:item_name="[{\"color\":\"dark_green\",\"italic\":false,\"text\":\"<Trinket>\"},{\"color\":\"white\",\"text\":\" Lava Cake\"}]",\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
'["",{"text":"Eating this cake grants ","italic":false,"color":"gray"},{"text":"Fire","italic":false,"color":"yellow"}]',\
'["",{"text":" Resistance ","italic":false,"color":"yellow"},{"text":"and clears ","italic":false,"color":"gray"},{"text":"Mining","italic":false,"color":"yellow"}]',\
'["",{"text":" Fatigue","italic":false,"color":"yellow"},{"text":".","italic":false,"color":"gray"}]',\
'["",{"text":"After a brief period of time,","italic":false,"color":"gray"}]',\
'["",{"text":" the cake ","italic":false,"color":"gray"},{"text":"explodes","italic":false,"color":"yellow"},{"text":", dealing","italic":false,"color":"gray"}]',\
'["",{"text":" damage to nearby enemies!","italic":false,"color":"gray"}]'\
]] 2