# tutorial/sequence/stage_toss_select_trainee/pmt_give_transcript.mcfunction
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
[{italic:false,color:"white",text:"In Cash Grab Arena, there are many different"}],\
[{italic:false,color:"aqua",text:" Classes"},{italic:false,color:"white",text:" you can equip, each with their own"}],\
[{italic:false,color:"white",text:" unique items and abilities."}],\
{italic:false,color:"dark_gray",text:""},\
[{italic:false,color:"white",text:"For the tutorial, you can equip the "},{italic:false,color:"aqua",text:"Trainee"}],\
[{italic:false,color:"white",text:" Class by "},{italic:false,color:"gold",text:"clicking on it in your inventory"},{color:"white",text:"."}],\
{italic:false,color:"dark_gray",text:""},\
{italic:false,color:"yellow",text:"To continue, equip the Trainee class."}\
]\
] 1
