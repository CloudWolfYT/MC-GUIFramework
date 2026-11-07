execute as @a run function ui:player/tick
execute as @e[type=minecraft:chest_minecart,tag=ui] run function ui:minecart/tick
kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_model_data":1}}}]
kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_model_data":2}}}]