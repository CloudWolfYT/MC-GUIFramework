## start search for new ui or one with same id
scoreboard players set #loop open_ui 12
scoreboard players operation .in ui.id = @s ui.id
execute anchored eyes run function a:ui/find/raycast

## if ui is found link it to player
execute if score #loop open_ui matches -1 run scoreboard players operation @s ui.id = .out ui.id
## if ui is not found
execute if score #loop open_ui matches 0 run function a:ui/return/exit_ui
execute if score #loop open_ui matches 0 run scoreboard players set @s ui.id 0
execute if score #loop open_ui matches 0 run scoreboard players set @s open_ui 0