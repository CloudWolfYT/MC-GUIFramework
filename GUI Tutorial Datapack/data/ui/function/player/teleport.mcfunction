# if you dont have a ui minecart, make one
execute unless score @s ui.id matches 0.. run function ui:player/open

# find my ui minecart and teleport it to me
scoreboard players operation #search ui.id = @s ui.id
execute at @s as @e[type=item_display,tag=ui] if score @s ui.id = #search ui.id run tp @s ~ ~1 ~