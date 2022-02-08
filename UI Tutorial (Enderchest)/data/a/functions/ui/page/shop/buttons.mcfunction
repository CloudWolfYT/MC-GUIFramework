## set button based on what was taken.
# intermediate variable avoid multiple inputs here!
scoreboard players set .button ui 0
execute unless data storage ui container[{Slot:0b}] run scoreboard players set .button ui 1
#execute unless data storage ui container[{Slot:13b}] run scoreboard players set .button ui 2
#execute unless data storage ui container[{Slot:15b}] run scoreboard players set .button ui 3

## pick a page to go to
execute if score .button ui matches 1 run scoreboard players set @s ui.page 0
#execute if score .button ui matches 2 run scoreboard players set @s ui.page 2
#execute if score .button ui matches 3 run scoreboard players set @s ui.page 3

execute unless score @s ui.page matches 1 run scoreboard players set .page_change ui 1
execute unless score @s ui.page matches 1 run function a:ui/refresh