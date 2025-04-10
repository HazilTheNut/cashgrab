# tutorial/sequence/stage_trinket_offhand/pmt_give_transcript.mcfunction
#
# Context:
#	as: a Player Monitor (pm) marker
#	+ the owner of the pm is tagged with t_pm_owner
#
# Summary: Grants transcript item for the current tutorial sequence stage
#
# Arguments: (none)

give @a[tag=t_pm_owner,limit=1] minecraft:paper[\
minecraft:item_name={color:"aqua",italic:false,text:"Transcript"},\
minecraft:lore=[\
{italic:false,color:"dark_gray",text:"--------------------------------------------"},\
[{italic:false,color:"white",text:"You usually are not able to regain your Trinkets"}],\
[{italic:false,color:"white",text:" after using them, though you can here by"}],\
[{italic:false,color:"gold",text:" clicking on the sign nearby"},{italic:false,color:"white",text:"."}],\
{italic:false,color:"dark_gray",text:""},\
[{italic:false,color:"white",text:"For quicker access, you can often "},{italic:false,color:"gold",text:"put your"}],\
[{italic:false,color:"gold",text:" Trinket in your offhand slot"},{italic:false,color:"white",text:"."}],\
{italic:false,color:"gray",text:"(This may not be fully supported on all Classes)"},\
{italic:false,color:"dark_gray",text:""},\
{italic:false,color:"yellow",text:"To continue, put your Vigor Flask in your"},\
{italic:false,color:"yellow",text:" offhand slot and drink it."}\
]\
] 1
