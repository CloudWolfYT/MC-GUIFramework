## find the controlling user
scoreboard players operation .in ui.id = @s ui.id
execute as @a[distance=..9,scores={ui.id=1..}] if score @s ui.id = .in ui.id run tag @s add this

## count items in the ui, if zero ignore buttons
execute store result score .items ui run data get storage ui container
execute if score .items ui matches 0 run scoreboard players set .page_change ui 1

## load the page you are on
scoreboard players add @s ui.page 0
execute if score @s ui.page matches 0 run function a:ui/page/menu/start
execute if score @s ui.page matches 1 run function a:ui/page/shop/start
execute if score @s ui.page matches 2 run function a:ui/page/hub/start
execute if score @s ui.page matches 3 run function a:ui/page/vend/start

## prevent double checks
data modify entity @s data.container set from entity @p[tag=this] EnderItems

## remove controlling user
tag @a remove this

## kill all items dropped
scoreboard players set .kill ui 1
