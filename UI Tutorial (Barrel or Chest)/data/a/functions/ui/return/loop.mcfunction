## set one return item to slot 0, and copy to box. then loot give back
data modify storage ui return[-1].Slot set value 0
data modify block ~ ~ ~ Items insert -1 from storage ui return[-1]
loot give @p[tag=this] mine ~ ~ ~ air{drop_contents:1b}

data remove storage ui return[-1]
scoreboard players remove #return ui 1
execute if score #return ui matches 1.. run function a:ui/return/loop