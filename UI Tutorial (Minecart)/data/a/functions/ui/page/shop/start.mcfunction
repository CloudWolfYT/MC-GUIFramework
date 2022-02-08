## get rid of buttons
clear @p[tag=this] #minecraft:all_items{ui:{null:1b}}

## isolate items to be returned
data modify storage ui return set from storage ui container
data remove storage ui return[{tag:{ui:{null:1b}}}]
# set the coords here to your shulker box!
execute positioned 0 -64 0 run function a:ui/return/start

## process what happened here
execute if score .page_change ui matches 0 run function a:ui/page/shop/buttons

## apply mask of the ui shape -> if you are still on the same page!
execute if score @s ui.page matches 1 run function a:ui/page/shop/mask