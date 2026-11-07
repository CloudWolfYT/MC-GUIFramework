# If player has no UI yet, open one
execute unless score @s ui.id matches 0.. run function ui:player/open

# Teleport the matching item_display (root of the stack) to the player
scoreboard players operation #search ui.id = @s ui.id
execute at @s as @e[type=item_display,tag=ui] if score @s ui.id = #search ui.id run tp @s ~ ~1 ~
