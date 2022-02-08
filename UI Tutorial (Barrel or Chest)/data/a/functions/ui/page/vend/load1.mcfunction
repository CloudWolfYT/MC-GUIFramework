scoreboard players add @s ui.index 0
execute if score @s ui.index matches 0 run data modify storage ui load set value {Slot:15b,id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:healing",ui:{null:1b,output:1b}}}
execute if score @s ui.index matches 1 run data modify storage ui load set value {Slot:15b,id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:leaping",ui:{null:1b,output:1b}}}
execute if score @s ui.index matches 2 run data modify storage ui load set value {Slot:15b,id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:luck",ui:{null:1b,output:1b}}}
execute if score @s ui.index matches 3 run data modify storage ui load set value {Slot:15b,id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:swiftness",ui:{null:1b,output:1b}}}