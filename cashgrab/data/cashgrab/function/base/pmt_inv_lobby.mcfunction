# base/pmt_inv_lobby.mcfunction
#
# Context:
#	as: an entity
#
# Summary: Populates inventory for players in the Lobby
#
# Arguments: (none)

item replace entity @a[tag=t_pm_owner,limit=1] hotbar.4 with minecraft:book[\
minecraft:item_name=[{color:"aqua",italic:false,text:"[Use]"},{color:"white",text:" Play Tutorial"}],\
minecraft:consumable={\
consume_seconds:0f,\
animation:"none",\
sound:"entity.villager.work_librarian",\
has_consume_particles:false,\
}\
] 1
