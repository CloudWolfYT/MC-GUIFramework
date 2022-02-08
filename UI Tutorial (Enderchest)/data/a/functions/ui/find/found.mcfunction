## lets system know a ui was found and which
scoreboard players set #loop open_ui -1
scoreboard players operation .out ui.id = @s ui.id
## lets system know that the ui is in use
tag @s add ui.active

execute as @p[tag=this] if score @s ui.id matches 0 run function a:ui/load