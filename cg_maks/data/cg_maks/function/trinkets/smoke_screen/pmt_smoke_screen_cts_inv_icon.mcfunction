# trinkets/smoke_screen/pmt_smoke_screen_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts class-and-trinket selection trinket icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:ink_sac[\
minecraft:item_name=[{color:"dark_green",italic:false,text:"<Trinket>"},{color:"white",text:" Smoke Screen"}],\
minecraft:custom_data={is_cts_icon:1},\
minecraft:lore=[\
[{text:"Fires a smoke bomb that briefly",italic:false,color:"gray"}],\
[{text:" blinds anyone near it.",italic:false,color:"gray"}]\
]] 3