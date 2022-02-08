## ensure one item is in box
data remove block ~ ~ ~ Items
## count return items
execute store result score #return ui run data get storage ui return
execute if score #return ui matches 1.. run function a:ui/return/loop