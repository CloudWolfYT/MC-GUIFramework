## set button based on what was taken.
# intermediate variable avoid multiple inputs here!
scoreboard players set .button ui 0
execute unless data storage ui container[{Slot:0b}] run scoreboard players set .button ui 1

## pick a page to go to
execute if score .button ui matches 1 run scoreboard players set @s ui.page 0

execute unless score @s ui.page matches 1 run scoreboard players set .page_change ui 1
execute unless score @s ui.page matches 1 run function a:ui/refresh