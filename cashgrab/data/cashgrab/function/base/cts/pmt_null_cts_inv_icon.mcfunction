# base/cts/pmt_null_cts_inv_icon.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Inserts NULL class-and-trinket selection class icon
#
# Arguments:
#	slot	: Inventory slot to insert into

$item replace entity @a[tag=t_pm_owner,limit=1] $(slot) with minecraft:barrier[\
minecraft:enchantment_glint_override=true,\
minecraft:item_name=[{color:"red",italic:false,text:"NULL"}],\
minecraft:lore=[\
{color:"dark_gray",italic:true,text:"Something wrong happened!"},\
]] 1
