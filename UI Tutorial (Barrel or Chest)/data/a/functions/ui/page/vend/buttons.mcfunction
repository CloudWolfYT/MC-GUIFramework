## set button based on what was taken.
# intermediate variable avoid multiple inputs here!
scoreboard players set .button ui 0
execute unless data storage ui container[{Slot:0b}] run scoreboard players set .button ui 1
execute unless data storage ui container[{Slot:6b}] run scoreboard players set .button ui 2
execute unless data storage ui container[{Slot:24b}] run scoreboard players set .button ui 3

## pick a page to go to
execute if score .button ui matches 1 run scoreboard players set @s ui.page 0
execute if score .button ui matches 2 run scoreboard players add @s ui.index 1
execute if score .button ui matches 3 run scoreboard players remove @s ui.index 1
execute if score @s ui.index matches ..-1 run scoreboard players set @s ui.index 3
execute if score @s ui.index matches 4.. run scoreboard players set @s ui.index 0

execute unless score @s ui.page matches 3 run scoreboard players set .page_change ui 1
execute unless score @s ui.page matches 3 run function a:ui/refresh