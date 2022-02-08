scoreboard players set .page_change ui 0
scoreboard players operation .in ui.id = @s ui.id

## move it to the player
execute as @a[scores={ui.id=1..}] if score @s ui.id = .in ui.id at @s anchored eyes positioned ^ ^ ^ as @e[type=chest_minecart,tag=ui] if score @s ui.id = .in ui.id run tp @s ~ ~ ~ ~ ~

## copy the Items array
execute as @e[type=chest_minecart,tag=ui] if score @s ui.id = .in ui.id run data modify storage ui container set from entity @s Items
## try to update the stored array...
execute store result score #temp ui run data modify entity @s data.container set from storage ui container
## if it updated, they are not the same so refresh the ui
execute if score #temp ui matches 1 as @e[type=chest_minecart] if score @s ui.id = .in ui.id run function a:ui/refresh
data modify entity @s data.container set from storage ui container