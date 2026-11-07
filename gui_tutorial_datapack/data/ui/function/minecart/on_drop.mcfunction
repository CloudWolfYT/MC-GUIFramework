execute if score @s ui.drop matches 1.. run function ui:minecart/on_change
execute if score @s ui.drop matches 1.. run kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{ui_item:{}}}}}]
execute if score @s ui.drop matches 1.. run scoreboard players reset @s ui.drop