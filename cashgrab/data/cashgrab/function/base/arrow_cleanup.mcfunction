# base/arrow_cleanup.mcfunction
#
# Context:
#	as: an arrow entity
#	at: the entity
#
# Summary: Displays particles then self-destructs if inGround nbt value is 1
#
# Arguments: (none)

particle minecraft:block{block_state:"minecraft:birch_planks"} ^ ^ ^-0.2 0.1 0.1 0.1 1 5
kill @s
