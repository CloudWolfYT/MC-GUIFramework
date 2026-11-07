# Return the inserted items to the OWNER player (not nearest @p)
scoreboard players operation #search ui.id = @s ui.id
execute as @a if score @s ui.id = #search ui.id run function ui:player/return

# Refresh the UI page (removes the inserted items visually)
function ui:menu/refresh
