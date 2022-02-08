## detecting shift vs regular clicking
execute store result score #temp ui run data get entity @p[tag=this] Inventory[{tag:{ui:{output:1b}}}]
execute store result score #temp1 ui run clear @p[tag=this] #minecraft:all_items{ui:{output:1b}}
scoreboard players operation #temp ui < #1 ui
scoreboard players operation #temp1 ui < #1 ui
scoreboard players operation #player_io ui = #temp ui
scoreboard players operation #player_io ui += #temp1 ui

## get rid of buttons
clear @p[tag=this] #minecraft:all_items{ui:{null:1b}}

## isolate items to be returned
data modify storage ui return set from storage ui container
data remove storage ui return[{tag:{ui:{null:1b}}}]
## exception for input slot
data remove storage ui return[{Slot:11b}]
# set the coords here to your shulker box!
execute positioned 0 -64 0 run function a:ui/return/start

## process what happened here
execute if score .page_change ui matches 0 run function a:ui/page/vend/buttons
data remove storage ui load
execute if score .page_change ui matches 0 run function a:ui/page/vend/load
execute if score .page_change ui matches 0 run function a:ui/page/vend/buy

## apply mask of the ui shape -> if you are still on the same page!
execute if score @s ui.page matches 3 run function a:ui/page/vend/mask