## lets system know a ui was found and which
scoreboard players set #loop open_ui -1
scoreboard players operation .out ui.id = @s ui.id
## lets system know that the ui is in use
tag @s add ui.active