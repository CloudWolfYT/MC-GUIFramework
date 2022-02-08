## ui is only active for one tick, at which it must be re-discovered
tag @s remove ui.active
scoreboard players set .page_change ui 0

## copy the Items array
execute as @a[distance=..9,scores={ui.id=1..}] if score @s ui.id = .in ui.id run data modify storage ui container set from entity @s EnderItems
## try to update the stored array...
execute store result score #temp ui run data modify entity @s data.container set from storage ui container
## if it updated, they are not the same so refresh the ui
execute if score #temp ui matches 1 run function a:ui/refresh